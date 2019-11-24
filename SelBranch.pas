//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelBranch = class(TForm)
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
    function Execute(UserId   :String):Integer;
    function OpenDbOnly(UserId   :String):Integer;
  end;

var
  frm_SelBranch: Tfrm_SelBranch;

implementation

Uses Main, MetrofilerDataModule;

{$R *.DFM}


function Tfrm_SelBranch.Execute(UserId   :String):Integer;
begin
  qry_Branch.Close;
  qry_Branch.Parameters.ParamValues['UserId'] := UserId;
  dm_Metrofiler.ExecuteCached(qry_Branch, EncodeTime(1,0,0,0));

  Result := Showmodal;
end;

function Tfrm_SelBranch.OpenDbOnly(UserId   :String):Integer;
begin
  qry_Branch.Close;
  qry_Branch.Parameters.ParamValues['UserId'] := UserId;
  dm_Metrofiler.ExecuteCached(qry_Branch, EncodeTime(1,0,0,0));
end;

procedure Tfrm_SelBranch.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Branch Code to find', 'Branch Code:', Code) then
    If not qry_Branch.Locate('Branch',Code,[]) Then
      ShowMessage('Branch not found!!');
end;

procedure Tfrm_SelBranch.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Branch Name to find', 'Branch Name:', Name) then
    If not qry_Branch.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Branch not found!!');
end;

procedure Tfrm_SelBranch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelBranch.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelBranch.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
