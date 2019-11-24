//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Delivery;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, ADODB;

type
  Tfrm_DeliveryType = class(TForm)
    dts_Deliver: TDataSource;
    DBGrid1: TDBGrid;
    qry_Delivery: TADOQuery;
    pnl_Top: TPanel;
    nav: TDBNavigator;
    btn_Close: TSpeedButton;
    qry_SQL: TADOQuery;
    btn_Access: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AccessClick(Sender: TObject);
    procedure qry_DeliveryAfterInsert(DataSet: TDataSet);
    procedure qry_DeliveryBeforePost(DataSet: TDataSet);
//    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DeliveryType: Tfrm_DeliveryType;

implementation

uses main, MetrofilerDataModule, AccessDeliveryType;

{$R *.DFM}

procedure Tfrm_DeliveryType.FormCreate(Sender: TObject);
begin
  qry_Delivery.Open;
end;

procedure Tfrm_DeliveryType.qry_DeliveryAfterInsert(DataSet: TDataSet);
begin
  Dataset['RequisitionType'] := 'Normal Requisition';
  Dataset['SLAMinutes'] := 180;
end;

procedure Tfrm_DeliveryType.qry_DeliveryBeforePost(DataSet: TDataSet);
begin
  If (Dataset.FieldByName('RequisitionType').AsString <> 'Normal Requisition')AND
     (Dataset.FieldByName('RequisitionType').AsString <> 'Destruction')AND
     (Dataset.FieldByName('RequisitionType').AsString <> 'Permanent Withdrawal')AND
     (Dataset.FieldByName('RequisitionType').AsString <> 'Off-Site')Then
    begin
      Messagedlg('Please specify/select a valid Requisition Type.', mtInformation, [mbOK], 0);
      Abort;
    end;
end;

procedure Tfrm_DeliveryType.btn_AccessClick(Sender: TObject);
begin
  frm_AccessDeliveryType.Execute(qry_Delivery.FieldbyName('Description').asString);
end;

procedure Tfrm_DeliveryType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Delivery.Close;
  frm_Console.act_DeliveryTypes.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_DeliveryType.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
