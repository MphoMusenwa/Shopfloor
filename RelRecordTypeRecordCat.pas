unit RelRecordTypeRecordCat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_RelRecordTypeRecordCat = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    sgrd_RecordCat: TStringGrid;
    Bevel1: TBevel;
    qry_Access: TADOQuery;
    lbl_BranchHd: TLabel;
    lbl_RecordType: TLabel;
    qry_RecordType: TADOQuery;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeSelectAll1: TMenuItem;
    procedure btn_SelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgrd_RecordCatDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure sgrd_RecordCatClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeSelectAll1Click(Sender: TObject);
  private
    { Private declarations }
    mRecordType   :String;
    FCheck, FNoCheck     :TBitmap;
    RecordCatChk  :TStringList;
    procedure DisplayAccess;
    procedure ToggleCheckboxUsers( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(RecordType :String):Integer;
  end;

var
  frm_RelRecordTypeRecordCat: Tfrm_RelRecordTypeRecordCat;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_RelRecordTypeRecordCat.btn_SelectClick(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   RCRTRts');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   RecordType = :RecordType');
  qry_Access.Parameters.ParamValues['RecordType'] := mRecordType;
  qry_Access.ExecSQL;
//---------------Add Users---------------------
  if (sgrd_RecordCat.Cells[0,1] > '')and(sgrd_RecordCat.RowCount > 1)then
    begin
      for I := 1 to sgrd_RecordCat.RowCount-1 do
        begin
          If RecordCatChk.Strings[I-1] = '1' Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO RCRTRts (RecordCat, Code, RecordType) VALUES(:RecordCat, :Code, :RecordType)');
              qry_Access.Parameters.ParamByName('RecordType').Value := mRecordType;
              qry_Access.Parameters.ParamByName('Code').Value := CompsCode;
              qry_Access.Parameters.ParamByName('RecordCat').Value := sgrd_RecordCat.Cells[0,I];
              qry_Access.ExecSQL;
            end;
        end;
    end;
  //---------------------------
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_RelRecordTypeRecordCat.DeSelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RecordCatChk.Count-1 do
    begin
      RecordCatChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_RecordCat.RowCount - 1 do
    begin
      TGridCracker(sgrd_RecordCat).InvalidateCell(sgrd_RecordCat.ColCount-1 , J);
    end;
end;

procedure Tfrm_RelRecordTypeRecordCat.DisplayAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..1]  of Integer;
begin
//-------------------Build Users-----------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   a.RecCatType,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM RCRTRts x WHERE x.RecordType = :RecordType AND x.RecordCat = a.RecCatType) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   RecordCat a');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.RecCatType');
  qry_Access.Parameters.ParamValues['RecordType'] := mRecordType;
  qry_Access.Open;

  sgrd_RecordCat.RowCount := 2;
  sgrd_RecordCat.Cells[0,0] := 'Record Category';
  sgrd_RecordCat.Cells[1,0] := 'Access';
  sgrd_RecordCat.Cells[0,1] := '';
  sgrd_RecordCat.Cells[1,1] := '';

  MaxLen[0] := sgrd_RecordCat.Canvas.TextWidth(sgrd_RecordCat.Cells[0,0])+10;

  RecordCatChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_RecordCat.RowCount := R+1;
      sgrd_RecordCat.Cells[0,R] := qry_Access.FieldByName('RecCatType').AsString;

      If qry_Access.FieldByName('Access').AsInteger = 1 Then
        RecordCatChk.Append('1')
      else RecordCatChk.Append('0');

      If sgrd_RecordCat.Canvas.TextWidth(sgrd_RecordCat.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := sgrd_RecordCat.Canvas.TextWidth(sgrd_RecordCat.Cells[0,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_RecordCat.ColWidths[0] := MaxLen[0];
  sgrd_RecordCat.ColWidths[1] := sgrd_RecordCat.Canvas.TextWidth('Access')+10;
end;

function Tfrm_RelRecordTypeRecordCat.Execute(RecordType :String):Integer;
begin
  mRecordType := RecordType;

  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT Description FROM IndexDefinitions WHERE Description = :RecordType');
  qry_RecordType.Parameters.ParamValues['RecordType'] := mRecordType;
  qry_RecordType.Open;

  lbl_RecordType.Caption := qry_RecordType.FieldbyName('Description').AsString;

  DisplayAccess;

  Result := ShowModal;
end;

procedure Tfrm_RelRecordTypeRecordCat.FormCreate(Sender: TObject);
var 
  bmp: TBitmap; 
begin 
  FCheck:= TBitmap.Create;
  FNoCheck:= TBitmap.Create;
  bmp:= TBitmap.create; 
  try 
    bmp.handle := LoadBitmap( 0, PChar(OBM_CHECKBOXES ));
    // bmp now has a 4x3 bitmap of divers state images 
    // used by checkboxes and radiobuttons
    With FNoCheck Do Begin 
      // the first subimage is the unchecked box 
      width := bmp.width div 4; 
      height := bmp.height div 3; 
      canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect ); 
    End; 
    With FCheck Do Begin 
      // the second subimage is the checked box 
      width := bmp.width div 4; 
      height := bmp.height div 3; 
      canvas.copyrect( 
        canvas.cliprect, 
        bmp.canvas,
        rect( width, 0, 2*width, height ));
    End; 
  finally 
    bmp.free 
  end;

  RecordCatChk  := TStringList.Create;
end;

procedure Tfrm_RelRecordTypeRecordCat.FormDestroy(Sender: TObject);
begin
  RecordCatChk.Free;
end;

procedure Tfrm_RelRecordTypeRecordCat.SelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RecordCatChk.Count-1 do
    begin
      RecordCatChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_RecordCat.RowCount - 1 do
    begin
      TGridCracker(sgrd_RecordCat).InvalidateCell(sgrd_RecordCat.ColCount-1 , J);
    end;
end;

procedure Tfrm_RelRecordTypeRecordCat.sgrd_RecordCatClick(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol in [1,2,3,4,5]) and (aRow >= grid.fixedRows) Then
    begin
      // click landed in a checkbox cell
      ToggleCheckboxUsers( aCol, aRow );
    end;
end;

procedure Tfrm_RelRecordTypeRecordCat.ToggleCheckboxUsers( acol, arow: Integer );
begin
  if sgrd_RecordCat.Cells[0, aRow] = '' Then
    exit;
  If aCol in [1] Then
    With TGridCracker( sgrd_RecordCat ) Do
      Begin
        If aCol = 1 Then
          begin
            If RecordCatChk.Count < ARow Then
              exit;
            If RecordCatChk.Strings[ARow-1] = '1' Then
              RecordCatChk.Strings[ARow-1] := '0'
            else RecordCatChk.Strings[ARow-1] := '1';
            InvalidateCell( aCol, aRow );
          end;
      end;
end;


procedure Tfrm_RelRecordTypeRecordCat.sgrd_RecordCatDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 1 Then
        begin
          If RecordCatChk.Count < ARow Then
            exit;

          If RecordCatChk.Strings[ARow-1] = '1' Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
    end;
end;

end.
