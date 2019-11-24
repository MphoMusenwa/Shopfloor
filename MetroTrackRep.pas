//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit MetroTrackRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB,
  DBTables, Mask, DBCtrls, QRCtrls, QuickRpt, Printers, ADODB;

type
  Tfrm_MetroTrackRep = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qry_Records: TADOQuery;
    dts_Records: TDataSource;
    TabSheet2: TTabSheet;
    rep_History: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    PrintDialog: TPrintDialog;
    TabSheet3: TTabSheet;
    qry_SQL: TADOQuery;
    ScrollBox1: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_UserIdBarcode: TEdit;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    ScrollBox2: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    date_From: TDateTimePicker;
    date_To: TDateTimePicker;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    edt_Barcode: TEdit;
    btn_PrintDelSlip: TBitBtn;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_PrintDelSlipClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MetroTrackRep: Tfrm_MetroTrackRep;

implementation

uses main, SelBranch, SelDept,MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_MetroTrackRep.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_MetroTrackRep.FormCreate(Sender: TObject);
begin
  date_From.DateTime := Now-30;
  date_To.DateTime := Now;
  PageControl1.ActivePageIndex := 0;
end;

procedure Tfrm_MetroTrackRep.BitBtn1Click(Sender: TObject);
begin
  If trim(edt_Barcode.Text) = '' Then
    begin
      Messagedlg('Please enter a barcode First!!', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT * FROM MetroTrackLog');
  qry_Records.SQL.Add('WHERE Filenumber = '+QuotedStr(edt_Barcode.text));
  qry_Records.SQL.Add('AND TrackDate BETWEEN :mFrom AND :mTo');
  qry_Records.SQL.Add('ORDER BY TrackNo');
  qry_Records.Parameters.ParamByName('mFrom').Value := Trunc(date_From.DateTime);
  qry_Records.Parameters.ParamByName('mTo').Value := Trunc(date_To.DateTime)+EncodeTime(23,59,59,59);
  qry_Records.Open;
end;

procedure Tfrm_MetroTrackRep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_MetrofileriReports.Enabled := True;
  qry_Records.Close;
  Action := caFree;
end;

procedure Tfrm_MetroTrackRep.btn_PrintDelSlipClick(Sender: TObject);
begin
  If not qry_Records.Active Then
    begin
      BitBtn1Click(Self);
    end;
  If PrintDialog.Execute Then
    begin
      rep_History.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
      rep_History.Print;
    end;
end;

procedure Tfrm_MetroTrackRep.BitBtn2Click(Sender: TObject);
Var
  J   :Integer;
begin
  If trim(edt_UserIdBarcode.Text) = '' Then
    begin
      Messagedlg('Please enter a barcode First!!', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Max(TrackNo) FROM MetroTrackLog');
  qry_SQL.SQL.Add('WHERE Filenumber = '+QuotedStr(edt_UserIdBarcode.text));
  qry_SQL.Open;
  J := qry_SQL.Fields[0].AsInteger;
  qry_SQL.Close;

  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT * FROM MetroTrackLog');
  qry_Records.SQL.Add('WHERE Filenumber = '+QuotedStr(edt_UserIdBarcode.text));
  qry_Records.SQL.Add('AND TrackNo = '+InttoStr(J));
  qry_Records.Open;
end;

procedure Tfrm_MetroTrackRep.PageControl1Change(Sender: TObject);
begin
  qry_Records.Close;
end;

end.
