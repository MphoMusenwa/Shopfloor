unit MetReq;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids;

type
  Tfrm_MetReq = class(TForm)
    Label1: TLabel;
    dpt_codes: TComboBox;
    Label2: TLabel;
    wrhouse: TComboBox;
    edt_rqstr: TDBComboBox;
    dts_Requester: TDataSource;
    Table1: TTable;
    Label3: TLabel;
    btn_Box: TBitBtn;
    BitBtn1: TBitBtn;
    TreeView1: TTreeView;
    btn_ReqReturn: TBitBtn;
    TreeView2: TTreeView;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label6: TLabel;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btn_ReqReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MetReq: Tfrm_MetReq;

implementation

uses main;

{$R *.DFM}
procedure Tfrm_MetReq.FormCreate(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := 467;
  Height:= 250;
end;

procedure Tfrm_MetReq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
//  frm_Console.btn_Remote.Enabled := true;

// exit;
end;

procedure Tfrm_MetReq.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
mname :string;
begin
if Source is TTreeView then
        Begin
        mname := Treeview1.Selected.Text;
        Treeview1.Items.Add(Treeview1.Selected,Treeview1.Selected.Text);
        ShowMessage(mname + ' has been moved');
        end;
end;



procedure Tfrm_MetReq.TreeView2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
mname :string;
begin
if Source is TTreeView then
        Begin
        mname := Treeview1.Selected.Text;
        TreeView2.Items.Add(TreeView2.Selected,Treeview1.Selected.Text);
//        TreeView2.Items.Add(Treeview1.Selected,'Frank');
        ShowMessage(mname + ' has been moved');
        end;
end;




procedure Tfrm_MetReq.btn_ReqReturnClick(Sender: TObject);
begin
Close;
end;

end.
