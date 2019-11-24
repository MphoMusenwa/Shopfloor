//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ContType;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ExtCtrls, Buttons,
  Grids, DBGrids, ADODB;

type
  Tfrm_ContTypes = class(TForm)
    btn_Close: TSpeedButton;
    dts_ContType: TDataSource;
    edt_BoxType: TDBEdit;
    edt_Depth: TDBEdit;
    edt_Vertical: TDBEdit;
    edt_Width: TDBEdit;
    grp_BoxType: TGroupBox;
    grp_Details: TGroupBox;
    lbl_BoxType: TLabel;
    lbl_Comments: TLabel;
    lbl_Depth: TLabel;
    lbl_Horizontal: TLabel;
    lbl_Vertical: TLabel;
    mem_Comments: TDBMemo;
    nav_BoxTypes: TDBNavigator;
    pnl_Top: TPanel;
    tbl_ContType: TADOTable;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ContTypes: Tfrm_ContTypes;

implementation

{$R *.DFM}

uses Main, MetrofilerDatamodule;


procedure Tfrm_ContTypes.FormCreate(Sender: TObject);
  begin
    tbl_ContType.Open;
  end;

procedure Tfrm_ContTypes.btn_CloseClick(Sender: TObject);
  begin
    Close;
  end;

procedure Tfrm_ContTypes.FormClose(Sender: TObject; var Action: TCloseAction);
  var
    mrResult : TModalResult;
  begin
    if tbl_ContType.State in [dsEdit, dsInsert] then
      begin
        mrResult := MessageDlg('Save the changes to the current Box Type?',
                              mtConfirmation,
                              [mbYes, mbNo, mbAbort], 0);
        case mrResult of
          mrYes   : tbl_ContType.Post;
          mrNo    : tbl_ContType.Cancel;
          mrAbort : Exit;
        end;
      end;
    tbl_ContType.Close;
    frm_Console.act_ContainerTypes.Enabled := True;
    Action := caFree;
  end;


end.
  