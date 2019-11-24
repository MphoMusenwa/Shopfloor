//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit DataModReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ADODB;

type
  TDatModReq = class(TDataModule)
    qry_Items: TADOQuery;
    dts_Pickd: TDataSource;
    qry_NotFiled: TADOQuery;
    dts_Items: TDataSource;
    dts_NotFiled: TDataSource;
    dts_Files: TDataSource;
    dts_Pick: TDataSource;
    dts_Container: TDataSource;
    qry_Container: TADOQuery;
    qry_FilesMain: TADOQuery;
    Qry_Files: TADOQuery;
    qry_Gen: TADOQuery;
    qry_UpdLocation2: TADOQuery;
    qry_Pick: TADOQuery;
    qry_UpdContainer: TADOQuery;
    qry_GenIns: TADOQuery;
    qry_VerContContents: TADOQuery;
    qry_SetFilesOffSite: TADOQuery;
    qry_PickTx_No: TIntegerField;
    qry_PickRequester: TStringField;
    qry_PickDeliver: TStringField;
    qry_PickTxDate: TDateTimeField;
    qry_PickUserId: TStringField;
    qry_PickType: TStringField;
    qry_PickTypeDesc: TStringField;
    qry_PickUpdated: TSmallintField;
    qry_PickStatus: TStringField;
    qry_PickBranch: TStringField;
    qry_PickDepartment: TStringField;
    qry_PickBranch_Name: TStringField;
    qry_PickDept_Name: TStringField;
    qry_PickPrinted: TBooleanField;
    qry_PickDeliveryAddress: TStringField;
    qry_PickDeliveryNotePrinted: TBooleanField;
    qry_PickdItemNo: TAutoIncField;
    qry_PickdBarcode: TStringField;
    qry_PickdTx_No: TIntegerField;
    qry_PickdWareHouse: TStringField;
    qry_PickdRow: TStringField;
    qry_PickdLevelNum: TIntegerField;
    qry_PickdBay: TIntegerField;
    qry_PickdLocNo: TStringField;
    qry_PickdRecordNo: TIntegerField;
    qry_PickdMatched: TIntegerField;
    qry_PickdItemNumber: TStringField;
    qry_PickdFilingMethod: TStringField;
    qry_PickdTrType: TStringField;
    qry_PickdContainer: TStringField;
    qry_Pickd:  TADOQuery;
    qry_PickCostCentre: TStringField;
    qry_PickInternalDept: TStringField;
    qry_PickSLA: TStringField;
    qry_PickSLAn: TIntegerField;
    qry_PickPrintedDescr: TStringField;
    qry_PickdMatchedDescr: TStringField;
    qry_PickComments: TStringField;
    qry_CheckLoc: TADOQuery;
    qry_CheckFile: TADOQuery;
    procedure qry_PickCalcFields(DataSet: TDataSet);
    procedure qry_PickAfterScroll(DataSet: TDataSet);
    procedure qry_PickAfterOpen(DataSet: TDataSet);
    procedure qry_PickdCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ShowOnlyUnmatched   :Boolean;
  end;

var
  DatModReq: TDatModReq;

implementation

uses Retrievals,Main,MetrofilerDataModule;

{$R *.DFM}

procedure TDatModReq.qry_PickCalcFields(DataSet: TDataSet);
begin
  If Dataset.FieldbyName('Printed').AsBoolean Then
    Dataset['PrintedDescr'] := 'Yes'
  else Dataset['PrintedDescr'] := 'No';
end;

procedure TDatModReq.qry_PickdCalcFields(DataSet: TDataSet);
begin
  If Dataset.FieldbyName('Matched').AsInteger = 0 Then Dataset['MatchedDescr'] := 'Un-Matched'
  else If Dataset.FieldbyName('Matched').AsInteger = 1 Then Dataset['MatchedDescr'] := 'Found'
  else If Dataset.FieldbyName('Matched').AsInteger = 2 Then Dataset['MatchedDescr'] := 'Delivered'
  else If Dataset.FieldbyName('Matched').AsInteger = 3 Then Dataset['MatchedDescr'] := 'Not Found';
end;

procedure TDatModReq.qry_PickAfterScroll(DataSet: TDataSet);
begin
  qry_Pickd.Close;
  If ShowOnlyUnmatched Then
    qry_Pickd.SQL.Text := 'SELECT * FROM Pickd WHERE Tx_No = :Tx_No AND Matched = 0 ORDER BY Tx_No,WareHouse,Row,Bay,LevelNum,container,barcode,itemnumber'
  else qry_Pickd.SQL.Text := 'SELECT * FROM Pickd WHERE Tx_No = :Tx_No ORDER BY Tx_No,WareHouse,Row,Bay,LevelNum,container,barcode,itemnumber';
  qry_Pickd.Parameters.ParamByName('Tx_No').Value := Dataset.FieldbyName('TX_NO').AsInteger;
  qry_Pickd.Open;
end;

procedure TDatModReq.qry_PickAfterOpen(DataSet: TDataSet);
begin
 If Dataset.IsEmpty Then
   qry_Pickd.Close;
end;

end.
