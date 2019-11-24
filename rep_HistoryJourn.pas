unit rep_HistoryJourn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, ExtCtrls, quickrpt, Qrctrls;

type
  Tfrm_RecordPos = class(TForm)
    rep_WhContents: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    TitleBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    Panel1: TPanel;
    btn_Close: TBitBtn;
    btn_Print: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    CBox_FT: TDBLookupComboBox;
    btn_Preview: TBitBtn;
    BitBtn1: TBitBtn;
    qry_Rep: TQuery;
    src_Rep: TDataSource;
    src_Select: TDataSource;
    qry_Select: TQuery;
    QRLabel7: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PrintClick(Sender: TObject);
    procedure CBox_FTCloseUp(Sender: TObject);
    procedure btn_PreviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RecordPos: Tfrm_RecordPos;

implementation

uses main;

{$R *.DFM}



procedure Tfrm_RecordPos.BitBtn1Click(Sender: TObject);
begin
   rep_WHContents.PrinterSetup;
end;

procedure Tfrm_RecordPos.btn_CloseClick(Sender: TObject);
begin
   Close;
end;


procedure Tfrm_RecordPos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_Console.itm_RecordPositions.Enabled := True;
    qry_Rep.Active := False;
    qry_Select.Active := False;
    Action := CaFree;
end;

procedure Tfrm_RecordPos.btn_PrintClick(Sender: TObject);
begin
  rep_WHContents.Print;
end;

procedure Tfrm_RecordPos.CBox_FTCloseUp(Sender: TObject);
begin
  qry_Rep.Active := False;
  qry_Rep.SQL.Clear;
  qry_Rep.SQL.Add ('SELECT * FROM FILES WHERE FILETYPE LIKE :FT ORDER BY WAREHOUSE');
  qry_Rep.Params[0].Datatype := ftString;
  qry_Rep.Params[0].AsString := CBox_FT.Text;;
  qry_Rep.Active := True;
end;

procedure Tfrm_RecordPos.btn_PreviewClick(Sender: TObject);
begin
  rep_WHContents.Preview;
end;

end.
