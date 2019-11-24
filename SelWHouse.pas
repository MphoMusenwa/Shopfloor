//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelWHouse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelWhouse = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_WHouse: TADOQuery;
    dts_Dept: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_SearchCode: TButton;
    Button1: TButton;
    procedure qry_WHouseBeforeOpen(DataSet: TDataSet);
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
    Access  :String;
    Flag3D  :Smallint;
  end;

var
  frm_SelWhouse: Tfrm_SelWhouse;

implementation

USES MetrofilerDatamodule, main;

{$R *.DFM}

procedure Tfrm_SelWhouse.qry_WHouseBeforeOpen(DataSet: TDataSet);
begin
  If (frm_Console.AccessSysAdmin) or (Access = '') Then
    begin
      qry_WHouse.Close;
      qry_WHouse.SQL.Clear;
      qry_WHouse.SQL.Add('SELECT');
      qry_WHouse.SQL.Add('    w.Warehouse, w.Name, w.D3Flag');
      qry_WHouse.SQL.Add('FROM');
      qry_WHouse.SQL.Add('    Whouse w');
      If Flag3D <> -1 Then
        qry_WHouse.SQL.Add('WHERE w.D3Flag = :D3Flag');

      qry_WHouse.SQL.Add('ORDER BY');
      qry_WHouse.SQL.Add('    w.Name');

      If Flag3D <> -1 Then
        qry_WHouse.Parameters.ParamValues['D3Flag'] := Flag3D;
    end
  else If Access <> '' Then
    begin
      qry_WHouse.Close;
      qry_WHouse.SQL.Clear;
      qry_WHouse.SQL.Add('SELECT');
      qry_WHouse.SQL.Add('	w.Warehouse,');
      qry_WHouse.SQL.Add('	w.Name,');
      qry_WHouse.SQL.Add('	w.D3Flag');
      qry_WHouse.SQL.Add('FROM');
      qry_WHouse.SQL.Add('	Whouse w');
      qry_WHouse.SQL.Add('WHERE');
      If Flag3D <> -1 Then
        qry_WHouse.SQL.Add('    w.D3Flag = :D3Flag AND');
      qry_WHouse.SQL.Add('	(');
      qry_WHouse.SQL.Add('');
      qry_WHouse.SQL.Add('(w.Warehouse IN (SELECT a.Code FROM LAuthRts a WHERE a.UserId = :ID1))');
      qry_WHouse.SQL.Add('OR');
      qry_WHouse.SQL.Add('(w.Warehouse IN (SELECT a.Code FROM LAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = :ID2))');
      qry_WHouse.SQL.Add(')');
      qry_WHouse.SQL.Add('ORDER BY');
      qry_WHouse.SQL.Add('    w.Name');

      qry_WHouse.Parameters.ParamValues['ID1'] := Access;
      qry_WHouse.Parameters.ParamValues['ID2'] := Access;
      If Flag3D <> -1 Then
        qry_WHouse.Parameters.ParamValues['D3Flag'] := Flag3D;
    end;
end;

procedure Tfrm_SelWhouse.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Filing Area Code to find', 'Filing Area Code:', Code) then
    If not qry_WHouse.Locate('Warehouse',Code,[]) Then
      ShowMessage('Filing Area not found!!');
end;

procedure Tfrm_SelWhouse.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Filing Area Name to find', 'Filing Area Name:', Name) then
    If not qry_WHouse.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Filing Area not found!!');
end;

procedure Tfrm_SelWhouse.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelWhouse.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelWhouse.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
