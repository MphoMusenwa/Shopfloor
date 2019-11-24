unit framViewLocationContainers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tfram_ViewLocationContainers = class(TFrame)
    Panel9: TPanel;
    Label2: TLabel;
    Label27: TLabel;
    lbl_ViewLocWH3D: TLabel;
    Label43: TLabel;
    Label55: TLabel;
    btn_ViewLoc3D: TBitBtn;
    edt_ViewLocWH3D: TEdit;
    btn_ViewLocWH3D: TButton;
    edt_ViewRow3D: TEdit;
    edt_ViewBay3D: TEdit;
    edt_ViewLev3D: TEdit;
    Panel10: TPanel;
    Label31: TLabel;
    edt_ViewLocContainerCount: TEdit;
    DBGrid4: TDBGrid;
    qry_SQL: TADOQuery;
    dts_BrowseContainers: TDataSource;
    qry_BrowseContainers: TADOQuery;
    procedure edt_ViewLocWH3DKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ViewLocWH3DClick(Sender: TObject);
    procedure btn_ViewLoc3DClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SelWHouse, MetrofilerDataModule, Main;

{$R *.dfm}

procedure Tfram_ViewLocationContainers.btn_ViewLoc3DClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
//-----------Records-----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT COUNT(*)');
  qry_SQL.SQL.Add('FROM');
  qry_SQL.SQL.Add('  Containers c');
  qry_SQL.SQL.Add('  INNER JOIN Location l ON c.Container = l.Boxnumber');
  qry_SQL.SQL.Add('WHERE');
  qry_SQL.SQL.Add('  l.warehouse = '+QuotedStr(edt_ViewLocWH3D.Text));
  If trim(edt_ViewRow3D.Text) <> '' Then
    qry_SQL.SQL.Add('  AND l.Rownum = '+QuotedStr(edt_ViewRow3D.Text));
  If trim(edt_ViewBay3D.Text) <> '' Then
    qry_SQL.SQL.Add('  AND l.Bay = '+InttoStr(StrtoInt(edt_ViewBay3D.Text)));
  If trim(edt_ViewLev3D.Text) <> '' Then
    qry_SQL.SQL.Add('  AND l.LevelNum = '+InttoStr(StrtoInt(edt_ViewLev3D.Text)));
  qry_SQL.SQL.Add('  AND c.Code = '+QuotedStr(CompsCode));
  qry_SQL.SQL.Add('  AND l.Used = ''Y''');
  qry_SQL.Open;
  edt_ViewLocContainerCount.Text := InttoStr(qry_SQL.Fields[0].asInteger);
  qry_SQL.Close;
//----------
  qry_BrowseContainers.Close;
  qry_BrowseContainers.SQL.Clear;
  qry_BrowseContainers.SQL.Add('SELECT c.Container, l.Warehouse, l.LocNo, l.Position_x, l.Position_y, l.Position_z, c.IssueStatus');
  qry_BrowseContainers.SQL.Add('FROM');
  qry_BrowseContainers.SQL.Add('  Containers c');
  qry_BrowseContainers.SQL.Add('  INNER JOIN Location l ON c.Container = l.Boxnumber');
  qry_BrowseContainers.SQL.Add('WHERE');
  qry_BrowseContainers.SQL.Add('  l.warehouse = '+QuotedStr(edt_ViewLocWH3D.Text));
  If trim(edt_ViewRow3D.Text) <> '' Then
    qry_BrowseContainers.SQL.Add('  AND l.Rownum = '+QuotedStr(edt_ViewRow3D.Text));
  If trim(edt_ViewBay3D.Text) <> '' Then
    qry_BrowseContainers.SQL.Add('  AND l.Bay = '+InttoStr(StrtoInt(edt_ViewBay3D.Text)));
  If trim(edt_ViewLev3D.Text) <> '' Then
    qry_BrowseContainers.SQL.Add('  AND l.LevelNum = '+InttoStr(StrtoInt(edt_ViewLev3D.Text)));
  qry_BrowseContainers.SQL.Add('  AND c.Code = '+QuotedStr(CompsCode));
  qry_BrowseContainers.SQL.Add('  AND l.Used = ''Y''');
  qry_BrowseContainers.SQL.Add('ORDER BY');
  qry_BrowseContainers.SQL.Add('  l.Warehouse, l.LocNo, l.Position_x, l.Position_y, l.Position_z');
  qry_BrowseContainers.Open;
  Screen.Cursor := crDefault;
end;

procedure Tfram_ViewLocationContainers.btn_ViewLocWH3DClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_ViewLocWH3D.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_ViewLocWH3D.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfram_ViewLocationContainers.edt_ViewLocWH3DKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_ViewLocWH3D.Text := '';
      lbl_ViewLocWH3D.Caption := '---';
    end;
end;

end.


