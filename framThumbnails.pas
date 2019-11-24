unit framThumbnails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, GraphicEx, ExtCtrls, Jpeg, StdCtrls, Buttons,
  AxCtrls, OleCtrls, DBOleCtl, Menus, ComCtrls, ToolWin, ieview,
  iemview, DebenuPDFLibrary, Printers, imageenview, imageenio,
  iemio, iexBitmaps;


type
  Tfram_Thumbnails = class(TFrame)
    qry_Image: TADOQuery;
    qry_Thumb: TADOQuery;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    pnl_Html: TPanel;
    img_Html: TImage;
    pnl_Mail: TPanel;
    img_Mail: TImage;
    pnl_Excel: TPanel;
    img_Excel: TImage;
    ImageViewerPages: TImageEnMView;
    pnl_ThumbSize: TPanel;
    lbl_ThumbSize: TLabel;
    cb_ThumbSize: TComboBox;
    PrintDialog1: TPrintDialog;
    ImageEnViewPrint: TImageEnView;
    procedure cb_ThumbSizeChange(Sender: TObject);
    procedure ImageViewerPagesImageSelect(Sender: TObject; idx: Integer);
  private
    { Private declarations }
    procedure LoadPDFPage(PDFFilename :String; PageNo:Integer; VAR OutputStream :TMemoryStream);
  public
    { Public declarations }
    tWorkSpaceHeight       :Integer;
    tWorkSpaceWidth        :Integer;

    tTop   :Integer;
    tLeft  :Integer;
    tZoomIncrement :Integer;
    tThumbNailWidth   :Integer;
    tThumbNailSpacer  :Integer;
    tMaxHeight       :Integer;
    ViewedFilenames  :Array[1..1000] of String;
    TotListdrawn   :Integer;
    Listdrawn  :Array[1..1000] of Integer;

    aParentForm :TForm;
    function GetDocuments(Module :String; ListImages :String):Boolean;
    function Redraw:Boolean;
    Procedure GetFilenames(Var CurrFilenames   :TStringList);
    procedure Print;
  end;

implementation

USES MetrofilerDataModule, eRecords, ImgCentre;

{$R *.dfm}

Procedure Tfram_Thumbnails.GetFilenames(Var CurrFilenames   :TStringList);
Var
  J  :Integer;
begin
  CurrFilenames.Clear;
  For J := 1 to TotListdrawn Do
    begin
      If trim(ViewedFilenames[J]) <> '' Then
        CurrFilenames.Append(trim(ViewedFilenames[J]));
    end;
end;

procedure Tfram_Thumbnails.ImageViewerPagesImageSelect(Sender: TObject;
  idx: Integer);
Var
  tImageNo   :Integer;
begin
  tImageNo := ImageViewerPages.ImageID[idx];
  //---
  If tImageNo > 0 Then
    begin
      If aParentForm is Tfrm_eRecords Then
        begin
          Tfrm_eRecords(aParentForm).DisplayThumbnail(tImageNo);
        end
      else If aParentForm is Tfrm_ImageCentre Then
        begin
          Tfrm_ImageCentre(aParentForm).DisplayThumbnail(tImageNo);
        end
    end;
end;

procedure Tfram_Thumbnails.cb_ThumbSizeChange(Sender: TObject);
Var
  B, tSize   :Integer;
begin
  Screen.Cursor := crHourglass;
  B := ImageViewerPages.SelectedImage;
  try
    ImageViewerPages.Clear;
    tSize := StrtoInt(copy(cb_ThumbSize.Text, 1, pos('x', cb_ThumbSize.Text)-1));
    ImageViewerPages.ThumbWidth := tSize;
    ImageViewerPages.ThumbHeight := tSize;
    Redraw();
    ImageViewerPages.SelectedImage := B;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function Tfram_Thumbnails.GetDocuments(Module :String; ListImages :String):Boolean;
Var
  J                      :Integer;
  DocType                :String;
  FileName               :String;
  AImageNo         :Integer;
  MemoryStream :TMemoryStream;
  PageCount    :Integer;
  aPDFDoc     :TDebenuPDFLibrary;
begin
Screen.Cursor := crHourglass;
try
  qry_Thumb.Close;
  qry_Thumb.SQL.Clear;
  qry_Thumb.SQL.Add('SELECT TrxNo, eRecNo, DocName, Filename FROM eRecordImages');
  qry_Thumb.SQL.Add('WHERE TrxNo IN ('+ListImages+')');
  qry_Thumb.SQL.Add('AND TrxNo NOT IN (');
  For J := 1 to TotListdrawn Do
    qry_Thumb.SQL.Add(InttoStr(Listdrawn[J])+',');
  qry_Thumb.SQL.Add('0');
  qry_Thumb.SQL.Add(')');
  qry_Thumb.SQL.Add('ORDER BY TrxNo');
  qry_Thumb.Open;
  qry_Thumb.First;
  While not qry_Thumb.EOF Do
    begin
      Application.ProcessMessages;
    //--------Get Filename and Extension---------
      AImageNo := qry_Thumb.FieldbyName('TRXNO').asInteger;
      FileName := dm_Metrofiler.ReadERecFromRepositry(Module, AImageNo);
      DocType := UpperCase(ExtractFileExt(Filename));
 //------------
      Inc(TotListdrawn);
      Listdrawn[TotListdrawn] := AImageNo;
      ViewedFilenames[TotListdrawn] := Filename;

      If (DocType = '.TIF')OR
         (DocType = '.TIFF')OR
         (DocType = '.JPG')OR
         (DocType = '.JPEG')OR
         (DocType = '.PNG')OR
         (DocType = '.PSD')OR
         (DocType = '.BMP')Then
        begin
          ImageViewerPages.MIO.LoadfromFile(Filename);
          ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AImageNo;
          Application.ProcessMessages;
        end;
      If (DocType = '.XLS')Then
        begin
        end;
      If (DocType = '.HTM')OR
         (DocType = '.HTML')Then
        begin
        end;
      If (DocType = '.MSG')OR
         (DocType = '.EML')Then
        begin
        end;
      If (DocType = '.PDF')Then
        begin
          aPDFDoc := TDebenuPDFLibrary.Create;
          try
             aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
             aPDFDoc.LoadFromFile(Filename, '');
             PageCount := aPDFDoc. PageCount;
              For J := 1 to PageCount Do
                begin
                  MemoryStream   := TMemoryStream.Create;
                  try
                    If cb_ThumbSize.ItemIndex = 0 Then
                      aPDFDoc.RenderPageToStream(25, J, 0, MemoryStream)
                    else if cb_ThumbSize.ItemIndex = 1 Then
                      aPDFDoc.RenderPageToStream(50, J, 0, MemoryStream)
                    else if cb_ThumbSize.ItemIndex = 2 Then
                      aPDFDoc.RenderPageToStream(75, J, 0, MemoryStream);
                    MemoryStream.Position := 0;
                    ImageViewerPages.MIO.LoadFromStream(MemoryStream);
                    ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AImageNo;
                    Application.ProcessMessages;
                  finally
                    MemoryStream.Free;
                  end;
                end;
          finally
            aPDFDoc.Free;
          end;
        end;
      qry_Thumb.Next;
    end;
finally
  Result := True;
  Screen.Cursor := crDefault;
  qry_Thumb.Close;
end;
end;

function Tfram_Thumbnails.Redraw:Boolean;
Var
  J, A                   :Integer;
  DocType                :String;
  FileName               :String;
  AImageNo               :Integer;
  MemoryStream           :TMemoryStream;
  PageCount              :Integer;
  aPDFDoc                :TDebenuPDFLibrary;
begin
Screen.Cursor := crHourglass;
try
  ImageViewerPages.Clear;
  For A := 1 to TotListdrawn Do
    begin
      Application.ProcessMessages;
    //--------Get Filename and Extension---------
      Filename := ViewedFilenames[A];
      AImageNo := Listdrawn[A];
      DocType := UpperCase(ExtractFileExt(Filename));
 //------------
      If (DocType = '.TIF')OR
         (DocType = '.TIFF')OR
         (DocType = '.JPG')OR
         (DocType = '.JPEG')OR
         (DocType = '.PNG')OR
         (DocType = '.PSD')OR
         (DocType = '.BMP')Then
        begin
          ImageViewerPages.MIO.LoadfromFile(Filename);
          ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AImageNo;
          Application.ProcessMessages;
        end;
      If (DocType = '.XLS')Then
        begin
        end;
      If (DocType = '.HTM')OR
         (DocType = '.HTML')Then
        begin
        end;
      If (DocType = '.MSG')OR
         (DocType = '.EML')Then
        begin
        end;
      If (DocType = '.PDF')Then
        begin
          aPDFDoc := TDebenuPDFLibrary.Create;
          try
             aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
             aPDFDoc.LoadFromFile(Filename, '');
             PageCount := aPDFDoc. PageCount;
              For J := 1 to PageCount Do
                begin
                  MemoryStream   := TMemoryStream.Create;
                  try
                    If cb_ThumbSize.ItemIndex = 0 Then
                      aPDFDoc.RenderPageToStream(25, J, 0, MemoryStream)
                    else if cb_ThumbSize.ItemIndex = 1 Then
                      aPDFDoc.RenderPageToStream(50, J, 0, MemoryStream)
                    else if cb_ThumbSize.ItemIndex = 2 Then
                      aPDFDoc.RenderPageToStream(75, J, 0, MemoryStream);
                    MemoryStream.Position := 0;
                    ImageViewerPages.MIO.LoadFromStream(MemoryStream);
                    ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AImageNo;
                    Application.ProcessMessages;
                  finally
                    MemoryStream.Free;
                  end;
                end;
          finally
            aPDFDoc.Free;
          end;
        end;
    end;
finally
  Result := True;
  Screen.Cursor := crDefault;
  qry_Thumb.Close;
end;
end;

procedure Tfram_Thumbnails.Print;
Var
  TotPagesToPrint    :Integer;
  J,C, A             :Integer;
  ExtName            :String;
  MemoryStream       :TMemoryStream;
  Filename           :String;
  startPage, endPage :Integer;
  FirstPageFlag      :Boolean;
begin
  If TotListdrawn = 0 Then
    begin
      Messagedlg('Nothing to Print.', mtWarning, [mbOK], 0);
      exit;
    end;

  PrintDialog1.MinPage := 1;
  PrintDialog1.MaxPage := ImageViewerPages.ImageCount;
  PrintDialog1.FromPage := 1;
  PrintDialog1.ToPage := ImageViewerPages.ImageCount;
  PrintDialog1.Options := [poPageNums];

  If not PrintDialog1.Execute() Then
    exit;

  if PrintDialog1.PrintRange = prPageNums then
    begin
      startPage := PrintDialog1.FromPage;
      endPage   := PrintDialog1.ToPage;
    end
  else // All pages
    begin
      startPage := 1;
      endPage   := TotPagesToPrint;
    end;

  Screen.Cursor := crHourglass;
  try
    Printer.Title := 'Metrofile Viewer Print';
    Printer.Copies := PrintDialog1.Copies;
    Printer.BeginDoc;
    A := 0;
    FirstPageFlag := True;
    For C := 1 to TotListdrawn Do
      begin
        Filename := ViewedFilenames[C];
        ExtName := UpperCase(ExtractFileExt(Filename));
        If ExtName = '.PDF' Then
          begin
            TotPagesToPrint := dm_Metrofiler.GetPDFPageCount(Filename);

            For J := 1 to TotPagesToPrint Do
              begin
                MemoryStream := TMemoryStream.Create;
                try
                  MemoryStream.Clear;
                  LoadPDFPage(Filename, J, MemoryStream);
                  MemoryStream.Position := 0;

                  Inc(A);
                  If (A >= startPage) AND (A <= endPage)Then
                    begin
                      If not FirstPageFlag Then
                        Printer.NewPage
                      else FirstPageFlag := False;

                      ImageEnViewPrint.Clear;
                      ImageEnViewPrint.IO.Params.ImageIndex := 0;
                      ImageEnViewPrint.IO.LoadFromStream(MemoryStream);
                      ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
                    end;
                finally
                  MemoryStream.Free;
                end;
              end;
          end
        else If (ExtName = '.TIF')OR
                (ExtName = '.TIFF')Then
          begin
            TotPagesToPrint := EnumTIFFIm(Filename);
            For J := 1 to TotPagesToPrint Do
              begin
                  Inc(A);
                  If (A >= startPage) AND (A <= endPage)Then
                    begin
                      If not FirstPageFlag Then
                        Printer.NewPage
                      else FirstPageFlag := False;

                      ImageEnViewPrint.Clear;
                      ImageEnViewPrint.IO.Params.ImageIndex := J-1;
                      ImageEnViewPrint.IO.LoadFromFile(Filename);
                      ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
                    end;
              end;
          end
        else
          begin
            Inc(A);
            If (A >= startPage) AND (A <= endPage)Then
              begin
                If not FirstPageFlag Then
                  Printer.NewPage
                else FirstPageFlag := False;

                ImageEnViewPrint.Clear;
                ImageEnViewPrint.IO.Params.ImageIndex := 0;
                ImageEnViewPrint.IO.LoadFromFile(Filename);
                ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
              end;
          end;
      end;
  finally
    Printer.EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_Thumbnails.LoadPDFPage(PDFFilename :String; PageNo:Integer; VAR OutputStream :TMemoryStream);
Var
  aPDFDoc     :TDebenuPDFLibrary;
begin
  aPDFDoc := TDebenuPDFLibrary.Create;
  try
     aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
     aPDFDoc.LoadFromFile(PDFFilename, '');
     aPDFDoc.RenderPageToStream(150, PageNo, 0, OutputStream);
  finally
    aPDFDoc.Free;
  end;
end;


end.
