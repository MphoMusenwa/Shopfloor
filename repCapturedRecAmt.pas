//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repCapturedRecAmt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_CapturedRecAmt = class(TForm)
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
    lbl_RAmount: TQRLabel;
    QRShape4: TQRShape;
    QRBand9: TQRBand;
    QRLabel33: TQRLabel;
    lbl_RTotal: TQRLabel;
    lbl_Range: TQRLabel;
    qry_Get_Br_Dpt_FT: TADOQuery;
    qry_Records: TADOQuery;
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure lbl_RTotalPrint(sender: TObject; var Value: String);
    procedure lbl_RangePrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    FromD, ToD  :TDateTime;
    Tot         :Integer;
  end;

var
  rep_CapturedRecAmt: Trep_CapturedRecAmt;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_CapturedRecAmt.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT COUNT(*) RTot FROM FILES');
  qry_Records.SQL.Add('WHERE (Branch = :Br)');
  qry_Records.SQL.Add('AND (Department = :Dpt)');
  qry_Records.SQL.Add('AND (EntryDate >= :FR)');
  qry_Records.SQL.Add('AND (EntryDate <= :TO)');
  qry_Records.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Records.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Records.Parameters.ParamByName('FR').Value := FromD;
  qry_Records.Parameters.ParamByName('TO').Value := ToD;
  qry_Records.Open;
  Tot := Tot + qry_Records.FieldbyName('RTOT').asInteger;
  lbl_RAmount.Caption := CurrtoStrF(qry_Records.FieldbyName('RTOT').asInteger, ffNumber, 0);
end;

procedure Trep_CapturedRecAmt.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Tot := 0;
end;

procedure Trep_CapturedRecAmt.lbl_RTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(Tot);
end;

procedure Trep_CapturedRecAmt.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

end.
