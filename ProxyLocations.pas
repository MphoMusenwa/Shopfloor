//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ProxyLocations;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, Mask, ADODB, ToolWin;

type
  Tfrm_ProxyLocactions = class(TForm)
    dts_ProxyLoc: TDataSource;
    DBGrid1: TDBGrid;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    nav_BoxTypes: TDBNavigator;
    qry_ProxyLoc: TADOQuery;
    btn_Access: TSpeedButton;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure dts_ProxyLocStateChange(Sender: TObject);
    procedure qry_ProxyLocAfterInsert(DataSet: TDataSet);
    procedure btn_AccessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ProxyLocactions: Tfrm_ProxyLocactions;

implementation

uses main, MetrofilerDatamodule, AccessProxyLoc;

{$R *.DFM}
procedure Tfrm_ProxyLocactions.FormCreate(Sender: TObject);
begin
  qry_ProxyLoc.Open;
end;

procedure Tfrm_ProxyLocactions.qry_ProxyLocAfterInsert(DataSet: TDataSet);
begin
  Dataset['LocationId'] := dm_Metrofiler.CreateGuid;
end;

procedure Tfrm_ProxyLocactions.btn_AccessClick(Sender: TObject);
begin
  frm_AccessProxyLoc.Execute(qry_ProxyLoc.FieldByName('LocationId').AsString);
end;

procedure Tfrm_ProxyLocactions.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ProxyLocactions.dts_ProxyLocStateChange(Sender: TObject);
begin
  If not qry_ProxyLoc.IsEmpty Then
    begin
      btn_Access.Enabled := not(qry_ProxyLoc.State in dsEditModes);
    end;
end;

procedure Tfrm_ProxyLocactions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_ProxyLoc.Close;
  frm_Console.act_ProxyLoc.Enabled := true;
  Action := caFree;
end;



end.
