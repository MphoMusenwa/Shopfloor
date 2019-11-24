unit Trantype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBCtrls, Mask, DB, DBTables, Buttons, ExtCtrls;

type
  Tfrm_TranTypes = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TBitBtn;
    nav_TranTypes: TDBNavigator;
    lbl_TranType: TLabel;
    lbl_ChargeCode: TLabel;
    lbl_Descr: TLabel;
    tbl_TransType: TTable;
    ds_TranType: TDataSource;
    edt_TranType: TDBEdit;
    edt_ChargeCode: TDBEdit;
    mem_Description: TDBMemo;
    qry_Trans: TQuery;
    cmb_Trans: TComboBox;
    pnl_Charge: TPanel;
    chk_Charge: TDBCheckBox;
    chk_Order: TDBCheckBox;
    lbl_Status: TLabel;
    lbl_To: TLabel;
    lbl_From: TLabel;
    edt_StatusFrom: TDBEdit;
    edt_StatusTo: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nav_TranTypesClick(Sender: TObject; Button: TNavigateBtn);
    procedure cmb_TransChange(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshList;
  public
    { Public declarations }
  end;

var
  frm_TranTypes: Tfrm_TranTypes;

implementation

{$R *.DFM}

uses Main;

procedure Tfrm_TranTypes.RefreshList;
begin
  qry_Trans.Active := true;
  cmb_Trans.Items.Clear;
  while not( qry_Trans.EOF) do
  begin
    cmb_Trans.Items.Add( qry_Trans.Fields[0].AsString );
    qry_Trans.Next;
  end;
  qry_Trans.Active := false;
end;

procedure Tfrm_TranTypes.FormCreate(Sender: TObject);
begin
  tbl_TransType.Active := true;
  Top   := 0;
  Left  := 0;
  Width := 467;
  Height:= 250;
  RefreshList;
end;

procedure Tfrm_TranTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbl_TransType.Active := false;
  frm_Console.itm_Tools_TransactionTypes.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_TranTypes.nav_TranTypesClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  with nav_TranTypes do
  case Button of
    nbInsert  : VisibleButtons := [nbPost, nbCancel];
    {nbDelete  : VisibleButtons := [nbPost, nbCancel];}
    nbEdit    : VisibleButtons := [nbPost, nbCancel];
    nbPost    : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                   nbInsert, nbDelete, nbEdit, nbRefresh];
    nbCancel  : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                   nbInsert, nbDelete, nbEdit, nbRefresh];
  end;

  if Button = nbPost then RefreshList;

end;

procedure Tfrm_TranTypes.cmb_TransChange(Sender: TObject);
begin
  with tbl_TransType  do
  begin
    EditKey;
    FieldByName('TranType').AsString := cmb_Trans.Items[ cmb_Trans.ItemIndex ];
    GotoKey;
  end;
end;

end.
