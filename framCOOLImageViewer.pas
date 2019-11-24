unit framCOOLImageViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, Buttons, DB, ADODB, GraphicEx,
  AxCtrls, OleCtrls, DBOleCtl, StdCtrls, JPEG, Menus, ImgList, imageenview,
  ieview, iemview, imageenio, iemio, DebenuPDFLibrary, Printers, ImageEnProc;

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
  Tfram_COOLImageViewer = class(TFrame)
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
    Panel3: TPanel;
    PrintDialog1: TPrintDialog;
    PrintDialog2: TPrintDialog;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btn_Normal: TSpeedButton;
    btn_Pan: TSpeedButton;
    btn_SelRect: TSpeedButton;
    Bevel5: TBevel;
    ImageEnViewPrint: TImageEnView;
    ImageEnMView1: TImageEnMView;
    qry_COOLBackground: TADOQuery;
    qry_COOLLabels: TADOQuery;
    qry_COOLData: TADOQuery;
    ImageViewer: TImageEnView;
    procedure btn_ZoomInClick(Sender: TObject);
    procedure btn_ZoomOutClick(Sender: TObject);
    procedure btn_FittoWidthClick(Sender: TObject);
    procedure btn_FittoHeightClick(Sender: TObject);
    procedure btn_FittoActualClick(Sender: TObject);
    procedure btn_FittoBestClick(Sender: TObject);
    procedure btn_RotateLeftClick(Sender: TObject);
    procedure btn_RotateRightClick(Sender: TObject);
    procedure btn_NormalClick(Sender: TObject);
    procedure btn_PanClick(Sender: TObject);
    procedure btn_SelRectClick(Sender: TObject);
  private
    { Private declarations }
    function DrawCOOLBackground(RecordType  :String):Boolean;
    function DrawCOOLFields(RecordType  :String; ID :Integer):Boolean;
    procedure IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
  public
    { Public declarations }
    FileName   :String;
    AID   :Integer;
    function GetDocuments(RecordType  :String; ID :Integer):Boolean;
    procedure Print;
  end;

implementation

USES MetrofilerDataModule, ImageAnnote, eRecords;

{$R *.dfm}

procedure Tfram_COOLImageViewer.btn_FittoActualClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.btn_FittoBestClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.btn_FittoHeightClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.btn_FittoWidthClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.btn_NormalClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [];
  btn_Normal.Down := true;
  btn_Pan.Down := false;
  btn_SelRect.Down := false;
end;

procedure Tfram_COOLImageViewer.btn_PanClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [miScroll];
  btn_Normal.Down := false;
  btn_Pan.Down := true;
  btn_SelRect.Down := false;
end;

procedure Tfram_COOLImageViewer.btn_RotateLeftClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.Proc.Rotate(90);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_COOLImageViewer.btn_RotateRightClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.Proc.Rotate(270);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_COOLImageViewer.btn_SelRectClick(Sender: TObject);
begin
  ImageViewer.MouseInteract := [miSelectZoom];
  btn_Normal.Down := false;
  btn_Pan.Down := false;
  btn_SelRect.Down := true;
end;

procedure Tfram_COOLImageViewer.btn_ZoomInClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.btn_ZoomOutClick(Sender: TObject);
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

procedure Tfram_COOLImageViewer.Print;
begin
  If not PrintDialog1.Execute() Then
    exit;
  Screen.Cursor := crHourglass;
  try
    Printer.Title := 'Metrofile COOL Print';
    Printer.Copies := PrintDialog1.Copies;
    Printer.BeginDoc;
    ImageViewer.IO.PrintImage(Printer.Canvas,0,0,0,0,ievpCENTER,iehpCENTER,iesFITTOPAGE,0,0,1);
  finally
    Printer.EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

function Tfram_COOLImageViewer.DrawCOOLBackground(RecordType  :String):Boolean;
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

function Tfram_COOLImageViewer.DrawCOOLFields(RecordType  :String; ID :Integer):Boolean;
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


procedure Tfram_COOLImageViewer.IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
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

function Tfram_COOLImageViewer.GetDocuments(RecordType  :String; ID :Integer):Boolean;
begin
Screen.Cursor := crHourglass;
try
//==============================================================================
//-------Initialize
//==============================================================================
  ImageViewer.MouseInteract := [];
  Result := False;
  If ID = 0 Then
    exit;
//---------
  AID := ID;

  DrawCOOLBackground(RecordType);
  DrawCOOLFields(RecordType, AID);
  ImageViewer.LayersMergeAll;

  If dm_Metrofiler.ViewerLastView = 'Best' Then
    btn_FittoBest.Click
  else If dm_Metrofiler.ViewerLastView = 'Width' Then
    btn_FittoWidth.Click
  else If dm_Metrofiler.ViewerLastView = 'Height' Then
    btn_FittoHeight.Click
  else If dm_Metrofiler.ViewerLastView = 'Actual' Then
    btn_FittoActual.Click
  else btn_FittoBest.Click;

  Result := True;
finally
  Screen.Cursor := crDefault;
end;
end;

end.
