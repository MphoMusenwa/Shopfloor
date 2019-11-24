//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repCapturedRecList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_CapturedRecList = class(TForm)
    qry_Records: TADOQuery;
    qry_Get_Br_Dpt_FT: TADOQuery;
    report: TQuickRep;
    QRBand5: TQRBand;
    QRLabel26: TQRLabel;
    QRSysData10: TQRSysData;
    QRBand6: TQRBand;
    QRSysData11: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData12: TQRSysData;
    lbl_Range: TQRLabel;
    QRBand8: TQRBand;
    QRBand9: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    lbl_RAmount: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qry_GetTot: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    procedure lbl_RangePrint(sender: TObject; var Value: String);
    procedure qry_Get_Br_Dpt_FTAfterScroll(DataSet: TDataSet);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FromD, ToD  :TDateTime;
  end;

var
  rep_CapturedRecList: Trep_CapturedRecList;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_CapturedRecList.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

procedure Trep_CapturedRecList.qry_Get_Br_Dpt_FTAfterScroll(
  DataSet: TDataSet);
begin
//============Total Containers Captured=========================================
  qry_GetTot.Close;
  qry_GetTot.SQL.Clear;
  qry_GetTot.SQL.Add('SELECT COUNT(*) RTot FROM FILES');
  qry_GetTot.SQL.Add('WHERE (Branch = :Br)');
  qry_GetTot.SQL.Add('AND (Department = :Dpt)');
  qry_GetTot.SQL.Add('AND (EntryDate >= :FR)');
  qry_GetTot.SQL.Add('AND (EntryDate <= :TO)');
  qry_GetTot.Parameters.ParamByName('BR').Value := Dataset.FieldbyName('BrCode').asString;
  qry_GetTot.Parameters.ParamByName('DPT').Value := Dataset.FieldbyName('DptCode').asString;
  qry_GetTot.Parameters.ParamByName('FR').Value := FromD;
  qry_GetTot.Parameters.ParamByName('TO').Value := ToD;
  qry_GetTot.Open;
//===========================Get List of containers captured====================
  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT Filenumber, EntryDate, UserId, FileType FROM FILES');
  qry_Records.SQL.Add('WHERE (Branch = :Br)');
  qry_Records.SQL.Add('AND (Department = :Dpt)');
  qry_Records.SQL.Add('AND (EntryDate >= :FR)');
  qry_Records.SQL.Add('AND (EntryDate <= :TO)');
  qry_Records.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Records.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Records.Parameters.ParamByName('FR').Value := FromD;
  qry_Records.Parameters.ParamByName('TO').Value := ToD;
  qry_Records.Open;
end;

procedure Trep_CapturedRecList.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lbl_RAmount.Caption := CurrtoStrF(qry_GetTot.FieldbyName('RTOT').asInteger, ffNumber, 0);
end;

end.
