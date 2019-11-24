unit framImageViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, Buttons, DB, ADODB, GraphicEx,
  AxCtrls, OleCtrls, DBOleCtl, StdCtrls, JPEG, Menus, ImgList, imageenview,
  ieview, iemview, imageenio, iemio, Printers, DebenuPDFLibrary, iexBitmaps;

type
  Tfram_ImageViewer = class(TFrame)
    qry_eRecordImages: TADOQuery;
    qry_Annotate: TADOQuery;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    ImageEnMView1: TImageEnMView;
    ImageViewer: TImageEnView;
    TabSheet1: TTabSheet;
    ImageViewerPages: TImageEnMView;
    Panel1: TPanel;
    Bevel1: TBevel;
    btn_ZoomOut: TSpeedButton;
    btn_ZoomIn: TSpeedButton;
    btn_FittoBest: TSpeedButton;
    btn_FittoActual: TSpeedButton;
    btn_FittoHeight: TSpeedButton;
    btn_FittoWidth: TSpeedButton;
    btn_RotateLeft: TSpeedButton;
    btn_RotateRight: TSpeedButton;
    btn_NextPage: TSpeedButton;
    btn_PrevPage: TSpeedButton;
    Panel3: TPanel;
    PrintDialog1: TPrintDialog;
    ImageEnViewPrint: TImageEnView;
    PrintDialog2: TPrintDialog;
    Bevel2: TBevel;
    Bevel3: TBevel;
    cb_PageCnt: TComboBox;
    Bevel4: TBevel;
    btn_Normal: TSpeedButton;
    btn_Pan: TSpeedButton;
    btn_SelRect: TSpeedButton;
    lbl_ThumbSize: TLabel;
    cb_ThumbSize: TComboBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btn_SplitImage: TSpeedButton;
    btnMergeImages: TSpeedButton;
    Bevel7: TBevel;
    procedure btn_ZoomInClick(Sender: TObject);
    procedure btn_ZoomOutClick(Sender: TObject);
    procedure btn_FittoWidthClick(Sender: TObject);
    procedure btn_FittoHeightClick(Sender: TObject);
    procedure btn_FittoActualClick(Sender: TObject);
    procedure btn_FittoBestClick(Sender: TObject);
    procedure btn_RotateLeftClick(Sender: TObject);
    procedure btn_RotateRightClick(Sender: TObject);
    procedure btn_PrevPageClick(Sender: TObject);
    procedure btn_NextPageClick(Sender: TObject);
    procedure cb_PageCntChange(Sender: TObject);
    procedure btn_NormalClick(Sender: TObject);
    procedure btn_PanClick(Sender: TObject);
    procedure btn_SelRectClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ImageViewerPagesImageSelect(Sender: TObject; idx: Integer);
    procedure cb_ThumbSizeChange(Sender: TObject);
  private
    { Private declarations }
    TotalPages  :Integer;
    ImageStream  :TMemoryStream;
    DocType    :String;
    ThumbsLoaded   :Boolean;
    cRotate      :Array[0..200] of Integer;
    procedure LoadPDFPage(PDFFilename :String; PageNo:Integer; VAR OutputStream :TMemoryStream);
  public
    { Public declarations }
    FileName   :String;
    AImageNo   :Integer;
    function GetDocuments(Module :String; ImageNo :Integer):Boolean;
    function SetPosition(X, Y :Integer; Zoom :Single):Boolean;
    Procedure GetPosition(VAR x, y :Integer; VAR Zoom : Single);
    Procedure FreeMemoryStream();
    procedure Print;
  end;

implementation

USES MetrofilerDataModule, ImageAnnote, eRecords;

{$R *.dfm}

procedure Tfram_ImageViewer.ImageViewerPagesImageSelect(Sender: TObject;
  idx: Integer);
begin
  Screen.Cursor := crHourglass;
  try
    If (DocType = '.PDF')Then
      begin
        ImageStream.Clear;
        LoadPDFPage(Filename, idx+1, ImageStream);
        ImageStream.Position := 0;
        ImageViewer.IO.LoadFromStream(ImageStream);
        If cRotate[idx] <> 0 Then
          ImageViewer.Proc.Rotate(cRotate[idx]);
      end
    else
      begin
        ImageViewer.IO.Params.ImageIndex := idx;
        ImageStream.Position := 0;
        ImageViewer.IO.LoadFromStream(ImageStream);
        If dm_Metrofiler.ViewerLastView = 'Best' Then
          btn_FittoBest.Click;
        If dm_Metrofiler.ViewerLastView = 'Width' Then
          btn_FittoWidth.Click;
        If dm_Metrofiler.ViewerLastView = 'Height' Then
          btn_FittoHeight.Click;
        If dm_Metrofiler.ViewerLastView = 'Actual' Then
          btn_FittoActual.Click;
      end;

    PageControl1.ActivePageIndex := 0;
    PageControl1Change(Self);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.PageControl1Change(Sender: TObject);
Var
  J   :Integer;
begin
  If PageControl1.ActivePageIndex = 0 Then
    begin
      btn_ZoomIn.Enabled := true;
      btn_ZoomOut.Enabled := true;
      btn_FittoWidth.Enabled := true;
      btn_FittoHeight.Enabled := true;
      btn_FittoActual.Enabled := true;
      btn_FittoBest.Enabled := true;
      btn_RotateLeft.Enabled := true;
      btn_RotateRight.Enabled := true;
      btn_PrevPage.Enabled := (TotalPages > 1);
      btn_NextPage.Enabled := (TotalPages > 1);
      cb_PageCnt.Enabled := (TotalPages > 1);
      btn_Normal.Enabled := true;
      btn_Pan.Enabled := true;
      btn_SelRect.Enabled := true;

      cb_ThumbSize.Enabled := false;
      lbl_ThumbSize.Enabled := false;
    end
  else If PageControl1.ActivePageIndex = 1 Then
    begin
      btn_ZoomIn.Enabled := false;
      btn_ZoomOut.Enabled := false;
      btn_FittoWidth.Enabled := false;
      btn_FittoHeight.Enabled := false;
      btn_FittoActual.Enabled := false;
      btn_FittoBest.Enabled := false;
      btn_RotateLeft.Enabled := false;
      btn_RotateRight.Enabled := false;
      btn_PrevPage.Enabled := false;
      btn_NextPage.Enabled := false;
      cb_PageCnt.Enabled := false;
      btn_Normal.Enabled := false;
      btn_Pan.Enabled := false;
      btn_SelRect.Enabled := false;

      cb_ThumbSize.Enabled := (TotalPages > 1);
      lbl_ThumbSize.Enabled := (TotalPages > 1);

      If (DocType = '.PDF')Then
        begin
          If not ThumbsLoaded Then
            begin
              ThumbsLoaded := True;
              ImageViewerPages.Clear;
              For J := 1 to TotalPages Do
                begin
                  Application.ProcessMessages;
                  ImageStream.Clear;
                  LoadPDFPage(Filename, J, ImageStream);
                  ImageStream.Position := 0;
                  ImageViewerPages.MIO.LoadFromStream(ImageStream);
                end;
              ImageViewerPages.SelectedImage := 0;
              if cRotate[0] <> 0 Then
                ImageViewerPages.Proc.Rotate(cRotate[0]);
            end;
        end;
    end;
end;

procedure Tfram_ImageViewer.btn_FittoActualClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    dm_Metrofiler.ViewerLastView := 'Actual';

    ImageViewer.Zoom := 100;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := true;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_FittoBestClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    dm_Metrofiler.ViewerLastView := 'Best';
    ImageViewer.Fit;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := true;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_FittoHeightClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    dm_Metrofiler.ViewerLastView := 'Height';
    ImageViewer.FitToHeight;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := true;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_FittoWidthClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    dm_Metrofiler.ViewerLastView := 'Width';
    ImageViewer.FitToWidth;
    btn_FittoWidth.Down := true;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_NextPageClick(Sender: TObject);
begin
  If cb_PageCnt.ItemIndex < cb_PageCnt.Items.Count-1 Then
    begin
      cb_PageCnt.ItemIndex := cb_PageCnt.ItemIndex+1;
      cb_PageCntChange(Self);
    end;
end;

procedure Tfram_ImageViewer.btn_NormalClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [];
  btn_Normal.Down := true;
  btn_Pan.Down := false;
  btn_SelRect.Down := false;
end;

procedure Tfram_ImageViewer.btn_PanClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [miScroll];
  btn_Normal.Down := false;
  btn_Pan.Down := true;
  btn_SelRect.Down := false;
end;

procedure Tfram_ImageViewer.btn_PrevPageClick(Sender: TObject);
begin
  If cb_PageCnt.ItemIndex > 0 Then
    begin
      cb_PageCnt.ItemIndex := cb_PageCnt.ItemIndex-1;
      cb_PageCntChange(Self);
    end;
end;

procedure Tfram_ImageViewer.btn_RotateLeftClick(Sender: TObject);
Var
  idx   :Integer;
begin
  Screen.Cursor := crHourglass;
  try
    idx := ImageViewerPages.SelectedImage;
    If idx = -1 Then
      idx := 0;

    If cRotate[idx] >= 270 Then
      cRotate[idx] := 0
    else Inc(cRotate[idx], 90);

    ImageViewer.Proc.Rotate(90);
    If ImageViewerPages.ImageCount > 0 Then
      ImageViewerPages.Proc.Rotate(90);
    If (DocType <> '.PDF') AND (TotalPages > 1) Then
      begin
        ImageEnMView1.Proc.Rotate(90);
        ImageEnMView1.MIO.SaveToFile(Filename);
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_RotateRightClick(Sender: TObject);
Var
  idx   :Integer;
begin
  Screen.Cursor := crHourglass;
  try
    idx := ImageViewerPages.SelectedImage;
    If idx = -1 Then
      idx := 0;
    If cRotate[idx] <= 0 Then
      cRotate[idx] := 270
    else Dec(cRotate[idx], 90);

    ImageViewer.Proc.Rotate(270);
    If ImageViewerPages.ImageCount > 0 Then
      ImageViewerPages.Proc.Rotate(270);
    If (DocType <> '.PDF') AND (TotalPages > 1) Then
      begin
        ImageEnMView1.Proc.Rotate(270);
        ImageEnMView1.MIO.SaveToFile(Filename);
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_SelRectClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [miSelectZoom];
  btn_Normal.Down := false;
  btn_Pan.Down := false;
  btn_SelRect.Down := true;
end;

procedure Tfram_ImageViewer.btn_ZoomInClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
  If ImageViewer.Zoom <= 10 Then
    ImageViewer.Zoom := ImageViewer.Zoom+1
  else If ImageViewer.Zoom <= 20 Then
    ImageViewer.Zoom := ImageViewer.Zoom+2
  else If ImageViewer.Zoom <= 50 Then
    ImageViewer.Zoom := ImageViewer.Zoom+5
  else if ImageViewer.Zoom <= 100 Then
    ImageViewer.Zoom := ImageViewer.Zoom+10
  else ImageViewer.Zoom := ImageViewer.Zoom+20;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.btn_ZoomOutClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
   If ImageViewer.Zoom <= 10 Then
     ImageViewer.Zoom := ImageViewer.Zoom-1
   else If ImageViewer.Zoom <= 20 Then
     ImageViewer.Zoom := ImageViewer.Zoom-2
   else If ImageViewer.Zoom <= 50 Then
     ImageViewer.Zoom := ImageViewer.Zoom-5
   else if ImageViewer.Zoom <= 100 Then
     ImageViewer.Zoom := ImageViewer.Zoom-10
   else ImageViewer.Zoom := ImageViewer.Zoom-20;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_ImageViewer.Print;
Var
  TotPagesToPrint    :Integer;
  J                  :Integer;
  ExtName            :String;
  MemoryStream       :TMemoryStream;
  startPage, endPage :Integer;
  NewPageFlag        :Boolean;
begin
  If Filename = '' Then
    begin
      Messagedlg('Nothing to Print.', mtWarning, [mbOK], 0);
      exit;
    end;

  ExtName := UpperCase(ExtractFileExt(Filename));
  If ExtName = '.PDF' Then
    begin
      TotPagesToPrint := dm_Metrofiler.GetPDFPageCount(Filename);

      PrintDialog1.MinPage := 1;
      PrintDialog1.MaxPage := TotPagesToPrint;
      PrintDialog1.FromPage := 1;
      PrintDialog1.ToPage := TotPagesToPrint;
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
        NewPageFlag := False;
        For J := startPage to endPage Do
          begin
            MemoryStream := TMemoryStream.Create;
            try
              MemoryStream.Clear;
              LoadPDFPage(Filename, J, MemoryStream);
              MemoryStream.Position := 0;

              If NewPageFlag Then
                Printer.NewPage
              else NewPageFlag := true;

              ImageEnViewPrint.Clear;
              ImageEnViewPrint.IO.Params.ImageIndex := 0;
              ImageEnViewPrint.IO.LoadFromStream(MemoryStream);
              ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
            finally
              MemoryStream.Free;
            end;
          end;
      finally
        Printer.EndDoc;
        Screen.Cursor := crDefault;
      end;
    end
  else If (ExtName = '.TIF')OR
          (ExtName = '.TIFF')Then
    begin
      TotPagesToPrint := EnumTIFFIm(Filename);

      PrintDialog1.MinPage := 1;
      PrintDialog1.MaxPage := TotPagesToPrint;
      PrintDialog1.FromPage := 1;
      PrintDialog1.ToPage := TotPagesToPrint;
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

        NewPageFlag := False;
        For J := startPage to endPage Do
          begin
              If NewPageFlag Then
                Printer.NewPage
              else NewPageFlag := true;

            if J > 1 then
              Printer.NewPage;
            ImageEnViewPrint.Clear;
            ImageEnViewPrint.IO.Params.ImageIndex := J-1;
            ImageEnViewPrint.IO.LoadFromFile(Filename);
            ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
          end;
      finally
        Printer.EndDoc;
        Screen.Cursor := crDefault;
      end;
    end
  else
    begin
      TotPagesToPrint := 1;

      PrintDialog1.MinPage := 1;
      PrintDialog1.MaxPage := TotPagesToPrint;
      PrintDialog1.FromPage := 1;
      PrintDialog1.ToPage := TotPagesToPrint;
      PrintDialog1.Options := [poPageNums];

      If not PrintDialog1.Execute() Then
        exit;

      Screen.Cursor := crHourglass;
      try
        Printer.Title := 'Metrofile Viewer Print';
        Printer.Copies := PrintDialog1.Copies;
        Printer.BeginDoc;

        ImageEnViewPrint.Clear;
        ImageEnViewPrint.IO.Params.ImageIndex := 0;
        ImageEnViewPrint.IO.LoadFromFile(Filename);
        ImageEnViewPrint.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
      finally
        Printer.EndDoc;
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure Tfram_ImageViewer.cb_PageCntChange(Sender: TObject);
begin
  If (DocType = '.PDF')Then
    begin
      ImageStream.Clear;
      LoadPDFPage(Filename, StrtoInt(cb_PageCnt.Text), ImageStream);
      ImageStream.Position := 0;
      ImageViewer.IO.LoadFromStream(ImageStream);

      If cRotate[cb_PageCnt.ItemIndex] <> 0 Then
        ImageViewer.Proc.Rotate(cRotate[cb_PageCnt.ItemIndex]);

      If dm_Metrofiler.ViewerLastView = 'Best' Then
        btn_FittoBest.Click;
      If dm_Metrofiler.ViewerLastView = 'Width' Then
        btn_FittoWidth.Click;
      If dm_Metrofiler.ViewerLastView = 'Height' Then
        btn_FittoHeight.Click;
      If dm_Metrofiler.ViewerLastView = 'Actual' Then
        btn_FittoActual.Click;
    end
  else
    begin
     ImageViewerPagesImageSelect(Self, cb_PageCnt.ItemIndex);
     ImageViewerPages.SelectedImage := cb_PageCnt.ItemIndex;
    end;
end;

procedure Tfram_ImageViewer.cb_ThumbSizeChange(Sender: TObject);
Var
  B, J, tSize   :Integer;
begin
  Screen.Cursor := crHourglass;
  B := ImageViewerPages.SelectedImage;
  try
    tSize := StrtoInt(copy(cb_ThumbSize.Text, 1, pos('x', cb_ThumbSize.Text)-1));

    ImageViewerPages.Clear;
    ImageViewerPages.ThumbWidth := tSize;
    ImageViewerPages.ThumbHeight := tSize;

    If (DocType = '.PDF')Then
      begin
        For J := 1 to TotalPages Do
          begin
            Application.ProcessMessages;
            ImageStream.Clear;
            LoadPDFPage(Filename, J, ImageStream);
            ImageStream.Position := 0;
            ImageViewerPages.MIO.LoadFromStream(ImageStream);
          end;
        For J := 0 to TotalPages-1 Do
          begin
            if cRotate[J] <> 0 Then
              begin
                ImageViewerPages.SelectedImage := J;
                ImageViewerPages.Proc.Rotate(cRotate[J]);
              end;
          end;
      end
    else
      begin
        ImageStream.Position := 0;
        ImageViewerPages.MIO.LoadFromStream(ImageStream);
      end;
    ImageViewerPages.SelectedImage := B;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function Tfram_ImageViewer.GetDocuments(Module :String; ImageNo :Integer):Boolean;
Var
  J          :Integer;
  PageCount    :Integer;
begin
Screen.Cursor := crHourglass;
try
//==============================================================================
//-------Initialize
//==============================================================================
  PageControl1.ActivePageIndex := 0;
  PageControl1Change(Self);
  ImageViewer.MouseInteract := [];

  btn_ZoomIn.Enabled := false;
  btn_ZoomOut.Enabled := false;
  btn_FittoWidth.Enabled := false;
  btn_FittoHeight.Enabled := false;
  btn_FittoActual.Enabled := false;
  btn_FittoBest.Enabled := false;
  btn_RotateLeft.Enabled := false;
  btn_RotateRight.Enabled := false;
  btn_PrevPage.Enabled := false;
  btn_NextPage.Enabled := false;
  cb_PageCnt.Enabled := false;
  btn_Normal.Enabled := false;
  btn_Pan.Enabled := false;
  btn_SelRect.Enabled := false;

  Tabsheet1.TabVisible := false;
  Tabsheet1.Visible := false;
  Tabsheet2.TabVisible := false;
  Tabsheet2.Visible := false;

  cb_ThumbSize.Enabled := false;
  lbl_ThumbSize.Enabled := false;

  For J := 0 to 200 Do
    cRotate[J] := 0;
//==============================================================================
//-------First Cache to Disk and then Reload
//==============================================================================
//  ImgEdit.AnnotationFillColor := frm_ImageAnnote.Shape_FillColor.Brush.Color;
//  ImgEdit.AnnotationFontColor := frm_ImageAnnote.lbl_Color.Font.Color;
//  ImgEdit.AnnotationLineColor := frm_ImageAnnote.lbl_Color.Font.Color;
//  CursorMode := 1;
//  ImgEdit.MousePointer := 0;
//  ImgEdit.SelectionRectangle := False;
  Result := False;
  ImageViewerPages.Clear;
  If ImageNo = 0 Then
    begin
      exit;
    end;
//---------
  AImageNo := ImageNo;
  FileName := dm_Metrofiler.ReadERecFromRepositry(Module, AImageNo);
  DocType := UpperCase(ExtractFileExt(Filename));
//---------
  If (DocType <> '.TIFF')AND
     (DocType <> '.TIF')AND
     (DocType <> '.JPEG')AND
     (DocType <> '.JPG')AND
     (DocType <> '.PNG')AND
     (DocType <> '.PCX')AND
     (DocType <> '.BMP')AND
     (DocType <> '.PDF')AND
     (DocType <> '.PSD')Then
    begin
      Messagedlg('Image format <'+DocType+'> not supported by this viewer!', mtWarning, [mbOK], 0);
      exit;
    end;
//====================PDF Convertion============================================
  If (DocType = '.PDF')Then
    begin
      PageCount := dm_Metrofiler.GetPDFPageCount(Filename);

      ImageStream := TMemoryStream.Create;
      ImageStream.Clear;
      LoadPDFPage(Filename, 1, ImageStream);

      TotalPages := PageCount;

      cb_PageCnt.Items.Clear;
      For J := 1 to PageCount Do
        cb_PageCnt.Items.Append(InttoStr(J));

      cb_PageCnt.ItemIndex := 0;
      btn_PrevPage.Enabled := (PageCount > 1);
      btn_NextPage.Enabled := (PageCount > 1);
      cb_PageCnt.Enabled := (PageCount > 1);
      If (PageCount > 1) Then
        begin
          Tabsheet1.TabVisible := true;
          Tabsheet1.Visible := true;
          Tabsheet2.TabVisible := true;
          Tabsheet2.Visible := true;
        end
      else
        begin
          Tabsheet1.TabVisible := false;
          Tabsheet1.Visible := false;
          Tabsheet2.TabVisible := false;
          Tabsheet2.Visible := true;
        end;

      ImageStream.Position := 0;
      ImageViewer.IO.LoadFromStream(ImageStream);

      If dm_Metrofiler.ViewerLastView = 'Best' Then
        btn_FittoBest.Click
      else If dm_Metrofiler.ViewerLastView = 'Width' Then
        btn_FittoWidth.Click
      else If dm_Metrofiler.ViewerLastView = 'Height' Then
        btn_FittoHeight.Click
      else If dm_Metrofiler.ViewerLastView = 'Actual' Then
        btn_FittoActual.Click
      else btn_FittoActual.Click;

      PageControl1.ActivePageIndex := 0;
      PageControl1Change(Self);
    end
  else
    begin
      ImageStream := TMemoryStream.Create;
      ImageStream.LoadFromFile(Filename);
      ImageStream.Position := 0;
      ImageViewerPages.Clear;
      ImageViewerPages.MIO.LoadFromStream(ImageStream);

      TotalPages := EnumTIFFIm(Filename);

      ImageEnMView1.Clear;
      If TotalPages > 1 Then
        begin
          ImageStream.Position := 0;
          ImageEnMView1.MIO.LoadFromStream(ImageStream);
        end;

      cb_PageCnt.Items.Clear;
      For J := 1 to TotalPages Do
        cb_PageCnt.Items.Append(InttoStr(J));

      cb_PageCnt.ItemIndex := 0;
      btn_PrevPage.Enabled := (TotalPages > 1);
      btn_NextPage.Enabled := (TotalPages > 1);
      cb_PageCnt.Enabled := (TotalPages > 1);
      If (TotalPages > 1) Then
        begin
          Tabsheet1.TabVisible := true;
          Tabsheet1.Visible := true;
          Tabsheet2.TabVisible := true;
          Tabsheet2.Visible := true;
        end
      else
        begin
          Tabsheet1.TabVisible := false;
          Tabsheet1.Visible := false;
          Tabsheet2.TabVisible := false;
          Tabsheet2.Visible := true;
        end;

      ImageViewerPages.SelectedImage := 0;
      ImageViewerPagesImageSelect(Self, 0);

      If dm_Metrofiler.ViewerLastView = 'Best' Then
        btn_FittoBest.Click
      else If dm_Metrofiler.ViewerLastView = 'Width' Then
        btn_FittoWidth.Click
      else If dm_Metrofiler.ViewerLastView = 'Height' Then
        btn_FittoHeight.Click
      else If dm_Metrofiler.ViewerLastView = 'Actual' Then
        btn_FittoActual.Click
      else btn_FittoActual.Click;

      PageControl1.ActivePageIndex := 0;
      PageControl1Change(Self);
    end;
  Result := True;
finally
  Screen.Cursor := crDefault;
end;
end;

function Tfram_ImageViewer.SetPosition(X, Y :Integer; Zoom :Single):Boolean;
begin
//----
  ImageViewer.Zoom := Zoom;
  ImageViewer.ViewX := X;
  ImageViewer.ViewY := Y;
  Result := True;
end;

Procedure Tfram_ImageViewer.GetPosition(VAR x, y :Integer; VAR Zoom : Single);
begin
//----
  X := ImageViewer.ViewX;
  Y := ImageViewer.ViewY;
  Zoom := ImageViewer.Zoom;
end;

procedure Tfram_ImageViewer.LoadPDFPage(PDFFilename :String; PageNo:Integer; VAR OutputStream :TMemoryStream);
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

Procedure Tfram_ImageViewer.FreeMemoryStream();
begin
  If ImageStream <> Nil Then
    ImageStream.Free;
end;


end.
