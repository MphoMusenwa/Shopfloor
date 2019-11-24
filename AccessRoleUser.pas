unit AccessRoleUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_AccessRoleUser = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    lbl_Role: TLabel;
    lbl_RoleID: TLabel;
    qry_Roles: TADOQuery;
    qry_Access: TADOQuery;
    Bevel1: TBevel;
    sgrd_Access: TStringGrid;
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
    mRoleId   :Integer;
    AccessChk  :TStringList;
    FCheck, FNoCheck     :TBitmap;
    procedure DisplayAccess;
    procedure ToggleCheckbox( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(RoleId :Integer):Integer;
  end;

var
  frm_AccessRoleUser: Tfrm_AccessRoleUser;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_AccessRoleUser.btn_SelectClick(Sender: TObject);
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
  qry_Access.SQL.Add('   RoleId = :RoleId');
  qry_Access.Parameters.ParamValues['RoleId'] := mRoleId;
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
              qry_Access.SQL.Add('INSERT INTO RolesRts (UserId, RoleId) VALUES(:UserId, :RoleId)');
              qry_Access.Parameters.ParamByName('UserId').Value := sgrd_Access.Cells[0,I];
              qry_Access.Parameters.ParamByName('RoleId').Value := mRoleId;
              qry_Access.ExecSQL;
            end;
        end;
    end;
  //---------------------------
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessRoleUser.DeSelectAll1Click(Sender: TObject);
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

procedure Tfrm_AccessRoleUser.DisplayAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..1]  of Integer;
begin
//-------------------Build DeliveryTypes----------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   a.UserID,');
  qry_Access.SQL.Add('   a.Surname,');
  qry_Access.SQL.Add('   a.Name,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM RolesRts x WHERE x.RoleId = :RoleId AND x.UserId = a.UserId) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   AuthCodes a');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   a.UserType IN (''S'', ''A'')');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.UserId');
  qry_Access.Parameters.ParamValues['RoleId'] := mRoleId;
  qry_Access.Open;

  sgrd_Access.RowCount := 2;
  sgrd_Access.Cells[0,0] := 'UserId';
  sgrd_Access.Cells[1,0] := 'Name';
  sgrd_Access.Cells[2,0] := 'Access';
  sgrd_Access.Cells[0,1] := '';
  sgrd_Access.Cells[1,1] := '';
  sgrd_Access.Cells[2,1] := '';

  MaxLen[0] := sgrd_Access.Canvas.TextWidth('UserId')+10;
  MaxLen[1] := sgrd_Access.Canvas.TextWidth('Name')+10;

  AccessChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Access.RowCount := R+1;
      sgrd_Access.Cells[0,R] := qry_Access.FieldByName('UserId').AsString;
      sgrd_Access.Cells[1,R] := trim(qry_Access.FieldByName('Name').AsString+' '+qry_Access.FieldByName('Surname').AsString);

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

function Tfrm_AccessRoleUser.Execute(RoleId :Integer):Integer;
Var
  TempStr   :String;
begin
  mRoleId := RoleId;

  qry_Roles.Close;
  qry_Roles.SQL.Clear;
  qry_Roles.SQL.Add('SELECT RoleId, Role FROM Roles WHERE RoleId = :Role');
  qry_Roles.Parameters.ParamValues['Role'] := RoleId;
  qry_Roles.Open;

  TempStr := trim(qry_Roles.FieldbyName('ROLEID').AsString) + ' - ' + trim(qry_Roles.FieldbyName('ROLE').AsString);
  lbl_RoleId.Caption := TempStr;

  DisplayAccess;

  Result := ShowModal;
end;


procedure Tfrm_AccessRoleUser.FormCreate(Sender: TObject);
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

procedure Tfrm_AccessRoleUser.FormDestroy(Sender: TObject);
begin
  AccessChk.free;
end;

procedure Tfrm_AccessRoleUser.SelectAll1Click(Sender: TObject);
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

procedure Tfrm_AccessRoleUser.sgrd_AccessClick(Sender: TObject);
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

procedure Tfrm_AccessRoleUser.sgrd_AccessDrawCell(Sender: TObject; ACol,
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

procedure Tfrm_AccessRoleUser.ToggleCheckbox( acol, arow: Integer );
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
