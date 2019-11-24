//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repDesContAmt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_DesContAmt = class(TForm)
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
    qry_Containers: TADOQuery;
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
  rep_DesContAmt: Trep_DesContAmt;

implementation

Uses
  MetrofilerDataModule;


{$R *.DFM}

procedure Trep_DesContAmt.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_Containers.Close;
  qry_Containers.SQL.Clear;
  qry_Containers.SQL.Add('SELECT COUNT(*) CTot FROM CONTAINERS a, TRANSA b');
  qry_Containers.SQL.Add('WHERE (a.Container = b.Container)');
  qry_Containers.SQL.Add('AND (a.Branch = :Br)');
  qry_Containers.SQL.Add('AND (a.Department = :Dpt)');
  qry_Containers.SQL.Add('AND (b.Transaction_Type = ''CDS'')');
  qry_Containers.SQL.Add('AND (b.TDate >= :FR)');
  qry_Containers.SQL.Add('AND (b.TDate <= :TO)');

  qry_Containers.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Containers.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Containers.Parameters.ParamByName('FR').Value := FromD;
  qry_Containers.Parameters.ParamByName('TO').Value := ToD;
  qry_Containers.Open;
  Tot := Tot + qry_Containers.FieldbyName('CTOT').asInteger;
  lbl_CAmount.Caption := CurrtoStrF(qry_Containers.FieldbyName('CTOT').asInteger, ffNumber, 0);
end;

procedure Trep_DesContAmt.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Tot := 0;
end;

procedure Trep_DesContAmt.lbl_CTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(Tot);
end;

procedure Trep_DesContAmt.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

end.
