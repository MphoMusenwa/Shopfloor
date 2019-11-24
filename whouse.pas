//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit whouse;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, Mask, ADODB, ToolWin;

type
  Tfrm_Warehouse = class(TForm)
    grp_Details: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    dts_WHouse: TDataSource;
    DBGrid1: TDBGrid;
    tbl_WHouse: TADOTable;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    nav_BoxTypes: TDBNavigator;
    Splitter3: TSplitter;
    edt_Code: TDBEdit;
    edt_Name: TDBEdit;
    chk_3d: TDBCheckBox;
    btn_Access: TSpeedButton;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbl_WHouseAfterInsert(DataSet: TDataSet);
    procedure btn_CloseClick(Sender: TObject);
    procedure dts_WHouseStateChange(Sender: TObject);
    procedure tbl_WHouseAfterCancel(DataSet: TDataSet);
    procedure btn_AccessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Warehouse: Tfrm_Warehouse;

implementation

uses main, MetrofilerDatamodule, AccessFilingArea;

{$R *.DFM}
procedure Tfrm_Warehouse.FormCreate(Sender: TObject);
begin
  chk_3d.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);
  btn_Access.Visible := frm_Console.AccessSysAdmin;
  tbl_WHouse.Open;
end;

procedure Tfrm_Warehouse.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Warehouse.btn_AccessClick(Sender: TObject);
begin
  frm_AccessFilingArea.Execute(tbl_WHouse.FieldbyName('WAREHOUSE').asString);
end;

procedure Tfrm_Warehouse.dts_WHouseStateChange(Sender: TObject);
begin
  If (not(tbl_WHouse.IsEmpty))AND(not(tbl_WHouse.State in dsEditModes)) Then
    begin
      btn_Access.Enabled := true;
    end
  else
    begin
      btn_Access.Enabled := false;
    end;
end;

procedure Tfrm_Warehouse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbl_WHouse.Close;
  frm_Console.act_Warehouse.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_Warehouse.tbl_WHouseAfterCancel(DataSet: TDataSet);
begin
  If (not(tbl_WHouse.IsEmpty))AND(not(tbl_WHouse.State in dsEditModes)) Then
    begin
      btn_Access.Enabled := true;
    end
  else
    begin
      btn_Access.Enabled := false;
    end;
end;

procedure Tfrm_Warehouse.tbl_WHouseAfterInsert(DataSet: TDataSet);
begin
  Dataset['D3Flag'] := 0;
  edt_Code.SetFocus;
end;

end.
