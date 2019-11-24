unit rep_FilesOut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls,
  ComCtrls, ADODB;

type
  Tfrm_FilesWithDrawn = class(TForm)
    Panel1: TPanel;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    cb_DesType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl_Branch: TLabel;
    lbl_Dept: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    date_From: TDateTimePicker;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    edt_Req: TEdit;
    date_To: TDateTimePicker;
    report: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    qry_Det: TADOQuery;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    lbl_Barcode: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_PreviewClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_DesTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FilesWithDrawn: Tfrm_FilesWithDrawn;

implementation

uses main, SelBranch, SelDept, SelRType, SelWHouse,MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_FilesWithDrawn.btn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_FilesWithDrawn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Det.Close;
  Action := CaFree;
end;

procedure Tfrm_FilesWithDrawn.btn_SelBranchClick(Sender: TObject);
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

procedure Tfrm_FilesWithDrawn.btn_SelDeptClick(Sender: TObject);
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

procedure Tfrm_FilesWithDrawn.edt_BranchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
    end;
end;

procedure Tfrm_FilesWithDrawn.edt_DeptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
end;

procedure Tfrm_FilesWithDrawn.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
end;

procedure Tfrm_FilesWithDrawn.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  If cb_DesType.ItemIndex = 1 Then
    frm_SelWHouse.Flag3D := 0
  else frm_SelWHouse.Flag3D := 1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_FilesWithDrawn.btn_PrintClick(Sender: TObject);
begin
  qry_Det.Close;
  qry_Det.SQL.Clear;
  Case cb_DesType.ItemIndex of
    0 : begin
          qry_Det.SQL.Add('select a.* from containers a');
          qry_Det.SQL.Add('where (a.issuestatus =''OUT'')');
        end;
    1 : begin
          qry_Det.SQL.Add('select a.Filenumber, a.Branch, a.Department, a.IssuedTo, a.IssuedOn, a.Text1, a.Text2, b.warehouse');
          qry_Det.SQL.Add('from files a LEFT OUTER JOIN pickd b');
          qry_Det.SQL.Add('             ON (a.ItTxNo = b.Tx_No)and(a.FileNumber = b.Barcode)');
          qry_Det.SQL.Add('and (a.issuestatus =''OUT'')');
        end;
  end;
  qry_Det.SQL.Add('and (a.IssuedOn  >= :FR)and(a.IssuedOn  <= :TO)');
  qry_Det.Parameters.ParamByName('FR').Value := Trunc(date_From.date);
  qry_Det.Parameters.ParamByName('TO').Value := Trunc(date_To.date)+EncodeTime(23,59,59,59);
  If edt_Branch.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.branch = :BR)');
      qry_Det.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.Department = :DPT)');
      qry_Det.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (b.Warehouse = :WH)');
      qry_Det.Parameters.ParamByName('WH').Value := edt_Whouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.IssuedTo Like :REQ)');
      qry_Det.Parameters.ParamByName('REQ').Value := edt_Req.Text+'%';
    end;
  qry_Det.SQL.Add('ORDER BY a.IssuedTo, a.IssuedOn');
  qry_Det.Open;
  Case cb_DesType.ItemIndex of
    0 : lbl_Barcode.DataField := 'Container';
    1 : lbl_Barcode.DataField := 'Filenumber';
  end;
  report.Print;
end;

procedure Tfrm_FilesWithDrawn.btn_PreviewClick(Sender: TObject);
begin
  qry_Det.Close;
  qry_Det.SQL.Clear;
  Case cb_DesType.ItemIndex of
    0 : begin
          qry_Det.SQL.Add('select a.* from containers a');
          qry_Det.SQL.Add('where (a.issuestatus =''OUT'')');
        end;
    1 : begin
          qry_Det.SQL.Add('select a.* from files a');
          qry_Det.SQL.Add('where (a.issuestatus =''OUT'')');


{          qry_Det.SQL.Add('select a.Filenumber, a.Branch, a.Department, a.IssuedTo, a.IssuedOn, a.Text1, a.Text2, b.warehouse');
          qry_Det.SQL.Add('from files a LEFT OUTER JOIN pickd b');
          qry_Det.SQL.Add('             ON (a.ItTxNo = b.Tx_No)and(a.FileNumber = b.Barcode)');
          qry_Det.SQL.Add('and (a.issuestatus =''OUT'')');}
        end;
  end;
  qry_Det.SQL.Add('and (a.IssuedOn  >= :FR)and(a.IssuedOn  <= :TO)');
  qry_Det.Parameters.ParamByName('FR').Value := Trunc(date_From.date);
  qry_Det.Parameters.ParamByName('TO').Value := Trunc(date_To.date)+EncodeTime(23,59,59,59);
  If edt_Branch.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.branch = :BR)');
      qry_Det.Parameters.ParamByName('BR').Value := edt_Branch.Text;
    end;
  If edt_Dept.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.Department = :DPT)');
      qry_Det.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
    end;
  If edt_WHouse.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (b.Warehouse = :WH)');
      qry_Det.Parameters.ParamByName('WH').Value := edt_Whouse.Text;
    end;
  If edt_Req.Text <> '' Then
    begin
      qry_Det.SQL.Add('and (a.IssuedTo Like :REQ)');
      qry_Det.Parameters.ParamByName('REQ').Value := edt_Req.Text+'%';
    end;
  qry_Det.SQL.Add('ORDER BY a.IssuedTo, a.IssuedOn');
  qry_Det.Open;
  Case cb_DesType.ItemIndex of
    0 : lbl_Barcode.DataField := 'Container';
    1 : lbl_Barcode.DataField := 'Filenumber';
  end;
  report.Preview;
end;

procedure Tfrm_FilesWithDrawn.BitBtn1Click(Sender: TObject);
begin
  report.PrinterSetup;
end;

procedure Tfrm_FilesWithDrawn.FormCreate(Sender: TObject);
begin
  date_From.Date := now-7;
  date_To.Date := now;
  cb_DesType.ItemIndex := 0;
  cb_DesTypeChange(Self);
end;

procedure Tfrm_FilesWithDrawn.cb_DesTypeChange(Sender: TObject);
begin
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '';
end;

end.
