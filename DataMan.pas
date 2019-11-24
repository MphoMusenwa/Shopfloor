unit DataMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, ToolWin,
  framDataManagerERecords, framDataManager;

type
  Tfrm_DataMan = class(TForm)
    Panel3: TPanel;
    btn_Close: TSpeedButton;
    fram_DataManager1: Tfram_DataManager;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DataMan: Tfrm_DataMan;

implementation

uses main;

{$R *.dfm}

procedure Tfrm_DataMan.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DataMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fram_DataManager1.DoFrameDestroy;
  frm_Console.act_DataManager.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_DataMan.FormCreate(Sender: TObject);
begin
  fram_DataManager1.DoFrameCreate;
end;

end.
