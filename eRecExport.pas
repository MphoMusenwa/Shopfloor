unit eRecExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, ADODB, DirDlg;

type
  Tfrm_eRecExport = class(TForm)
    Panel3: TPanel;
    btn_Close: TSpeedButton;
    Panel8: TPanel;
    Label10: TLabel;
    Label18: TLabel;
    cb_BulkImportNo: TComboBox;
    btn_ExportBulkImport: TButton;
    Splitter3: TSplitter;
    Panel10: TPanel;
    Label21: TLabel;
    DBGrid1: TDBGrid;
    qry_BulkData: TADOQuery;
    DTS_BulkData: TDataSource;
    qry_SQL: TADOQuery;
    btn_SelectBulkImport: TButton;
    qry_Export: TADOQuery;
    qry_GetImage: TADOQuery;
    qry_IndexDefs: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_BulkImportNoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SelectBulkImportClick(Sender: TObject);
    procedure btn_ExportBulkImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_eRecExport: Tfrm_eRecExport;

implementation

uses main, MetrofilerDataModule, Progress;

{$R *.dfm}

procedure Tfrm_eRecExport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_eRecExport.btn_ExportBulkImportClick(Sender: TObject);
var
  s             :String;
  RecordType    :String;
  J             :Integer;
  DocName       :String;
  TrxNo         :Integer;
  TempFilename  :String;
  T             :TextFile;
  Line          :String;
  R, RTot       :Integer;
begin
  If not SelectDirectory('Select location where the Images will be exported.',s,'',s) Then
    exit;
  If copy(s, length(s), 1) <> '\' Then
    s := s + '\';
//-------------
  Screen.Cursor := crHourglass;
  frm_Progress.Show;
  try
    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Text := 'SELECT TOP 1 RecordType FROM eRecords WHERE ImportBatchNo = :ImportBatchNo';
    qry_Export.Parameters.ParamValues['ImportBatchNo'] := StrtoInt(cb_BulkImportNo.Text);
    qry_Export.Open;
    RecordType := qry_Export.FieldbyName('RecordType').asString;

    qry_IndexDefs.Close;
    qry_IndexDefs.SQL.Clear;
    qry_IndexDefs.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :Description');
    qry_IndexDefs.Parameters.ParamValues['Description'] := RecordType;
    qry_IndexDefs.Open;

    If qry_IndexDefs.IsEmpty Then
      begin
        Messagedlg('RecordType '+RecordType+' not found.', mtInformation, [mbOK], 0);
        exit;
      end;

    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Add('SELECT ');
    qry_Export.SQL.Add('	i.DocName,');
    qry_Export.SQL.Add('	e.Branch, ');
    qry_Export.SQL.Add('	e.Department,');
    qry_Export.SQL.Add('	e.RecordType,');
    qry_Export.SQL.Add('	e.RecordCat,');
    For J := 1 to 15 Do
      begin
        If trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
          begin
            If J <= 10 Then
              qry_Export.SQL.Add('	e.Text'+InttoStr(J)+' AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
            else if J <= 13 then
              qry_Export.SQL.Add('	CONVERT(varchar, e.Date'+InttoStr(J-10)+', 103) AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
            else if J <= 15 then
              qry_Export.SQL.Add('	e.Number'+InttoStr(J-13)+' AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
          end;
      end;
    qry_Export.SQL.Add('	i.TrxNo');
    qry_Export.SQL.Add('FROM ');
    qry_Export.SQL.Add('	eRecords e');
    qry_Export.SQL.Add('	INNER JOIN eREcordImages i ON e.eRecNo = i.eRecNo');
    qry_Export.SQL.Add('WHERE');
    qry_Export.SQL.Add('  ImportBatchNo = :ImportBatchNo');
    qry_Export.Parameters.ParamValues['ImportBatchNo'] := StrtoInt(cb_BulkImportNo.Text);
    qry_Export.Open;

    AssignFile(T, S + cb_BulkImportNo.Text+'.txt');
    Rewrite(T);
    try
      Line := qry_Export.Fields[0].FieldName;
      For J := 1 to qry_Export.Fields.Count-2 Do
        Line := Line + ','+qry_Export.Fields[J].FieldName;
      Writeln(T, Line);
      qry_Export.First;
      R := 0;
      RTot := qry_Export.RecordCount;
      While not qry_Export.EOF do
        begin
          Inc(R);
          frm_Progress.Prog(Round(((R)/RTot)*100));
          If frm_Progress.Cancelled Then
            break;
          Application.ProcessMessages;
  //----------------------------------------------------------
          TrxNo := qry_Export.FieldByName('TrxNo').AsInteger;
          DocName := qry_Export.FieldByName('DocName').AsString;
  //------------------Save Image------------------------------
          TempFilename := dm_Metrofiler.ReadERecFromRepositry('Export', TrxNo);
          MoveFile(PChar(TempFilename), PChar(s + DocName));
  //------------------Gen Index-------------------------------
          Line := qry_Export.Fields[0].asString;
          For J := 1 to qry_Export.Fields.Count-2 Do
            Line := Line + ','+qry_Export.Fields[J].asString;

          Writeln(T, Line);
  //----------------------------------------------------------
          qry_Export.Next;
        end;
      ShowMessage('Done Exporting.');
    finally
      CloseFile(T);
    end;
  finally
    frm_Progress.Hide;
    Screen.Cursor := crDefault;
    qry_Export.Close;
    qry_IndexDefs.Close;
  end;
end;

procedure Tfrm_eRecExport.btn_SelectBulkImportClick(Sender: TObject);
Var
  RecordType    :String;
  J             :Integer;
begin
  Screen.Cursor := crHourglass;
  qry_BulkData.Close;
  qry_BulkData.SQL.Clear;
  qry_BulkData.SQL.Text := 'SELECT TOP 1 RecordType FROM eRecords WHERE ImportBatchNo = :ImportBatchNo';
  qry_BulkData.Parameters.ParamValues['ImportBatchNo'] := StrtoInt(cb_BulkImportNo.Text);
  qry_BulkData.Open;
  RecordType := qry_BulkData.FieldbyName('RecordType').asString;

  qry_IndexDefs.Close;
  qry_IndexDefs.SQL.Clear;
  qry_IndexDefs.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :Description');
  qry_IndexDefs.Parameters.ParamValues['Description'] := RecordType;
  qry_IndexDefs.Open;

  If qry_IndexDefs.IsEmpty Then
    begin
      Messagedlg('RecordType '+RecordType+' not found.', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_BulkData.Close;
  qry_BulkData.SQL.Clear;
  qry_BulkData.SQL.Add('SELECT ');
  qry_BulkData.SQL.Add('	i.DocName,');
  qry_BulkData.SQL.Add('	e.Branch, ');
  qry_BulkData.SQL.Add('	e.Department,');
  qry_BulkData.SQL.Add('	e.RecordType,');
  qry_BulkData.SQL.Add('	e.RecordCat,');
  For J := 1 to 15 Do
    begin
      If trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
        begin
          If J <= 10 Then
            qry_BulkData.SQL.Add('	e.Text'+InttoStr(J)+' AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
          else if J <= 13 then
            qry_BulkData.SQL.Add('	CONVERT(varchar, e.Date'+InttoStr(J-10)+', 103) AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
          else if J <= 15 then
            qry_BulkData.SQL.Add('	e.Number'+InttoStr(J-13)+' AS ['+trim(qry_IndexDefs.FieldByName('Col'+InttoStr(J)).AsString)+'],')
        end;
    end;
  qry_BulkData.SQL.Add('	i.TrxNo');
  qry_BulkData.SQL.Add('FROM ');
  qry_BulkData.SQL.Add('	eRecords e');
  qry_BulkData.SQL.Add('	INNER JOIN eREcordImages i ON e.eRecNo = i.eRecNo');
  qry_BulkData.SQL.Add('WHERE');
  qry_BulkData.SQL.Add('  ImportBatchNo = :ImportBatchNo');
  qry_BulkData.Parameters.ParamValues['ImportBatchNo'] := StrtoInt(cb_BulkImportNo.Text);
  qry_BulkData.Open;
  frm_Console.AutoSizeNewColumns(DBGrid1);
  Screen.Cursor := crDefault;
end;

procedure Tfrm_eRecExport.cb_BulkImportNoChange(Sender: TObject);
begin
  btn_SelectBulkImport.Enabled := cb_BulkImportNo.Text <> '';
  btn_ExportBulkImport.Enabled := cb_BulkImportNo.Text <> '';
end;

procedure Tfrm_eRecExport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_SQL.Close;
  qry_BulkData.Close;
  qry_Export.Close;
  qry_Export.Close;
  frm_Console.act_BulkExport.Enabled := True;
  action := caFree;
end;

procedure Tfrm_eRecExport.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo AS [BatchNo] FROM eRecords WHERE ImportBatchNo IS NOT NULL ORDER BY ImportBatchNo DESC');
  qry_SQL.Open;
  qry_SQL.First;
  cb_BulkImportNo.Items.Clear;
  While not qry_SQL.EOF Do
    begin
      cb_BulkImportNo.Items.Append(InttoStr(qry_SQL.Fields[0].asInteger));
      qry_SQL.Next;
    end;
  qry_SQL.Close;
  Screen.Cursor := crDefault;
end;

end.
