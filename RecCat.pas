//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
{
eRecords Development
17042006:
It is assumed that Security is implented at a User level for record
categories, ie Branch Security access is not implemented. I have
Coded all the necessary tables and functionality in case it becomes a requirement
but the 2nd tab is disabled
}
//============================================================\\
unit RecCat;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, Mask, Tabnotbk, ADODB;

type
  Tfrm_RecCat = class(TForm)
    dts_FileType: TDataSource;
    qry_RecCat: TADOQuery;
    pnl_Top: TPanel;
    FileNavigator: TDBNavigator;
    grd_RecCat: TDBGrid;
    btn_Close: TSpeedButton;
    btn_Access: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure dts_FileTypeStateChange(Sender: TObject);
    procedure btn_AccessClick(Sender: TObject);
    procedure grd_RecCatTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RecCat: Tfrm_RecCat;

implementation

uses main, SelBranch, MetrofilerDataModule,
  RecCatLookup, AccessRecordCat;

{$R *.DFM}
procedure Tfrm_RecCat.FormCreate(Sender: TObject);
begin
  qry_RecCat.Close;
  qry_RecCat.SQL.Clear;
  qry_RecCat.SQL.Add('SELECT * FROM RecordCat ORDER BY [RecCatType]');
  qry_RecCat.Open;
  btn_Access.Visible := frm_Console.AccessSysAdmin;
end;

procedure Tfrm_RecCat.grd_RecCatTitleClick(Column: TColumn);
Var
  ColName    :String;
begin
  ColName := Column.Field.FieldName;
  qry_RecCat.Close;
  qry_RecCat.SQL.Clear;
  qry_RecCat.SQL.Add('SELECT * FROM RecordCat ORDER BY ['+ColName+']');
  qry_RecCat.Open;
end;

procedure Tfrm_RecCat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_Metrofiler.ClearCache;
  qry_RecCat.Close;
  frm_Console.act_RecordCat.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_RecCat.btn_ReqReturnClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_RecCat.btn_AccessClick(Sender: TObject);
begin
  frm_AccessRecordCat.Execute(qry_RecCat.FieldbyName('RecCatType').asString);
end;

procedure Tfrm_RecCat.dts_FileTypeStateChange(Sender: TObject);
begin
  If (not(qry_RecCat.IsEmpty))AND(not(qry_RecCat.State in dsEditModes)) Then
    begin
      btn_Access.Enabled := true;
    end
  else
    begin
      btn_Access.Enabled := false;
    end;
end;

procedure Tfrm_RecCat.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.




