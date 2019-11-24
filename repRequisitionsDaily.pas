//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repRequisitionsDaily;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Qrctrls, QuickRpt, ADODB;

type
  Trep_RequisitionsDaily = class(TForm)
    ScrollBox1: TScrollBox;
    rgrp_Type: TRadioGroup;
    Label1: TLabel;
    date_From: TDateTimePicker;
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
    qry_Sum: TADOQuery;
    report2: TQuickRep;
    PageHeaderBand2: TQRBand;
    TitleBand2: TQRBand;
    DetailBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel15: TQRLabel;
    QRSysData6: TQRSysData;
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
    Label2: TLabel;
    edt_Req: TEdit;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    lbl_Text: TQRLabel;
    QRDBText7: TQRDBText;
    qry_Loop: TADOQuery;
    Label9: TLabel;
    date_To: TDateTimePicker;
    QRSubDetail2: TQRSubDetail;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape3: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel21: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    lbl_Text2: TQRLabel;
    BitBtn1: TSpeedButton;
    btn_Preview: TSpeedButton;
    BitBtn2: TSpeedButton;
    BitBtn3: TSpeedButton;
    procedure btn_PreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qry_LoopAfterScroll(DataSet: TDataSet);
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
  rep_RequisitionsDaily: Trep_RequisitionsDaily;

implementation

uses main, SelBranch, SelDept, SelWHouse,MetrofilerDataModule;

{$R *.DFM}

procedure Trep_RequisitionsDaily.btn_PreviewClick(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      report2.Prepare;
      Report2.Print;
    end
  else If rgrp_Type.ItemIndex = 1 Then
    begin
      report.Prepare;
      report.Print;
    end;
end;

procedure Trep_RequisitionsDaily.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Det.Close;
  qry_Sum.Close;
  Action := caFree;
end;

procedure Trep_RequisitionsDaily.FormCreate(Sender: TObject);
begin
  date_From.Date := now;
  date_To.Date := now;
  PANEL1.Visible := FALSE;
end;

procedure Trep_RequisitionsDaily.DetailBand2BeforePrint(
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
    qry.ParamByName('FR').asDateTime := trunc(date_TDay.date)+EncodeTime(0,0,0,0);
    qry.ParamByName('TO').asDateTime := trunc(date_TDay.date)+EncodeTime(23,59,59,59);
    qry.ParamByName('RQ').asString := qry_Sum.FieldbyName('REQUESTER').asString;
    qry.Open;
    lbl_Tot.Caption := qry.FieldbyName('TOT').asString;
  finally
    PickTot := PickTot + qry_Sum.FieldbyName('Tot').asInteger;
    BarcodeTot := BarcodeTot + qry.FieldbyName('Tot').asInteger;
    qry.Close;
    qry.Free;
  end;}
end;

procedure Trep_RequisitionsDaily.QRLabel22Print(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(PickTot);
end;

procedure Trep_RequisitionsDaily.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(BarcodeTot);
end;

procedure Trep_RequisitionsDaily.rgrp_TypeClick(Sender: TObject);
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

procedure Trep_RequisitionsDaily.btn_SelBranchClick(Sender: TObject);
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

procedure Trep_RequisitionsDaily.btn_SelDeptClick(Sender: TObject);
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

procedure Trep_RequisitionsDaily.edt_BranchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
    end;
end;

procedure Trep_RequisitionsDaily.edt_DeptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
end;

procedure Trep_RequisitionsDaily.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
end;

procedure Trep_RequisitionsDaily.btn_SelWHouseClick(Sender: TObject);
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

procedure Trep_RequisitionsDaily.BitBtn3Click(Sender: TObject);
begin
  If rgrp_Type.ItemIndex = 0 Then
    begin
      report2.Prepare;
      Report2.Preview;
    end
  else If rgrp_Type.ItemIndex = 1 Then
    begin
      report.Prepare;
      report.Preview;
    end;
end;

procedure Trep_RequisitionsDaily.BitBtn2Click(Sender: TObject);
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

procedure Trep_RequisitionsDaily.FormShow(Sender: TObject);
begin
  top := 1;
  left := 10;
  height := 338;
  width := 538;
end;

procedure Trep_RequisitionsDaily.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qry   :TADOQuery;
begin
  If not qry_Det.Active Then
    begin
      PrintBand := False;
      exit;
    end;
  qry := TADOQuery.Create(Self);
  try
    qry.Close;
    qry.Connection := dm_Metrofiler.ADOConnect_mFiler;
    qry.SQL.Clear;
    If qry_Det.FieldByName('Barcode').asString <> '' Then
      begin
        qry.SQL.Add('SELECT TEXT1, TEXT2 FROM FILES WHERE FILENUMBER = :FN');
        qry.Parameters.ParamByName('FN').Value := qry_Det.FieldByName('Barcode').asString;
      end
    else if qry_Det.FieldByName('Container').Value <> '' Then
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

procedure Trep_RequisitionsDaily.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qry_Loop.Close;
  qry_Loop.SQL.Clear;
  qry_Loop.SQL.Add('Select Distinct(Convert(char(30), TxDate, 103)) from Pick');
  qry_Loop.SQL.Add('WHERE (TxDate >= :FR)AND(TxDate <= :TO)');
  qry_Loop.Parameters.ParamByName('FR').Value := trunc(date_From.Date)+EncodeTime(0,0,0,0);
  qry_Loop.Parameters.ParamByName('TO').Value := trunc(date_To.Date)+EncodeTime(23,59,59,59);
  qry_Loop.Open;
end;

procedure Trep_RequisitionsDaily.qry_LoopAfterScroll(DataSet: TDataSet);
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
  qry_Det.sql.add('select b.Barcode, b.Container, b.ItemNumber, a.Tx_No, a.Branch, a.Department, a.requester, b.warehouse');
  qry_Det.sql.add('from pick a, pickd b');
  qry_Det.sql.add('where (a.Tx_No = b.Tx_No)');
  qry_Det.sql.Add('and (a.TXDATE >= :FR)AND(a.TXDATE <= :TO)');
  qry_Det.sql.add('and (a.Type = ''RR'')');
  If edt_Branch.Text <> '' Then
    begin
      qry_Det.sql.add('and (a.Branch = :BR)');
      qry_Det.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Det.sql.add('and (a.Department = :DPT)');
      qry_Det.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Det.sql.add('and (b.warehouse = :WH)');
      qry_Det.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Det.sql.add('and (a.requester like :req)');
      qry_Det.Parameters.ParamByName('req').Value := edt_Req.Text+'%';
    end;
  qry_Det.sql.add('order by a.Branch, a.Department, b.warehouse, a.requester');
  qry_Det.Parameters.ParamByName('FR').Value := trunc(TempDate)+EncodeTime(0,0,0,0);
  qry_Det.Parameters.ParamByName('TO').Value := trunc(TempDate)+EncodeTime(23,59,59,59);
  qry_Det.Open;
end;

procedure Trep_RequisitionsDaily.DetailBand2AfterPrint(
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
  qry_Sum.sql.add('select  a.Branch, a.Department, b.warehouse, a.requester , count(*) tot');
  qry_Sum.sql.add('from pick a, pickd b');
  qry_Sum.sql.add('where (a.Tx_No = b.Tx_No)');
  qry_Sum.sql.Add('and (a.TXDATE >= :FR)AND(a.TXDATE <= :TO)');
  qry_Sum.sql.add('and (a.Type = ''RR'')');
  If edt_Branch.Text <> '' Then
    begin
      qry_Sum.sql.add('and (a.Branch = :BR)');
      qry_Sum.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Sum.sql.add('and (a.Department = :DPT)');
      qry_Sum.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Sum.sql.add('and (b.warehouse = :WH)');
      qry_Sum.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Sum.sql.add('and (a.requester like :req)');
      qry_Sum.Parameters.ParamByName('req').Value := edt_Req.Text+'%';
    end;
  qry_Sum.sql.add('group by a.Branch, a.Department, b.warehouse, a.requester');
  qry_Sum.Parameters.ParamByName('FR').Value := trunc(TempDate)+EncodeTime(0,0,0,0);
  qry_Sum.Parameters.ParamByName('TO').Value := trunc(TempDate)+EncodeTime(23,59,59,59);
  qry_Sum.Open;
end;

procedure Trep_RequisitionsDaily.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
