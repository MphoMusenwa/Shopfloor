unit rep_SchDestruct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls,
  ComCtrls, ADODB;

type
  Tfrm_OutSched = class(TForm)
    Panel1: TPanel;
    btn_Close: TBitBtn;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    qry_Rep: TADOQuery;
    src_Rep: TDataSource;
    Panel2: TPanel;
    rep_WhContents: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    TitleBand2: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    lbl_Barcode: TQRDBText;
    Label1: TLabel;
    date_To: TDateTimePicker;
    Label5: TLabel;
    cb_DesType: TComboBox;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_PreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_OutSched: Tfrm_OutSched;

implementation

uses main,MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_OutSched.BitBtn1Click(Sender: TObject);
begin
  rep_WHContents.PrinterSetup;
end;

procedure Tfrm_OutSched.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_OutSched.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Rep.Active := False;
  Action := CaFree;
end;

procedure Tfrm_OutSched.btn_PrintClick(Sender: TObject);
begin
  If length(cb_DesType.Text) = 0 then
    begin
      Messagedlg('Please select a destruction Type!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  qry_Rep.Close;
  qry_Rep.SQL.Clear;
  Case cb_DesType.ItemIndex of
    0 : qry_Rep.SQL.Add('SELECT * FROM CONTAINERS WHERE (ISSUESTATUS = ''OUT'')');
    1 : qry_Rep.SQL.Add('SELECT * FROM FILES WHERE (ISSUESTATUS = ''OUT'')');
  end;
  qry_Rep.SQL.Add('AND((DESTROY <> 1)OR(DESTROY is Null))');
  qry_Rep.SQL.Add('AND(DESTRUCT > :FR)AND(DESTRUCT <= :TO)');
  qry_Rep.Parameters.ParamByName('FR').Value := Now;
  qry_Rep.Parameters.ParamByName('TO').Value := Trunc(date_To.date)+EncodeTime(23,59,59,59);
  qry_Rep.Open;
  rep_WHContents.Print;
end;


procedure Tfrm_OutSched.btn_PreviewClick(Sender: TObject);
begin
  If length(cb_DesType.Text) = 0 then
    begin
      Messagedlg('Please select a destruction Type!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  qry_Rep.Close;
  qry_Rep.SQL.Clear;
  Case cb_DesType.ItemIndex of
    0 : begin
          qry_Rep.SQL.Add('SELECT * FROM CONTAINERS WHERE (ISSUESTATUS = ''OUT'')');
          lbl_Barcode.DataField := 'Container';
        end;
    1 : begin
          qry_Rep.SQL.Add('SELECT * FROM FILES WHERE (ISSUESTATUS = ''OUT'')');
          lbl_Barcode.DataField := 'Filenumber';
        end;
  end;
  qry_Rep.SQL.Add('AND((DESTROY <> 1)OR(DESTROY is Null))');
  qry_Rep.SQL.Add('AND(DESTRUCT > :FR)AND(DESTRUCT <= :TO)');
  qry_Rep.SQL.Add('ORDER BY BRANCH, DEPARTMENT, FILETYPE');
  qry_Rep.Parameters.ParamByName('FR').Value := Now;
  qry_Rep.Parameters.ParamByName('TO').Value := Trunc(date_To.date)+EncodeTime(23,59,59,59);
  qry_Rep.Open;
  rep_WHContents.Preview;
end;

procedure Tfrm_OutSched.FormCreate(Sender: TObject);
begin
  date_To.DateTime := Now + 30;
end;

end.
