unit AccessUserRecordType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  Menus;

type
  Tfrm_AccessUserRecordType = class(TForm)
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
    AccessCChk  :TStringList;
    AccessFChk  :TStringList;
    AccessIChk  :TStringList;
    AccessEChk  :TStringList;
    FCheck, FNoCheck     :TBitmap;
    procedure DisplayAccess;
    procedure ToggleCheckbox( acol, arow: Integer );
  public
    { Public declarations }
    function Execute(UserId :String):Integer;
  end;

var
  frm_AccessUserRecordType: Tfrm_AccessUserRecordType;

implementation

Uses Main, MetrofilerDataModule;

{$R *.dfm}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_AccessUserRecordType.btn_SelectClick(Sender: TObject);
var
  i : Integer;
  ContainersAccess, FilesAccess, ItemsAccess, eRecordsAccess   :Boolean;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   IndexUAuthRts');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   UserId = :UserId');
  qry_Access.Parameters.ParamValues['UserId'] := mUserId;
  qry_Access.ExecSQL;
//---------------Add Roles---------------------
  if (sgrd_Access.Cells[0,1] > '')and(sgrd_Access.RowCount > 1)then
    begin
      for I := 1 to sgrd_Access.RowCount-1 do
        begin
          ContainersAccess := False;
          FilesAccess := False;
          ItemsAccess := False;
          eRecordsAccess := False;
          If AccessCChk.Strings[I-1] = '1' Then ContainersAccess := True;
          If AccessFChk.Strings[I-1] = '1' Then FilesAccess := True;
          If AccessIChk.Strings[I-1] = '1' Then ItemsAccess := True;
          If AccessEChk.Strings[I-1] = '1' Then eRecordsAccess := True;

          If ContainersAccess OR FilesAccess OR ItemsAccess OR eRecordsAccess Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO IndexUAuthRts (Description, Branch, Department, UserId, Containers, Files, Items, eRecords) VALUES(:Description, :Branch, :Department, :UserId, :Containers, :Files, :Items, :eRecords)');
              qry_Access.Parameters.ParamValues['Description'] := sgrd_Access.Cells[0,I];
              qry_Access.Parameters.ParamByName('Branch').Value := sgrd_Access.Cells[1,I];
              qry_Access.Parameters.ParamByName('Department').Value := sgrd_Access.Cells[3,I];
              qry_Access.Parameters.ParamByName('UserId').Value := mUserId;
              qry_Access.Parameters.ParamByName('Containers').Value := ContainersAccess;
              qry_Access.Parameters.ParamByName('Files').Value := FilesAccess;
              qry_Access.Parameters.ParamByName('Items').Value := ItemsAccess;
              qry_Access.Parameters.ParamByName('eRecords').Value := eRecordsAccess;
              qry_Access.ExecSQL;
            end;
        end;
    end;
  Screen.Cursor := crDefault;
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessUserRecordType.DeSelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to AccessCChk.Count-1 do
    begin
      If AccessCChk.Strings[J] = '1' Then AccessCChk.Strings[J] := '0';
      If AccessFChk.Strings[J] = '1' Then AccessFChk.Strings[J] := '0';
      If AccessIChk.Strings[J] = '1' Then AccessIChk.Strings[J] := '0';
      If AccessEChk.Strings[J] = '1' Then AccessEChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Access.RowCount - 1 do
    begin
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-1 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-2 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-3 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-4 , J);
    end;
end;

procedure Tfrm_AccessUserRecordType.DisplayAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..8]  of Integer;
begin
//-------------------Build RecordTypes------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DECLARE @UserId varchar(255)');
  qry_Access.SQL.Add('');
  qry_Access.SQL.Add('SET @UserId = :UserId');
  qry_Access.SQL.Add('');
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   i.Branch,');
  qry_Access.SQL.Add('   b.Name AS "BranchName",');
  qry_Access.SQL.Add('   i.Department AS Dept,');
  qry_Access.SQL.Add('   d.Name AS "DeptName",');
  qry_Access.SQL.Add('   i.Description,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserId = @UserId AND x.Containers = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ContainersAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserId = @UserId AND x.Files = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS FilesAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseItems = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseItems = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserId = @UserId AND x.Items = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ItemsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserId = @UserId AND x.eRecords = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS eRecordsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseCool = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseCool = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserId = @UserId AND x.COOL = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS COOLAccess');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   IndexAuthRts i');
  qry_Access.SQL.Add('   INNER JOIN IndexDefinitions id ON i.Description = id.Description');
  qry_Access.SQL.Add('   INNER JOIN branches b ON i.Branch = b.Branch');
  qry_Access.SQL.Add('   INNER JOIN Departments d ON i.Branch = d.Branch AND i.Department = d.Department');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('   i.Description,');
  qry_Access.SQL.Add('   i.Branch,');
  qry_Access.SQL.Add('   i.Department');
  qry_Access.Parameters.ParamValues['UserId'] := mUserId;
  qry_Access.Open;

  sgrd_Access.RowCount := 2;
  sgrd_Access.Cells[0,0] := 'RecordType';
  sgrd_Access.Cells[1,0] := 'Branch';
  sgrd_Access.Cells[2,0] := 'Branch Name';
  sgrd_Access.Cells[3,0] := 'Dept';
  sgrd_Access.Cells[4,0] := 'Dept Name';
  sgrd_Access.Cells[5,0] := 'Containers';
  sgrd_Access.Cells[6,0] := 'Files';
  sgrd_Access.Cells[7,0] := 'Items';
  sgrd_Access.Cells[8,0] := 'eRecords';

  MaxLen[0] := sgrd_Access.Canvas.TextWidth('RecordType')+10;
  MaxLen[1] := sgrd_Access.Canvas.TextWidth('Branch')+10;
  MaxLen[2] := sgrd_Access.Canvas.TextWidth('Branch Name')+10;
  MaxLen[3] := sgrd_Access.Canvas.TextWidth('Dept')+10;
  MaxLen[4] := sgrd_Access.Canvas.TextWidth('Dept Name')+10;

  sgrd_Access.Cells[0,1] := '';
  sgrd_Access.Cells[1,1] := '';
  sgrd_Access.Cells[2,1] := '';
  sgrd_Access.Cells[3,1] := '';
  sgrd_Access.Cells[4,1] := '';
  sgrd_Access.Cells[5,1] := '';
  sgrd_Access.Cells[6,1] := '';
  sgrd_Access.Cells[7,1] := '';
  sgrd_Access.Cells[8,1] := '';

  AccessCChk.Clear;
  AccessFChk.Clear;
  AccessIChk.Clear;
  AccessEChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Access.RowCount := R+1;
      sgrd_Access.Cells[0,R] := qry_Access.FieldByName('Description').AsString;
      sgrd_Access.Cells[1,R] := qry_Access.FieldByName('Branch').AsString;
      sgrd_Access.Cells[2,R] := qry_Access.FieldByName('BranchName').AsString;
      sgrd_Access.Cells[3,R] := qry_Access.FieldByName('Dept').AsString;
      sgrd_Access.Cells[4,R] := qry_Access.FieldByName('DeptName').AsString;

      AccessCChk.Append(qry_Access.FieldByName('ContainersAccess').AsString);
      AccessFChk.Append(qry_Access.FieldByName('FilesAccess').AsString);
      AccessIChk.Append(qry_Access.FieldByName('ItemsAccess').AsString);
      AccessEChk.Append(qry_Access.FieldByName('eRecordsAccess').AsString);

      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[0,R])+10;
      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[1,R])+10;
      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[2,R])+10 > MaxLen[2] Then
        MaxLen[2] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[2,R])+10;
      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[3,R])+10 > MaxLen[3] Then
        MaxLen[3] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[3,R])+10;
      If sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[4,R])+10 > MaxLen[4] Then
        MaxLen[4] := sgrd_Access.Canvas.TextWidth(sgrd_Access.Cells[4,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Access.ColWidths[0] := MaxLen[0];
  sgrd_Access.ColWidths[1] := MaxLen[1];
  sgrd_Access.ColWidths[2] := MaxLen[2];
  sgrd_Access.ColWidths[3] := MaxLen[3];
  sgrd_Access.ColWidths[4] := MaxLen[4];
  sgrd_Access.ColWidths[5] := sgrd_Access.Canvas.TextWidth('Containers')+10;
  sgrd_Access.ColWidths[6] := sgrd_Access.Canvas.TextWidth('Files')+10;
  sgrd_Access.ColWidths[7] := sgrd_Access.Canvas.TextWidth('Items')+10;
  sgrd_Access.ColWidths[8] := sgrd_Access.Canvas.TextWidth('eRecords')+10;
end;

function Tfrm_AccessUserRecordType.Execute(UserId :String):Integer;
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


procedure Tfrm_AccessUserRecordType.FormCreate(Sender: TObject);
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

  AccessCChk  := TStringList.Create;
  AccessFChk  := TStringList.Create;
  AccessIChk  := TStringList.Create;
  AccessEChk  := TStringList.Create;
end;

procedure Tfrm_AccessUserRecordType.FormDestroy(Sender: TObject);
begin
  AccessCChk.free;
  AccessFChk.free;
  AccessIChk.free;
  AccessEChk.free;
end;

procedure Tfrm_AccessUserRecordType.SelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to AccessCChk.Count-1 do
    begin
      If AccessCChk.Strings[J] = '0' Then AccessCChk.Strings[J] := '1';
      If AccessFChk.Strings[J] = '0' Then AccessFChk.Strings[J] := '1';
      If AccessIChk.Strings[J] = '0' Then AccessIChk.Strings[J] := '1';
      If AccessEChk.Strings[J] = '0' Then AccessEChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Access.RowCount - 1 do
    begin
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-1 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-2 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-3 , J);
      TGridCracker(sgrd_Access).InvalidateCell(sgrd_Access.ColCount-4 , J);
    end;
end;

procedure Tfrm_AccessUserRecordType.sgrd_AccessClick(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol in [8,7,6,5]) and (aRow >= grid.fixedRows) Then
    begin
      // click landed in a checkbox cell
      ToggleCheckbox( aCol, aRow );
    end;
end;

procedure Tfrm_AccessUserRecordType.sgrd_AccessDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 5 Then
        begin
          If (AccessCChk.Count >= ARow)and(AccessCChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (AccessCChk.Count >= ARow)and(AccessCChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 6 Then
        begin
          If (AccessFChk.Count >= ARow)and(AccessFChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (AccessFChk.Count >= ARow)and(AccessFChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 7 Then
        begin
          If (AccessIChk.Count >= ARow)and(AccessIChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (AccessIChk.Count >= ARow)and(AccessIChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 8 Then
        begin
          If (AccessEChk.Count >= ARow)and(AccessEChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (AccessEChk.Count >= ARow)and(AccessEChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
    end;
end;

procedure Tfrm_AccessUserRecordType.ToggleCheckbox( acol, arow: Integer );
begin
  if sgrd_Access.Cells[0, aRow] = '' Then
    exit;
  With TGridCracker( sgrd_Access ) Do
    Begin
      If aCol = 5 Then
        begin
          If AccessCChk.Count < ARow Then
            exit;
          If AccessCChk.Strings[ARow-1] = '1' Then
            AccessCChk.Strings[ARow-1] := '0'
          else If AccessCChk.Strings[ARow-1] = '0' Then
            AccessCChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 6 Then
        begin

          If AccessFChk.Count < ARow Then
            exit;
          If AccessFChk.Strings[ARow-1] = '1' Then
            AccessFChk.Strings[ARow-1] := '0'
          else If AccessFChk.Strings[ARow-1] = '0' Then
            AccessFChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 7 Then
        begin

          If AccessIChk.Count < ARow Then
            exit;
          If AccessIChk.Strings[ARow-1] = '1' Then
            AccessIChk.Strings[ARow-1] := '0'
          else If AccessIChk.Strings[ARow-1] = '0' Then
            AccessIChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 8 Then
        begin

          If AccessEChk.Count < ARow Then
            exit;
          If AccessEChk.Strings[ARow-1] = '1' Then
            AccessEChk.Strings[ARow-1] := '0'
          else If AccessEChk.Strings[ARow-1] = '0' Then
            AccessEChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
    end;
end;

end.
