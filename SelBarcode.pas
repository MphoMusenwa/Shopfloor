//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelBarcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ExtCtrls, DBCtrls,
  Grids, DBGrids, ADODB;

type
  Tfrm_SelBarcode = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_BarCode: TADOQuery;
    dts_Branch: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    procedure qry_BarCodeBeforeOpen(DataSet: TDataSet);
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
    Branch    :String;
    Department :String;
  end;

var
  frm_SelBarcode: Tfrm_SelBarcode;

implementation

Uses Main, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_SelBarcode.qry_BarCodeBeforeOpen(DataSet: TDataSet);
begin

  qry_Barcode.Parameters.ParamByName('mBranch').Value := Branch;
  qry_Barcode.Parameters.ParamByName('mDept').Value := Department;
end;

procedure Tfrm_SelBarcode.btn_SearchCodeClick(Sender: TObject);
Var
  Code   :String;
begin
  if InputQuery('Enter Branch Code to find', 'Branch Code:', Code) then
    If not qry_Barcode.Locate('Branch',Code,[]) Then
      ShowMessage('Branch not found!!');
end;

procedure Tfrm_SelBarcode.Button1Click(Sender: TObject);
Var
  Name   :String;
begin
  if InputQuery('Enter File to find', 'File:', Name) then
    If not qry_Barcode.Locate('FileNumber',Name,[loCaseInsensitive, loPartialKey]) Then
      ShowMessage('File not found!!');
end;

procedure Tfrm_SelBarcode.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

procedure Tfrm_SelBarcode.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_SelBarcode.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
