unit rep_Destruction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls,
  ComCtrls, ADODB;

type
  Tfrm_Destruction = class(TForm)
    qry_Rep: TADOQuery;
    qry_Build: TADOQuery;
    Panel3: TPanel;
    rep_Destruct: TQuickRep;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData5: TQRSysData;
    QRBand4: TQRBand;
    QRSysData4: TQRSysData;
    lbl_Date: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel7: TQRLabel;
    lbl_RecordType: TQRLabel;
    lbl_Dept: TQRLabel;
    lbl_Warehouse: TQRLabel;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand6: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    lbl_Barcode: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    Panel1: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    btn_2: TRadioButton;
    Actual_Date: TDateTimePicker;
    btn_1: TRadioButton;
    From_Date: TDateTimePicker;
    To_Date: TDateTimePicker;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    lbl_Branch: TQRLabel;
    lbl_DesType: TQRLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label40: TLabel;
    Label3: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    Label5: TLabel;
    cb_DesType: TComboBox;
    btn_SelRecordType: TButton;
    edt_RType: TEdit;
    Label1: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_DatePrint(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure rep_DestructBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_DesTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Destruction: Tfrm_Destruction;

implementation

uses main, SelBranch, SelDept, SelWHouse, SelRType,MetrofilerDataModule;

{$R *.DFM}


procedure Tfrm_Destruction.btn_CloseClick(Sender: TObject);
begin
   Close;
end;


procedure Tfrm_Destruction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Rep.Close;
  qry_Build.Close;
  Action := CaFree;
end;


procedure Tfrm_Destruction.btn_PreviewClick(Sender: TObject);
begin
  rep_Destruct.Preview;
end;


procedure Tfrm_Destruction.btn_1Click(Sender: TObject);
begin
  From_Date.Enabled := True;
  To_Date.Enabled := True;
  Actual_Date.Enabled := False;
end;

procedure Tfrm_Destruction.btn_2Click(Sender: TObject);
begin
   From_Date.Enabled := False;
   To_Date.Enabled := False;
   Actual_Date.Enabled := True;
end;

procedure Tfrm_Destruction.BitBtn1Click(Sender: TObject);
begin
  rep_Destruct.PrinterSetup;
end;

procedure Tfrm_Destruction.btn_PrintClick(Sender: TObject);
begin
  rep_Destruct.Print;
end;

procedure Tfrm_Destruction.FormCreate(Sender: TObject);
begin
  From_Date.Date := Now;
  To_Date.Date := Now;
  Actual_Date.Date := Now;
end;

procedure Tfrm_Destruction.lbl_DatePrint(sender: TObject;
  var Value: String);
begin
  If btn_1.Checked Then
    Value := 'Report from: '+DatetoStr(From_Date.Date)+' to: '+DatetoStr(To_Date.Date);
  If btn_2.Checked Then
    Value := 'Report on: '+DatetoStr(Actual_Date.Date);
end;

procedure Tfrm_Destruction.FormShow(Sender: TObject);
begin
  top := 10;
  left := 30;
  height := 338;
  width := 351;
end;

procedure Tfrm_Destruction.rep_DestructBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  SQLText    :String;
begin
  If btn_1.Checked Then
    lbl_Date.Caption := 'Destructions from: '+DatetoStr(From_Date.Date)+' to: '+DatetoStr(To_Date.Date)
  else If btn_2.Checked Then
    lbl_Date.Caption := 'Destructions on: '+DatetoStr(Actual_Date.Date);
//====
  If length(edt_Branch.Text) > 0 Then
    begin
      qry_Build.Close;
      qry_Build.SQL.Clear;
      qry_Build.SQL.Add('SELECT * FROM BRANCHES WHERE BRANCH = :BR');
      qry_Build.Parameters.ParamByName('BR').Value := edt_Branch.Text;
      qry_Build.Open;
      lbl_Branch.Caption := 'Branch: '+qry_Build.FieldbyName('Branch').asString+ '  '+qry_Build.FieldbyName('Name').asString;
      qry_Build.Close;
    end
  else lbl_Branch.Caption := 'Branch: All Branches';
//====
  If length(edt_Dept.Text) > 0 Then
    begin
      qry_Build.Close;
      qry_Build.SQL.Clear;
      qry_Build.SQL.Add('SELECT * FROM DEPARTMENTS WHERE Department = :DPT');
      qry_Build.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
      qry_Build.Open;
      lbl_Dept.Caption := 'Department: '+qry_Build.FieldbyName('Department').asString+ '  '+qry_Build.FieldbyName('Name').asString;
      qry_Build.Close;
    end
  else lbl_Dept.Caption := 'Department: All Departments';
//====
  lbl_DesType.Caption := 'Destruction Type: '+cb_DesType.Text;
//====
  If length(edt_RType.Text) > 0 Then
    lbl_RecordType.Caption := 'Record Type: '+edt_RType.Text
  else lbl_RecordType.Caption := 'Record Type: All Rcord Types';
//====
  If length(edt_Whouse.Text) > 0 Then
    begin
      qry_Build.Close;
      qry_Build.SQL.Clear;
      qry_Build.SQL.Add('SELECT * FROM WHOUSE WHERE Warehouse = :WH');
      qry_Build.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
      qry_Build.Open;
      lbl_Warehouse.Caption := 'Warehouse: '+qry_Build.FieldbyName('Warehouse').asString+ '  '+qry_Build.FieldbyName('Name').asString;
      qry_Build.Close;
    end
  else lbl_Warehouse.Caption := 'Warehouse: All Warehouse';
//==============================================================================
  If cb_DesType.ItemIndex = 0 Then
    begin
      SQLText := 'SELECT * FROM CONTAINERS WHERE';
      lbl_Barcode.DataField := 'Container';
    end
  else If cb_DesType.ItemIndex = 1 Then
    begin
      SQLText := 'SELECT * FROM FILES WHERE';
      lbl_Barcode.DataField := 'Filenumber';
    end;
  SQLText := SQLTEXT + '(DESTRUCT >= :FD)AND(DESTRUCT <= :TD)';

  IF length(edt_Branch.Text) > 0 Then
    SQLText := SQLTEXT + 'AND(BRANCH = :BR)';

  IF length(edt_Dept.Text) > 0 Then
    SQLText := SQLTEXT + 'AND(DEPARTMENT = :DP)';

  IF length(edt_RType.Text) > 0 Then
    SQLText := SQLTEXT + 'AND(FILETYPE = :RT)';

  IF length(edt_WHouse.Text) > 0 Then
    SQLText := SQLTEXT + 'AND(WAREHOUSE = :WH)';

  qry_Rep.Close;
  qry_Rep.SQL.Clear;                              //1                  //2
  qry_Rep.SQL.Add(SQLText);
  If btn_1.Checked Then
    begin
      qry_Rep.Parameters.ParamByName('FD').Value := Trunc(From_Date.Date)+EncodeTime(0,0,0,0);
      qry_Rep.Parameters.ParamByName('TD').Value := Trunc(To_Date.Date)+EncodeTime(23,59,59,59);
    end;
  If btn_2.Checked Then
    begin
      qry_Rep.Parameters.ParamByName('FD').Value := Trunc(Actual_Date.Date)+EncodeTime(0,0,0,0);
      qry_Rep.Parameters.ParamByName('TD').Value := Trunc(Actual_Date.Date)+EncodeTime(23,59,59,59);
    end;
  IF length(edt_Branch.Text) > 0 Then
    qry_Rep.Parameters.ParamByName('BR').Value := edt_Branch.Text;
  IF length(edt_Dept.Text) > 0 Then
    qry_Rep.Parameters.ParamByName('DP').Value := edt_Dept.Text;
  IF length(edt_RType.Text) > 0 Then
    qry_Rep.Parameters.ParamByName('RT').Value := edt_RType.Text;
  IF length(edt_WHouse.Text) > 0 Then
    qry_Rep.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
  qry_Rep.Open;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Destruction.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Destruction.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Destruction.btn_SelWHouseClick(Sender: TObject);
begin
  If length(cb_DesType.Text) = 0 Then
    begin
      Messagedlg('Please select a Destruction Type!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  frm_SelWHouse.Access := User;
  If cb_DesType.ItemIndex = 0 Then
    frm_SelWHouse.Flag3D := 1
  else if cb_DesType.ItemIndex = 1 Then
    frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Destruction.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_Dept.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If length(cb_DesType.Text) = 0 Then
    begin
      Messagedlg('Please select a Destruction Type!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_Branch.Text,
                          edt_Dept.Text,
                          User,
                          cb_DesType.ItemIndex = 0,
                          cb_DesType.ItemIndex = 1,
                          False,
                          False,
                          False) = mrOK Then
    edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Destruction.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
  Abort;  
end;

procedure Tfrm_Destruction.cb_DesTypeChange(Sender: TObject);
begin
  edt_RType.Text := ''
end;

end.
