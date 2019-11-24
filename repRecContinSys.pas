//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repRecContinSys;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_RecContinSys = class(TForm)
    report: TQuickRep;
    QRBand5: TQRBand;
    QRLabel26: TQRLabel;
    QRSysData10: TQRSysData;
    QRBand6: TQRBand;
    QRSysData11: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData12: TQRSysData;
    QRBand7: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand8: TQRBand;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    lbl_CAmount: TQRLabel;
    QRShape4: TQRShape;
    QRBand9: TQRBand;
    QRLabel33: TQRLabel;
    lbl_CTotal: TQRLabel;
    qry_Get_Br_Dpt_FT: TADOQuery;
    qry_Tot: TADOQuery;
    QRLabel1: TQRLabel;
    lbl_RAmount: TQRLabel;
    lbl_RTotal: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure lbl_CTotalPrint(sender: TObject; var Value: String);
    procedure lbl_RTotalPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    CTot, RTot   :Integer;
  end;

var
  rep_RecContinSys: Trep_RecContinSys;

implementation

Uses
MetrofilerDataModule;

{$R *.DFM}

procedure Trep_RecContinSys.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_Tot.Close;
  qry_Tot.SQL.Clear;
  qry_Tot.SQL.Add('SELECT COUNT(*) RTot FROM FILES ');
  qry_Tot.SQL.Add('WHERE (Branch = :Br)');
  qry_Tot.SQL.Add('AND (Department = :Dpt)');
  qry_Tot.SQL.Add('AND (FileType = :FT)');
  qry_Tot.SQL.Add('AND ((IssueStatus = ''IN'')OR(IssueStatus = ''MIN''))');
  qry_Tot.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Tot.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Tot.Parameters.ParamByName('FT').Value := qry_Get_Br_Dpt_FT.FieldbyName('FileType').asString;
  qry_Tot.Open;
  RTot := RTot + qry_Tot.FieldbyName('RTOT').asInteger;
  lbl_RAmount.Caption := CurrtoStrF(qry_Tot.FieldbyName('RTOT').asInteger, ffNumber, 0);

  qry_Tot.Close;
  qry_Tot.SQL.Clear;
  qry_Tot.SQL.Add('SELECT COUNT(*) CTot FROM CONTAINERS ');
  qry_Tot.SQL.Add('WHERE (Branch = :Br)');
  qry_Tot.SQL.Add('AND (Department = :Dpt)');
  qry_Tot.SQL.Add('AND (FileType = :FT)');
  qry_Tot.SQL.Add('AND ((IssueStatus = ''IN'')OR(IssueStatus = ''MIN''))');
  qry_Tot.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Tot.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Tot.Parameters.ParamByName('FT').Value := qry_Get_Br_Dpt_FT.FieldbyName('FileType').asString;
  qry_Tot.Open;
  CTot := CTot + qry_Tot.FieldbyName('CTOT').asInteger;
  lbl_CAmount.Caption := CurrtoStrF(qry_Tot.FieldbyName('CTOT').asInteger, ffNumber, 0);
end;

procedure Trep_RecContinSys.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  RTot := 0;
  CTot := 0;
end;

procedure Trep_RecContinSys.lbl_CTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(CTot);
end;

procedure Trep_RecContinSys.lbl_RTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(RTot);
end;

end.
