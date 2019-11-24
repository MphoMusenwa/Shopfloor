//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelAuthCodeRts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelAuthCodesRts = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_AuthCodes: TADOQuery;
    dts_AuthCodes: TDataSource;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_SearchCode: TButton;
    grd_AuthCodesRts: TDBGrid;
    procedure btn_SearchCodeClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelAuthCodesRts: Tfrm_SelAuthCodesRts;

implementation

Uses Main, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_SelAuthCodesRts.btn_SearchCodeClick(Sender: TObject);
Var
  UserID   :String;
begin
  if InputQuery('Enter UserID to find', 'UserID:', UserID) then
    If not qry_AuthCodes.Locate('UserID',UserID,[]) Then
      ShowMessage('UserID not found!!');
end;

procedure Tfrm_SelAuthCodesRts.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelAuthCodesRts.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelAuthCodesRts.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
