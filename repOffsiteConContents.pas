//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repOffsiteConContents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, Db, DBTables, ExtCtrls, StdCtrls, Buttons, ADODB;

type
  Trep_OffSiteConContents = class(TForm)
    qry_GetContainer: TADOQuery;
    qry_Records: TADOQuery;
    Panel1: TPanel;
    btn_Print: TSpeedButton;
    btn_Preview: TSpeedButton;
    BitBtn1: TSpeedButton;
    Label1: TLabel;
    edt_Container: TEdit;
    Panel2: TPanel;
    report: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    lbl_Container: TQRLabel;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qry_Items: TADOQuery;
    SpeedButton1: TSpeedButton;
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qry_RecordsAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_OffSiteConContents: Trep_OffSiteConContents;

implementation

uses main, MetrofilerDataModule;

{$R *.DFM}

procedure Trep_OffSiteConContents.btn_PreviewClick(Sender: TObject);
begin
  qry_GetContainer.Close;
  qry_GetContainer.SQL.Clear;
  qry_GetContainer.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CO');
  qry_GetContainer.Parameters.ParamByName('CO').Value := edt_Container.Text;
  qry_GetContainer.Open;
  If qry_GetContainer.isEmpty Then
    begin
      Showmessage('Container not found!!');
      exit;
    end;
  report.Preview;
  qry_GetContainer.Close;
end;

procedure Trep_OffSiteConContents.btn_PrintClick(Sender: TObject);
begin
  qry_GetContainer.Close;
  qry_GetContainer.SQL.Clear;
  qry_GetContainer.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CO');
  qry_GetContainer.Parameters.ParamByName('CO').Value := edt_Container.Text;
  qry_GetContainer.Open;
  If qry_GetContainer.isEmpty Then
    begin
      Showmessage('Container not found!!');
      exit;
    end;
  report.Print;
  qry_GetContainer.Close;
end;

procedure Trep_OffSiteConContents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Items.Close;
  qry_Records.Close;
  qry_GetContainer.Close;
  Action := caFree;
end;

procedure Trep_OffSiteConContents.reportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT * FROM FILES WHERE (CONTAINERNO = :CO) ORDER BY FILENUMBER');
  qry_Records.Parameters.ParamByName('CO').Value := qry_GetContainer.FieldbyName('CONTAINER').asString;
  qry_Records.Open;
end;

procedure Trep_OffSiteConContents.qry_RecordsAfterScroll(
  DataSet: TDataSet);
begin
  qry_Items.Close;
  qry_Items.SQL.Clear;
  qry_Items.SQL.Add('SELECT * FROM ITEMS WHERE (FILENUMBER = :FN) ORDER BY ITEMNUMBER');
  qry_Items.Parameters.ParamByName('FN').Value := Dataset.FieldbyName('Filenumber').asString;
  qry_Items.Open;
end;

procedure Trep_OffSiteConContents.BitBtn1Click(Sender: TObject);
begin
  report.PrinterSetup;
end;

procedure Trep_OffSiteConContents.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
