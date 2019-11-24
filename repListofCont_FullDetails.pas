//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repListofCont_FullDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB;

type
  Trep_ListContFullDet = class(TForm)
    report: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    lbl_BranchH: TQRLabel;
    QRLabel3: TQRLabel;
    qry_BranchDept: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qry_Containers: TADOQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    procedure qry_BranchDeptAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_ListContFullDet: Trep_ListContFullDet;

implementation

Uses
  MetrofilerDataModule;

{$R *.DFM}

procedure Trep_ListContFullDet.qry_BranchDeptAfterScroll(
  DataSet: TDataSet);
begin
  qry_Containers.Close;
  qry_Containers.SQL.Clear;
  qry_Containers.SQL.Add('SELECT Container, Destruct, EntryDate, Text1, Text2, Text3, Text4 FROM Containers');
  qry_Containers.SQL.Add('WHERE (Branch = :BR)and(Department = :DPT)');
  qry_Containers.Parameters.ParamByName('BR').Value := Dataset.FieldbyName('BRANCH').asString;
  qry_Containers.Parameters.ParamByName('DPT').Value := Dataset.FieldbyName('DEPARTMENT').asString;
  qry_Containers.Open;
end;

end.
