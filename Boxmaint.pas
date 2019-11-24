unit Boxmaint;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, TabNotBk, DB, DBTables,
  GetComp, GetDept, Mask, ComCtrls, DBCtrls;

type
  Tfrm_BoxMaintenance = class(TForm)
    btn_Close: TBitBtn;
    pnl_Top: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editSFileArea: TDBLookupComboBox;
    Label2: TLabel;
    editSLocation: TDBLookupComboBox;
    lst_Source: TListBox;
    btn_FetchSource: TBitBtn;
    btn_ClearSource: TBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    editDFileArea: TDBLookupComboBox;
    editDLocation: TDBLookupComboBox;
    lst_Dest: TListBox;
    BitBtn2: TBitBtn;
    dts_SFilingArea: TDataSource;
    tbl_SFArea: TTable;
    dts_SourceLocation: TDataSource;
    tbl_SLocation: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BoxMaintenance: Tfrm_BoxMaintenance;

implementation

uses main;


{$R *.DFM}

procedure Tfrm_BoxMaintenance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbl_SFArea.Active := false;
  tbl_SLocation.Active := false;
  frm_Console.itm_Tools_BoxMaintenance.Enabled := True;
  Action := caFree;
end;


procedure Tfrm_BoxMaintenance.FormCreate(Sender: TObject);
begin
  Top := 0;
  Left := 0;
  Height := 330;
  Width := 475;
  ShowHint := frm_Console.bShowHints;
  tbl_SFArea.Active := true;
  tbl_SLocation.Active := true;
end;

end.
