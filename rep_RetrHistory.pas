unit rep_RetrHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls,
  ComCtrls;

type
  Tfrm_Destruction = class(TForm)
    rep_Destruct1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    TitleBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    Panel1: TPanel;
    btn_Close: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    CBox_FT: TDBLookupComboBox;
    qry_Rep: TQuery;
    src_Rep: TDataSource;
    src_Select: TDataSource;
    qry_Select: TQuery;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    Panel4: TPanel;
    Label3: TLabel;
    CBox_Dept: TDBLookupComboBox;
    Panel5: TPanel;
    Label4: TLabel;
    CBox_Warehouse: TDBLookupComboBox;
    qry_Select3: TQuery;
    src_Select3: TDataSource;
    qry_Select2: TQuery;
    Panel7: TPanel;
    btn_2: TRadioButton;
    src_Select2: TDataSource;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Date3: TDateTimePicker;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    btn_1: TRadioButton;
    Label6: TLabel;
    Label7: TLabel;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    tbl_headings: TTable;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    rep_Destruct2: TQuickRep;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
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
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText21: TQRDBText;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure rep_Destruct1AfterPreview(Sender: TObject);
    procedure rep_Destruct1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Destruction: Tfrm_Destruction;

implementation

uses main;

{$R *.DFM}


procedure Tfrm_Destruction.btn_CloseClick(Sender: TObject);
begin
   Close;
end;


procedure Tfrm_Destruction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_Console.itm_RepDestruction.Enabled := True;
    qry_Rep.Active := False;
    qry_Select.Active := False;
    tbl_Headings.Close;
    Action := CaFree;
end;


procedure Tfrm_Destruction.btn_PreviewClick(Sender: TObject);
begin
 // Editing the headings
 //-----------------------------------------------
  tbl_Headings.First;
  tbl_Headings.Edit;
  If length(CBox_FT.Text) > 0 Then
    tbl_Headings.Fields[0].AsString := CBox_FT.Text
  Else tbl_Headings.Fields[0].AsString := 'All';
  If length(CBox_Warehouse.Text) > 0 Then
    tbl_Headings.Fields[1].AsString := CBox_Warehouse.Text
  Else tbl_Headings.Fields[1].AsString := 'All';
  If length(CBox_Dept.Text) > 0 Then
    tbl_Headings.Fields[2].AsString := CBox_Dept.Text
  Else tbl_Headings.Fields[2].AsString := 'All';
  If btn_1.Checked = True Then
    begin
      tbl_Headings.Fields[3].AsString := DatetoStr(Date1.Date);
      tbl_Headings.Fields[4].AsString := DatetoStr(Date2.Date);
      tbl_Headings.Post;
      qry_Rep.Active := False;
      qry_Rep.SQL.Clear;                              //1                  //2                   //3                           //4                  //4                      //5
      qry_Rep.SQL.Add ('SELECT * FROM FILES WHERE (FILETYPE LIKE :FT)AND(WAREHOUSE LIKE :WH)AND(DEPARTMENT LIKE :DEPT)AND(ISSUESTATUS = :ST)AND(DESTRUCT > :DATE1)AND(DESTRUCT < :DATE2)');
      qry_Rep.Params[0].DataType := ftString;
      qry_Rep.Params[1].DataType := ftString;
      qry_Rep.Params[2].DataType := ftString;
      qry_Rep.Params[3].DataType := ftString;
      qry_Rep.Params[4].DataType := ftDate;
      qry_Rep.Params[5].DataType := ftDate;
      If length(CBox_FT.Text) > 0 Then
        qry_Rep.Params[0].asString := CBox_FT.Text
      Else  qry_Rep.Params[0].asString := '%';
      If length(CBox_Warehouse.Text) > 0 Then
        qry_Rep.Params[1].asString := CBox_Warehouse.Text
      Else  qry_Rep.Params[1].asString := '%';
      If length(CBox_Dept.Text) > 0 Then
        qry_Rep.Params[2].asString := CBox_Dept.Text
      Else  qry_Rep.Params[2].asString := '%';
      qry_Rep.Params[3].asString := 'OUT';
      qry_Rep.Params[4].asDate := Date1.Date;
      qry_Rep.Params[5].asDate := Date2.Date;
      qry_Rep.Open;
      rep_Destruct2.Preview;
    end;
  If btn_2.Checked = True Then
    begin
      tbl_Headings.Fields[3].AsString := DatetoStr(Date3.Date);
      tbl_Headings.Post;
      qry_Rep.Active := False;
      qry_Rep.SQL.Clear;                              //1                  //2                   //3                           //4                  //4
      qry_Rep.SQL.Add ('SELECT * FROM FILES WHERE (FILETYPE LIKE :FT)AND(WAREHOUSE LIKE :WH)AND(DEPARTMENT LIKE :DEPT)AND(ISSUESTATUS = :ST)AND(DESTRUCT = :DATE)');
      qry_Rep.Params[0].DataType := ftString;
      qry_Rep.Params[1].DataType := ftString;
      qry_Rep.Params[2].DataType := ftString;
      qry_Rep.Params[3].DataType := ftString;
      qry_Rep.Params[4].DataType := ftDate;
      If length(CBox_FT.Text) > 0 Then
        qry_Rep.Params[0].asString := CBox_FT.Text
      Else  qry_Rep.Params[0].asString := '%';
      If length(CBox_Warehouse.Text) > 0 Then
        qry_Rep.Params[1].asString := CBox_Warehouse.Text
      Else  qry_Rep.Params[1].asString := '%';
      If length(CBox_Dept.Text) > 0 Then
        qry_Rep.Params[2].asString := CBox_Dept.Text
      Else  qry_Rep.Params[2].asString := '%';
      qry_Rep.Params[3].asString := 'OUT';
      qry_Rep.Params[4].asDate := Date3.Date;
      qry_Rep.Open;
      rep_Destruct1.Preview;
    end;
end;




procedure Tfrm_Destruction.btn_1Click(Sender: TObject);
begin
   Date1.Enabled := True;
   Date2.Enabled := True;
   Date3.Enabled := False;
end;

procedure Tfrm_Destruction.btn_2Click(Sender: TObject);
begin
   Date1.Enabled := False;
   Date2.Enabled := False;
   Date3.Enabled := True;
end;

procedure Tfrm_Destruction.BitBtn1Click(Sender: TObject);
begin
   rep_Destruct1.PrinterSetup;
end;

procedure Tfrm_Destruction.btn_PrintClick(Sender: TObject);
begin
 // Editing the headings
 //-----------------------------------------------
  tbl_Headings.First;
  tbl_Headings.Edit;
  If length(CBox_FT.Text) > 0 Then
    tbl_Headings.Fields[0].AsString := CBox_FT.Text
  Else tbl_Headings.Fields[0].AsString := 'All';
  If length(CBox_Warehouse.Text) > 0 Then
    tbl_Headings.Fields[1].AsString := CBox_Warehouse.Text
  Else tbl_Headings.Fields[1].AsString := 'All';
  If length(CBox_Dept.Text) > 0 Then
    tbl_Headings.Fields[2].AsString := CBox_Dept.Text
  Else tbl_Headings.Fields[2].AsString := 'All';
  If btn_1.Checked = True Then
    begin
      tbl_Headings.Fields[3].AsString := DatetoStr(Date1.Date);
      tbl_Headings.Fields[4].AsString := DatetoStr(Date2.Date);
      tbl_Headings.Post;
      qry_Rep.Active := False;
      qry_Rep.SQL.Clear;                              //1                  //2                   //3                           //4                  //4                      //5
      qry_Rep.SQL.Add ('SELECT * FROM FILES WHERE (FILETYPE LIKE :FT)AND(WAREHOUSE LIKE :WH)AND(DEPARTMENT LIKE :DEPT)AND(ISSUESTATUS = :ST)AND(DESTRUCT > :DATE1)AND(DESTRUCT < :DATE2)');
      qry_Rep.Params[0].DataType := ftString;
      qry_Rep.Params[1].DataType := ftString;
      qry_Rep.Params[2].DataType := ftString;
      qry_Rep.Params[3].DataType := ftString;
      qry_Rep.Params[4].DataType := ftDate;
      qry_Rep.Params[5].DataType := ftDate;
      If length(CBox_FT.Text) > 0 Then
        qry_Rep.Params[0].asString := CBox_FT.Text
      Else  qry_Rep.Params[0].asString := '%';
      If length(CBox_Warehouse.Text) > 0 Then
        qry_Rep.Params[1].asString := CBox_Warehouse.Text
      Else  qry_Rep.Params[1].asString := '%';
      If length(CBox_Dept.Text) > 0 Then
        qry_Rep.Params[2].asString := CBox_Dept.Text
      Else  qry_Rep.Params[2].asString := '%';
      qry_Rep.Params[3].asString := 'OUT';
      qry_Rep.Params[4].asDate := Date1.Date;
      qry_Rep.Params[5].asDate := Date2.Date;
      qry_Rep.Open;
      rep_Destruct2.Print;
    end;
  If btn_2.Checked = True Then
    begin
      tbl_Headings.Fields[3].AsString := DatetoStr(Date3.Date);
      tbl_Headings.Post;
      qry_Rep.Active := False;
      qry_Rep.SQL.Clear;                              //1                  //2                   //3                           //4                  //4
      qry_Rep.SQL.Add ('SELECT * FROM FILES WHERE (FILETYPE LIKE :FT)AND(WAREHOUSE LIKE :WH)AND(DEPARTMENT LIKE :DEPT)AND(ISSUESTATUS = :ST)AND(DESTRUCT = :DATE)');
      qry_Rep.Params[0].DataType := ftString;
      qry_Rep.Params[1].DataType := ftString;
      qry_Rep.Params[2].DataType := ftString;
      qry_Rep.Params[3].DataType := ftString;
      qry_Rep.Params[4].DataType := ftDate;
      If length(CBox_FT.Text) > 0 Then
        qry_Rep.Params[0].asString := CBox_FT.Text
      Else  qry_Rep.Params[0].asString := '%';
      If length(CBox_Warehouse.Text) > 0 Then
        qry_Rep.Params[1].asString := CBox_Warehouse.Text
      Else  qry_Rep.Params[1].asString := '%';
      If length(CBox_Dept.Text) > 0 Then
        qry_Rep.Params[2].asString := CBox_Dept.Text
      Else  qry_Rep.Params[2].asString := '%';
      qry_Rep.Params[3].asString := 'OUT';
      qry_Rep.Params[4].asDate := Date3.Date;
      qry_Rep.Open;
      rep_Destruct1.Print;
    end;
end;

procedure Tfrm_Destruction.rep_Destruct1AfterPreview(Sender: TObject);
begin
    qry_Select.Active := True;
    qry_Select2.Active := True;
    qry_Select3.Active := True;
end;

procedure Tfrm_Destruction.rep_Destruct1AfterPrint(Sender: TObject);
begin
    qry_Select.Active := True;
    qry_Select2.Active := True;
    qry_Select3.Active := True;
end;









end.
