unit framCOOLThumbnails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, GraphicEx, ExtCtrls, Jpeg, StdCtrls, Buttons, 
  AxCtrls, OleCtrls, DBOleCtl, Menus, ComCtrls, ToolWin, ieview,
  iemview, DebenuPDFLibrary, Printers, imageenview, imageenio,
  iemio, ImageEnProc;


type
  PCOOLPosRec = ^TMyCOOLPosRec;
  TMyCOOLPosRec = record
    ID        :Integer;
    FieldName :String;
    FieldValue:String;
    FontName  :String;
    FontSize  :Integer;
    FontStyle :String;
    PosX      :Integer;
    PosY      :Integer;
    Visible   :Boolean;
  end;
  Tfram_COOLThumbnails = class(TFrame)
    qry_Image: TADOQuery;
    qry_Thumb: TADOQuery;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ImageViewerPages: TImageEnMView;
    pnl_ThumbSize: TPanel;
    lbl_ThumbSize: TLabel;
    cb_ThumbSize: TComboBox;
    PrintDialog1: TPrintDialog;
    ImageEnViewPrint: TImageEnView;
    ImageViewer: TImageEnView;
    qry_COOLLabels: TADOQuery;
    qry_COOLBackground: TADOQuery;
    qry_COOLData: TADOQuery;
    qry_SQL: TADOQuery;
    procedure cb_ThumbSizeChange(Sender: TObject);
    procedure ImageViewerPagesImageSelect(Sender: TObject; idx: Integer);
  private
    { Private declarations }
    function DrawCOOLBackground(RecordType  :String):Boolean;
    function DrawCOOLFields(RecordType  :String; ID :Integer):Boolean;
    procedure IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
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
    ARecordType     :String;
    aParentForm :TForm;
    function GetDocuments(RecordType, ListImages :String):Boolean;
    function Redraw:Boolean;
    Procedure GetFilenames(Var CurrFilenames   :TStringList);
    procedure Print;
  end;

implementation

USES MetrofilerDataModule, COOL;

{$R *.dfm}

Procedure Tfram_COOLThumbnails.GetFilenames(Var CurrFilenames   :TStringList);
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

procedure Tfram_COOLThumbnails.ImageViewerPagesImageSelect(Sender: TObject;
  idx: Integer);
Var
  tImageNo   :Integer;
begin
  tImageNo := ImageViewerPages.ImageID[idx];
  //---
  If tImageNo > 0 Then
    begin
      If aParentForm is Tfrm_COOL Then
        begin
          Tfrm_COOL(aParentForm).DisplayThumbnail(tImageNo);
        end;
    end;
end;

procedure Tfram_COOLThumbnails.cb_ThumbSizeChange(Sender: TObject);
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



procedure Tfram_COOLThumbnails.IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
var
  XAdj, YAdj   :Integer;
begin
  with Canvas do
  begin
    XAdj := Round(Font.Height/20);
    YAdj := Round(Font.Height/5);
    TextOut( x-XAdj, y-YAdj, Text);
  end;
end;

function Tfram_COOLThumbnails.DrawCOOLBackground(RecordType  :String):Boolean;
Var
  MemoryStream   :TMemoryStream;
begin
  Screen.Cursor := crHourglass;
  MemoryStream   := TMemoryStream.Create;
  try
    ImageViewer.LayersClear;
    ImageViewer.Clear;
    qry_COOLBackground.Close;
    qry_COOLBackground.SQL.Clear;
    qry_COOLBackground.SQL.Add('SELECT COOLBackground FROM IndexDefinitions WHERE Description = :DS');
    qry_COOLBackground.Parameters.ParamByName('DS').Value := RecordType;
    qry_COOLBackground.Open;
    TBlobField(qry_COOLBackground.Fields[0]).SaveToStream(MemoryStream);
    If MemoryStream.Size > 0 Then
      begin
        MemoryStream.Position := 0;
        ImageViewer.IO.LoadFromStream(MemoryStream);
      end;
  finally
    MemoryStream.Free;
    Screen.Cursor := crDefault;
  end;
end;

function Tfram_COOLThumbnails.DrawCOOLFields(RecordType  :String; ID :Integer):Boolean;
Var
  COOLDataPtr   :PCOOLPosRec;
  COOLTblName   :String;
begin
  Screen.Cursor := crHourglass;
  try
    qry_COOLData.Close;
    qry_COOLData.SQL.Clear;
    qry_COOLData.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
    qry_COOLData.Parameters.ParamByName('DS').Value := RecordType;
    qry_COOLData.Open;
    COOLTblName := '[dbo].[COOL_' + qry_COOLData.FieldbyName('COOLID').AsString + ']';
    qry_COOLData.Close;
    qry_COOLData.SQL.Clear;
    qry_COOLData.SQL.Add('SELECT * FROM ' + COOLTblName + ' WHERE ID = :ID');
    qry_COOLData.Parameters.ParamByName('ID').Value := ID;
    qry_COOLData.Open;

    qry_COOLLabels.Close;
    qry_COOLLabels.SQL.Clear;
    qry_COOLLabels.SQL.Add('SELECT * FROM IndexDefinitions_COOL_Pos WHERE Description = :DS ORDER BY ID');
    qry_COOLLabels.Parameters.ParamByName('DS').Value := RecordType;
    qry_COOLLabels.Open;
    qry_COOLLabels.First;

    While not qry_COOLLabels.EOF Do
      begin
        New(COOLDataPtr);
        COOLDataPtr.ID := qry_COOLLabels.FieldByName('ID').AsInteger;
        COOLDataPtr.FieldName := qry_COOLLabels.FieldByName('FieldName').AsString;
        COOLDataPtr.FieldValue := qry_COOLData.FieldbyName(COOLDataPtr.FieldName).asString;
        COOLDataPtr.FontName := qry_COOLLabels.FieldByName('FontName').AsString;
        COOLDataPtr.FontSize := qry_COOLLabels.FieldByName('FontSize').AsInteger;
        COOLDataPtr.FontStyle := UpperCase(qry_COOLLabels.FieldByName('FontStyle').AsString);
        COOLDataPtr.PosX := qry_COOLLabels.FieldByName('XPos').AsInteger;
        COOLDataPtr.PosY := qry_COOLLabels.FieldByName('YPos').AsInteger;
        COOLDataPtr.Visible := qry_COOLLabels.FieldByName('Visible').asBoolean;

        ImageViewer.LayersAdd;
        ImageViewer.Layers[ImageViewer.LayersCurrent].UserData := COOLDataPtr;
        ImageViewer.Proc.Fill(CreateRGB(255,255,255));
        ImageViewer.Bitmap.Canvas.Font.Name := COOLDataPtr.FontName;
        ImageViewer.Bitmap.Canvas.Font.Size := COOLDataPtr.FontSize;
        ImageViewer.Bitmap.Canvas.Font.Style := [];
        If pos('BOLD', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsBold];
        If pos('ITALIC', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsItalic];
        If pos('UNDERLINE', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsUnderline];
        If pos('STRIKEOUT', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsStrikeOut];

        IETextOut(ImageViewer.Bitmap.Canvas, COOLDataPtr.PosX, COOLDataPtr.PosY, 0, COOLDataPtr.FieldValue); // draw text on NEW layer
        ImageViewer.Proc.SetTransparentColors(CreateRGB(255,255,255), CreateRGB(255,255,255), 0); // remove the white, making it as transparent

        qry_COOLLabels.Next;
      end;
  finally
    qry_COOLData.Close;
    qry_COOLLabels.Close;
    Screen.Cursor := crDefault;
  end;
end;


function Tfram_COOLThumbnails.GetDocuments(RecordType, ListImages :String):Boolean;
Var
  J                      :Integer;
  FileName               :String;
  AID                    :Integer;
  MemoryStream           :TMemoryStream;
  COOLTblName            :String;
begin
  Screen.Cursor := crHourglass;
  try
    ARecordType := RecordType;
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
    qry_SQL.Parameters.ParamByName('DS').Value := RecordType;
    qry_SQL.Open;
    COOLTblName := '[dbo].[COOL_' + qry_SQL.FieldbyName('COOLID').AsString + ']';

    qry_Thumb.Close;
    qry_Thumb.SQL.Clear;
    qry_Thumb.SQL.Add('SELECT ID FROM ' + COOLTblName);
    qry_Thumb.SQL.Add('WHERE ID IN ('+ListImages+')');
    qry_Thumb.SQL.Add('AND ID NOT IN (');
    For J := 1 to TotListdrawn Do
      qry_Thumb.SQL.Add(InttoStr(Listdrawn[J])+',');
    qry_Thumb.SQL.Add('0');
    qry_Thumb.SQL.Add(')');
    qry_Thumb.SQL.Add('ORDER BY ID');
    qry_Thumb.Open;
    qry_Thumb.First;
    While not qry_Thumb.EOF Do
      begin
        Application.ProcessMessages;
      //-----
        AID := qry_Thumb.FieldbyName('ID').asInteger;
      //-----
        ImageViewer.Clear;
        DrawCOOLBackground(RecordType);
        DrawCOOLFields(RecordType, AID);
        ImageViewer.LayersMergeAll;
      //-----
        Inc(TotListdrawn);
        Listdrawn[TotListdrawn] := AID;
        ViewedFilenames[TotListdrawn] := Filename;
      //-----
        MemoryStream := TMemoryStream.Create;
        try
          ImageViewer.IO.SaveToStreamBMP(MemoryStream);
          MemoryStream.Position := 0;
          ImageViewerPages.MIO.LoadFromStream(MemoryStream);
          ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AID;
        finally
          MemoryStream.Free;
        end;
        qry_Thumb.Next;
      end;
finally
  Result := True;
  Screen.Cursor := crDefault;
  qry_Thumb.Close;
end;
end;

function Tfram_COOLThumbnails.Redraw:Boolean;
Var
  A                   :Integer;
  AID                    :Integer;
  MemoryStream           :TMemoryStream;
begin
Screen.Cursor := crHourglass;
try
  ImageViewerPages.Clear;
  For A := 1 to TotListdrawn Do
    begin
      Application.ProcessMessages;
    //--------
      AID := Listdrawn[A];
    //-----
      ImageViewer.Clear;
      DrawCOOLBackground(ARecordType);
      DrawCOOLFields(ARecordType, AID);
      ImageViewer.LayersMergeAll;
    //-----
      MemoryStream := TMemoryStream.Create;
      try
        ImageViewer.IO.SaveToStreamBMP(MemoryStream);
        MemoryStream.Position := 0;
        ImageViewerPages.MIO.LoadFromStream(MemoryStream);
        ImageViewerPages.ImageID[ImageViewerPages.ImageCount-1] := AID;
      finally
        MemoryStream.Free;
      end;
    end;
finally
  Result := True;
  Screen.Cursor := crDefault;
  qry_Thumb.Close;
end;
end;

procedure Tfram_COOLThumbnails.Print;
Var
  A, C                :Integer;
  AID                    :Integer;
  startPage, endPage :Integer;
  FirstPageFlag          :Boolean;
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
      endPage   := ImageViewerPages.ImageCount;
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
        Application.ProcessMessages;
        Inc(A);
      //-----
        AID := Listdrawn[A];
      //-----
        If (A >= startPage) AND (A <= endPage)Then
          begin
            If not FirstPageFlag Then
              Printer.NewPage
            else FirstPageFlag := False;

            ImageViewer.Clear;
            DrawCOOLBackground(ARecordType);
            DrawCOOLFields(ARecordType, AID);
            ImageViewer.LayersMergeAll;
            ImageViewer.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
          end;
      end;
  finally
    Printer.EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

end.
