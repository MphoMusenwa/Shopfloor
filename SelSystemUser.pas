//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelSystemUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelSystemUser = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_AuthCodes: TADOQuery;
    dts_AuthCodes: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    btn_SearchUserID: TButton;
    Button1: TButton;
    procedure btn_SearchUserIDClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  frm_SelSystemUser: Tfrm_SelSystemUser;

implementation

Uses Main, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_SelSystemUser.btn_SearchUserIDClick(Sender: TObject);
Var
  UserID   :String;
begin
  if InputQuery('Enter UserID to find', 'UserID:', UserID) then
    If not qry_AuthCodes.Locate('UserID',UserID,[]) Then
      ShowMessage('UserID not found!!');
end;

procedure Tfrm_SelSystemUser.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter Name to find', 'Name:', Name) then
    If not qry_AuthCodes.Locate('Name',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('Name not found!!');
end;

procedure Tfrm_SelSystemUser.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelSystemUser.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelSystemUser.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
