//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repCapturedContAmt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_CapturedContAmt = class(TForm)
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
  rep_CapturedContAmt: Trep_CapturedContAmt;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_CapturedContAmt.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_Containers.Close;
  qry_Containers.SQL.Clear;
  qry_Containers.SQL.Add('SELECT COUNT(*) CTot FROM CONTAINERS');
  qry_Containers.SQL.Add('WHERE (Branch = :Br)');
  qry_Containers.SQL.Add('AND (Department = :Dpt)');
  qry_Containers.SQL.Add('AND (EntryDate >= :FR)');
  qry_Containers.SQL.Add('AND (EntryDate <= :TO)');
  qry_Containers.Parameters.ParamByName('BR').Value := qry_Get_Br_Dpt_FT.FieldbyName('BrCode').asString;
  qry_Containers.Parameters.ParamByName('DPT').Value := qry_Get_Br_Dpt_FT.FieldbyName('DptCode').asString;
  qry_Containers.Parameters.ParamByName('FR').Value := FromD;
  qry_Containers.Parameters.ParamByName('TO').Value := ToD;
  qry_Containers.Open;
  Tot := Tot + qry_Containers.FieldbyName('CTOT').asInteger;
  lbl_CAmount.Caption := CurrtoStrF(qry_Containers.FieldbyName('CTOT').asInteger, ffNumber, 0);
end;

procedure Trep_CapturedContAmt.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Tot := 0;
end;

procedure Trep_CapturedContAmt.lbl_CTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := InttoStr(Tot);
end;

procedure Trep_CapturedContAmt.lbl_RangePrint(sender: TObject;
  var Value: String);
begin
  Value := 'From: '+DatetoStr(FromD)+' to '+DatetoStr(ToD);
end;

end.
