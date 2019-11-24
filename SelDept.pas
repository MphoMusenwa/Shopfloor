//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelDept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelDept = class(TForm)
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
    function Execute(Branch, UserId   :String):Integer;
    function OpenDbOnly(Branch, UserId   :String):Integer;
  end;

var
  frm_SelDept: Tfrm_SelDept;

implementation

Uses Main, MetrofilerDatamodule;

{$R *.DFM}


function Tfrm_SelDept.Execute(Branch, UserId   :String):Integer;
begin
  qry_Dept.Close;
  qry_Dept.Parameters.ParamValues['Branch'] := Branch;
  qry_Dept.Parameters.ParamValues['UserId'] := UserId;
  dm_Metrofiler.ExecuteCached(qry_Dept, EncodeTime(1,0,0,0));

  Result := Showmodal;
end;

function Tfrm_SelDept.OpenDbOnly(Branch, UserId   :String):Integer;
begin
  qry_Dept.Close;
  qry_Dept.Parameters.ParamValues['Branch'] := Branch;
  qry_Dept.Parameters.ParamValues['UserId'] := UserId;
  dm_Metrofiler.ExecuteCached(qry_Dept, EncodeTime(1,0,0,0));
end;

procedure Tfrm_SelDept.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Branch Code to find', 'Branch Code:', Code) then
    If not qry_Dept.Locate('Department',Code,[]) Then
      ShowMessage('Department not found!!');
end;

procedure Tfrm_SelDept.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Branch Name to find', 'Branch Name:', Name) then
    If not qry_Dept.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Department not found!!');
end;

procedure Tfrm_SelDept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelDept.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelDept.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
