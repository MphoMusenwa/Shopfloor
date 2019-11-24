unit AccessUserRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_AccessUserRole = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    qry_Access: TADOQuery;
    Bevel1: TBevel;
    sgrd_Access: TStringGrid;
    lbl_User: TLabel;
    lbl_UserID: TLabel;
    qry_AuthCodes: TADOQuery;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeSelectAll1: TMenuItem;
    procedure sgrd_AccessClick(Sender: TObject);
    procedure sgrd_AccessDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SelectClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeSelectAll1Click(Sender: TObject);
  private
    { Private declarations }
    mUserId   :String;
    AccessChk  :TStringList;
    FCheck, FNoCheck     :TBitmap;
    procedure DisplayAccess;
    procedure ToggleCheckbox( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(UserId :String):Integer;
  end;

var
  frm_AccessUserRole: Tfrm_AccessUserRole;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_AccessUserRole.btn_SelectClick(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   RolesRts');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   UserId = :UserId');
  qry_Access.Parameters.ParamValues['UserId'] := mUserId;
  qry_Access.ExecSQL;
//---------------Add Access---------------------
  if (sgrd_Access.Cells[0,1] > '')and(sgrd_Access.RowCount > 1)then
    begin
      for I := 1 to sgrd_Access.RowCount-1 do
        begin
          If AccessChk.Strings[I-1] = '1' Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO RolesRts (RoleId, UserId) VALUES(:RoleId, :UserId)');
              qry_Access.Parameters.ParamByName('RoleId').Value := StrtoInt(sgrd_Access.Cells[0,I]);
              qry_Access.Parameters.ParamByName('UserId').Value := mUserId;
              qry_Access.ExecSQL;
            end;
        end;
    end;
  //---------------------------
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessUserRole.DeSelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to AccessChk.Count-1 do
    begin
      AccessChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Access.RowCount - 1 do
    begin
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessUserRole.DisplayAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..1]  of Integer;
begin
//-------------------Build DeliveryTypes----------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   a.RoleId,');
  qry_Access.SQL.Add('   a.Role,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM RolesRts x WHERE x.UserId = :UserId AND x.RoleId = a.RoleId) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   Roles a');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.RoleId');
  qry_Access.Parameters.ParamValues['UserId'] := mUserId;
  qry_Access.Open;

  sgrd_Access.RowCount := 2;
  sgrd_Access.Cells[0,0] := 'RoleId';
  sgrd_Access.Cells[1,0] := 'Role';
  sgrd_Access.Cells[2,0] := 'Access';
  sgrd_Access.Cells[0,1] := '';
  sgrd_Access.Cells[1,1] := '';
  sgrd_Access.Cells[2,1] := '';

  MaxLen[0] := sgrd_Access.Canvas.TextWidth('RoleId')+10;
  MaxLen[1] := sgrd_Access.Canvas.TextWidth('Role')+10;

  AccessChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Access.RowCount := R+1;
      sgrd_Access.Cells[0,R] := qry_Access.FieldByName('RoleId').AsString;
      sgrd_Access.Cells[1,R] := qry_Access.FieldByName('Role').AsString;

      If qry_Access.FieldByName('Access').AsInteger = 1 Then
        AccessChk.Append('1')
      else AccessChk.Append('0');

      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[0,R])+10;
      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[1,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Access.ColWidths[0] := MaxLen[0];
  sgrd_Access.ColWidths[1] := MaxLen[1];
  sgrd_Access.ColWidths[2] := sgrd_Access.Canvas.TextWidth('Access')+10;
end;

function Tfrm_AccessUserRole.Execute(UserId :String):Integer;
Var
  TempStr   :String;
begin
  mUserId := Userid;

  qry_AuthCodes.Close;
  qry_AuthCodes.SQL.Clear;
  qry_AuthCodes.SQL.Add('SELECT UserId, Surname, Name FROM AuthCodes WHERE UserId = :UserId');
  qry_AuthCodes.Parameters.ParamValues['UserId'] := mUserId;
  qry_AuthCodes.Open;

  TempStr := trim(qry_AuthCodes.FieldbyName('NAME').AsString) + ' ' + trim(qry_AuthCodes.FieldbyName('SURNAME').AsString);
  TempStr := trim(qry_AuthCodes.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);
  lbl_UserId.Caption := TempStr;

  DisplayAccess;

  Result := ShowModal;
end;


procedure Tfrm_AccessUserRole.FormCreate(Sender: TObject);
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

  AccessChk  := TStringList.Create;
end;

procedure Tfrm_AccessUserRole.FormDestroy(Sender: TObject);
begin
  AccessChk.free;
end;

procedure Tfrm_AccessUserRole.SelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to AccessChk.Count-1 do
    begin
      AccessChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Access.RowCount - 1 do
    begin
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessUserRole.sgrd_AccessClick(Sender: TObject);
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
      ToggleCheckbox( aCol, aRow );
    end;
end;

procedure Tfrm_AccessUserRole.sgrd_AccessDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 2 Then
        begin
          If AccessChk.Count < ARow Then
            exit;

          If AccessChk.Strings[ARow-1] = '1' Then
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

procedure Tfrm_AccessUserRole.ToggleCheckbox( acol, arow: Integer );
begin
  if sgrd_Access.Cells[0, aRow] = '' Then
    exit;
  If aCol in [2] Then
    With TGridCracker( sgrd_Access ) Do
      Begin
        If aCol = 2 Then
          begin
            If AccessChk.Count < ARow Then
              exit;
            If AccessChk.Strings[ARow-1] = '1' Then
              AccessChk.Strings[ARow-1] := '0'
            else AccessChk.Strings[ARow-1] := '1';
            InvalidateCell( aCol, aRow );
          end;
      end;
end;

end.
