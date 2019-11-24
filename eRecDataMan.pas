unit eRecDataMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, ToolWin,
  framDataManagerERecords;

type
  Tfrm_eRecDataMan = class(TForm)
    fram_eRecDataManager1: Tfram_eRecDataManager;
    Panel3: TPanel;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_eRecDataMan: Tfrm_eRecDataMan;

implementation

uses main;

{$R *.dfm}

procedure Tfrm_eRecDataMan.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_eRecDataMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fram_eRecDataManager1.DoFrameDestroy;
  Action := caFree;
end;

procedure Tfrm_eRecDataMan.FormCreate(Sender: TObject);
begin
  fram_eRecDataManager1.DoFrameCreate;
  If frm_Console.feRecords <> Nil Then
    frm_Console.feRecords.btn_eRecordDataManager.Enabled := True;
  If frm_Console.fePending <> Nil Then
    frm_Console.fePending.btn_eRecordDataManager.Enabled := True;
end;

end.
