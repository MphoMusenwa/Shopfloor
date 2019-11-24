unit IndexDefsRelations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, ADODB;

type
  Tfrm_IndexDefsRelations = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbl_RightAccess: TLabel;
    Label4: TLabel;
    btn_SelectAll: TButton;
    btn_Deselect: TButton;
    btn_DeselectAll: TButton;
    btn_Create: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    btn_Select: TButton;
    sgrd_Denied: TStringGrid;
    sgrd_Granted: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    btn_SelectAllRCat: TButton;
    btn_DeSelectRCat: TButton;
    btn_DeSelectAllRCat: TButton;
    Panel2: TPanel;
    Label3: TLabel;
    btn_SelectRCat: TButton;
    sgrd_DeniedRCat: TStringGrid;
    sgrd_GrantedRCat: TStringGrid;
    cb_ItemType: TComboBox;
    cb_RecordType: TComboBox;
    qry_SQL: TADOQuery;
    btn_SaveRightsRCat: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cb_ItemTypeChange(Sender: TObject);
    procedure cb_RecordTypeChange(Sender: TObject);
    procedure btn_SelectRCatClick(Sender: TObject);
    procedure btn_SelectAllRCatClick(Sender: TObject);
    procedure btn_DeSelectRCatClick(Sender: TObject);
    procedure btn_DeSelectAllRCatClick(Sender: TObject);
    procedure btn_SelectClick(Sender: TObject);
    procedure btn_SelectAllClick(Sender: TObject);
    procedure btn_DeselectClick(Sender: TObject);
    procedure btn_DeselectAllClick(Sender: TObject);
    procedure btn_SaveRightsRCatClick(Sender: TObject);
    procedure btn_CreateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_IndexDefsRelations: Tfrm_IndexDefsRelations;

implementation

uses main;

{$R *.dfm}

procedure Tfrm_IndexDefsRelations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_IndexDefsRelations.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_IndexDefsRelations.FormCreate(Sender: TObject);
begin
  If (frm_Console.fCOOLMan = 1)or(frm_Console.feRecMan = 1)or(frm_Console.fWebMan =1)or(frm_Console.fEntMan = 1) Then
    TabSheet2.TabVisible := True
  else TabSheet2.TabVisible := False;

  If (frm_Console.fWareMan = 1)or(frm_Console.fDocMan =1)or(frm_Console.fEntMan = 1) Then
    TabSheet1.TabVisible := True
  else TabSheet1.TabVisible := False;

  If TabSheet1.TabVisible Then
    PageControl1.ActivePageIndex := 0
  else if TabSheet2.TabVisible Then
    PageControl1.ActivePageIndex := 1;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Description, UseERecords, UseItems, UseFiles FROM IndexDefinitions ORDER BY Description');
  qry_SQL.Open;
  qry_SQL.First;

  cb_RecordType.Items.Clear;
  cb_ItemType.Items.Clear;
  While not qry_SQL.EOF Do
    begin
      If qry_SQL.FieldByName('UseItems').AsBoolean Then
        cb_ItemType.Items.Append(qry_SQL.FieldByName('Description').asString);

      If qry_SQL.FieldByName('UseERecords').AsBoolean Then
        cb_RecordType.Items.Append(qry_SQL.FieldByName('Description').asString);

      qry_SQL.Next;
    end;
  qry_SQL.Close;
end;

procedure Tfrm_IndexDefsRelations.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IndexDefsRelations.cb_ItemTypeChange(Sender: TObject);
var
  J : Integer;
begin
  Screen.Cursor := crHourglass;
//===========================First Clear Grids==================================
  For J := 0 to sgrd_Denied.RowCount -1 Do
    begin
      sgrd_Denied.Cells[0,J] := '';
    end;
  For J := 0 to sgrd_Granted.RowCount -1 Do
    begin
      sgrd_Granted.Cells[0,J] := '';
    end;
  sgrd_Denied.Cells[0,0] := 'Record Type';
  sgrd_Granted.Cells[0,0] := 'Record Type';
//===================================Get Data===================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Description FROM IndexDefinitions');
  qry_SQL.SQL.Add('WHERE (Description NOT IN (SELECT FileType FROM IAuthRts WHERE (ItemType = :IT)))');
  qry_SQL.SQL.Add('AND UseFiles = 1');
  qry_SQL.Parameters.ParamByName('IT').Value := cb_ItemType.Text;
  qry_SQL.Open;
  If not qry_SQL.Isempty Then
    sgrd_Denied.RowCount := qry_SQL.RecordCount+1
  else sgrd_Denied.RowCount := 2;
  qry_SQL.First;
  J := 0;
  While not qry_SQL.EOF Do
    begin
      Inc(J);
      sgrd_Denied.Cells[0,J] := qry_SQL.FieldbyName('Description').asString;
      qry_SQL.Next;
    end;
  qry_SQL.Close;
//======================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Description FROM IndexDefinitions');
  qry_SQL.SQL.Add('WHERE (Description IN (SELECT FileType FROM IAuthRts WHERE (ItemType = :IT)))');
  qry_SQL.SQL.Add('AND UseFiles = 1');
  qry_SQL.Parameters.ParamByName('IT').Value := cb_ItemType.Text;
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    sgrd_Granted.RowCount := qry_SQL.RecordCount+1
  else sgrd_Granted.RowCount := 2;
  qry_SQL.First;
  J := 0;
  While not qry_SQL.EOF Do
    begin
      Inc(J);
      sgrd_Granted.Cells[0,J] := qry_SQL.FieldbyName('Description').asString;
      qry_SQL.Next;
    end;
  qry_SQL.Close;
  btn_Create.Enabled := (cb_ItemType.Text <> '');
  btn_Select.Enabled := (cb_ItemType.Text <> '');
  btn_DeSelect.Enabled := (cb_ItemType.Text <> '');
  btn_SelectAll.Enabled := (cb_ItemType.Text <> '');
  btn_DeSelectAll.Enabled := (cb_ItemType.Text <> '');
  Screen.Cursor := crDefault;
  end;

procedure Tfrm_IndexDefsRelations.cb_RecordTypeChange(Sender: TObject);
var
  J : Integer;
begin
  Cursor := crHourglass;
//===========================First Clear Grids==================================
  For J := 0 to sgrd_DeniedRCat.RowCount -1 Do
    begin
      sgrd_DeniedRCat.Cells[0,J] := '';
    end;
  For J := 0 to sgrd_GrantedRCat.RowCount -1 Do
    begin
      sgrd_GrantedRCat.Cells[0,J] := '';
    end;
  sgrd_DeniedRCat.Cells[0,0] := 'Name';
  sgrd_GrantedRCat.Cells[0,0] := 'Name';
//===================================Get Data===================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT RecCatType FROM RecordCat');
  qry_SQL.SQL.Add('WHERE RecCatType NOT IN (SELECT RecordCat FROM RCRTRts WHERE Recordtype = :FT)');
  qry_SQL.Parameters.ParamByName('FT').Value := cb_RecordType.Text;
  qry_SQL.Open;
  If qry_SQL.RecordCount > 0 Then
    sgrd_DeniedRCat.RowCount := qry_SQL.RecordCount+1
  else sgrd_DeniedRCat.RowCount := 2;
  qry_SQL.First;
  J := 0;
  While not qry_SQL.EOF Do
    begin
      Inc(J);
      sgrd_DeniedRCat.Cells[0,J] := qry_SQL.FieldbyName('RecCatType').asString;
      qry_SQL.Next;
    end;
  qry_SQL.Close;
//======================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT RecCatType FROM RecordCat');
  qry_SQL.SQL.Add('WHERE RecCatType IN (SELECT RecordCat FROM RCRTRts WHERE Recordtype = :FT)');
  qry_SQL.Parameters.ParamByName('FT').Value := cb_RecordType.Text;
  qry_SQL.Open;
  If qry_SQL.RecordCount > 0 Then
    sgrd_GrantedRCat.RowCount := qry_SQL.RecordCount+1
  else sgrd_GrantedRCat.RowCount := 2;
  qry_SQL.First;
  J := 0;
  While not qry_SQL.EOF Do
    begin
      Inc(J);
      sgrd_GrantedRCat.Cells[0,J] := qry_SQL.FieldbyName('RecCatType').asString;
      qry_SQL.Next;
    end;
  qry_SQL.Close;

  btn_SaveRightsRCat.Enabled := (cb_RecordType.Text <> '');
  btn_SelectRCat.Enabled := (cb_RecordType.Text <> '');
  btn_DeSelectRCat.Enabled := (cb_RecordType.Text <> '');
  btn_SelectAllRCat.Enabled := (cb_RecordType.Text <> '');
  btn_DeSelectAllRCat.Enabled := (cb_RecordType.Text <> '');

  Cursor := crDefault;
end;

procedure Tfrm_IndexDefsRelations.btn_SelectRCatClick(Sender: TObject);
var
  B, J          :Integer;
  TempDbt       :String[30];
  CodeTemp      :Array of String[30];
begin
  Screen.cursor := crhourglass;
  try
  TempDbt := sgrd_DeniedRCat.Cells[0,sgrd_DeniedRCat.Selection.Top];
  If length(TempDbt) = 0 Then
    exit;
  For B := 1 to sgrd_GrantedRCat.RowCount-1 Do
    If TempDbt = sgrd_GrantedRCat.Cells[0,B] Then
      exit;
//=====================Add======================================================
  If (sgrd_GrantedRCat.RowCount = 2)and(length(sgrd_GrantedRCat.Cells[0,1]) = 0) Then
    begin
      sgrd_GrantedRCat.Cells[0, 1] := sgrd_DeniedRCat.Cells[0,sgrd_DeniedRCat.Selection.Top];
    end
  else
    begin
      sgrd_GrantedRCat.RowCount := sgrd_GrantedRCat.RowCount + 1;
      sgrd_GrantedRCat.Cells[0, sgrd_GrantedRCat.RowCount-1] := sgrd_DeniedRCat.Cells[0,sgrd_DeniedRCat.Selection.Top];
    end;
//====================Delete====================================================
  SetLength(CodeTemp, sgrd_DeniedRCat.RowCount - 2);
  J := -1;
  For B := 1 to sgrd_DeniedRCat.RowCount-1 Do
    begin
      If TempDbt <> sgrd_DeniedRCat.Cells[0,B] Then
        begin
          Inc(J);
          CodeTemp[J] := sgrd_DeniedRCat.Cells[0,B];
        end;
    end;
  If sgrd_DeniedRCat.RowCount > 2 Then
    sgrd_DeniedRCat.RowCount := sgrd_DeniedRCat.RowCount - 1;
  For B := 1 TO sgrd_DeniedRCat.RowCount -1 Do
    begin
      sgrd_DeniedRCat.Cells[0, B] := '';
    end;
  For B := low(CodeTemp) to High(CodeTemp) Do
    begin
      sgrd_DeniedRCat.Cells[0, B+1] := CodeTemp[B];
    end;
  finally
    Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_SelectAllRCatClick(Sender: TObject);
var
  B, C          :Integer;
  TempDbt        :String[30];
begin
  try
  For C := 1 to sgrd_DeniedRCat.RowCount -1  Do
    begin
      TempDbt := sgrd_DeniedRCat.Cells[0,C];
      If length(TempDbt) = 0 Then
        Continue;
      For B := 1 to sgrd_GrantedRCat.RowCount-1 Do
        If TempDbt = sgrd_GrantedRCat.Cells[0,B] Then
          Continue;
//=====================Add======================================================
      If (sgrd_GrantedRCat.RowCount = 2)and(length(sgrd_GrantedRCat.Cells[0,1]) = 0) Then
        begin
          sgrd_GrantedRCat.Cells[0, 1] := sgrd_DeniedRCat.Cells[0,C];
//          sgrd_GrantedRCat.Cells[1, 1] := sgrd_DeniedRCat.Cells[1,C];
        end
      else
        begin
          sgrd_GrantedRCat.RowCount := sgrd_GrantedRCat.RowCount + 1;
          sgrd_GrantedRCat.Cells[0, sgrd_GrantedRCat.RowCount-1] := sgrd_DeniedRCat.Cells[0,C];
//          sgrd_GrantedRCat.Cells[1, sgrd_GrantedRCat.RowCount-1] := sgrd_DeniedRCat.Cells[1,C];
        end;
    end;
//====================Delete====================================================
  sgrd_DeniedRCat.rowCount := 2;
  sgrd_DeniedRCat.Cells[0,1] := '';
//  sgrd_DeniedRCat.Cells[1,1] := '';
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_DeSelectRCatClick(Sender: TObject);
var
  B, J          :Integer;
  TempDbt        :String[30];
  CodeTemp      :Array of String[30];
begin
  try
  TempDbt := sgrd_GrantedRCat.Cells[0,sgrd_GrantedRCat.Selection.Top];
  If length(TempDbt) = 0 Then
    exit;
  For B := 1 to sgrd_DeniedRCat.RowCount-1 Do
    If TempDbt = sgrd_DeniedRCat.Cells[0,B] Then
      exit;
//=====================Add======================================================
  If (sgrd_DeniedRCat.RowCount = 2)and(length(sgrd_DeniedRCat.Cells[0,1]) = 0) Then
    begin
      sgrd_DeniedRCat.Cells[0, 1] := sgrd_GrantedRCat.Cells[0,sgrd_GrantedRCat.Selection.Top];
    end
  else
    begin
      sgrd_DeniedRCat.RowCount := sgrd_DeniedRCat.RowCount + 1;
      sgrd_DeniedRCat.Cells[0, sgrd_DeniedRCat.RowCount-1] := sgrd_GrantedRCat.Cells[0,sgrd_GrantedRCat.Selection.Top];
    end;
//====================Delete====================================================
  SetLength(CodeTemp, sgrd_GrantedRCat.RowCount - 2);
  J := -1;
  For B := 1 to sgrd_GrantedRCat.RowCount-1 Do
    begin
      If TempDbt <> sgrd_GrantedRCat.Cells[0,B] Then
        begin
          Inc(J);
          CodeTemp[J] := sgrd_GrantedRCat.Cells[0,B];
        end;
    end;
  If sgrd_GrantedRCat.RowCount > 2 Then
    sgrd_GrantedRCat.RowCount := sgrd_GrantedRCat.RowCount - 1;
  For B := 1 TO sgrd_GrantedRCat.RowCount -1 Do
    begin
      sgrd_GrantedRCat.Cells[0, B] := '';
    end;
  For B := low(CodeTemp) to High(CodeTemp) Do
    begin
      sgrd_GrantedRCat.Cells[0, B+1] := CodeTemp[B];
    end;
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_DeSelectAllRCatClick(Sender: TObject);
var
  B, C          :Integer;
  TempDbt        :String[30];
begin
  try
  For C := 1 to sgrd_GrantedRCat.RowCount -1 Do
    begin
      TempDbt := sgrd_GrantedRCat.Cells[0,C];
      If length(TempDbt) = 0 Then
        Continue;
      For B := 1 to sgrd_DeniedRCat.RowCount-1 Do
        If TempDbt = sgrd_DeniedRCat.Cells[0,B] Then
          Continue;
//=====================Add======================================================
      If (sgrd_DeniedRCat.RowCount = 2)and(length(sgrd_DeniedRCat.Cells[0,1]) = 0) Then
        begin
          sgrd_DeniedRCat.Cells[0, 1] := sgrd_GrantedRCat.Cells[0,C];
//          sgrd_DeniedRCat.Cells[1, 1] := sgrd_GrantedRCat.Cells[1,C];
        end
      else
        begin
          sgrd_DeniedRCat.RowCount := sgrd_DeniedRCat.RowCount + 1;
          sgrd_DeniedRCat.Cells[0, sgrd_DeniedRCat.RowCount-1] := sgrd_GrantedRCat.Cells[0,C];
//          sgrd_DeniedRCat.Cells[1, sgrd_DeniedRCat.RowCount-1] := sgrd_GrantedRCat.Cells[1,C];
        end;
    end;
//====================Delete====================================================
  sgrd_GrantedRCat.rowCount := 2;
  sgrd_GrantedRCat.Cells[0,1] := '';
//  sgrd_GrantedRCat.Cells[1,1] := '';
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_SelectClick(Sender: TObject);
var
  B, J          :Integer;
  TempDbt       :String[30];
  CodeTemp      :Array of String[30];
begin
  Screen.cursor := crhourglass;
  try
  TempDbt := sgrd_Denied.Cells[0,sgrd_Denied.Selection.Top];
  If length(TempDbt) = 0 Then
    exit;
  For B := 1 to sgrd_Granted.RowCount-1 Do
    If TempDbt = sgrd_Granted.Cells[0,B] Then
      exit;
//=====================Add======================================================
  If (sgrd_Granted.RowCount = 2)and(length(sgrd_Granted.Cells[0,1]) = 0) Then
    begin
      sgrd_Granted.Cells[0, 1] := sgrd_Denied.Cells[0,sgrd_Denied.Selection.Top];
    end
  else
    begin
      sgrd_Granted.RowCount := sgrd_Granted.RowCount + 1;
      sgrd_Granted.Cells[0, sgrd_Granted.RowCount-1] := sgrd_Denied.Cells[0,sgrd_Denied.Selection.Top];
    end;
//====================Delete====================================================
  SetLength(CodeTemp, sgrd_Denied.RowCount - 2);
  J := -1;
  For B := 1 to sgrd_Denied.RowCount-1 Do
    begin
      If TempDbt <> sgrd_Denied.Cells[0,B] Then
        begin
          Inc(J);
          CodeTemp[J] := sgrd_Denied.Cells[0,B];
        end;
    end;
  If sgrd_Denied.RowCount > 2 Then
    sgrd_Denied.RowCount := sgrd_Denied.RowCount - 1;
  For B := 1 TO sgrd_Denied.RowCount -1 Do
    begin
      sgrd_Denied.Cells[0, B] := '';
    end;
  For B := low(CodeTemp) to High(CodeTemp) Do
    begin
      sgrd_Denied.Cells[0, B+1] := CodeTemp[B];
    end;
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_SelectAllClick(Sender: TObject);
var
  B, C          :Integer;
  TempDbt        :String[30];
begin
  try
  For C := 1 to sgrd_Denied.RowCount -1  Do
    begin
      TempDbt := sgrd_Denied.Cells[0,C];
      If length(TempDbt) = 0 Then
        Continue;
      For B := 1 to sgrd_Granted.RowCount-1 Do
        If TempDbt = sgrd_Granted.Cells[0,B] Then
          Continue;
//=====================Add======================================================
      If (sgrd_Granted.RowCount = 2)and(length(sgrd_Granted.Cells[0,1]) = 0) Then
        begin
          sgrd_Granted.Cells[0, 1] := sgrd_Denied.Cells[0,C];
//          sgrd_Granted.Cells[1, 1] := sgrd_Denied.Cells[1,C];
        end
      else
        begin
          sgrd_Granted.RowCount := sgrd_Granted.RowCount + 1;
          sgrd_Granted.Cells[0, sgrd_Granted.RowCount-1] := sgrd_Denied.Cells[0,C];
//          sgrd_Granted.Cells[1, sgrd_Granted.RowCount-1] := sgrd_Denied.Cells[1,C];
        end;
    end;
//====================Delete====================================================
  sgrd_Denied.rowCount := 2;
  sgrd_Denied.Cells[0,1] := '';
//  sgrd_Denied.Cells[1,1] := '';
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_DeselectClick(Sender: TObject);
var
  B, J          :Integer;
  TempDbt        :String[30];
  CodeTemp      :Array of String[30];
begin
  try
  TempDbt := sgrd_Granted.Cells[0,sgrd_Granted.Selection.Top];
  If length(TempDbt) = 0 Then
    exit;
  For B := 1 to sgrd_Denied.RowCount-1 Do
    If TempDbt = sgrd_Denied.Cells[0,B] Then
      exit;
//=====================Add======================================================
  If (sgrd_Denied.RowCount = 2)and(length(sgrd_Denied.Cells[0,1]) = 0) Then
    begin
      sgrd_Denied.Cells[0, 1] := sgrd_Granted.Cells[0,sgrd_Granted.Selection.Top];
    end
  else
    begin
      sgrd_Denied.RowCount := sgrd_Denied.RowCount + 1;
      sgrd_Denied.Cells[0, sgrd_Denied.RowCount-1] := sgrd_Granted.Cells[0,sgrd_Granted.Selection.Top];
    end;
//====================Delete====================================================
  SetLength(CodeTemp, sgrd_Granted.RowCount - 2);
  J := -1;
  For B := 1 to sgrd_Granted.RowCount-1 Do
    begin
      If TempDbt <> sgrd_Granted.Cells[0,B] Then
        begin
          Inc(J);
          CodeTemp[J] := sgrd_Granted.Cells[0,B];
        end;
    end;
  If sgrd_Granted.RowCount > 2 Then
    sgrd_Granted.RowCount := sgrd_Granted.RowCount - 1;
  For B := 1 TO sgrd_Granted.RowCount -1 Do
    begin
      sgrd_Granted.Cells[0, B] := '';
    end;
  For B := low(CodeTemp) to High(CodeTemp) Do
    begin
      sgrd_Granted.Cells[0, B+1] := CodeTemp[B];
    end;
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_DeselectAllClick(Sender: TObject);
var
  B, C          :Integer;
  TempDbt        :String[30];
begin
  try
  For C := 1 to sgrd_Granted.RowCount -1 Do
    begin
      TempDbt := sgrd_Granted.Cells[0,C];
      If length(TempDbt) = 0 Then
        Continue;
      For B := 1 to sgrd_Denied.RowCount-1 Do
        If TempDbt = sgrd_Denied.Cells[0,B] Then
          Continue;
//=====================Add======================================================
      If (sgrd_Denied.RowCount = 2)and(length(sgrd_Denied.Cells[0,1]) = 0) Then
        begin
          sgrd_Denied.Cells[0, 1] := sgrd_Granted.Cells[0,C];
//          sgrd_Denied.Cells[1, 1] := sgrd_Granted.Cells[1,C];
        end
      else
        begin
          sgrd_Denied.RowCount := sgrd_Denied.RowCount + 1;
          sgrd_Denied.Cells[0, sgrd_Denied.RowCount-1] := sgrd_Granted.Cells[0,C];
//          sgrd_Denied.Cells[1, sgrd_Denied.RowCount-1] := sgrd_Granted.Cells[1,C];
        end;
    end;
//====================Delete====================================================
  sgrd_Granted.rowCount := 2;
  sgrd_Granted.Cells[0,1] := '';
  finally
  Screen.cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefsRelations.btn_SaveRightsRCatClick(Sender: TObject);
Var
  i   :Integer;
begin
  Screen.Cursor := crHourglass;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('delete from RCRTRts');
  qry_SQL.SQL.Add('where Recordtype = :type and Code  = :code');
  qry_SQL.Parameters.ParamByName('type').Value := cb_RecordType.Text;
  qry_SQL.Parameters.ParamByName('code').Value := CompsCode;
  qry_SQL.ExecSQL;
//--------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('Insert into RCRTRts (Code, Recordtype, RecordCat)');
  qry_SQL.SQL.Add('values(:code,  :type, :RC)');
  if (sgrd_GrantedRCat.Cells[0,0] > '')and
     (sgrd_GrantedRCat.RowCount > 1)then  // dont insert for a null value in 1-270100
    begin
      For i := 1 to sgrd_GrantedRCat.RowCount-1 Do
        begin
          qry_SQL.Parameters.ParamByName('type').Value := cb_RecordType.Text;
          qry_SQL.Parameters.ParamByName('RC').Value := sgrd_GrantedRCat.Cells[0, I];
          qry_SQL.Parameters.ParamByName('code').Value := CompsCode;
          qry_SQL.ExecSQL;
        end;
    end;
  Screen.Cursor := crDefault;
  MessageDlg('Access right(s) granted as specified', mtInformation, [mbOK], 0);
end;

procedure Tfrm_IndexDefsRelations.btn_CreateClick(Sender: TObject);
Var
  i   :Integer;
begin
  Screen.Cursor := crHourglass;
  qry_SQL.Active := false;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('delete from IAuthRts');
  qry_SQL.SQL.Add('where (ItemType = :IT)');
  qry_SQL.Parameters.ParamByName('IT').Value := cb_ItemType.Text;
  qry_SQL.ExecSQL;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('INSERT INTO IAuthRts (ItemType, FileType)');
  qry_SQL.SQL.Add('values(:ItemType, :FileType)');
  if (sgrd_Granted.Cells[0,1] > '')and
     (sgrd_Granted.RowCount > 1)then  // dont insert for a null value in 1-270100
    begin
      For i := 1 to sgrd_Granted.RowCount-1 Do
        begin
          qry_SQL.Parameters.ParamByName('ItemType').Value := cb_ItemType.Text;
          qry_SQL.Parameters.ParamByName('FileType').Value := sgrd_Granted.Cells[0, I];
          qry_SQL.ExecSQL;
        end;
    end;
  Screen.Cursor := crDefault;
  MessageDlg('Access right(s) granted as specified', mtInformation, [mbOK], 0);
end;

end.
