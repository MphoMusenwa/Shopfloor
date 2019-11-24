//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repRetRecAmt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_RetRecAmt = class(TForm)
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
    lbl_Range: TQRLabel;
    qry_Get_Br_Dpt_FT: TADOQuery;
    qry_Records: TADOQuery;
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure lbl_CTotalPrint(sender: TObject; var Value: String);
    procedure lbl_RangePrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    FromD, ToD  :TDateTime;
    Tot         :Integer;
  end;

var
  rep_RetRecAmt: Trep_RetRecAmt;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_RetRecAmt.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT COUNT(*) CTot FROM FILES a, TRANSA b');
  qry_Records.SQL.Add('WHERE (a.Filenumber = b.Filenumber)');
  qry_Records.SQL.Add('AND (a.Branch = :Br)');
  qry_Records.SQL.Add('AND (a.Department = :Dpt)');
  qry_Records.SQL.Add('AND (b.Transaction_Type = ''FW'')');
  qry_Records.SQL.Add('AND (b.TDate >= :FR)');
  qry_Records.SQL.Add('AND (b.TDate <= :TO)');

  qry_Records.Parameters.ParambyName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Records.Parameters.ParambyName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Records.Parameters.ParambyName('FR').Value := FromD;
  qry_Records.Parameters.ParambyName('TO').Value := ToD;
  qry_Records.Open;
  Tot := Tot + qry_Records.FieldbyName('CTOT').asInteger;
  lbl_CAmount.Caption := CurrtoStrF(qry_Records.FieldbyName('CTOT').asInteger, ffNumber, 0);
end;

procedure Trep_RetRecAmt.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Tot := 0;
end;

procedure Trep_RetRecAmt.lbl_CTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(Tot);
end;

procedure Trep_RetRecAmt.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

end.
