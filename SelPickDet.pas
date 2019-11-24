unit SelPickDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, ComCtrls,
  ToolWin, DB, DBTables, ADODB;

type
  Tfrm_SelPickDet = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DBGrid1: TDBGrid;
    dts_Search: TDataSource;
    qry_Search: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelPickDet: Tfrm_SelPickDet;

implementation

Uses
  MetrofilerDataModule;

{$R *.dfm}

end.


