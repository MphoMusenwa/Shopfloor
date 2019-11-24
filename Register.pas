unit Register;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ExtCtrls, Buttons;

type
  Tfrm_Register = class(TForm)
    btn_Close: TBitBtn;
    nav_Register: TDBNavigator;
    pnl_Top: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dts_Company: TDataSource;
    tbl_Company: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Register: Tfrm_Register;

implementation

{$R *.DFM}

uses main;



procedure Tfrm_Register.FormCreate(Sender: TObject);
begin
  ShowHint := frm_Console.bShowHints;
  Top := 0;
  Left := 0;
  Height := 280;
  Width := 360;
  Screen.Cursor := crHourglass;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Register.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Register.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
frm_Console.itm_Tools_Register.Enabled := True;
  Action := caFree;
end;

end.
