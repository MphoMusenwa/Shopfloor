unit Deliveryl;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_MBill = class(TForm)
    btn_ReqReturn: TBitBtn;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MBill: Tfrm_MBill;

implementation

uses main;

{$R *.DFM}
procedure Tfrm_MBill.FormCreate(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := 467;
  Height:= 250;
end;

procedure Tfrm_MBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
  frm_Console.btn_Requisitions.Enabled := true;
end;



procedure Tfrm_MBill.btn_ReqReturnClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_MBill.BitBtn2Click(Sender: TObject);
begin
MessageDlg('Error System Is Off-Line',mtError,[mbOK],0);
end;

end.
