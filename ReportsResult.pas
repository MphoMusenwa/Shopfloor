unit ReportsResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  Tfrm_ReportResult = class(TForm)
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    sp_Report: TADOStoredProc;
    dts_Report: TDataSource;
    DBGrid1: TDBGrid;
    btn_ExportExcel: TSpeedButton;
    lbl_RowsReturned: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_ExportExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ReportResult: Tfrm_ReportResult;

implementation

{$R *.dfm}

Uses Main, MetrofilerDataModule, Progress;

procedure Tfrm_ReportResult.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_ReportResult.btn_ExportExcelClick(Sender: TObject);
begin
  sp_Report.DisableControls;
  TRY
    dm_Metrofiler.ExporttoXLS(sp_Report);
  FINALLY
    sp_Report.EnableControls;
  END;
end;

end.
