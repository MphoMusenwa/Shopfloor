//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit IndexDefinitionsSelBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_IndexDefinitionsSelBranch = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_Branch: TADOQuery;
    dts_Branch: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_SearchCode: TButton;
    Button1: TButton;
    procedure qry_BranchBeforeOpen(DataSet: TDataSet);
    procedure btn_SearchCodeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecordType :String;
  end;

var
  frm_IndexDefinitionsSelBranch: Tfrm_IndexDefinitionsSelBranch;

implementation

Uses Main, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_IndexDefinitionsSelBranch.qry_BranchBeforeOpen(DataSet: TDataSet);
begin
  qry_Branch.Close;
  qry_Branch.SQL.Clear;
  qry_Branch.SQL.Add('SELECT DISTINCT');
  qry_Branch.SQL.Add('	b.Branch,');
  qry_Branch.SQL.Add('	b.Name');
  qry_Branch.SQL.Add('FROM');
  qry_Branch.SQL.Add('	Branches b');
  qry_Branch.SQL.Add('	INNER JOIN IndexAuthRts a ON b.Branch = a.Branch');
  qry_Branch.SQL.Add('WHERE');
  qry_Branch.SQL.Add('	a.Description = :RecordType');
  qry_Branch.Parameters.ParamByName('RecordType').Value := RecordType;
end;

procedure Tfrm_IndexDefinitionsSelBranch.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Branch Code to find', 'Branch Code:', Code) then
    If not qry_Branch.Locate('Branch',Code,[]) Then
      ShowMessage('Branch not found!!');
end;

procedure Tfrm_IndexDefinitionsSelBranch.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Branch Name to find', 'Branch Name:', Name) then
    If not qry_Branch.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Branch not found!!');
end;

procedure Tfrm_IndexDefinitionsSelBranch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_IndexDefinitionsSelBranch.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_IndexDefinitionsSelBranch.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
