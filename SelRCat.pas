//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelRCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelRCat = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_RCat: TADOQuery;
    dts_Dept: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    btn_GenSrch: TBitBtn;
    ToolButton4: TToolButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_GenSrchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ShowGen   :Boolean;
    IsGen     :Boolean;
    BAccess :String;
    DAccess :String;
    UserId  :String;
    Flag3D  :smallint;
  end;

var
  frm_SelRCat: Tfrm_SelRCat;

implementation

Uses Main, MetrofilerDatamodule;

{$R *.DFM}

procedure Tfrm_SelRCat.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Record Category to find', 'Record Category:', Name) then
    If not qry_RCat.Locate('RecORDCAT',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Record Category not found!!');
end;

procedure Tfrm_SelRCat.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelRCat.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelRCat.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelRCat.FormShow(Sender: TObject);
begin
  btn_GenSrch.Enabled := ShowGen;
  IsGen := False;
end;

procedure Tfrm_SelRCat.btn_GenSrchClick(Sender: TObject);
begin
  IsGen := True;
  ModalResult := mrOK;
end;

end.
