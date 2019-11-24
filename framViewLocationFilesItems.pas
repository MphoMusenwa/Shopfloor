unit framViewLocationFilesItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  Tfram_ViewLocationFilesItems = class(TFrame)
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    lbl_RWHouseViewRec: TLabel;
    editLoc: TEdit;
    btn_GenQry: TBitBtn;
    edt_RWHouseViewRec: TEdit;
    Button2: TButton;
    pnl_ViewLocFiles: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label6: TLabel;
    editRecordsFound: TEdit;
    Splitter2: TSplitter;
    pnl_ViewLocItems: TPanel;
    Panel3: TPanel;
    Label78: TLabel;
    editItemsFound: TEdit;
    DBGrid3: TDBGrid;
    dts_BrowseItems: TDataSource;
    qry_BrowseItems: TADOQuery;
    qry_BrowseFiles: TADOQuery;
    dts_BrowseFiles: TDataSource;
    qry_SQL: TADOQuery;
    procedure edt_RWHouseViewRecChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_GenQryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SelWHouse, Main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfram_ViewLocationFilesItems.btn_GenQryClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
//-----------Records-----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT COUNT(*) FROM files');
  qry_SQL.SQL.Add('WHERE warehouse = '+QuotedStr(edt_RWHouseViewRec.Text));
  qry_SQL.SQL.Add('AND LocNo = '+QuotedStr(editLoc.Text));
  qry_SQL.SQL.Add('AND Code = '+QuotedStr(CompsCode));
  qry_SQL.SQL.Add('AND IssueStatus IN (''IN'', ''REQ'', ''MIN'')');
  qry_SQL.Open;
  editRecordsFound.Text := InttoStr(qry_SQL.Fields[0].asInteger);
//----------
  qry_BrowseFiles.Close;
  qry_BrowseFiles.SQL.Clear;
  qry_BrowseFiles.SQL.Add('SELECT * FROM files');
  qry_BrowseFiles.SQL.Add('WHERE warehouse = '+QuotedStr(edt_RWHouseViewRec.Text));
  qry_BrowseFiles.SQL.Add('AND LocNo = '+QuotedStr(editLoc.Text));
  qry_BrowseFiles.SQL.Add('AND Code = '+QuotedStr(CompsCode));
  qry_BrowseFiles.SQL.Add('AND IssueStatus IN (''IN'', ''REQ'', ''MIN'')');
  qry_BrowseFiles.SQL.Add('ORDER BY Recordno');
  qry_BrowseFiles.Open;
//-----------Items-----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT COUNT(*) FROM Items');
  qry_SQL.SQL.Add('WHERE warehouse = '+QuotedStr(edt_RWHouseViewRec.Text));
  qry_SQL.SQL.Add('AND LocNo = '+QuotedStr(editLoc.Text));
  qry_SQL.SQL.Add('AND Status IN (''L'', ''RQ'')');
  qry_SQL.Open;
  editItemsFound.Text := InttoStr(qry_SQL.Fields[0].asInteger);
  qry_SQL.Close;
//-----------
  qry_BrowseItems.Close;
  qry_BrowseItems.SQL.Clear;
  qry_BrowseItems.SQL.Add('SELECT * FROM Items');
  qry_BrowseItems.SQL.Add('WHERE warehouse = '+QuotedStr(edt_RWHouseViewRec.Text));
  qry_BrowseItems.SQL.Add('AND LocNo = '+QuotedStr(editLoc.Text));
  qry_BrowseItems.SQL.Add('AND Status IN (''L'', ''RQ'')');
  qry_BrowseItems.SQL.Add('ORDER BY Recordno');
  qry_BrowseItems.Open;
  Screen.Cursor := crDefault;
end;

procedure Tfram_ViewLocationFilesItems.Button2Click(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_RWHouseViewRec.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_RWHouseViewRec.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfram_ViewLocationFilesItems.edt_RWHouseViewRecChange(Sender: TObject);
begin
  editLoc.Text := '';
end;

end.
