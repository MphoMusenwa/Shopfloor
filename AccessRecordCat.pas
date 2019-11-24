unit AccessRecordCat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_AccessRecordCat = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    qry_Access: TADOQuery;
    lbl_Hd: TLabel;
    lbl_RecordCat: TLabel;
    qry_RecordCat: TADOQuery;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    sgrd_Roles: TStringGrid;
    TabSheet2: TTabSheet;
    sgrd_Users: TStringGrid;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeSelectAll1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure btn_SelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgrd_UsersDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure sgrd_UsersClick(Sender: TObject);
    procedure sgrd_RolesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrd_RolesClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeSelectAll1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
    mRecordCat   :String;
    FCheck, FNoCheck     :TBitmap;
    UsersChk  :TStringList;
    RolesChk  :TStringList;

    procedure DisplayAccess;
    procedure ToggleCheckboxUsers( acol, arow: Integer );
    procedure ToggleCheckboxRoles( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(RecordCat :String):Integer;
  end;

var
  frm_AccessRecordCat: Tfrm_AccessRecordCat;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_AccessRecordCat.btn_SelectClick(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   RCAuthRts');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   RecordCat = :RecordCat');
  qry_Access.Parameters.ParamValues['RecordCat'] := mRecordCat;
  qry_Access.ExecSQL;
//---------------Add Users---------------------
  if (sgrd_Users.Cells[0,1] > '')and(sgrd_Users.RowCount > 1)then
    begin
      for I := 1 to sgrd_Users.RowCount-1 do
        begin
          If UsersChk.Strings[I-1] = '1' Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO RCAuthRts (RecordCat, Code, UserId) VALUES(:RecordCat, :Code, :UserId)');
              qry_Access.Parameters.ParamByName('RecordCat').Value := mRecordCat;
              qry_Access.Parameters.ParamByName('Code').Value := CompsCode;
              qry_Access.Parameters.ParamByName('UserId').Value := sgrd_Users.Cells[0,I];
              qry_Access.ExecSQL;
            end;
        end;
    end;
//---------------Add Roles---------------------
  if (sgrd_Roles.Cells[0,1] > '')and(sgrd_Roles.RowCount > 1)then
    begin
      for I := 1 to sgrd_Roles.RowCount-1 do
        begin
          If RolesChk.Strings[I-1] = '1' Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO RCAuthRts (RecordCat, Code, RoleId) VALUES(:RecordCat, :Code, :RoleId)');
              qry_Access.Parameters.ParamByName('RecordCat').Value := mRecordCat;
              qry_Access.Parameters.ParamByName('Code').Value := CompsCode;
              qry_Access.Parameters.ParamByName('RoleId').Value := strtoint(sgrd_Roles.Cells[0,I]);
              qry_Access.ExecSQL;
            end;
        end;
    end;
  //---------------------------
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessRecordCat.DeSelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RolesChk.Count-1 do
    begin
      RolesChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Roles.RowCount - 1 do
    begin
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessRecordCat.DisplayAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..1]  of Integer;
begin
//-------------------Build Users-----------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   a.UserID,');
  qry_Access.SQL.Add('   a.Surname,');
  qry_Access.SQL.Add('   a.Name,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM RCAuthRts x WHERE x.RecordCat = :RecordCat AND x.UserId = a.UserId) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   AuthCodes a');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   a.UserType IN (''S'', ''A'')');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.UserID');
  qry_Access.Parameters.ParamValues['RecordCat'] := mRecordCat;
  qry_Access.Open;

  sgrd_Users.RowCount := 2;
  sgrd_Users.Cells[0,0] := 'UserId';
  sgrd_Users.Cells[1,0] := 'Name';
  sgrd_Users.Cells[2,0] := 'Access';
  sgrd_Users.Cells[0,1] := '';
  sgrd_Users.Cells[1,1] := '';
  sgrd_Users.Cells[2,1] := '';

  UsersChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Users.RowCount := R+1;
      sgrd_Users.Cells[0,R] := qry_Access.FieldByName('UserID').AsString;
      sgrd_Users.Cells[1,R] := trim(qry_Access.FieldByName('Name').AsString+' '+qry_Access.FieldByName('Surname').AsString);

      If qry_Access.FieldByName('Access').AsInteger = 1 Then
        UsersChk.Append('1')
      else UsersChk.Append('0');

      If sgrd_Users.Canvas.TextWidth(sgrd_Users.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := sgrd_Users.Canvas.TextWidth(sgrd_Users.Cells[0,R])+10;
      If sgrd_Users.Canvas.TextWidth(sgrd_Users.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := sgrd_Users.Canvas.TextWidth(sgrd_Users.Cells[1,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Users.ColWidths[0] := MaxLen[0];
  sgrd_Users.ColWidths[1] := MaxLen[1];
  sgrd_Users.ColWidths[2] := sgrd_Users.Canvas.TextWidth('Access')+10;
//-------------------Build Roles-----------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   a.RoleId,');
  qry_Access.SQL.Add('   a.Role,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM RCAuthRts x WHERE x.RecordCat = :RecordCat AND x.RoleId = a.RoleId) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   Roles a');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.RoleId');
  qry_Access.Parameters.ParamValues['RecordCat'] := mRecordCat;
  qry_Access.Open;

  sgrd_Roles.RowCount := 2;
  sgrd_Roles.Cells[0,0] := 'RoleId';
  sgrd_Roles.Cells[1,0] := 'Role';
  sgrd_Roles.Cells[2,0] := 'Access';
  sgrd_Roles.Cells[0,1] := '';
  sgrd_Roles.Cells[1,1] := '';
  sgrd_Roles.Cells[2,1] := '';

  RolesChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Roles.RowCount := R+1;
      sgrd_Roles.Cells[0,R] := qry_Access.FieldByName('RoleId').AsString;
      sgrd_Roles.Cells[1,R] := trim(qry_Access.FieldByName('Role').AsString);

      If qry_Access.FieldByName('Access').AsInteger = 1 Then
        RolesChk.Append('1')
      else RolesChk.Append('0');

      If sgrd_Roles.Canvas.TextWidth(sgrd_Roles.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := sgrd_Roles.Canvas.TextWidth(sgrd_Roles.Cells[0,R])+10;
      If sgrd_Roles.Canvas.TextWidth(sgrd_Roles.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := sgrd_Roles.Canvas.TextWidth(sgrd_Roles.Cells[1,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Roles.ColWidths[0] := MaxLen[0];
  sgrd_Roles.ColWidths[1] := MaxLen[1];
  sgrd_Roles.ColWidths[2] := sgrd_Roles.Canvas.TextWidth('Access')+10;
end;

function Tfrm_AccessRecordCat.Execute(RecordCat :String):Integer;
begin
  mRecordCat := RecordCat;

  qry_RecordCat.Close;
  qry_RecordCat.SQL.Clear;
  qry_RecordCat.SQL.Add('SELECT RecCatType AS [RecordCat] FROM RecordCat WHERE RecCatType = :RecordCat');
  qry_RecordCat.Parameters.ParamValues['RecordCat'] := mRecordCat;
  qry_RecordCat.Open;

  lbl_RecordCat.Caption := qry_RecordCat.FieldbyName('RecordCat').AsString;

  DisplayAccess;

  PageControl1.ActivePageIndex := 0;

  Result := ShowModal;
end;

procedure Tfrm_AccessRecordCat.FormCreate(Sender: TObject);
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

  UsersChk  := TStringList.Create;
  RolesChk  := TStringList.Create;
end;

procedure Tfrm_AccessRecordCat.FormDestroy(Sender: TObject);
begin
  UsersChk.Free;
  RolesChk.Free;
end;

procedure Tfrm_AccessRecordCat.MenuItem1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to UsersChk.Count-1 do
    begin
      UsersChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Users.RowCount - 1 do
    begin
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessRecordCat.MenuItem2Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to UsersChk.Count-1 do
    begin
      UsersChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Users.RowCount - 1 do
    begin
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessRecordCat.SelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RolesChk.Count-1 do
    begin
      RolesChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Roles.RowCount - 1 do
    begin
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-1 , J);
    end;
end;

procedure Tfrm_AccessRecordCat.sgrd_RolesClick(Sender: TObject);
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
      ToggleCheckboxRoles( aCol, aRow );
    end;
end;

procedure Tfrm_AccessRecordCat.sgrd_RolesDrawCell(Sender: TObject; ACol,
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
          If RolesChk.Count < ARow Then
            exit;

          If RolesChk.Strings[ARow-1] = '1' Then
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

procedure Tfrm_AccessRecordCat.sgrd_UsersClick(Sender: TObject);
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

procedure Tfrm_AccessRecordCat.ToggleCheckboxUsers( acol, arow: Integer );
begin
  if sgrd_Users.Cells[0, aRow] = '' Then
    exit;
  If aCol in [2] Then
    With TGridCracker( sgrd_Users ) Do
      Begin
        If aCol = 2 Then
          begin
            If UsersChk.Count < ARow Then
              exit;
            If UsersChk.Strings[ARow-1] = '1' Then
              UsersChk.Strings[ARow-1] := '0'
            else UsersChk.Strings[ARow-1] := '1';
            InvalidateCell( aCol, aRow );
          end;
      end;
end;

procedure Tfrm_AccessRecordCat.ToggleCheckboxRoles( acol, arow: Integer );
begin
  if sgrd_Roles.Cells[0, aRow] = '' Then
    exit;
  If aCol in [2] Then
    With TGridCracker( sgrd_Roles ) Do
      Begin
        If aCol = 2 Then
          begin
            If RolesChk.Count < ARow Then
              exit;
            If RolesChk.Strings[ARow-1] = '1' Then
              RolesChk.Strings[ARow-1] := '0'
            else RolesChk.Strings[ARow-1] := '1';
            InvalidateCell( aCol, aRow );
          end;
      end;
end;

procedure Tfrm_AccessRecordCat.sgrd_UsersDrawCell(Sender: TObject; ACol,
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
          If UsersChk.Count < ARow Then
            exit;

          If UsersChk.Strings[ARow-1] = '1' Then
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
