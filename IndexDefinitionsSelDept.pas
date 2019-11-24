//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit IndexDefinitionsSelDept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_IndexDefinitionsSelDept = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_Dept: TADOQuery;
    dts_Dept: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_SearchCode: TButton;
    Button1: TButton;
    procedure qry_DeptBeforeOpen(DataSet: TDataSet);
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
    RecordType  :String;
    Branch :String;
  end;

var
  frm_IndexDefinitionsSelDept: Tfrm_IndexDefinitionsSelDept;

implementation

Uses Main, MetrofilerDatamodule;

{$R *.DFM}

procedure Tfrm_IndexDefinitionsSelDept.qry_DeptBeforeOpen(DataSet: TDataSet);
begin
  qry_Dept.Close;
  qry_Dept.SQL.Clear;
  qry_Dept.SQL.Add('SELECT');
  qry_Dept.SQL.Add('	d.Department,');
  qry_Dept.SQL.Add('	d.Name');
  qry_Dept.SQL.Add('FROM');
  qry_Dept.SQL.Add('	Departments d');
  qry_Dept.SQL.Add('	INNER JOIN Branches b ON d.Branch = b.Branch');
  qry_Dept.SQL.Add('	INNER JOIN IndexAuthRts a ON d.Branch = a.Branch AND d.Department = a.Department');
  qry_Dept.SQL.Add('WHERE');
  qry_Dept.SQL.Add('	a.Description = :RecordType AND');
  qry_Dept.SQL.Add('	d.Branch = :Branch');
  qry_Dept.Parameters.ParamByName('RecordType').Value := RecordType;
  qry_Dept.Parameters.ParamByName('Branch').Value := Branch;
end;

procedure Tfrm_IndexDefinitionsSelDept.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Branch Code to find', 'Branch Code:', Code) then
    If not qry_Dept.Locate('Department',Code,[]) Then
      ShowMessage('Department not found!!');
end;

procedure Tfrm_IndexDefinitionsSelDept.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Branch Name to find', 'Branch Name:', Name) then
    If not qry_Dept.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Department not found!!');
end;

procedure Tfrm_IndexDefinitionsSelDept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_IndexDefinitionsSelDept.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_IndexDefinitionsSelDept.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
