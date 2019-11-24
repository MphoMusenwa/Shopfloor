unit BulkImportPurge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  Tfrm_BulkImportPurge = class(TForm)
    Panel3: TPanel;
    btn_Close: TSpeedButton;
    Panel8: TPanel;
    Label10: TLabel;
    Label18: TLabel;
    cb_BulkImportNo: TComboBox;
    btn_DeleteBulkImport: TButton;
    rgrp_RelatedBulkImport: TRadioGroup;
    btn_SelectBulkImport: TButton;
    Splitter3: TSplitter;
    Panel10: TPanel;
    Label21: TLabel;
    DBGrid1: TDBGrid;
    qry_BulkData: TADOQuery;
    DTS_BulkData: TDataSource;
    qry_SQL: TADOQuery;
    qry_Del: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_BulkImportNoChange(Sender: TObject);
    procedure btn_SelectBulkImportClick(Sender: TObject);
    procedure btn_DeleteBulkImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BulkImportPurge: Tfrm_BulkImportPurge;

implementation

uses MetrofilerDataModule, main, Progress;

{$R *.dfm}

procedure Tfrm_BulkImportPurge.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BulkImportPurge.btn_DeleteBulkImportClick(Sender: TObject);
Var
  T, Tot, Perc    :Integer;
begin
//-----
  If Messagedlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//-----
  Screen.Cursor := crHourglass;
//-----Containers
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Container FROM Containers WHERE ImportBatchNo = '+cb_BulkImportNo.Text+' AND ISNULL(IssueStatus, '''') NOT IN ('''', ''MET'', ''INUSE'')');
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Screen.Cursor := crDefault;
      Messagedlg('Cannot purge this import because Status Changes have already happened.', mtInformation ,[mbOK], 0);
      exit;
    end;

  qry_Del.Close;
  qry_Del.SQL.Clear;
  qry_Del.SQL.Add('UPDATE Containers SET IssueStatus = ''BIP'', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE() WHERE Container = :CN1');
  qry_Del.SQL.Add('DELETE FROM Containers WHERE Container = :CN2');

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Container FROM Containers WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
  qry_SQL.Open;
  qry_SQL.First;
  T := 0;
  Tot := qry_SQL.RecordCount;
  If Tot > 0 Then
    begin
      frm_Progress.Show;
      try
        While not qry_SQL.EOF Do
          begin
            Inc(T);
            Perc := Round(T/Tot);
            frm_Progress.Prog(Perc);
            qry_Del.Close;
            qry_Del.Parameters.ParamByName('CN1').Value := qry_SQL.FieldbyName('CONTAINER').AsString;
            qry_Del.Parameters.ParamByName('CN2').Value := qry_SQL.FieldbyName('CONTAINER').AsString;
            qry_Del.ExecSQL;
            qry_SQL.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    end;
//-----Files
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Filenumber FROM Files WHERE ImportBatchNo = '+cb_BulkImportNo.Text+' AND ISNULL(IssueStatus, '''') NOT IN ('''', ''MET'', ''INUSE'')');
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Screen.Cursor := crDefault;
      Messagedlg('Cannot purge this import because Status Changes have already happened.', mtInformation ,[mbOK], 0);
      exit;
    end;

  qry_Del.Close;
  qry_Del.SQL.Clear;
  qry_Del.SQL.Add('UPDATE Files SET IssueStatus = ''BIP'', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE() WHERE Filenumber = :FN1');
  qry_Del.SQL.Add('DELETE FROM Files WHERE Filenumber = :FN2');

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Filenumber FROM Files WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
  qry_SQL.Open;
  qry_SQL.First;
  T := 0;
  Tot := qry_SQL.RecordCount;
  If Tot > 0 Then
    begin
      frm_Progress.Show;
      try
        While not qry_SQL.EOF Do
          begin
            Inc(T);
            Perc := Round(T/Tot);
            frm_Progress.Prog(Perc);
            qry_Del.Close;
            qry_Del.Parameters.ParamByName('FN1').Value := qry_SQL.FieldbyName('FILENUMBER').AsString;
            qry_Del.Parameters.ParamByName('FN2').Value := qry_SQL.FieldbyName('FILENUMBER').AsString;
            qry_Del.ExecSQL;
            qry_SQL.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    end;
//-----Items
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Itemnumber FROM Items WHERE ImportBatchNo = '+cb_BulkImportNo.Text+' AND ISNULL(Status, ''P'') NOT IN (''P'', ''MET'', ''IU'')');
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Screen.Cursor := crDefault;
      Messagedlg('Cannot purge this import because Status Changes have already happened.', mtInformation ,[mbOK], 0);
      exit;
    end;

  qry_Del.Close;
  qry_Del.SQL.Clear;
  qry_Del.SQL.Add('UPDATE Items SET Status = ''BIP'', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE() WHERE Filenumber = :IN1');
  qry_Del.SQL.Add('DELETE FROM Items WHERE Itemnumber = :IN2');

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Itemnumber FROM Items WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
  qry_SQL.Open;
  qry_SQL.First;
  T := 0;
  Tot := qry_SQL.RecordCount;
  If Tot > 0 Then
    begin
      frm_Progress.Show;
      try
        While not qry_SQL.EOF Do
          begin
            Inc(T);
            Perc := Round(T/Tot);
            frm_Progress.Prog(Perc);
            qry_Del.Close;
            qry_Del.Parameters.ParamByName('IN1').Value := qry_SQL.FieldbyName('ITEMNUMBER').AsString;
            qry_Del.Parameters.ParamByName('IN2').Value := qry_SQL.FieldbyName('ITEMNUMBER').AsString;
            qry_Del.ExecSQL;
            qry_SQL.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    end;
//-----eRecordImages
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT i.TrxNo FROM eRecords e INNER JOIN eRecordImages i ON e.eRecNo = i.eRecNo WHERE e.ImportBatchNo = '+cb_BulkImportNo.Text);
  qry_SQL.Open;
  qry_SQL.First;
  T := 0;
  Tot := qry_SQL.RecordCount;
  If Tot > 0 Then
    begin
      frm_Progress.Show;
      try
        While not qry_SQL.EOF Do
          begin
            Inc(T);
            Perc := Round(T/Tot);
            frm_Progress.Prog(Perc);
//------------
            dm_Metrofiler.DeleteERecFromRepositry(qry_SQL.FieldbyName('TrxNo').AsInteger, false);
            qry_SQL.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    end;
//-----eRecords
  qry_Del.Close;
  qry_Del.SQL.Clear;
  qry_Del.SQL.Add('DELETE FROM eRecords WHERE eRecNo = :ER');

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT eRecNo FROM eRecords WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
  qry_SQL.Open;
  qry_SQL.First;
  T := 0;
  Tot := qry_SQL.RecordCount;
  If Tot > 0 Then
    begin
      frm_Progress.Show;
      try
        While not qry_SQL.EOF Do
          begin
            Inc(T);
            Perc := Round(T/Tot);
            frm_Progress.Prog(Perc);
            qry_Del.Close;
            qry_Del.Parameters.ParamByName('ER').Value := qry_SQL.FieldbyName('eRecNo').AsString;
            qry_Del.ExecSQL;
            qry_SQL.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    end;
//--------------------------Refresh---------------------------------------------
  qry_BulkData.Close;
  qry_BulkData.Open;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DECLARE @Result TABLE (BatchNo int NOT NULL)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SET NOCOUNT On');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Containers WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Files WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Items WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM eRecords WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SET NOCOUNT Off');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SELECT BatchNo FROM @Result ORDER BY BatchNo');
  qry_SQL.Open;
  qry_SQL.First;
  cb_BulkImportNo.Items.Clear;
  While not qry_SQL.EOF Do
    begin
      cb_BulkImportNo.Items.Append(InttoStr(qry_SQL.Fields[0].asInteger));
      qry_SQL.Next;
    end;
  qry_SQL.Close;
  cb_BulkImportNo.Text := '';
  Screen.Cursor := crDefault;
  Messagedlg('Purge successful.', mtInformation ,[mbOK], 0);
end;

procedure Tfrm_BulkImportPurge.btn_SelectBulkImportClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  if rgrp_RelatedBulkImport.ItemIndex = 0 then
    begin
      qry_BulkData.Close;
      qry_BulkData.SQL.Clear;
      qry_BulkData.SQL.Add('SELECT Container, Branch, Department, FileType AS RecordType, IssueStatus, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Containers WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
      qry_BulkData.Open;
      frm_Console.AutoSizeNewColumns(DBGrid1);
    end;
  if rgrp_RelatedBulkImport.ItemIndex = 1 then
    begin
      qry_BulkData.Close;
      qry_BulkData.SQL.Clear;
      qry_BulkData.SQL.Add('SELECT Filenumber, ContainerNo, Branch, Department, FileType AS RecordType, IssueStatus, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Files WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
      qry_BulkData.Open;
      frm_Console.AutoSizeNewColumns(DBGrid1);
    end;
  if rgrp_RelatedBulkImport.ItemIndex = 2 then
    begin
      qry_BulkData.Close;
      qry_BulkData.SQL.Clear;
      qry_BulkData.SQL.Add('SELECT Itemnumber, Filenumber, FileType AS RecordType, Status AS IssueStatus, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Items WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
      qry_BulkData.Open;
      frm_Console.AutoSizeNewColumns(DBGrid1);
    end;
  if rgrp_RelatedBulkImport.ItemIndex = 3 then
    begin
      qry_BulkData.Close;
      qry_BulkData.SQL.Clear;
      qry_BulkData.SQL.Add('SELECT eRecNo, Branch, Department, RecordType, RecordCat, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM eRecords WHERE ImportBatchNo = '+cb_BulkImportNo.Text);
      qry_BulkData.Open;
      frm_Console.AutoSizeNewColumns(DBGrid1);
    end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_BulkImportPurge.cb_BulkImportNoChange(Sender: TObject);
begin
  btn_SelectBulkImport.Enabled := cb_BulkImportNo.Text <> '';
  btn_DeleteBulkImport.Enabled := cb_BulkImportNo.Text <> '';
end;

procedure Tfrm_BulkImportPurge.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_SQL.Close;
  qry_BulkData.Close;
  frm_Console.act_BulkImportPurge.Enabled := True;
  action := caFree;
end;

procedure Tfrm_BulkImportPurge.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DECLARE @Result TABLE (BatchNo int NOT NULL)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SET NOCOUNT On');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Containers WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Files WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM Items WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('INSERT INTO @Result(BatchNo)');
  qry_SQL.SQL.Add('SELECT DISTINCT ImportBatchNo FROM eRecords WHERE ImportBatchNo IS NOT NULL AND ImportBatchNo NOT IN (SELECT BatchNo FROM @Result)');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SET NOCOUNT Off');
  qry_SQL.SQL.Add('');
  qry_SQL.SQL.Add('SELECT BatchNo FROM @Result ORDER BY BatchNo DESC');
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
