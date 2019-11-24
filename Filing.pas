//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit Filing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, ADODB, StdCtrls, ComCtrls, framPutAwayFileItem,
  framPutFilesintoContainer, framPutAwayContainers, framViewLocationFilesItems,
  framViewLocationContainers, framItemAuditLoc, framAuditLocFiles,
  framAuditLocItems, framMoveLocations;

type
  Tfrm_Filing = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    qry_DefLocLen: TADOQuery;
    fram_PutFilesintoContainer1: Tfram_PutFilesintoContainer;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    fram_ViewLocationFilesItems1: Tfram_ViewLocationFilesItems;
    fram_ViewLocationContainers1: Tfram_ViewLocationContainers;
    fram_PutAwayFileItem1: Tfram_PutAwayFileItem;
    fram_PutAwayContainers1: Tfram_PutAwayContainers;
    fram_AuditLocItems1: Tfram_AuditLocItems;
    fram_AuditLocFiles1: Tfram_AuditLocFiles;
    TabSheet8: TTabSheet;
    fram_MoveLocations1: Tfram_MoveLocations;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Filing: Tfrm_Filing;

implementation

uses main;

{$R *.dfm}

procedure Tfrm_Filing.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Filing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_DefLocLen.Close;
  frm_Console.act_Filing.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Filing.FormCreate(Sender: TObject);
Var
  Flag3D   :Boolean;
  LocView  :Boolean;
begin
  qry_DefLocLen.Close;
  qry_DefLocLen.SQL.Text := 'SELECT DefLocLen FROM Company WHERE CompanyCode = :CD';
  qry_DefLocLen.Parameters.ParamByName('CD').Value := CompsCode;
  qry_DefLocLen.Open;
  fram_PutAwayFileItem1.cb_LocSize.ItemIndex := qry_DefLocLen.Fields[0].asInteger;
  fram_AuditLocFiles1.cb_LocSize.ItemIndex := qry_DefLocLen.Fields[0].asInteger;
  qry_DefLocLen.Close;
//---
  Flag3D := frm_Console.AccessRight(39);
  LocView := frm_Console.AccessRight(27);
  Tabsheet2.TabVisible := Flag3D;
  Tabsheet5.TabVisible := Flag3D;
//  Tabsheet3.TabVisible := LocView;
  Tabsheet4.TabVisible := Flag3D;
//  Tabsheet6.TabVisible := LocView;
 // Tabsheet7.TabVisible := LocView;
end;

procedure Tfrm_Filing.FormResize(Sender: TObject);
begin
  fram_ViewLocationFilesItems1.pnl_ViewLocFiles.Height := Round(Tabsheet3.Height/2);
end;

end.
