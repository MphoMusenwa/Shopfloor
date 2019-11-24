unit Getbox;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Buttons, ExtCtrls;

type
  Tfrm_BoxesList = class(TForm)
    pnl_Big: TPanel;
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    qry_Box: TQuery;
    dts_Boxes: TDataSource;
    grd_Boxes: TDBGrid;
    lbl_BoxNo: TLabel;
    edt_BoxNumber: TEdit;
    qry_Offline: TQuery;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure dts_BoxesDataChange(Sender: TObject; Field: TField);
    procedure edt_BoxNumberChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sBoxNumber : String;
    function Execute ( Company, Department : String ) : TModalResult;
  end;

var
  frm_BoxesList: Tfrm_BoxesList;

implementation

{$R *.DFM}

uses main;

function Tfrm_BoxesList.Execute ( Company, Department : String ) : TModalResult;
begin
  qry_Box.Active := false;
  qry_Offline.Active := false;
{  if frm_Console.bOffline then
  begin
    dts_Boxes.Dataset := qry_Offline;
    qry_Offline.ParamByName('Code').AsString := Company;
    qry_Offline.ParamByName('Dept').AsString := Department;
    qry_Offline.Active := true;
  end else
  }
//  begin
    dts_Boxes.Dataset := qry_Box;
    qry_Box.ParamByName('Code').AsString := Company;
    qry_Box.ParamByName('Dept').AsString := Department;
    qry_Box.Active := true;
//  end;

  Execute := ShowModal;
end;


procedure Tfrm_BoxesList.btn_OKClick(Sender: TObject);
begin
  if length(sBoxNumber) = 0 then
    ModalResult := mrNone
  else
    qry_Box.Active := false;
end;

procedure Tfrm_BoxesList.btn_CancelClick(Sender: TObject);
begin
  qry_Box.Active := false;
end;

procedure Tfrm_BoxesList.dts_BoxesDataChange(Sender: TObject; Field: TField);
begin
//  if frm_Console.bOffline then
//    sBoxNumber := qry_Offline.FieldByName('BoxNumber').AsString
//  else
    sBoxNumber := qry_Box.FieldByName('BoxNumber').AsString;
  edt_BoxNumber.Text := sBoxNumber;
end;

procedure Tfrm_BoxesList.edt_BoxNumberChange(Sender: TObject);
begin
  sBoxNumber := edt_BoxNumber.Text;
end;

end.
