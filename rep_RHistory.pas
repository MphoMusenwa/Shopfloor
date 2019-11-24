unit rep_RHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls,
  ComCtrls, ADODB;

type
  Tfrm_RetrieveHistory = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    qry_History: TADOQuery;
    Panel7: TPanel;
    btn_Print: TBitBtn;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    From_Date: TDateTimePicker;
    To_Date: TDateTimePicker;
    Label2: TLabel;
    cb_FileType: TComboBox;
    cb_Requester: TComboBox;
    qry_Build: TADOQuery;
    Panel3: TPanel;
    rep_RHistory: TQuickRep;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    lbl_FileType: TQRLabel;
    lbl_Requester: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand6: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText1: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    SpeedButton1: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PreviewClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_FileTypePrint(sender: TObject; var Value: String);
    procedure lbl_RequesterPrint(sender: TObject; var Value: String);
    procedure rep_RHistoryBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RetrieveHistory: Tfrm_RetrieveHistory;

implementation

uses main,MetrofilerDataModule;

{$R *.DFM}


procedure Tfrm_RetrieveHistory.btn_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_RetrieveHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_History.Close;
  Action := CaFree;
end;


procedure Tfrm_RetrieveHistory.btn_PreviewClick(Sender: TObject);
begin
  rep_RHistory.Preview;
end;

procedure Tfrm_RetrieveHistory.BitBtn1Click(Sender: TObject);
begin
  rep_RHistory.PrinterSetup;
end;

procedure Tfrm_RetrieveHistory.btn_PrintClick(Sender: TObject);
begin
  rep_RHistory.Print;
end;

procedure Tfrm_RetrieveHistory.FormCreate(Sender: TObject);
begin
//==============================================================================
  With qry_Build Do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT Description FROM IndexDefinitions ORDER BY Description');
      Active := True;
      cb_FileType.Items.Clear;
      First;
      While not EOF Do
        begin
          cb_FileType.Items.Append(FieldbyName('Description').asString);
          Next;
        end;
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT USERID FROM AUTHCODES ORDER BY USERID');
      Active := True;
      cb_Requester.Items.Clear;
      First;
      While not EOF Do
        begin
          cb_Requester.Items.Append(FieldbyName('USERID').asString);
          Next;
        end;
      Active := False;
    end;
//==============================================================================
  From_Date.Date := Now;
  To_Date.Date := Now;
end;

procedure Tfrm_RetrieveHistory.lbl_FileTypePrint(sender: TObject;
  var Value: String);
begin
  Value := 'FileType : '+cb_FileType.Text;
end;

procedure Tfrm_RetrieveHistory.lbl_RequesterPrint(sender: TObject;
  var Value: String);
begin
  Value := 'Requester : '+cb_Requester.Text;
end;

procedure Tfrm_RetrieveHistory.rep_RHistoryBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  SQLString   :String;
begin
  With qry_History do
    begin
      Active := False;
      SQL.Clear;
      SQLString := 'SELECT * FROM HISTORY WHERE (((DATETREQ >= :FD)AND(DATETREQ <= :TD))'
                  +'OR((DATETRET >= :FD)AND(DATETRET <= :TD)))';
      IF length(cb_FileType.Text) > 0 Then
        SQLString := SQLString + 'AND(FILETYPE = :FT)';
      IF length(cb_Requester.Text) > 0 Then
        SQLString := SQLString + 'AND(REQUESTER = :RQ)';
      SQL.Add(SQLString);
      Parameters.ParambyName('FD').Value := StrtoDate(DatetoStr(From_Date.Date));
      Parameters.ParambyName('TD').Value := StrtoDate(DatetoStr(To_Date.Date));
      IF length(cb_FileType.Text) > 0 Then
        Parameters.ParambyName('FT').Value := cb_FileType.Text;
      IF length(cb_Requester.Text) > 0 Then
        Parameters.ParambyName('RQ').Value := cb_Requester.Text;
      Active := True;
    end;
end;

procedure Tfrm_RetrieveHistory.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
