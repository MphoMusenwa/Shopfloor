unit BulkCaptureReCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons,
  ComCtrls, ToolWin;

type
  Tfrm_BulkCaptureReclassify = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    qry_Classify: TADOQuery;
    dts_Classify: TDataSource;
    procedure btn_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(UserId, Branch, Department, RecordType, RecordCat   :String):Integer;
  end;

var
  frm_BulkCaptureReclassify: Tfrm_BulkCaptureReclassify;

implementation

uses MetrofilerDataModule;

{$R *.dfm}

function Tfrm_BulkCaptureReclassify.Execute(UserId, Branch, Department, RecordType, RecordCat   :String):Integer;
begin
  qry_Classify.Close;
  dm_Metrofiler.ExecuteCached(qry_Classify, EncodeTime(1,0,0,0));

  If Recordcat = '' Then
    qry_Classify.Locate('Branch;Department;RecordType', VarArrayOf([Branch, Department, RecordType]), [])
  else
    qry_Classify.Locate('Branch;Department;RecordType;RecordCat', VarArrayOf([Branch, Department, RecordType, RecordCat]), []);

  Result := Showmodal;
end;

procedure Tfrm_BulkCaptureReclassify.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_BulkCaptureReclassify.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_BulkCaptureReclassify.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    ModalResult := mrOK;
end;

end.
