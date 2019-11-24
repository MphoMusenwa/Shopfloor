//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repWorkCaptured;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, ComCtrls, QuickRpt, Qrctrls,
  ADODB;

type
  Trep_workCaptured = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cb_UserID: TComboBox;
    Label2: TLabel;
    date_From: TDateTimePicker;
    btn_Preview: TSpeedButton;
    qry_UserID: TADOQuery;
    Label3: TLabel;
    date_To: TDateTimePicker;
    qry_Files: TADOQuery;
    Panel2: TPanel;
    report: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    lbl_Userid: TQRLabel;
    lbl_FromTo: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    BitBtn1: TSpeedButton;
    procedure cb_UserIDKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PreviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_workCaptured: Trep_workCaptured;

implementation

uses main, MetrofilerDatamodule;

{$R *.DFM}

procedure Trep_workCaptured.cb_UserIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  abort;
end;

procedure Trep_workCaptured.FormCreate(Sender: TObject);
begin
  qry_UserID.Close;
  qry_UserID.SQL.Clear;
  qry_UserID.SQL.Add('SELECT UserID FROM AuthCodes Order by UserId');
  qry_UserID.Open;
  qry_UserID.First;
  cb_UserId.Items.Clear;
  While not qry_UserID.EOF Do
    begin
      cb_UserId.Items.Append(qry_Userid.FieldbyName('Userid').asString);
      qry_UserID.Next;
    end;
  qry_UserID.Close;
  date_From.Date := Now;
  date_To.Date := Now;
  panel2.SendToBack;
end;

procedure Trep_workCaptured.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Userid.Close;
  qry_Files.Close;
  Action := caFree;
end;

procedure Trep_workCaptured.btn_PreviewClick(Sender: TObject);
begin
  If length(cb_Userid.Text) = 0 Then
    begin
      MessageDlg('Please select a Userid!!', mtWarning, [mbOk], 0);
      exit;
    end;
  lbl_Userid.Caption := 'Userid: '+cb_Userid.Text;
  lbl_FromTo.Caption := 'From: '+DatetoStr(date_From.Date)+' to: '+DatetoStr(date_To.Date);
  qry_Files.Close;
  qry_Files.SQL.Clear;
  qry_Files.SQL.Add('SELECT FileNumber, Userid, EntryDate, Text1, Text2 FROM Files');
  qry_Files.SQL.Add('WHERE (Userid = :ID)AND(EntryDate >= :FR)AND(EntryDate <= :TO) Order by EntryDate');
  qry_Files.Parameters.ParambyName('ID').Value := cb_Userid.Text;
  qry_Files.Parameters.ParambyName('FR').Value := Trunc(date_From.Date)+EncodeTime(0,0,0,0);
  qry_Files.Parameters.ParambyName('TO').Value := Trunc(date_To.Date)+EncodeTime(23,59,59,59);
  qry_Files.Open;
  report.Preview;
  qry_Files.Close;
end;

procedure Trep_workCaptured.FormShow(Sender: TObject);
begin
  top := 2;
  left := 10;
  height := 185;
  width := 352;
end;

procedure Trep_workCaptured.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
