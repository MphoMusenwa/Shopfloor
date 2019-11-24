unit AccessImageCentreGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_AccessImageCentreGroup = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    sgrd_Users: TStringGrid;
    qry_Access: TADOQuery;
    lbl_Role: TLabel;
    lbl_GroupID: TLabel;
    qry_Roles: TADOQuery;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeSelectAll1: TMenuItem;
    procedure btn_SelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgrd_UsersDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure sgrd_UsersClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeSelectAll1Click(Sender: TObject);
  private
    { Private declarations }
    mGroupId   :Integer;
    FCheck, FNoCheck     :TBitmap;
    UsersChk  :TStringList;
    RolesChk  :TStringList;

    procedure DisplayAccess;
    procedure ToggleCheckboxUsers( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(GroupId :Integer):Integer;
  end;

var
  frm_AccessImageCentreGroup: Tfrm_AccessImageCentreGroup;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_AccessImageCentreGroup.btn_SelectClick(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   ImageCentreRts');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   GroupId = :GroupId');
  qry_Access.Parameters.ParamValues['GroupId'] := mGroupId;
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
              qry_Access.SQL.Add('INSERT INTO ImageCentreRts (GroupId, UserId) VALUES(:GroupId, :UserId)');
              qry_Access.Parameters.ParamByName('GroupId').Value := mGroupId;
              qry_Access.Parameters.ParamByName('UserId').Value := sgrd_Users.Cells[0,I];
              qry_Access.ExecSQL;
            end;
        end;
    end;
  //---------------------------
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessImageCentreGroup.DeSelectAll1Click(Sender: TObject);
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

procedure Tfrm_AccessImageCentreGroup.DisplayAccess;
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
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM ImageCentreRts x WHERE x.GroupId = :GroupId AND x.UserId = a.UserId) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   AuthCodes a');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   a.UserType IN (''S'', ''A'')');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  a.UserID');
  qry_Access.Parameters.ParamValues['GroupId'] := mGroupId;
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
end;

function Tfrm_AccessImageCentreGroup.Execute(GroupId :Integer):Integer;
Var
  TempStr   :String;
begin
  mGroupId := GroupId;

  qry_Roles.Close;
  qry_Roles.SQL.Clear;
  qry_Roles.SQL.Add('SELECT GroupId, ImageCentreGroup FROM ImageCentreGroups WHERE GroupId = :GroupId');
  qry_Roles.Parameters.ParamValues['GroupId'] := GroupId;
  qry_Roles.Open;

  TempStr := trim(qry_Roles.FieldbyName('GroupId').AsString) + ' - ' + trim(qry_Roles.FieldbyName('ImageCentreGroup').AsString);
  lbl_GroupId.Caption := TempStr;

  DisplayAccess;

  Result := ShowModal;
end;

procedure Tfrm_AccessImageCentreGroup.FormCreate(Sender: TObject);
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

procedure Tfrm_AccessImageCentreGroup.FormDestroy(Sender: TObject);
begin
  UsersChk.Free;
  RolesChk.Free;
end;

procedure Tfrm_AccessImageCentreGroup.SelectAll1Click(Sender: TObject);
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

procedure Tfrm_AccessImageCentreGroup.sgrd_UsersClick(Sender: TObject);
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

procedure Tfrm_AccessImageCentreGroup.ToggleCheckboxUsers( acol, arow: Integer );
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


procedure Tfrm_AccessImageCentreGroup.sgrd_UsersDrawCell(Sender: TObject; ACol,
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
