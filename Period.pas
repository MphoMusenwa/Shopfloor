//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Period;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls,
  Buttons, ADODB, ComCtrls, DateUtils;

type
  Tfrm_Period = class(TForm)
    db_Period: TDBEdit;
    db_StartDate: TDBEdit;
    Label1: TLabel;
    db_EndDate: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    tbl_Period: TADOTable;
    dts_Period: TDataSource;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    FileNavigator: TDBNavigator;
    dt_From: TDateTimePicker;
    dt_To: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure dt_FromChange(Sender: TObject);
    procedure dt_ToChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Period: Tfrm_Period;

implementation

{$R *.DFM}

uses main, MetrofilerDatamodule;

procedure Tfrm_Period.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbl_Period.Close;
  frm_Console.act_Periods.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Period.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  tbl_Period.Open;
  dt_From.DateTime := Now;
  dt_To.DateTime := Now;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Period.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Period.dt_FromChange(Sender: TObject);
begin
  tbl_Period.edit;
  tbl_Period.FieldByName('START_DATE').AsDateTime := StartoftheDay(dt_From.date);
end;

procedure Tfrm_Period.dt_ToChange(Sender: TObject);
begin
  tbl_Period.edit;
  tbl_Period.FieldByName('END_DATE').AsDateTime := StartoftheDay(dt_To.date);
end;

end.
