unit IndexDefinitionsMatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  Tfrm_IndexDefsMatch = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    nav: TDBNavigator;
    grd_Match: TDBGrid;
    qryIndexDefsMatch: TADOQuery;
    qry_SQL: TADOQuery;
    dtsIndexDefsMatch: TDataSource;
    procedure btn_CloseClick(Sender: TObject);
    procedure qryIndexDefsMatchAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    mRecordType   :String;
  public
    { Public declarations }
    function Execute(RecordType :String):Integer;
  end;

var
  frm_IndexDefsMatch: Tfrm_IndexDefsMatch;

implementation

uses Main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_IndexDefsMatch.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function Tfrm_IndexDefsMatch.Execute(RecordType :String):Integer;
var
  J         :Integer;
begin
  mRecordType := RecordType;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :DS');
  qry_SQL.Parameters.ParamByName('DS').Value := mRecordType;
  qry_SQL.Open;

  if qry_SQL.IsEmpty then
    begin
      Messagedlg('RecordType '+QuotedStr(mRecordType)+' not found!', mtInformation, [mbOK], 0);
      qry_SQL.close;
      exit;
    end;

  qryIndexDefsMatch.Close;
  qryIndexDefsMatch.SQL.Clear;
  qryIndexDefsMatch.SQL.Add('SELECT Description AS [RecordType]');

  For J := 1 to 10 Do
    begin
      If trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
        qryIndexDefsMatch.SQL.Add(' ,Text'+InttoStr(J)+' AS ['+trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString)+']');
    end;

  For J := 1 to 3 Do
    begin
      If trim(qry_SQL.FieldByName('Col'+InttoStr(J+10)).AsString) <> '' Then
        qryIndexDefsMatch.SQL.Add(' ,Date'+InttoStr(J)+' AS ['+trim(qry_SQL.FieldByName('Col'+InttoStr(J+10)).AsString)+']');
    end;

  For J := 1 to 2 Do
    begin
      If trim(qry_SQL.FieldByName('Col'+InttoStr(J+13)).AsString) <> '' Then
        qryIndexDefsMatch.SQL.Add(' ,Number'+InttoStr(J)+' AS ['+trim(qry_SQL.FieldByName('Col'+InttoStr(J+13)).AsString)+']');
    end;

  qryIndexDefsMatch.SQL.Add('FROM IndexDefsMatch');
  qryIndexDefsMatch.SQL.Add('WHERE Description = :DS');
  qryIndexDefsMatch.Parameters.ParamValues['DS'] := mRecordType;

  Screen.Cursor := CrHourglass;
  try
    grd_Match.Columns.Clear;
    qryIndexDefsMatch.Open;
    Application.ProcessMessages;
    FRM_cONSOLE.AutoSizeNewColumns(grd_Match);
  finally
    Screen.Cursor := CrDefault;
  end;

  qryIndexDefsMatch.FieldByName('RecordType').ReadOnly := True;

  Result := ShowModal;

  qryIndexDefsMatch.Close;
end;

procedure Tfrm_IndexDefsMatch.qryIndexDefsMatchAfterInsert(DataSet: TDataSet);
begin
  qryIndexDefsMatch.FieldByName('RecordType').ReadOnly := False;
  qryIndexDefsMatch['RecordType'] := mRecordType;
  qryIndexDefsMatch.FieldByName('RecordType').ReadOnly := True;

end;

end.
