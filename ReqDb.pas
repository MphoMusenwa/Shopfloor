unit ReqDb;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons;

type
  Tfrm_Requester = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditName: TDBEdit;
    Label2: TLabel;
    EditTelephone: TDBEdit;
    Label3: TLabel;
    EditFax: TDBEdit;
    Label4: TLabel;
    EditAddr: TDBEdit;
    EditAddr2: TDBEdit;
    EditAddr3: TDBEdit;
    EditAddr4: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    dts_Requester: TDataSource;
    Panel2: TPanel;
    edt_Name: TDBLookupComboBox;
    Label8: TLabel;
    btn_ReqReturn: TBitBtn;
    editAddr5: TDBEdit;
    tbl_Requester: TTable;
    Label5: TLabel;
    editMobile: TDBEdit;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
   private
    { private declarations }
  public
    { public declarations }
  end;

var
  frm_Requester: Tfrm_Requester;

implementation

{$R *.DFM}
uses main;

procedure Tfrm_Requester.FormCreate(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := 467;
  Height:= 250;
  tbl_Requester.Open;
end;
procedure Tfrm_Requester.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
  frm_Console.itm_Tools_Requester.Enabled := true;
end;
procedure Tfrm_Requester.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.
