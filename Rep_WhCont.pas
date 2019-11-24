unit Rep_WhCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Db, DBTables, DBCtrls, StdCtrls, Buttons, Qrctrls,
  ADODB;

type
  Tfrm_Rep_WhCont = class(TForm)
    Panel1: TPanel;
    btn_Close: TBitBtn;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    qry_Contents: TADOQuery;
    Panel3: TPanel;
    rep_WhContents: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRSysData3: TQRSysData;
    TitleBand2: TQRBand;
    lbl_Warehouse: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    Label41: TLabel;
    Label5: TLabel;
    cb_Type: TComboBox;
    Label1: TLabel;
    cb_Location: TComboBox;
    qry_Location: TADOQuery;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure cb_TypeChange(Sender: TObject);
    procedure rep_WhContentsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure edt_WHouseChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Rep_WhCont: Tfrm_Rep_WhCont;

implementation

Uses main, SelWHouse,MetrofilerDataModule;

{$R *.DFM}


procedure Tfrm_Rep_WhCont.btn_PreviewClick(Sender: TObject);
begin
  rep_WHContents.Preview;
end;


procedure Tfrm_Rep_WhCont.btn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Rep_WhCont.btn_PrintClick(Sender: TObject);
begin
  rep_WHContents.Print;
end;

procedure Tfrm_Rep_WhCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Contents.Close;
  Action := CaFree;
end;


procedure Tfrm_Rep_WhCont.BitBtn1Click(Sender: TObject);
begin
  rep_WHContents.PrinterSetup;
end;

procedure Tfrm_Rep_WhCont.cb_TypeChange(Sender: TObject);
begin
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '';
end;

procedure Tfrm_Rep_WhCont.rep_WhContentsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  If length(cb_Type.Text) = 0 Then
    begin
      ShowMessage('Please select a Filing Area Type!!');
      PrintReport := False;
      exit;
    end;
  If length(edt_WHouse.Text) = 0 Then
    begin
      ShowMessage('Please select a Filing Area!!');
      PrintReport := False;
      exit;
    end;
  qry_Contents.Close;
  qry_Contents.SQL.Clear;
  Case cb_Type.ItemIndex of
    0 :begin
         qry_Contents.SQL.Append('SELECT Container Barcode, LocNo, Destruct, FileType, IssueStatus FROM Containers where (IssueStatus = ''IN'')');
       end;
    1 :begin
         qry_Contents.SQL.Append('SELECT Filenumber Barcode, LocNo, RecordNo, Destruct, FileType, IssueStatus FROM Files where (IssueStatus = ''IN'')');
       end;
  end;
  qry_Contents.SQL.Append('AND(Warehouse = :WH)');
  qry_Contents.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
  If length(cb_Location.Text) > 0 Then
    begin
      qry_Contents.SQL.Append('AND(LocNo = :LC)');
      qry_Contents.Parameters.ParamByName('LC').Value := cb_Location.Text;
    end;

  Case cb_Type.ItemIndex of
    0 :begin
         qry_Contents.SQL.Append('ORDER BY LOCNO');
       end;
    1 :begin
         qry_Contents.SQL.Append('ORDER BY LOCNO, RECORDNO');
       end;
  end;
  qry_Contents.Open;
  lbl_Warehouse.Caption := 'Filing Area: '+edt_WHouse.Text+'   '+lbl_WHouse.Caption;
end;

procedure Tfrm_Rep_WhCont.btn_SelWHouseClick(Sender: TObject);
begin
  If length(cb_Type.Text) = 0 Then
    exit;
  frm_SelWHouse.Access := User;
  If cb_Type.ItemIndex = 0 Then
    frm_SelWHouse.Flag3D := 1
  else if cb_Type.ItemIndex = 1 Then
    frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Rep_WhCont.edt_WHouseChange(Sender: TObject);
begin
  qry_Location.Close;
  qry_Location.SQL.Clear;
  qry_Location.SQL.Add('SELECT LOCNO FROM LOCATION WHERE (WAREHOUSE = :WH) ORDER BY LOCNO');
  qry_Location.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
  qry_Location.Open;
  qry_Location.First;
  cb_Location.Items.Clear;
  cb_Location.Items.Append('');
  While not qry_Location.EOF Do
    begin
      cb_Location.Items.Append(qry_Location.FieldbyName('LOCNO').asString);
      qry_Location.Next;
    end;
  qry_Location.Close;
end;

end.
