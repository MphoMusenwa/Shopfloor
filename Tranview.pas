unit Tranview;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, TabNotBk, DBCtrls,
  StdCtrls, Buttons, ExtCtrls, GetComp, GetDept, Menus, IniFiles, ComCtrls;

type
  Tfrm_TransView = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TBitBtn;
    dts_SQL: TDataSource;
    ntb_Transactions: TTabbedNotebook;
    grd_Result: TDBGrid;
    btn_Exec: TBitBtn;
    grp_BoxFile: TGroupBox;
    lbl_02: TLabel;
    edt_BoxNumber: TEdit;
    lbl_04: TLabel;
    edt_FileNumber: TEdit;
    grp_Client: TGroupBox;
    lbl_03: TLabel;
    lbl_Department: TLabel;
    edt_Dept: TEdit;
    btn_SelectDept: TButton;
    grp_Date: TGroupBox;
    edt_FromDate: TEdit;
    edt_ToDate: TEdit;
    lbl_05: TLabel;
    lbl_06: TLabel;
    grp_Transaction: TGroupBox;
    cmb_View: TComboBox;
    lbl_01: TLabel;
    lbl_07: TLabel;
    mem_SQL: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SelectCodeClick(Sender: TObject);
    procedure btn_SelectDeptClick(Sender: TObject);
    procedure btn_ExecClick(Sender: TObject);
    procedure itm_SaveWidthsClick(Sender: TObject);
    procedure itm_RestoreWidthsClick(Sender: TObject);
    procedure itm_ViewSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_TransView: Tfrm_TransView;

implementation

{$R *.DFM}

uses main;

procedure Tfrm_TransView.FormCreate(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := 492;
  Height := 382;
//  qry_View.Active := true;

  cmb_View.Clear;
{  while not(qry_View.EOF) do
  begin
    cmb_View.Items.Add( qry_View.Fields[0].AsString );
    qry_View.Next;
  end;
 }
//  qry_View.Active := false;
end;

procedure Tfrm_TransView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.btn_TransView.Enabled := True;
//  qry_SQL.Active := false;
  Action := caFree;
end;

procedure Tfrm_TransView.btn_SelectCodeClick(Sender: TObject);
begin
  if frm_GetCompany.ShowModal = mrOK then
  begin
//    edt_Code.Text := frm_GetCompany.CompanyCode;
//    lbl_Company.Caption   := frm_GetCompany.CompanyName;
//    lbl_Company.Visible   := true;
    edt_Dept.SetFocus;
  end;
end;

procedure Tfrm_TransView.btn_SelectDeptClick(Sender: TObject);
begin
{
  if frm_GetDept.Execute(edt_Code.Text) = mrOK then
  begin
    edt_Dept.Text := frm_GetDept.DeptCode;
    lbl_Department.Caption := frm_GetDept.DeptName;
    lbl_Department.Visible := true;
    btn_Exec.SetFocus;
  end;
  }
end;

procedure Tfrm_TransView.btn_ExecClick(Sender: TObject);
var
  bAND : Boolean;
begin
  if cmb_View.ItemIndex < 0 then
  begin
    MessageDlg('Please select the Type of Transaction first', mtWarning,
               [mbOK], 0);
    cmb_View.SetFocus;
    Exit;
  end;

  dts_SQL.Enabled := false;
//  qry_SQL.Active := false;
//  qry_SQL.SQL.Clear;
//  qry_SQL.SQL.Add('SELECT * FROM '+ cmb_View.Items[ cmb_View.ItemIndex ]);
{  if ( length(edt_BoxNumber.Text) > 0 ) or ( length(edt_Code.Text) > 0 ) or
     ( length(edt_Dept.Text) > 0 ) or ( length(edt_FileNumber.Text) > 0 ) or
     ( length(edt_ToDate.Text) > 0 ) or ( length(edt_FromDate.Text) > 0 ) then
  begin
    qry_SQL.SQL.Add('WHERE ');
    bAND := false;

    if length(edt_BoxNumber.Text) > 0 then
    begin
      bAND := true;
      qry_SQL.SQL.Add('BoxNumber LIKE "'+ edt_BoxNumber.Text + '"');
    end;

    if length(edt_FileNumber.Text) > 0 then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('FileNumber LIKE "'+ edt_FileNumber.Text + '"');
      bAND := true;
    end;

    if length(edt_Code.Text) > 0 then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('Code = "'+ edt_Code.Text + '"');
      bAND := true;
    end;


    if length(edt_Dept.Text) > 0 then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('Dept = "'+ edt_Dept.Text + '"');
      bAND := true;
    end;

    if (length(edt_FromDate.Text) > 0) and (length(edt_ToDate.Text) > 0) then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('Date BETWEEN  "'+ FormatDateTime('yyyymmdd',StrToDateTime(edt_FromDate.Text)) + '"');
      qry_SQL.SQL.Add(' AND "' + FormatDateTime('yyyymmdd',StrToDateTime(edt_ToDate.Text)) + ' 23:59"');
      bAND := true;
    end;
    if (length(edt_FromDate.Text) > 0) and (length(edt_ToDate.Text) = 0) then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('Date > "'+ FormatDateTime('yyyymmdd',StrToDateTime(edt_FromDate.Text)) + '" ');
      bAND := true;
    end;
    if (length(edt_FromDate.Text) = 0) and (length(edt_ToDate.Text) > 0) then
    begin
      if bAND then
        qry_SQL.SQL.Add('AND');
      qry_SQL.SQL.Add('Date < "'+ FormatDateTime('yyyymmdd',StrToDateTime(edt_ToDate.Text)) + '" ');
      bAND := true;
    end;
  end;

  mem_SQL.Lines.Assign( qry_SQL.SQL );
  qry_SQL.Active := true;
  dts_SQL.Enabled := true;
  if qry_SQL.RecordCount > 0 then
    begin
      lbl_Company.Visible := false;
      lbl_Department.Visible := false;
      ntb_Transactions.PageIndex := 1;
      itm_RestoreWidthsClick(nil);
    end
  else
    MessageDlg('This transaction view returned no results.',mtInformation,[mbOk],0);
}    
end;

procedure Tfrm_TransView.itm_SaveWidthsClick(Sender: TObject);
var
  ini : TIniFile;
  b   : Byte;
begin
  try
    ini := TIniFile.Create('METROFIL.INI');
    for b := 0 to grd_Result.FieldCount-1 do
        ini.WriteInteger(  'Column Widths',
                          grd_Result.Fields[b].FieldName,
                          grd_Result.Fields[b].DisplayWidth);
  finally
    ini.Free;
  end;
end;

procedure Tfrm_TransView.itm_RestoreWidthsClick(Sender: TObject);
var
  ini      : TIniFile;
  b,bField : Byte;
begin
  if not(dts_SQL.Enabled) then Exit;
//  if not(qry_SQL.Active) then Exit;
//  if qry_SQL.EOF then Exit;
  bField := grd_Result.FieldCount; bField :=  bField - 1;
  if bField > 20 then
  begin
    MessageDlg('Possible invalid value returned by FIELDCOUNT method.'+#13+
               'Method returned the value ' + IntToStr(bField)
               , mtWarning,
               [mbOK], 0);

    Exit;
  end;

  try
    ini := TIniFile.Create('METROFIL.INI');
    for b := 0 to bField do
      grd_Result.Fields[b].DisplayWidth :=
        ini.ReadInteger(  'Column Widths',
                          grd_Result.Fields[b].FieldName,
                          grd_Result.Fields[b].DisplayWidth);
  finally
    ini.Free;
  end;
end;

procedure Tfrm_TransView.itm_ViewSQLClick(Sender: TObject);
begin
  grd_Result.Visible  := Not(grd_Result.Visible);
  mem_SQL.Visible := Not(mem_SQL.Visible);
end;

end.
