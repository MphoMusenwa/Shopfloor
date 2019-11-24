//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repContSAtoIA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls, Barcd4, ADODB;

type
  Trep_ContSAtoIA = class(TForm)
    qry_Containers: TADOQuery;
    REPORT: TQuickRep;
    qry_Files: TADOQuery;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    lbl_Range: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    QRImage: TQRImage;
    Barcode: TPrintBarcode;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure REPORTBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qry_ContainersAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    mFrom, mTo   :TDateTime;
  end;

var
  rep_ContSAtoIA: Trep_ContSAtoIA;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_ContSAtoIA.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    BarCode.TopInInches := 0;
    BarCode.LeftInInches := 0;
    BarCode.HeightInInches := 0.296;
    BarCode.WidthInInches := 2;
    BarCode.BarCodeType := Code128;
    BarCode.AutoSizing := false;
    BarCode.AutoPosition := true;
    Barcode.Text := qry_Files.FieldbyName('FILENUMBER').asString;
    Barcode.DrawBarCode(QRImage.Canvas, 0);
end;

procedure Trep_ContSAtoIA.REPORTBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qry_Files.Close;
  qry_Files.SQL.Clear;
  qry_Files.SQL.Add('SELECT * FROM FILES WHERE (CONTAINERNO = :CO)');
  qry_Files.SQL.Add('AND((ISSUESTATUS = ''MET'')OR(ISSUESTATUS = ''MIN'')OR(ISSUESTATUS = ''CON''))');
  qry_Containers.Close;
  qry_Containers.SQL.Clear;
  qry_Containers.SQL.Add('select Container, Branch, Department, FileType, IssueStatus, entrydate+((WIP*30)+(AONS*30)+(SAONS*30)) IADate');
  qry_Containers.SQL.Add('from containers where');
  qry_Containers.SQL.Add('((entrydate+((WIP*30)+(AONS*30)+(SAONS*30))) >= :mStart)');
  qry_Containers.SQL.Add('AND((entrydate+((WIP*30)+(AONS*30)+(SAONS*30))) <= :mEnd)');
  qry_Containers.Parameters.ParamByName('mStart').Value := mFrom;
  qry_Containers.Parameters.ParamByName('mEnd').Value := mTo;
  qry_Containers.Open;
end;

procedure Trep_ContSAtoIA.qry_ContainersAfterScroll(DataSet: TDataSet);
begin
  qry_Files.Close;
  qry_Files.Parameters.ParamByName('CO').Value := Dataset.FieldbyName('CONTAINER').asString;
  qry_Files.Open;
end;

end.
