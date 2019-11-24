//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
{
eRecords Development
17042006:
It is assumed that Security is implented at a User level for record
categories, ie Branch Security access is not implemented. I have
Coded all the necessary tables and functionality in case it becomes a requirement
but the 2nd tab is disabled
}
//============================================================\\
unit Actions;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, Mask, Tabnotbk, ADODB;

type
  Tfrm_Actions = class(TForm)
    dts_Actions: TDataSource;
    qry_Actions: TADOQuery;
    pnl_Top: TPanel;
    FileNavigator: TDBNavigator;
    grd_RecCat: TDBGrid;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_ID: TDBEdit;
    edt_Name: TDBEdit;
    btn_Close: TSpeedButton;
    Splitter1: TSplitter;
    Label3: TLabel;
    edt_AddedOn: TDBEdit;
    Label4: TLabel;
    edt_AddedBy: TDBEdit;
    cb_ActionType: TDBComboBox;
    Label6: TLabel;
    Label5: TLabel;
    mem_Description: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure qry_ActionsBeforeInsert(DataSet: TDataSet);
    procedure qry_ActionsAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Actions: Tfrm_Actions;

implementation

uses main, MetrofilerDataModule;

{$R *.DFM}
procedure Tfrm_Actions.FormCreate(Sender: TObject);
begin
  qry_Actions.Open;
end;

procedure Tfrm_Actions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_Metrofiler.ClearCache;
  qry_Actions.Close;
  frm_Console.act_Actions.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_Actions.btn_ReqReturnClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_Actions.qry_ActionsAfterInsert(DataSet: TDataSet);
begin
  Dataset['AddedBy'] := User;
  Dataset['AddedOn'] := dm_Metrofiler.GetServTimeNow;
end;

procedure Tfrm_Actions.qry_ActionsBeforeInsert(DataSet: TDataSet);
begin
  edt_Name.SetFocus;
end;

procedure Tfrm_Actions.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.




