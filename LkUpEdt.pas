unit Lkupedt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, DBCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_LookupEdit = class(TForm)
    Panel1: TPanel;
    button_Close: TBitBtn;
    DBEditor: TDBNavigator;
    tblLookupText: TTable;
    dsLookupText: TDataSource;
    dbgrid_LookupText: TDBGrid;
    procedure button_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEditorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_LookupEdit: Tfrm_LookupEdit;

implementation

{$R *.DFM}

uses Main;

procedure Tfrm_LookupEdit.button_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LookupEdit.FormCreate(Sender: TObject);
begin
  tblLookupText.Active := true;
end;

procedure Tfrm_LookupEdit.DBEditorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
{  with DBEditor do
  case Button of
    nbInsert  : VisibleButtons := [nbPost, nbCancel];
    {nbDelete  : VisibleButtons := [nbPost, nbCancel];}
    {nbEdit    : VisibleButtons := [nbPost, nbCancel];
    nbPost    : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                   nbInsert, nbDelete, nbEdit, nbRefresh];
    nbCancel  : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                   nbInsert, nbDelete, nbEdit, nbRefresh];
  end;}

end;

end.
