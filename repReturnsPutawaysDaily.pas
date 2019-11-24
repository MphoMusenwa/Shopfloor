//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repReturnsPutawaysDaily;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Qrctrls, QuickRpt, ADODB;

type
  Trep_ReturnsPutawaysDaily = class(TForm)
    ScrollBox1: TScrollBox;
    rgrp_Type: TRadioGroup;
    btn_Preview: TSpeedButton;
    Panel1: TPanel;
    qry_Det: TADOQuery;
    report: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    qry_Sum: TADOQuery;
    report2: TQuickRep;
    PageHeaderBand2: TQRBand;
    TitleBand2: TQRBand;
    ColumnHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    SummaryBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel15: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel18: TQRLabel;
    lbl_SumType: TQRLabel;
    QRLabel21: TQRLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl_Branch: TLabel;
    lbl_Dept: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    Label41: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    lbl_WHouse: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QRLabel17: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    Label2: TLabel;
    edt_Req: TEdit;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    BitBtn2: TSpeedButton;
    BitBtn3: TSpeedButton;
    Label9: TLabel;
    cb_TrxType: TComboBox;
    QRLabel4: TQRLabel;
    qry_Loop: TADOQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    lbl_Text: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    Label1: TLabel;
    Label10: TLabel;
    date_From: TDateTimePicker;
    date_To: TDateTimePicker;
    QRSubDetail2: TQRSubDetail;
    QRDBText11: TQRDBText;
    QRShape3: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    lbl_Text2: TQRLabel;
    BitBtn1: TSpeedButton;
    procedure btn_PreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure rgrp_TypeClick(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qry_LoopAfterScroll(DataSet: TDataSet);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    PickTot, BarcodeTot :Integer;
  public
    { Public declarations }
  end;

var
  rep_ReturnsPutawaysDaily: Trep_ReturnsPutawaysDaily;

implementation

uses main, SelBranch, SelDept, SelWHouse, DataVer, MetrofilerDataModule;

{$R *.DFM}

procedure Trep_ReturnsPutawaysDaily.btn_PreviewClick(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      Report2.Prepare;
      Report2.Print;
    end
  else If rgrp_Type.ItemIndex = 1 Then
    begin
      Report.Prepare;
      report.Print;
    end;
end;

procedure Trep_ReturnsPutawaysDaily.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Det.Close;
  qry_Sum.Close;
  Action := caFree;
end;

procedure Trep_ReturnsPutawaysDaily.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qry_Loop.Close;
  qry_Loop.SQL.Clear;
  qry_Loop.SQL.Add('Select Distinct(Convert(char(30), TDate, 103)) from Transa');
  qry_Loop.SQL.Add('WHERE (TDate >= :FR)AND(TDate <= :TO)');
  IF cb_TrxType.ItemIndex = 0 Then
    qry_Loop.sql.add('AND ((TRANSACTION_TYPE = ''FI'')OR(TRANSACTION_TYPE = ''CI''))')
  else qry_Loop.sql.add('AND ((TRANSACTION_TYPE = ''FR'')OR(TRANSACTION_TYPE = ''CR''))');
  If edt_Branch.Text <> '' Then
    begin
      qry_Loop.sql.add('and (Branch = :BR)');
      qry_Loop.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Loop.sql.add('and (Department = :DPT)');
      qry_Loop.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Loop.sql.add('and (warehouse = :WH)');
      qry_Loop.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Loop.sql.add('and (Userid like :req)');
      qry_Loop.Parameters.ParamByName('req').Value := edt_Req.Text+'%';
    end;
  qry_Loop.Parameters.ParamByName('FR').Value := trunc(date_From.Date)+EncodeTime(0,0,0,0);
  qry_Loop.Parameters.ParamByName('TO').Value := trunc(date_To.Date)+EncodeTime(23,59,59,59);
  qry_Loop.Open;
end;

procedure Trep_ReturnsPutawaysDaily.FormCreate(Sender: TObject);
begin
  date_From.Date := now;
  date_To.Date := now;
  PANEL1.Visible := FALSE;
  cb_TrxType.ItemIndex := 0;
end;

procedure Trep_ReturnsPutawaysDaily.DetailBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
//Var
//  qry   :TQuery;
begin
{  qry := TQuery.Create(Self);
  try
    qry.Close;
    qry.DatabaseName := 'MetroSQL';
    qry.SQL.Clear;
    qry.SQL.Add('SELECT COUNT(*) TOT FROM Pick a, PickD b');
    qry.SQL.Add('WHERE (a.Tx_No = b.Tx_No)');
    qry.SQL.Add('AND (a.TXDATE >= :FR)AND(a.TXDATE <= :TO)');
    qry.SQL.Add('AND (a.Requester = :RQ)');
    qry.Parameters.ParamByName('FR').asDateTime := trunc(date_TDay.date)+EncodeTime(0,0,0,0);
    qry.Parameters.ParamByName('TO').asDateTime := trunc(date_TDay.date)+EncodeTime(23,59,59,59);
    qry.Parameters.ParamByName('RQ').asString := qry_Sum.FieldbyName('REQUESTER').asString;
    qry.Open;
    lbl_Tot.Caption := qry.FieldbyName('TOT').asString;
  finally
    PickTot := PickTot + qry_Sum.FieldbyName('Tot').asInteger;
    BarcodeTot := BarcodeTot + qry.FieldbyName('Tot').asInteger;
    qry.Close;
    qry.Free;
  end;}
end;

procedure Trep_ReturnsPutawaysDaily.QRLabel22Print(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(PickTot);
end;

procedure Trep_ReturnsPutawaysDaily.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(BarcodeTot);
end;

procedure Trep_ReturnsPutawaysDaily.rgrp_TypeClick(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      label2.Visible := False;
      label4.Visible := False;
      edt_Req.Visible := False;
    end
  else if rgrp_Type.ItemIndex = 1 Then
    begin
      label2.Visible := True;
      label4.Visible := True;
      edt_Req.Visible := True;
    end;
end;

procedure Trep_ReturnsPutawaysDaily.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Trep_ReturnsPutawaysDaily.btn_SelDeptClick(Sender: TObject);
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

procedure Trep_ReturnsPutawaysDaily.edt_BranchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
    end;
end;

procedure Trep_ReturnsPutawaysDaily.edt_DeptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
end;

procedure Trep_ReturnsPutawaysDaily.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
end;

procedure Trep_ReturnsPutawaysDaily.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  If MessageDlg('3D Warehouses??', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    frm_SelWHouse.Flag3D := 1
  else frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Trep_ReturnsPutawaysDaily.BitBtn3Click(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      Report2.Prepare;
      Report2.Preview;
    end
  else If rgrp_Type.ItemIndex = 1 Then
    begin
      Report.Prepare;
      report.Preview;
    end;
end;

procedure Trep_ReturnsPutawaysDaily.BitBtn2Click(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      Report2.PrinterSetup;
    end
  else If rgrp_Type.ItemIndex = 1 Then
    begin
      report.PrinterSetup;
    end;
end;

procedure Trep_ReturnsPutawaysDaily.FormShow(Sender: TObject);
begin
  top := 1;
  left := 10;
  height := 338;
  width := 538;
end;

procedure Trep_ReturnsPutawaysDaily.qry_LoopAfterScroll(DataSet: TDataSet);
Var
  TempDate   :TDate;
begin
  If rgrp_Type.ItemIndex <> 1 Then
    exit;
  If trim(qry_Loop.Fields[0].asString) = '' Then
    begin
      qry_Det.Close;
      exit;
    end;
  TempDate := EncodeDate(StrtoInt(copy(qry_Loop.Fields[0].asString,7,4)),
                         StrtoInt(copy(qry_Loop.Fields[0].asString,4,2)),
                         StrtoInt(copy(qry_Loop.Fields[0].asString,1,2)));
  qry_Det.Close;
  qry_Det.sql.Clear;
  qry_Det.sql.add('select Branch, Department, Warehouse, UserId, Filenumber, Container, TDate');
  qry_Det.sql.add('from Transa');
  IF cb_TrxType.ItemIndex = 0 Then
    begin
      qry_Det.sql.add('WHERE ((TRANSACTION_TYPE = ''FI'')OR(TRANSACTION_TYPE = ''CI''))');
      report.ReportTitle := 'List of Putaways (Detailed)';
    end
  else
    begin
      qry_Det.sql.add('WHERE ((TRANSACTION_TYPE = ''FR'')OR(TRANSACTION_TYPE = ''CR''))');
      report.ReportTitle := 'List of Returns (Detailed)';
    end;
  qry_Det.sql.Add('and (TDATE >= :FR)AND(TDATE <= :TO)');
  If edt_Branch.Text <> '' Then
    begin
      qry_Det.sql.add('and (Branch = :BR)');
      qry_Det.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Det.sql.add('and (Department = :DPT)');
      qry_Det.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Det.sql.add('and (warehouse = :WH)');
      qry_Det.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Det.sql.add('and (Userid like :req)');
      qry_Det.Parameters.ParamByName('req').Value := edt_Req.Text+'%';
    end;
  qry_Det.sql.add('order by Branch, Department, warehouse, userid');
  qry_Det.Parameters.ParamByName('FR').Value := trunc(TempDate)+EncodeTime(0,0,0,0);
  qry_Det.Parameters.ParamByName('TO').Value := trunc(TempDate)+EncodeTime(23,59,59,59);
  qry_Det.Open;
end;

procedure Trep_ReturnsPutawaysDaily.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qry   :TAdoQuery;
begin
  If not qry_Det.Active Then
    begin
      PrintBand := False;
      exit;
    end;
  qry := TAdoQuery.Create(Self);
  try
    qry.Close;
    qry.Connection := dm_Metrofiler.ADOConnect_mFiler;
    qry.SQL.Clear;
    If qry_Det.FieldByName('Filenumber').asString <> '' Then
      begin
        qry.SQL.Add('SELECT TEXT1, TEXT2 FROM FILES WHERE FILENUMBER = :FN');
        qry.Parameters.ParamByName('FN').Value := qry_Det.FieldByName('Filenumber').asString;
      end
    else if qry_Det.FieldByName('Container').asString <> '' Then
      begin
        qry.SQL.Add('SELECT TEXT1, TEXT2 FROM CONTAINERS WHERE CONTAINER = :CN');
        qry.Parameters.ParamByName('CN').Value := qry_Det.FieldByName('Container').asString;
      end
    else
      begin
        lbl_Text.Caption := '';
        lbl_Text2.Caption := '';
        exit;
      end;
    qry.Open;
    lbl_Text.Caption := qry.FieldbyName('Text1').asString;
    lbl_Text2.Caption := qry.FieldbyName('Text2').asString;
  finally
    qry.Close;
    qry.Free
  end;
end;

procedure Trep_ReturnsPutawaysDaily.DetailBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
Var
  TempDate   :TDate;
begin
  If trim(qry_Loop.Fields[0].asString) = '' Then
    begin
      qry_Sum.Close;
      exit;
    end;
  TempDate := EncodeDate(StrtoInt(copy(qry_Loop.Fields[0].asString,7,4)),
                         StrtoInt(copy(qry_Loop.Fields[0].asString,4,2)),
                         StrtoInt(copy(qry_Loop.Fields[0].asString,1,2)));
  qry_Sum.Close;
  qry_Sum.sql.Clear;
  qry_Sum.sql.add('SELECT Branch, Department, Warehouse, UserId, Count(*) Tot');
  qry_Sum.sql.add('FROM Transa');
  IF cb_TrxType.ItemIndex = 0 Then
    begin
      qry_Sum.sql.add('WHERE ((TRANSACTION_TYPE = ''FI'')OR(TRANSACTION_TYPE = ''CI''))');
      lbl_SumType.Caption := 'Amount of Barcodes Putaway';
      report2.ReportTitle := 'List of Putaways (Summary)';
    end
  else
    begin
      qry_Sum.sql.add('WHERE ((TRANSACTION_TYPE = ''FR'')OR(TRANSACTION_TYPE = ''CR''))');
      lbl_SumType.Caption := 'Amount of Barcodes Returned';
      report2.ReportTitle := 'List of Returns (Summary)';
    end;
  qry_Sum.sql.Add('and (TDATE >= :FR)AND(TDATE <= :TO)');
  If edt_Branch.Text <> '' Then
    begin
      qry_Sum.sql.add('and (Branch = :BR)');
      qry_Sum.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Sum.sql.add('and (Department = :DPT)');
      qry_Sum.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Sum.sql.add('and (warehouse = :WH)');
      qry_Sum.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Sum.sql.add('and (UserId like :req)');
      qry_Sum.Parameters.ParamByName('req').Value := edt_Req.Text+'%';
    end;
  qry_Sum.sql.add('GROUP BY Branch, Department, Warehouse, userid');
  qry_Sum.Parameters.ParamByName('FR').Value := trunc(Tempdate)+EncodeTime(0,0,0,0);
  qry_Sum.Parameters.ParamByName('TO').Value := trunc(Tempdate)+EncodeTime(23,59,59,59);
  qry_Sum.Open;

end;

procedure Trep_ReturnsPutawaysDaily.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
