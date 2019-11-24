unit framDataManagerERecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, DBGrids, ExtCtrls, Grids, StdCtrls, DB, ADODB,
  Buttons, DateUtils;

type
  Tfram_eRecDataManager = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImageList1: TImageList;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Label29: TLabel;
    Label16: TLabel;
    Label32: TLabel;
    lbl_BranchR: TLabel;
    lbl_DeptR: TLabel;
    lbl_WorkR: TLabel;
    btn_BranchR: TButton;
    btn_DeptR: TButton;
    btn_RecordTypeR: TButton;
    edt_BranchR: TEdit;
    edt_DeptR: TEdit;
    edt_RecordTypeR: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label9: TLabel;
    cb_ReplaceWhat: TComboBox;
    btn_ClearR: TButton;
    btn_SelectR: TButton;
    btn_ReplaceR: TButton;
    cb_ReplaceWith: TComboBox;
    sgrd_ReplaceDet: TStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label6: TLabel;
    grd_FindReplace: TDBGrid;
    qry_eRecords: TADOQuery;
    qry_UpdRet: TADOQuery;
    qry_SQL: TADOQuery;
    dts_eRecords: TDataSource;
    qry_RecordType: TADOQuery;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbl_BranchP: TLabel;
    lbl_DeptP: TLabel;
    lbl_WorkP: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    Label8: TLabel;
    btn_SelBaseDate: TSpeedButton;
    btn_SelReplaceDate: TSpeedButton;
    btn_ClearP: TButton;
    btn_SelectP: TButton;
    btn_ReplaceP: TButton;
    btn_PurgeeRec: TButton;
    edt_BaseDate: TEdit;
    edt_ReplaceDate: TEdit;
    btn_BranchP: TButton;
    btn_DeptP: TButton;
    btn_RecordTypeP: TButton;
    edt_BranchP: TEdit;
    edt_DeptP: TEdit;
    edt_RecordTypeP: TEdit;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Label14: TLabel;
    grd_Purge: TDBGrid;
    Panel11: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    lbl_BranchT: TLabel;
    lbl_DeptT: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Panel12: TPanel;
    btn_ClearT: TButton;
    btn_SelectT: TButton;
    btn_ReplaceT: TButton;
    btn_BranchT: TButton;
    btn_DeptT: TButton;
    btn_RecordTypeT: TButton;
    edt_BranchT: TEdit;
    edt_DeptT: TEdit;
    edt_RecordTypeT: TEdit;
    pBar_Ret: TProgressBar;
    Panel13: TPanel;
    Label24: TLabel;
    grd_Retention: TDBGrid;
    procedure btn_BranchRClick(Sender: TObject);
    procedure btn_DeptRClick(Sender: TObject);
    procedure btn_RecordTypeRClick(Sender: TObject);
    procedure edt_RecordTypeRChange(Sender: TObject);
    procedure btn_SelectRClick(Sender: TObject);
    procedure cb_ReplaceWhatChange(Sender: TObject);
    procedure btn_ClearRClick(Sender: TObject);
    procedure btn_ReplaceRClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btn_BranchPClick(Sender: TObject);
    procedure btn_DeptPClick(Sender: TObject);
    procedure btn_RecordTypePClick(Sender: TObject);
    procedure btn_SelBaseDateClick(Sender: TObject);
    procedure btn_SelReplaceDateClick(Sender: TObject);
    procedure btn_SelectPClick(Sender: TObject);
    procedure btn_ClearPClick(Sender: TObject);
    procedure btn_ReplacePClick(Sender: TObject);
    procedure btn_PurgeeRecClick(Sender: TObject);
    procedure btn_BranchTClick(Sender: TObject);
    procedure btn_DeptTClick(Sender: TObject);
    procedure btn_RecordTypeTClick(Sender: TObject);
    procedure btn_SelectTClick(Sender: TObject);
    procedure btn_ClearTClick(Sender: TObject);
    procedure btn_ReplaceTClick(Sender: TObject);
    procedure edt_BranchRChange(Sender: TObject);
    procedure edt_DeptRChange(Sender: TObject);
    procedure sgrd_ReplaceDetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CalculatePurgeDate;
  public
    { Public declarations }
    Procedure DoFrameCreate;
    Procedure DoFrameDestroy;
  end;

implementation

uses SelBranch, SelDept, SelRType, Main, MetrofilerDataModule, Getdate;

{$R *.dfm}

procedure Tfram_eRecDataManager.btn_BranchPClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_DeptP.Text := '';
      lbl_DeptP.Caption := '...';
      edt_RecordTypeP.Text := '';
      lbl_WorkP.Caption := '...';
      edt_BaseDate.Text := '';
      edt_ReplaceDate.Text := '';
      qry_eRecords.Close;

      edt_BranchP.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchP.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_eRecDataManager.btn_BranchRClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_DeptR.Text := '';
      lbl_DeptR.Caption := '...';
      edt_RecordTypeR.Text := '';
      lbl_WorkR.Caption := '...';
      cb_ReplaceWhat.Items.Clear;
      cb_ReplaceWhat.ItemIndex := -1;
      cb_ReplaceWith.Items.Clear;
      cb_ReplaceWith.Text := '';
      qry_eRecords.Close;

      edt_BranchR.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchR.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_eRecDataManager.btn_BranchTClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_DeptT.Text := '';
      lbl_DeptT.Caption := '...';
      edt_RecordTypeT.Text := '';
      pBar_Ret.Position := 0;
      qry_eRecords.Close;

      edt_BranchT.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchT.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_eRecDataManager.btn_ClearPClick(Sender: TObject);
begin
  lbl_WorkP.Caption := '...';
  edt_BaseDate.Text := '';
  edt_ReplaceDate.Text := '';
  qry_eRecords.Close;
end;

procedure Tfram_eRecDataManager.btn_ClearRClick(Sender: TObject);
begin
  cb_ReplaceWhat.ItemIndex := -1;
  cb_ReplaceWith.ItemIndex := -1;
end;

procedure Tfram_eRecDataManager.btn_ClearTClick(Sender: TObject);
begin
  pBar_Ret.Position := 0;
  qry_eRecords.Close;
end;

procedure Tfram_eRecDataManager.btn_DeptPClick(Sender: TObject);
begin
  If length(edt_BranchP.Text) = 0 Then
    begin
      Messagedlg('Please select the Branch.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_BranchP.Text, User) = mrOK Then
    begin
      edt_RecordTypeP.Text := '';
      lbl_WorkP.Caption := '...';
      edt_BaseDate.Text := '';
      edt_ReplaceDate.Text := '';
      qry_eRecords.Close;

      edt_DeptP.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DeptP.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfram_eRecDataManager.btn_DeptRClick(Sender: TObject);
begin
  If length(edt_BranchR.Text) = 0 Then
    begin
      Messagedlg('Please select the Branch.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_BranchR.Text, User) = mrOK Then
    begin
      edt_RecordTypeR.Text := '';
      lbl_WorkR.Caption := '...';
      cb_ReplaceWhat.Items.Clear;
      cb_ReplaceWhat.ItemIndex := -1;
      cb_ReplaceWith.Items.Clear;
      cb_ReplaceWith.Text := '';
      qry_eRecords.Close;

      edt_DeptR.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DeptR.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfram_eRecDataManager.btn_DeptTClick(Sender: TObject);
begin
  If length(edt_BranchT.Text) = 0 Then
    begin
      Messagedlg('Please select the Branch.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_BranchT.Text, User) = mrOK Then
    begin
      edt_RecordTypeT.Text := '';
      pBar_Ret.Position := 0;
      qry_eRecords.Close;

      edt_DeptT.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DeptT.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfram_eRecDataManager.btn_PurgeeRecClick(Sender: TObject);
Var
  DateValue  :TDateTime;
begin
  If edt_RecordTypeP.Text = '' Then
    begin
      Messagedlg('Please select the Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If edt_BaseDate.Text = '' Then
    begin
      Messagedlg('Please specify the base date.', mtInformation ,[mbOK], 0);
      exit;
    end;

  If not TryStrtoDate(edt_BaseDate.Text, DateValue) Then
    begin
      Messagedlg('Invalid Base Date specified.', mtWarning ,[mbOK], 0);
      exit;
    end;

//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeP.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//--------
  If Messagedlg('Are you sure you want to PURGE all the eRecords with a Purge Date of "'+edt_BaseDate.Text+'"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//--------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM eRecordImages');
  qry_SQL.SQL.Add('WHERE eRecNo IN (');
  qry_SQL.SQL.Add('SELECT eRecNo FROM eRecords');
  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchP.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptP.Text));
  qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeP.Text));
  qry_SQL.SQL.Add('AND PurgeDate < :mPurgeDate');
  qry_SQL.Parameters.ParamValues['mPurgeDate'] := EndOfTheDay(StrtoDate(edt_BaseDate.Text));
  qry_SQL.SQL.Add('AND NilPurge = 0)');
  qry_SQL.ExecSQL;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM eRecords');
  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchP.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptP.Text));
  qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeP.Text));
  qry_SQL.SQL.Add('AND PurgeDate < :mPurgeDate');
  qry_SQL.Parameters.ParamValues['mPurgeDate'] := EndOfTheDay(StrtoDate(edt_BaseDate.Text));
  qry_SQL.SQL.Add('AND NilPurge = 0');
  qry_SQL.ExecSQL;
  lbl_WorkP.Caption := InttoStr(qry_SQL.RowsAffected)+' rows affected.';
  Messagedlg(InttoStr(qry_SQL.RowsAffected)+' rows affected.', mtInformation, [mbOK], 0);
//---------
  btn_SelectPClick(Self);
end;

procedure Tfram_eRecDataManager.btn_RecordTypePClick(Sender: TObject);
begin
  If length(edt_DeptP.Text) = 0 Then
    begin
      Messagedlg('Please select the Department.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_BranchP.Text,
                          edt_DeptP.Text,
                          User,
                          False,
                          False,
                          False,
                          True,
                          False) = mrOK Then
    begin
      lbl_WorkP.Caption := '...';
      edt_BaseDate.Text := '';
      edt_ReplaceDate.Text := '';
      qry_eRecords.Close;

      edt_RecordTypeP.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
  //------
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeP.Text));
      qry_RecordType.Open;
      If qry_RecordType.IsEmpty Then
        begin
          ShowMessage('Record Type not found!');
          qry_RecordType.Close;
          exit;
        end;
      qry_RecordType.Close;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfram_eRecDataManager.btn_RecordTypeRClick(Sender: TObject);
begin
  If length(edt_DeptR.Text) = 0 Then
    begin
      Messagedlg('Please select the Department.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_BranchR.Text,
                          edt_DeptR.Text,
                          User,
                          False,
                          False,
                          False,
                          True,
                          False) = mrOK Then
    begin
      lbl_WorkR.Caption := '...';
      cb_ReplaceWhat.Items.Clear;
      cb_ReplaceWhat.ItemIndex := -1;
      cb_ReplaceWith.Items.Clear;
      cb_ReplaceWith.Text := '';
      qry_eRecords.Close;

      edt_RecordTypeR.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfram_eRecDataManager.btn_RecordTypeTClick(Sender: TObject);
begin
  If length(edt_DeptT.Text) = 0 Then
    begin
      Messagedlg('Please select the Department.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_BranchT.Text,
                          edt_DeptT.Text,
                          User,
                          False,
                          False,
                          False,
                          True,
                          False) = mrOK Then
    begin
      pBar_Ret.Position := 0;
      qry_eRecords.Close;

      edt_RecordTypeT.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
  //------
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeT.Text));
      qry_RecordType.Open;
      If qry_RecordType.IsEmpty Then
        begin
          ShowMessage('Record Type not found!');
          qry_RecordType.Close;
          exit;
        end;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfram_eRecDataManager.btn_ReplacePClick(Sender: TObject);
Var
  DateValue  :TDateTime;
begin
  If edt_RecordTypeP.Text = '' Then
    begin
      Messagedlg('Please select the Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If edt_BaseDate.Text = '' Then
    begin
      Messagedlg('Please specify the base date.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If edt_ReplaceDate.Text = '' Then
    begin
      Messagedlg('Please specify the Replace with Date Value.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If not TryStrtoDate(edt_BaseDate.Text, DateValue) Then
    begin
      Messagedlg('Invalid Base Date specified.', mtWarning ,[mbOK], 0);
      exit;
    end;

  If not TryStrtoDate(edt_ReplaceDate.Text, DateValue) Then
    begin
      Messagedlg('Invalid Replace Date specified.', mtWarning ,[mbOK], 0);
      exit;
    end;

  If Trunc(DateValue) <= Trunc(Date) Then
    begin
      Messagedlg('Invalid Replace Date specified. The Replace Date must be in the future.', mtWarning ,[mbOK], 0);
      exit;
    end;

//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeP.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//--------
  If Messagedlg('Are you sure you want to replace all the eRecords with a Purge Date of "'+edt_BaseDate.Text+'" to "'+edt_ReplaceDate.Text+'"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//--------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE eRecords SET PurgeDate = :mNewPurge');
  qry_SQL.Parameters.ParamValues['mNewPurge'] := StrtoDate(edt_ReplaceDate.Text);
  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchP.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptP.Text));
  qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeP.Text));
  qry_SQL.SQL.Add('AND PurgeDate < :mPurgeDate');
  qry_SQL.Parameters.ParamValues['mPurgeDate'] := EndOfTheDay(StrtoDate(edt_BaseDate.Text));
  qry_SQL.SQL.Add('AND NilPurge = 0');
  qry_SQL.ExecSQL;
  lbl_WorkP.Caption := InttoStr(qry_SQL.RowsAffected)+' rows affected.';
  Messagedlg(InttoStr(qry_SQL.RowsAffected)+' rows affected.', mtInformation, [mbOK], 0);
//---------
  edt_BaseDate.Text := edt_ReplaceDate.Text;
  edt_ReplaceDate.Text := '';
  btn_SelectPClick(Self);
end;

procedure Tfram_eRecDataManager.btn_ReplaceRClick(Sender: TObject);
Var
  SearchStr   :String;
  DateValue  :TDateTime;
  NumValue   :Integer;
  J,R,T          :Integer;
  Flag            :Boolean;
begin
  If edt_RecordTypeR.Text = '' Then
    begin
      Messagedlg('Please select a Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If qry_eRecords.IsEmpty Then
    begin
      Messagedlg('Please select some data to replace.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If cb_ReplaceWhat.Text = '' Then
    begin
      Messagedlg('Please select what Field to Replace.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If cb_ReplaceWith.Text = '' Then
    begin
      Messagedlg('Please specify something to Replace with.', mtInformation ,[mbOK], 0);
      exit;
    end;
//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeR.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//------
  If Messagedlg('Are you sure you want to replace all data in the Column "'+cb_ReplaceWhat.Text+'" with "'+cb_ReplaceWith.Text+'"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//--------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE eRecords SET');

  If cb_ReplaceWhat.Text = 'Record Category' Then
    begin
      If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
        qry_SQL.SQL.Add('RecordCat = NULL')
      else qry_SQL.SQL.Add('RecordCat = '+QuotedStr(cb_ReplaceWith.Text));
    end
  else if cb_ReplaceWhat.Text = 'Record Type' Then
    begin
      If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
        qry_SQL.SQL.Add('RecordType = NULL')
      else qry_SQL.SQL.Add('RecordType = '+QuotedStr(cb_ReplaceWith.Text));
    end
  else
    begin
      For J := 1 to 15 Do
        begin
          If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) = cb_ReplaceWhat.Text Then
            begin
              If (J >=1)AND(J <= 10) Then
                begin
                  If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
                    qry_SQL.SQL.Add('Text'+InttoStr(J)+' = NULL')
                  else qry_SQL.SQL.Add('Text'+InttoStr(J)+' = '+QuotedStr(cb_ReplaceWith.Text));
                end
              else If (J >=11)AND(J <= 13) Then
                begin
                  If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
                    qry_SQL.SQL.Add('Date'+InttoStr(J-10)+' = NULL')
                  else
                    begin
                      If not tryStrtoDateTime(cb_ReplaceWith.Text, DateValue) Then
                        Continue;
                      qry_SQL.SQL.Add('Date'+InttoStr(J-10)+' = :mDate'+InttoStr(J-10));
                      qry_SQL.Parameters.ParamValues['mDate'+InttoStr(J-10)] := DateValue;
                    end;
                end
              else If (J >=14)AND(J <= 15) Then
                begin
                  If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
                    qry_SQL.SQL.Add('Number'+InttoStr(J-13)+' = NULL')
                  else
                    begin
                      If not tryStrtoInt(cb_ReplaceWith.Text, NumValue) Then
                        Continue;
                      qry_SQL.SQL.Add('Number'+InttoStr(J-13)+' = :mNumber'+InttoStr(J-13));
                      qry_SQL.Parameters.ParamValues['mNumber'+InttoStr(J-13)] := NumValue;
                    end;
                end
            end;
        end;
    end;

  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchR.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptR.Text));
  qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeR.Text));

  SearchStr := trim(sgrd_ReplaceDet.Cells[1,1]);
  If SearchStr <> '' Then
    begin
      If UpperCase(SearchStr) = '<NULL>' Then
        qry_SQL.SQL.Add('AND RTRIM(ISNULL(RecordCat, '''')) = ''''')
      else qry_SQL.SQL.Add('AND RecordCat = '+QuotedStr(SearchStr));
    end;

  R := 1;

  Flag := false;
  For T := 1 to 15 Do
    begin
      If qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString <> '' Then
        begin
          Inc(R);
          SearchStr := trim(sgrd_ReplaceDet.Cells[1,R]);
          If UpperCase(SearchStr) = '<NULL>' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_SQL.SQL.Add('AND RTRIM(ISNULL(Text'+InttoStr(T)+', '''')) = ''''');
                end
              else if (T >=11)AND(T <= 13) Then
                begin
                  qry_SQL.SQL.Add('AND Date'+InttoStr(T-10)+' IS NULL');
                end
              else If (T >=14)AND(T <= 15) Then
                begin
                  qry_SQL.SQL.Add('AND Number'+InttoStr(T-13)+' IS NULL');
                end
            end
          else If SearchStr <> '' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_SQL.SQL.Add('AND Text'+InttoStr(T)+' = '+QuotedStr(SearchStr));
                end
              else if (T >=11)AND(T <= 13) Then
                begin
                  If not tryStrtoDateTime(SearchStr, DateValue) Then
                    begin
                      ShowMessage('Invalid date '+SearchStr+' specified. Please correct it.');
                      qry_RecordType.Close;
                      exit;
                    end;

                  qry_SQL.SQL.Add('AND Date'+InttoStr(T-10)+' = :mDate'+InttoStr(T-10));
                  qry_SQL.Parameters.ParamValues['mDate'+InttoStr(T-10)] := DateValue;
                end
              else If (T >=14)AND(T <= 15) Then
                begin
                  If not tryStrtoInt(SearchStr, NumValue) Then
                    begin
                      ShowMessage('Invalid Number '+SearchStr+' specified. Please correct it.');
                      qry_RecordType.Close;
                      exit;
                    end;

                  qry_SQL.SQL.Add('AND Number'+InttoStr(T-13)+' = :mNumber'+InttoStr(T-13));
                  qry_SQL.Parameters.ParamValues['mNumber'+InttoStr(T-13)] := NumValue;
                end
            end;
        end;
    end;
//  If not Flag Then
//    begin
//      Messagedlg('Please specify some details first.', mtInformation, [mbOK], 0);
//      exit;
//    end;


  qry_SQL.ExecSQL;
  lbl_WorkR.Caption := InttoStr(qry_SQL.RowsAffected)+' rows affected.';
  Messagedlg(InttoStr(qry_SQL.RowsAffected)+' rows affected.', mtInformation, [mbOK], 0);
//---------
  cb_ReplaceWhat.Text := '';
  cb_ReplaceWith.Text := '';
  btn_SelectRClick(Self);
end;

procedure Tfram_eRecDataManager.btn_ReplaceTClick(Sender: TObject);
begin
  If edt_RecordTypeT.Text = '' Then
    begin
      Messagedlg('Please select the Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeT.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//--------
  If Messagedlg('Are you sure you want to Re-Calculate the Retention Period for '+InttoStr(qry_eRecords.RecordCount)+' eRecords?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//--------
  Screen.Cursor := crHourglass;
  try
    pBar_Ret.Position := 0;
    pBar_Ret.Max := qry_eRecords.RecordCount;
    pBar_Ret.Step := 1;
    qry_eRecords.First;
    qry_eRecords.DisableControls;
    While not qry_eRecords.EOF Do
      begin
        pBar_Ret.StepIt;
        Application.ProcessMessages;
//---------
        CalculatePurgeDate;
//---------
        qry_eRecords.Next;
      end;
  finally
    Screen.Cursor := crDefault;
    qry_eRecords.First;
    qry_eRecords.EnableControls;
  end;
  Messagedlg(InttoStr(qry_eRecords.RecordCount)+' rows affected.', mtInformation, [mbOK], 0);
//---------
  btn_SelectTClick(Self);
end;

procedure Tfram_eRecDataManager.btn_SelBaseDateClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_BaseDate.Text := DatetoStr(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfram_eRecDataManager.btn_SelectPClick(Sender: TObject);
Var
  LabelStr   :String;
  DateValue  :TDateTime;
  J          :Integer;
begin
  If edt_RecordTypeP.Text = '' Then
    begin
      Messagedlg('Please select the Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If edt_BaseDate.Text = '' Then
    begin
      Messagedlg('Please specify the base date.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If not TryStrtoDate(edt_BaseDate.Text, DateValue) Then
    begin
      Messagedlg('Invalid Base Date specified.', mtWarning ,[mbOK], 0);
      exit;
    end;
//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeP.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//------
  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
  qry_eRecords.SQL.Add('SELECT PurgeDate, ');
  For J := 1 to 15 Do
    begin
      If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          LabelStr := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
          If (J >=1)AND(J <= 10) Then
            qry_eRecords.SQL.Add('Text'+InttoStr(J)+' AS "'+LabelStr+'", ')
          else If (J >=11)AND(J <= 13) Then
            qry_eRecords.SQL.Add('Date'+InttoStr(J-10)+' AS "'+LabelStr+'", ')
          else If (J >=14)AND(J <= 15) Then
            qry_eRecords.SQL.Add('Number'+InttoStr(J-13)+' AS "'+LabelStr+'", ')
        end;
    end;
  qry_eRecords.SQL.Add('eRecNo');
  qry_eRecords.SQL.Add('FROM eRecords');
  qry_eRecords.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchP.Text));
  qry_eRecords.SQL.Add('AND Department = '+QuotedStr(edt_DeptP.Text));
  qry_eRecords.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeP.Text));
  qry_eRecords.SQL.Add('AND PurgeDate < :mPurgeDate');
  qry_eRecords.Parameters.ParamValues['mPurgeDate'] := EndOfTheDay(StrtoDate(edt_BaseDate.Text));
  qry_eRecords.SQL.Add('AND NilPurge = 0');
  qry_eRecords.Open;
  frm_Console.AutoSizeNewColumns(grd_Purge);
end;

procedure Tfram_eRecDataManager.btn_SelectRClick(Sender: TObject);
Var
  LabelStr,GroupbyList,SearchStr   :String;
  DateValue  :TDateTime;
  NumValue   :Integer;
  J,R,T          :Integer;
  Flag        :Boolean;
begin
  If edt_RecordTypeR.Text = '' Then
    begin
      Messagedlg('Please select a Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeR.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//------
  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
  qry_eRecords.SQL.Add('SELECT RecordType AS "Record Type", RecordCat AS "Record Category", ');
  For J := 1 to 15 Do
    begin
      If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          LabelStr := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
          If (J >=1)AND(J <= 10) Then
            qry_eRecords.SQL.Add('Text'+InttoStr(J)+' AS "'+LabelStr+'", ')
          else If (J >=11)AND(J <= 13) Then
            qry_eRecords.SQL.Add('Date'+InttoStr(J-10)+' AS "'+LabelStr+'", ')
          else If (J >=14)AND(J <= 15) Then
            qry_eRecords.SQL.Add('Number'+InttoStr(J-13)+' AS "'+LabelStr+'", ')
        end;
    end;
  qry_eRecords.SQL.Add('eRecNo');
  qry_eRecords.SQL.Add('FROM eRecords');
  qry_eRecords.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchR.Text));
  qry_eRecords.SQL.Add('AND Department = '+QuotedStr(edt_DeptR.Text));
  qry_eRecords.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeR.Text));

  SearchStr := trim(sgrd_ReplaceDet.Cells[1,1]);
  If SearchStr <> '' Then
    begin
      If UpperCase(SearchStr) = '<NULL>' Then
        qry_eRecords.SQL.Add('AND RTRIM(ISNULL(RecordCat, '''')) = ''''')
      else qry_eRecords.SQL.Add('AND RecordCat = '+QuotedStr(SearchStr));
    end;

  R := 1;
  GroupbyList := '';

  Flag := false;
  For T := 1 to 15 Do
    begin
      If qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString <> '' Then
        begin
          Inc(R);
          SearchStr := trim(sgrd_ReplaceDet.Cells[1,R]);
          If UpperCase(SearchStr) = '<NULL>' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_SQL.SQL.Add('AND RTRIM(ISNULL(Text'+InttoStr(T)+', '''')) = ''''');
                end
              else if (T >=11)AND(T <= 13) Then
                begin
                  qry_SQL.SQL.Add('AND Date'+InttoStr(T-10)+' IS NULL');
                end
              else If (T >=14)AND(T <= 15) Then
                begin
                  qry_SQL.SQL.Add('AND Number'+InttoStr(T-13)+' IS NULL');
                end
            end
          else If SearchStr <> '' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_eRecords.SQL.Add('AND Text'+InttoStr(T)+' = '+QuotedStr(SearchStr));
                  GroupbyList :=  GroupbyList + 'Text'+InttoStr(T)+',';
                end
              else if (T >=11)AND(T <= 13) Then
                begin
                  If not tryStrtoDateTime(SearchStr, DateValue) Then
                    begin
                      ShowMessage('Invalid date '+SearchStr+' specified. Please correct it.');
                      qry_RecordType.Close;
                      exit;
                    end;

                  qry_eRecords.SQL.Add('AND Date'+InttoStr(T-10)+' = :mDate'+InttoStr(T-10));
                  qry_eRecords.Parameters.ParamValues['mDate'+InttoStr(T-10)] := DateValue;
                  GroupbyList :=  GroupbyList + 'Date'+InttoStr(T-10)+',';
                end
              else If (T >=14)AND(T <= 15) Then
                begin
                  If not tryStrtoInt(SearchStr, NumValue) Then
                    begin
                      ShowMessage('Invalid Number '+SearchStr+' specified. Please correct it.');
                      qry_RecordType.Close;
                      exit;
                    end;

                  qry_eRecords.SQL.Add('AND Number'+InttoStr(T-13)+' = :mNumber'+InttoStr(T-13));
                  qry_eRecords.Parameters.ParamValues['mNumber'+InttoStr(T-13)] := NumValue;
                  GroupbyList :=  GroupbyList + 'Number'+InttoStr(T-13)+',';
                end
            end;
        end;
    end;
//  If not Flag Then
//    begin
//      Messagedlg('Please specify some details first.', mtInformation, [mbOK], 0);
//      exit;
//    end;


  GroupbyList :=  GroupbyList + 'eRecNo';
  qry_eRecords.SQL.Add('ORDER BY '+GroupbyList);
  qry_eRecords.Open;
  frm_Console.AutoSizeNewColumns(grd_FindReplace);
  btn_ReplaceR.Enabled := True;
end;

procedure Tfram_eRecDataManager.btn_SelectTClick(Sender: TObject);
Var
  LabelStr   :String;
  J          :Integer;
begin
  If edt_RecordTypeT.Text = '' Then
    begin
      Messagedlg('Please select the Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
//------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeT.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      ShowMessage('Record Type not found!');
      qry_RecordType.Close;
      exit;
    end;
//------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT COUNT(*)');
  qry_SQL.SQL.Add('FROM eRecords');
  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchT.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptT.Text));
  qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeT.Text));
  qry_SQL.Open;
  If qry_SQL.Fields[0].AsInteger > 10000 Then
    begin
      If Messagedlg('Resultset will be more than 10000 eRecords. Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        begin
          qry_SQL.Close;
          exit;
        end;
    end;
  qry_SQL.Close;
//------
  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
  qry_eRecords.SQL.Add('SELECT CaptureDate, NilPurge, PurgeDate, ');
  For J := 1 to 15 Do
    begin
      If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          LabelStr := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
          If (J >=1)AND(J <= 10) Then
            qry_eRecords.SQL.Add('Text'+InttoStr(J)+' AS "'+LabelStr+'", ')
          else If (J >=11)AND(J <= 13) Then
            qry_eRecords.SQL.Add('Date'+InttoStr(J-10)+' AS "'+LabelStr+'", ')
          else If (J >=14)AND(J <= 15) Then
            qry_eRecords.SQL.Add('Number'+InttoStr(J-13)+' AS "'+LabelStr+'", ')
        end;
    end;
  qry_eRecords.SQL.Add('eRecNo');
  qry_eRecords.SQL.Add('FROM eRecords');
  qry_eRecords.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchT.Text));
  qry_eRecords.SQL.Add('AND Department = '+QuotedStr(edt_DeptT.Text));
  qry_eRecords.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordTypeT.Text));
  qry_eRecords.Open;
  frm_Console.AutoSizeNewColumns(grd_Retention);
end;

procedure Tfram_eRecDataManager.btn_SelReplaceDateClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin

      edt_ReplaceDate.Text := DatetoStr(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfram_eRecDataManager.cb_ReplaceWhatChange(Sender: TObject);
begin
  If cb_ReplaceWhat.Text = 'Record Category' Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('      SELECT');
      qry_SQL.SQL.Add('        r.RecCatType');
      qry_SQL.SQL.Add('      FROM');
      qry_SQL.SQL.Add('        RecordCat r');
      qry_SQL.SQL.Add('        INNER JOIN RCRTRts rt ON r.RecCatType = rt.RecordCat');
      qry_SQL.SQL.Add('      WHERE');
      qry_SQL.SQL.Add('        rt.RecordType =:RecordType');
      qry_SQL.SQL.Add('      ORDER BY');
      qry_SQL.SQL.Add('        r.RecCatType');
      qry_SQL.Parameters.ParamByName('RecordType').Value := edt_RecordTypeR.Text;
      qry_SQL.Open;
      qry_SQL.First;
      cb_ReplaceWith.Items.Clear;
      While not qry_SQL.EOF Do
        begin
          cb_ReplaceWith.Items.Add(qry_SQL.Fields[0].asString);
          qry_SQL.Next;
        end;
      qry_SQL.Close;
      cb_ReplaceWith.Style := csDropDownList;
      If cb_ReplaceWith.Items.Count > 0 Then
        cb_ReplaceWith.ItemIndex := 0;
    end
  else if cb_ReplaceWhat.Text = 'Record Type' Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('      SELECT DISTINCT');
      qry_SQL.SQL.Add('        Description');
      qry_SQL.SQL.Add('      FROM');
      qry_SQL.SQL.Add('        IndexAuthRts');
      qry_SQL.SQL.Add('      WHERE');
      qry_SQL.SQL.Add('        Branch = :Branch AND');
      qry_SQL.SQL.Add('        Department = :Department');
      qry_SQL.SQL.Add('      ORDER BY');
      qry_SQL.SQL.Add('        Description');
      qry_SQL.Parameters.ParamByName('Branch').Value := edt_BranchR.Text;
      qry_SQL.Parameters.ParamByName('Department').Value := edt_DeptR.Text;
      qry_SQL.Open;
      qry_SQL.First;
      cb_ReplaceWith.Items.Clear;
      While not qry_SQL.EOF Do
        begin
          cb_ReplaceWith.Items.Add(qry_SQL.Fields[0].asString);
          qry_SQL.Next;
        end;
      qry_SQL.Close;
      cb_ReplaceWith.Style := csDropDownList;
      If cb_ReplaceWith.Items.Count > 0 Then
        cb_ReplaceWith.ItemIndex := 0;
    end
  else
    begin
      cb_ReplaceWith.Items.Clear;
      cb_ReplaceWith.Style := csDropDown;
      cb_ReplaceWith.Text := '';
    end;
end;

procedure Tfram_eRecDataManager.edt_BranchRChange(Sender: TObject);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_eRecDataManager.edt_DeptRChange(Sender: TObject);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_eRecDataManager.edt_RecordTypeRChange(Sender: TObject);
Var
  T, R   :Integer;
begin
  btn_ReplaceR.Enabled := False;
  sgrd_ReplaceDet.RowCount := 2;
  sgrd_ReplaceDet.Cells[0,0] := 'Field';
  sgrd_ReplaceDet.Cells[1,0] := 'Search For';
  sgrd_ReplaceDet.Cells[0,1] := 'Record Category';
  sgrd_ReplaceDet.Cells[1,1] := '';
//----------------
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(edt_RecordTypeR.Text));
  qry_RecordType.Open;
  If qry_RecordType.IsEmpty Then
    begin
      qry_RecordType.Close;
      exit;
    end;
  R := 1;
  cb_ReplaceWhat.Items.Clear;
  cb_ReplaceWhat.Items.Append('Record Type');
  cb_ReplaceWhat.Items.Append('Record Category');

  For T := 1 to 15 Do
    begin
      If qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString <> '' Then
        begin
          cb_ReplaceWhat.Items.Append(qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString);
          Inc(R);
          sgrd_ReplaceDet.RowCount := R+1;
          sgrd_ReplaceDet.Cells[0,R] := qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString;
          sgrd_ReplaceDet.Cells[1,R] := '';
        end;
    end;
  qry_RecordType.Close;
  cb_ReplaceWhat.ItemIndex := -1;
end;

procedure Tfram_eRecDataManager.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  qry_eRecords.Close;
end;

procedure Tfram_eRecDataManager.sgrd_ReplaceDetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_eRecDataManager.CalculatePurgeDate;
var
  mStartDate  :TDateTime;
  CalcDestructOnField :String;
  J, RetentonPeriod   :Integer;
begin
  If qry_eRecords.FieldByName('NilPurge').AsInteger = 1 Then
    begin
      exit;
    end;
//-------
  If qry_RecordType.FieldByName('eDestroy').AsInteger = 1 Then
    begin
      qry_UpdRet.Close;
      qry_UpdRet.SQL.Clear;
      qry_UpdRet.SQL.Add('UPDATE eRecords SET');
      qry_UpdRet.SQL.Add('  PurgeDate = NULL, NilPurge = 1');
      qry_UpdRet.SQL.Add('WHERE eRecNo = :eRecNo');
      qry_UpdRet.Parameters.ParamValues['eRecNo'] := qry_eRecords.FieldByName('eRecNo').AsInteger;
      qry_UpdRet.ExecSQL;
      exit;
    end;
  If (qry_RecordType.FieldByName('eCalcDestructOnEntryDate').AsBoolean = False)and
     (trim(qry_RecordType.FieldByName('eCalcDestructOnField').AsString) = '') Then
    begin
      exit;
    end;

  If (qry_RecordType.FieldByName('eCalcDestructOnEntryDate').AsBoolean = False)Then
    begin
      CalcDestructOnField :=  trim(qry_RecordType.FieldByName('eCalcDestructOnField').AsString);

      mStartDate := 0;
      For J := 11 to 13 Do
        begin
          If trim(qry_RecordType.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
            begin
              mStartDate := qry_eRecords.FieldbyName(CalcDestructOnField).asDateTime;
            end;
        end;
    end
  else If qry_RecordType.FieldByName('eCalcDestructOnEntryDate').AsBoolean Then
    begin
      mStartDate := qry_eRecords.FieldbyName('CaptureDate').asDateTime;
    end;

  If qry_RecordType.FieldbyName('eRetenTionPeriod').Value = Null Then
    begin
      exit;
    end;

  If mStartDate = 0 Then
    begin
      qry_UpdRet.Close;
      qry_UpdRet.SQL.Clear;
      qry_UpdRet.SQL.Add('UPDATE eRecords SET');
      qry_UpdRet.SQL.Add('  PurgeDate = NULL');
      qry_UpdRet.SQL.Add('WHERE eRecNo = :eRecNo');
      qry_UpdRet.Parameters.ParamValues['eRecNo'] := qry_eRecords.FieldByName('eRecNo').AsInteger;
      qry_UpdRet.ExecSQL;
      exit;
    end;

  RetentonPeriod:= qry_RecordType.FieldbyName('eRetenTionPeriod').asInteger;

  qry_UpdRet.Close;
  qry_UpdRet.SQL.Clear;
  qry_UpdRet.SQL.Add('UPDATE eRecords SET');
  qry_UpdRet.SQL.Add('  PurgeDate = :mDate');
  qry_UpdRet.SQL.Add('WHERE eRecNo = :eRecNo');
  qry_UpdRet.Parameters.ParamValues['mDate'] := StartoftheDay(IncMonth(mStartDate,RetentonPeriod));
  qry_UpdRet.Parameters.ParamValues['eRecNo'] := qry_eRecords.FieldByName('eRecNo').AsInteger;
  qry_UpdRet.ExecSQL;
end;


Procedure Tfram_eRecDataManager.DoFrameCreate;
begin
  sgrd_ReplaceDet.RowCount := 2;
  sgrd_ReplaceDet.Cells[0,0] := 'Field';
  sgrd_ReplaceDet.Cells[1,0] := 'Search For';
  sgrd_ReplaceDet.Cells[0,1] := '';
  sgrd_ReplaceDet.Cells[1,1] := '';
  PageControl1.ActivePageIndex := 0;
end;

Procedure Tfram_eRecDataManager.DoFrameDestroy;
begin
  qry_eRecords.Close;
  qry_UpdRet.Close;
  qry_SQL.Close;
  qry_RecordType.Close;
end;

end.
