//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelRType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelRType = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_RType: TADOQuery;
    dts_Dept: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_GenSrch: TBitBtn;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btn_GenSrchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsGen         :Boolean;
    function Execute(ShowGen :Boolean; Branch, Department, UserId :String; ShowContainers, ShowFiles, ShowItems, ShoweRecords, ShowCOOL :Boolean):Integer;
    function OpenDbOnly(Branch, Department, UserId :String; ShowContainers, ShowFiles, ShowItems, ShoweRecords, ShowCOOL :Boolean):Integer;
  end;

var
  frm_SelRType: Tfrm_SelRType;

implementation

Uses Main, MetrofilerDatamodule;

{$R *.DFM}

function Tfrm_SelRType.OpenDbOnly(Branch, Department, UserId :String; ShowContainers, ShowFiles, ShowItems, ShoweRecords, ShowCOOL :Boolean):Integer;
begin
  qry_RType.Close;
  qry_RType.Parameters.ParamValues['Branch'] := Branch;
  qry_RType.Parameters.ParamValues['Department'] := Department;
  qry_RType.Parameters.ParamValues['UserId'] := UserId;
  qry_RType.Parameters.ParamValues['ShowContainers'] := ShowContainers;
  qry_RType.Parameters.ParamValues['ShowFiles'] := ShowFiles;
  qry_RType.Parameters.ParamValues['ShowItems'] := ShowItems;
  qry_RType.Parameters.ParamValues['ShoweRecords'] := ShoweRecords;
  qry_RType.Parameters.ParamValues['ShowCOOL'] := ShowCOOL;
  dm_Metrofiler.ExecuteCached(qry_RType, EncodeTime(1,0,0,0));
end;


function Tfrm_SelRType.Execute(ShowGen :Boolean; Branch, Department, UserId :String; ShowContainers, ShowFiles, ShowItems, ShoweRecords, ShowCOOL :Boolean):Integer;
begin
  btn_GenSrch.Enabled := ShowGen;
  IsGen := False;

  qry_RType.Close;
  qry_RType.Parameters.ParamValues['Branch'] := Branch;
  qry_RType.Parameters.ParamValues['Department'] := Department;
  qry_RType.Parameters.ParamValues['UserId'] := UserId;
  qry_RType.Parameters.ParamValues['ShowContainers'] := ShowContainers;
  qry_RType.Parameters.ParamValues['ShowFiles'] := ShowFiles;
  qry_RType.Parameters.ParamValues['ShowItems'] := ShowItems;
  qry_RType.Parameters.ParamValues['ShoweRecords'] := ShoweRecords;
  qry_RType.Parameters.ParamValues['ShowCOOL'] := ShowCOOL;
  dm_Metrofiler.ExecuteCached(qry_RType, EncodeTime(1,0,0,0));

  Result := ShowModal;
end;

procedure Tfrm_SelRType.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Record Type to find', 'Record Type:', Name) then
    If not qry_RType.Locate('Description',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Record Type not found!!');
end;

procedure Tfrm_SelRType.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelRType.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelRType.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelRType.btn_GenSrchClick(Sender: TObject);
begin
  IsGen := True;
  ModalResult := mrOK;
end;

end.
