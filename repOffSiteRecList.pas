//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repOffSiteRecList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_OffSiteRecList = class(TForm)
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
    lbl_CAmount: TQRLabel;
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
  rep_OffSiteRecList: Trep_OffSiteRecList;

implementation

Uses
MetrofilerDataModule;

{$R *.DFM}

procedure Trep_OffSiteRecList.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

procedure Trep_OffSiteRecList.qry_Get_Br_Dpt_FTAfterScroll(
  DataSet: TDataSet);
begin
//============Total Containers Captured=========================================
  qry_GetTot.Close;
  qry_GetTot.SQL.Clear;
  qry_GetTot.SQL.Add('SELECT COUNT(*) CTot FROM Files a, TRANSA b');
  qry_GetTot.SQL.Add('WHERE (a.FileNumber = b.Filenumber)');
  qry_GetTot.SQL.Add('AND (a.Branch = :Br)');
  qry_GetTot.SQL.Add('AND (a.Department = :Dpt)');
  qry_GetTot.SQL.Add('AND (b.Transaction_Type = ''FOS'')');
  qry_GetTot.SQL.Add('AND (b.TDate >= :FR)');
  qry_GetTot.SQL.Add('AND (b.TDate <= :TO)');
  qry_GetTot.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_GetTot.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_GetTot.Parameters.ParamByName('FR').Value := FromD;
  qry_GetTot.Parameters.ParamByName('TO').Value := ToD;
  qry_GetTot.Open;
//===========================Get List of containers captured====================
  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT a.FileNumber, b.TDate, b.UserID, a.FileType FROM Files a, TRANSA b');
  qry_Records.SQL.Add('WHERE (a.FileNumber = b.Filenumber)');
  qry_Records.SQL.Add('AND (a.Branch = :Br)');
  qry_Records.SQL.Add('AND (a.Department = :Dpt)');
  qry_Records.SQL.Add('AND (b.Transaction_Type = ''FOS'')');
  qry_Records.SQL.Add('AND (b.TDate >= :FR)');
  qry_Records.SQL.Add('AND (b.TDate <= :TO)');
  qry_Records.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Records.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Records.Parameters.ParamByName('FR').Value := FromD;
  qry_Records.Parameters.ParamByName('TO').Value := ToD;
  qry_Records.Open;
end;

procedure Trep_OffSiteRecList.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lbl_CAmount.Caption := CurrtoStrF(qry_GetTot.FieldbyName('CTOT').asInteger, ffNumber, 0);
end;

end.
