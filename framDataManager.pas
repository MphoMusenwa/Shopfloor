unit framDataManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, DBGrids, ExtCtrls, Grids, StdCtrls, DB, ADODB,
  Buttons, DateUtils;

type
  Tfram_DataManager = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImageList1: TImageList;
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
    qry_Data: TADOQuery;
    qry_UpdRet: TADOQuery;
    qry_SQL: TADOQuery;
    dts_Data: TDataSource;
    qry_RecordType: TADOQuery;
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
    Label10: TLabel;
    cb_TypeR: TComboBox;
    Label4: TLabel;
    cb_TypeT: TComboBox;
    Label5: TLabel;
    procedure btn_BranchRClick(Sender: TObject);
    procedure btn_DeptRClick(Sender: TObject);
    procedure btn_RecordTypeRClick(Sender: TObject);
    procedure edt_RecordTypeRChange(Sender: TObject);
    procedure btn_SelectRClick(Sender: TObject);
    procedure cb_ReplaceWhatChange(Sender: TObject);
    procedure btn_ClearRClick(Sender: TObject);
    procedure btn_ReplaceRClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btn_BranchTClick(Sender: TObject);
    procedure btn_DeptTClick(Sender: TObject);
    procedure btn_RecordTypeTClick(Sender: TObject);
    procedure btn_SelectTClick(Sender: TObject);
    procedure btn_ClearTClick(Sender: TObject);
    procedure btn_ReplaceTClick(Sender: TObject);
    procedure cb_TypeTChange(Sender: TObject);
    procedure cb_TypeRChange(Sender: TObject);
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

procedure Tfram_DataManager.btn_BranchRClick(Sender: TObject);
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
      qry_Data.Close;

      edt_BranchR.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchR.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_DataManager.btn_BranchTClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_DeptT.Text := '';
      lbl_DeptT.Caption := '...';
      edt_RecordTypeT.Text := '';
      pBar_Ret.Position := 0;
      qry_Data.Close;

      edt_BranchT.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchT.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_DataManager.btn_ClearRClick(Sender: TObject);
begin
  cb_ReplaceWhat.ItemIndex := -1;
  cb_ReplaceWith.ItemIndex := -1;
end;

procedure Tfram_DataManager.btn_ClearTClick(Sender: TObject);
begin
  pBar_Ret.Position := 0;
  qry_Data.Close;
end;

procedure Tfram_DataManager.btn_DeptRClick(Sender: TObject);
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
      qry_Data.Close;

      edt_DeptR.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DeptR.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfram_DataManager.btn_DeptTClick(Sender: TObject);
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
      qry_Data.Close;

      edt_DeptT.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DeptT.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfram_DataManager.btn_RecordTypeRClick(Sender: TObject);
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
                          cb_TypeR.ItemIndex = 0,
                          cb_TypeR.ItemIndex = 1,
                          cb_TypeR.ItemIndex = 2,
                          False,
                          False) = mrOK Then
    begin
      lbl_WorkR.Caption := '...';
      cb_ReplaceWhat.Items.Clear;
      cb_ReplaceWhat.ItemIndex := -1;
      cb_ReplaceWith.Items.Clear;
      cb_ReplaceWith.Text := '';
      qry_Data.Close;

      edt_RecordTypeR.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfram_DataManager.btn_RecordTypeTClick(Sender: TObject);
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
                          cb_TypeT.ItemIndex = 0,
                          cb_TypeT.ItemIndex = 1,
                          False,
                          False,
                          False) = mrOK Then
    begin
      pBar_Ret.Position := 0;
      qry_Data.Close;

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

procedure Tfram_DataManager.btn_ReplaceRClick(Sender: TObject);
Var
  SearchStr   :String;
  DateValue  :TDateTime;
  NumValue   :Integer;
  J,R,T          :Integer;
  Flag         :Boolean;
begin
  If edt_RecordTypeR.Text = '' Then
    begin
      Messagedlg('Please select a Record Type first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If qry_Data.IsEmpty Then
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
  If cb_TypeR.ItemIndex = 0 Then qry_SQL.SQL.Add('UPDATE Containers SET');
  If cb_TypeR.ItemIndex = 1 Then qry_SQL.SQL.Add('UPDATE Files SET');
  If cb_TypeR.ItemIndex = 2 Then qry_SQL.SQL.Add('UPDATE Items SET');

  If cb_ReplaceWhat.Text = 'Record Category' Then
    begin
      If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
        qry_SQL.SQL.Add('RecordCat = NULL')
      else qry_SQL.SQL.Add('RecordCat = '+QuotedStr(cb_ReplaceWith.Text));
    end
  else if cb_ReplaceWhat.Text = 'Record Type' Then
    begin
      If UpperCase(cb_ReplaceWith.Text) = '<NULL>' Then
        qry_SQL.SQL.Add('FileType = NULL')
      else qry_SQL.SQL.Add('FileType = '+QuotedStr(cb_ReplaceWith.Text));
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
  qry_SQL.SQL.Add('AND FileType = '+QuotedStr(edt_RecordTypeR.Text));

  R := 0;
  If cb_TypeR.ItemIndex = 1 Then
    begin
      Inc(R);
      SearchStr := trim(sgrd_ReplaceDet.Cells[1,R]);
      If SearchStr <> '' Then
        begin
          If UpperCase(SearchStr) = '<NULL>' Then
            qry_SQL.SQL.Add('AND RTRIM(ISNULL(RecordCat, '''')) = ''''')
          else qry_SQL.SQL.Add('AND RecordCat = '+QuotedStr(SearchStr));
        end;
    end;

  Flag := False;
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
          else if SearchStr <> '' Then
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

procedure Tfram_DataManager.btn_ReplaceTClick(Sender: TObject);
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
  If Messagedlg('Are you sure you want to Re-Calculate the Retention Period for '+InttoStr(qry_Data.RecordCount)+' Records?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//--------
  Screen.Cursor := crHourglass;
  try
    pBar_Ret.Position := 0;
    pBar_Ret.Max := qry_Data.RecordCount;
    pBar_Ret.Step := 1;
    qry_Data.First;
    qry_Data.DisableControls;
    While not qry_Data.EOF Do
      begin
        pBar_Ret.StepIt;
        Application.ProcessMessages;
//---------
        CalculatePurgeDate;
//---------
        qry_Data.Next;
      end;
  finally
    Screen.Cursor := crDefault;
    qry_Data.First;
    qry_Data.EnableControls;
  end;
  Messagedlg(InttoStr(qry_Data.RecordCount)+' rows affected.', mtInformation, [mbOK], 0);
//---------
  btn_SelectTClick(Self);
end;

procedure Tfram_DataManager.btn_SelectRClick(Sender: TObject);
Var
  LabelStr,GroupbyList,SearchStr   :String;
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
  qry_Data.Close;
  qry_Data.SQL.Clear;
  qry_Data.SQL.Add('SELECT');
  qry_Data.SQL.Add('FileType AS "Record Type", ');

  If cb_TypeR.ItemIndex = 1 Then
    qry_Data.SQL.Add('RecordCat AS "Record Category", ');
  For J := 1 to 15 Do
    begin
      If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          LabelStr := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
          If (J >=1)AND(J <= 10) Then
            qry_Data.SQL.Add('Text'+InttoStr(J)+' AS "'+LabelStr+'", ')
          else If (J >=11)AND(J <= 13) Then
            qry_Data.SQL.Add('Date'+InttoStr(J-10)+' AS "'+LabelStr+'", ')
          else If (J >=14)AND(J <= 15) Then
            qry_Data.SQL.Add('Number'+InttoStr(J-13)+' AS "'+LabelStr+'", ')
        end;
    end;
  If cb_TypeR.ItemIndex = 0 Then qry_Data.SQL.Add('Container');
  If cb_TypeR.ItemIndex = 1 Then qry_Data.SQL.Add('Filenumber');
  If cb_TypeR.ItemIndex = 2 Then qry_Data.SQL.Add('Itemnumber');
  If cb_TypeR.ItemIndex = 0 Then qry_Data.SQL.Add('FROM Containers');
  If cb_TypeR.ItemIndex = 1 Then qry_Data.SQL.Add('FROM Files');
  If cb_TypeR.ItemIndex = 2 Then qry_Data.SQL.Add('FROM Items');
  qry_Data.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchR.Text));
  qry_Data.SQL.Add('AND Department = '+QuotedStr(edt_DeptR.Text));
  qry_Data.SQL.Add('AND FileType = '+QuotedStr(edt_RecordTypeR.Text));


  R := 0;

  If cb_TypeR.ItemIndex = 1 Then
    begin
      Inc(R);
      SearchStr := trim(sgrd_ReplaceDet.Cells[1,R]);
      If SearchStr <> '' Then
        begin
          If Uppercase(SearchStr) = '<NULL>' Then
            qry_Data.SQL.Add('AND RTRIM(ISNULL(RecordCat, '''')) = ''''')
          else qry_Data.SQL.Add('AND RecordCat = '+QuotedStr(SearchStr));
        end;
    end;

  GroupbyList := '';

  Flag := false;
  For T := 1 to 15 Do
    begin
      If qry_RecordType.FieldbyName('Col'+InttoStr(T)).AsString <> '' Then
        begin
          Inc(R);
          SearchStr := trim(sgrd_ReplaceDet.Cells[1,R]);

          If Uppercase(SearchStr) = '<NULL>' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_Data.SQL.Add('AND RTRIM(ISNULL(Text'+InttoStr(T)+', '''')) = ''''');
                  GroupbyList :=  GroupbyList + 'Text'+InttoStr(T)+',';
                end
              else if (T >=11)AND(T <= 13) Then
                begin
                  qry_Data.SQL.Add('AND Date'+InttoStr(T-10)+' IS NULL');
                  GroupbyList :=  GroupbyList + 'Date'+InttoStr(T-10)+',';
                end
              else If (T >=14)AND(T <= 15) Then
                begin
                  qry_Data.SQL.Add('AND Number'+InttoStr(T-13)+' IS NULL');
                  GroupbyList :=  GroupbyList + 'Number'+InttoStr(T-13)+',';
                end;
            end
          else if SearchStr <> '' Then
            begin
              Flag := True;
              If (T >=1)AND(T <= 10) Then
                begin
                  qry_Data.SQL.Add('AND Text'+InttoStr(T)+' = '+QuotedStr(SearchStr));
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

                  qry_Data.SQL.Add('AND Date'+InttoStr(T-10)+' = :mDate'+InttoStr(T-10));
                  qry_Data.Parameters.ParamValues['mDate'+InttoStr(T-10)] := DateValue;
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

                  qry_Data.SQL.Add('AND Number'+InttoStr(T-13)+' = :mNumber'+InttoStr(T-13));
                  qry_Data.Parameters.ParamValues['mNumber'+InttoStr(T-13)] := NumValue;
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
  If cb_TypeR.ItemIndex = 0 Then GroupbyList :=  GroupbyList + 'Container';
  If cb_TypeR.ItemIndex = 1 Then GroupbyList :=  GroupbyList + 'Filenumber';
  If cb_TypeR.ItemIndex = 2 Then GroupbyList :=  GroupbyList + 'Itemnumber';

  qry_Data.SQL.Add('ORDER BY '+GroupbyList);
  qry_Data.Open;
  frm_Console.AutoSizeNewColumns(grd_FindReplace);
  btn_ReplaceR.Enabled := True;
end;

procedure Tfram_DataManager.btn_SelectTClick(Sender: TObject);
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
  If cb_TypeT.ItemIndex = 0 Then qry_SQL.SQL.Add('FROM Containers');
  If cb_TypeT.ItemIndex = 1 Then qry_SQL.SQL.Add('FROM Files');


  qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchT.Text));
  qry_SQL.SQL.Add('AND Department = '+QuotedStr(edt_DeptT.Text));
  qry_SQL.SQL.Add('AND FileType = '+QuotedStr(edt_RecordTypeT.Text));
  qry_SQL.Open;
  If qry_SQL.Fields[0].AsInteger > 10000 Then
    begin
      If Messagedlg('Resultset will be more than 10000 Records. Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        begin
          qry_SQL.Close;
          exit;
        end;
    end;
  qry_SQL.Close;
//------
  qry_Data.Close;
  qry_Data.SQL.Clear;
  qry_Data.SQL.Add('SELECT EntryDate, Destroy AS [Do not Destroy], Destruct AS [Destroy Date], ');
  For J := 1 to 15 Do
    begin
      If trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          LabelStr := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
          If (J >=1)AND(J <= 10) Then
            qry_Data.SQL.Add('Text'+InttoStr(J)+' AS "'+LabelStr+'", ')
          else If (J >=11)AND(J <= 13) Then
            qry_Data.SQL.Add('Date'+InttoStr(J-10)+' AS "'+LabelStr+'", ')
          else If (J >=14)AND(J <= 15) Then
            qry_Data.SQL.Add('Number'+InttoStr(J-13)+' AS "'+LabelStr+'", ')
        end;
    end;
  If cb_TypeT.ItemIndex = 0 Then qry_Data.SQL.Add('Container');
  If cb_TypeT.ItemIndex = 1 Then qry_Data.SQL.Add('Filenumber');
  If cb_TypeT.ItemIndex = 0 Then qry_Data.SQL.Add('FROM Containers');
  If cb_TypeT.ItemIndex = 1 Then qry_Data.SQL.Add('FROM Files');
  qry_Data.SQL.Add('WHERE Branch = '+QuotedStr(edt_BranchT.Text));
  qry_Data.SQL.Add('AND Department = '+QuotedStr(edt_DeptT.Text));
  qry_Data.SQL.Add('AND FileType = '+QuotedStr(edt_RecordTypeT.Text));
  qry_Data.Open;
  frm_Console.AutoSizeNewColumns(grd_Retention);
end;

procedure Tfram_DataManager.cb_ReplaceWhatChange(Sender: TObject);
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

procedure Tfram_DataManager.cb_TypeRChange(Sender: TObject);
begin
  btn_ReplaceR.Enabled := False;
  edt_BranchR.Text := '';
  lbl_BranchR.Caption := '';
  edt_DeptR.Text := '';
  lbl_DeptR.Caption := '...';
  edt_RecordTypeR.Text := '';
  lbl_WorkR.Caption := '...';
  cb_ReplaceWhat.Items.Clear;
  cb_ReplaceWhat.ItemIndex := -1;
  cb_ReplaceWith.Items.Clear;
  cb_ReplaceWith.Text := '';
  qry_Data.Close;
end;

procedure Tfram_DataManager.cb_TypeTChange(Sender: TObject);
begin
  edt_BranchT.Text := '';
  lbl_BranchT.Caption := '';
  edt_DeptT.Text := '';
  lbl_DeptT.Caption := '...';
  edt_RecordTypeT.Text := '';
  pBar_Ret.Position := 0;
  qry_Data.Close;
end;

procedure Tfram_DataManager.edt_BranchRChange(Sender: TObject);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_DataManager.edt_DeptRChange(Sender: TObject);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_DataManager.edt_RecordTypeRChange(Sender: TObject);
Var
  T, R   :Integer;
begin
  btn_ReplaceR.Enabled := False;

  sgrd_ReplaceDet.RowCount := 2;
  sgrd_ReplaceDet.Cells[0,0] := 'Field';
  sgrd_ReplaceDet.Cells[1,0] := 'Search For';
  cb_ReplaceWhat.Items.Clear;
  R := 0;
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

  cb_ReplaceWhat.Items.Append('Record Type');

  If cb_TypeR.ItemIndex = 1 Then
    begin
      sgrd_ReplaceDet.Cells[0,1] := 'Record Category';
      sgrd_ReplaceDet.Cells[1,1] := '';
      cb_ReplaceWhat.Items.Append('Record Category');
      Inc(R);
    end;

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

procedure Tfram_DataManager.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  qry_Data.Close;
end;

procedure Tfram_DataManager.sgrd_ReplaceDetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_ReplaceR.Enabled := False;
end;

procedure Tfram_DataManager.CalculatePurgeDate;
var
  mStartDate  :TDateTime;
  CalcDestructOnField :String;
  J, RetentonPeriod   :Integer;
  NewDate             :TDateTime;
begin
  If cb_TypeT.ItemIndex = 0 Then
    begin
      If qry_Data.FieldByName('Do not Destroy').AsInteger = 1 Then
        begin
          exit;
        end;
    //-------
      If qry_RecordType.FieldByName('cDestroy').AsInteger = 1 Then
        begin
          qry_UpdRet.Close;
          qry_UpdRet.SQL.Clear;
          qry_UpdRet.SQL.Add('UPDATE Containers SET');
          qry_UpdRet.SQL.Add('  Destruct = NULL, Destroy = 1');
          qry_UpdRet.SQL.Add('WHERE Container = :Container');
          qry_UpdRet.Parameters.ParamValues['Container'] := qry_Data.FieldByName('Container').AsString;
          qry_UpdRet.ExecSQL;
          exit;
        end;
      If (qry_RecordType.FieldByName('cCalcDestructOnEntryDate').AsBoolean = False)and
         (trim(qry_RecordType.FieldByName('cCalcDestructOnField').AsString) = '') Then
        begin
          exit;
        end;

      If (qry_RecordType.FieldByName('cCalcDestructOnEntryDate').AsBoolean = False)Then
        begin
          CalcDestructOnField :=  trim(qry_RecordType.FieldByName('cCalcDestructOnField').AsString);

          mStartDate := 0;
          For J := 11 to 13 Do
            begin
              If trim(qry_RecordType.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
                begin
                  mStartDate := qry_Data.FieldbyName(CalcDestructOnField).asDateTime;
                end;
            end;
        end
      else If qry_RecordType.FieldByName('cCalcDestructOnEntryDate').AsBoolean Then
        begin
          mStartDate := qry_Data.FieldbyName('EntryDate').asDateTime;
        end;

      If qry_RecordType.FieldbyName('cRetenTionPeriod').Value = Null Then
        begin
          exit;
        end;

      If mStartDate = 0 Then
        begin
          qry_UpdRet.Close;
          qry_UpdRet.SQL.Clear;
          qry_UpdRet.SQL.Add('UPDATE Containers SET');
          qry_UpdRet.SQL.Add('  RetentionPeriod = NULL');
          qry_UpdRet.SQL.Add('  Destruct = NULL');
          qry_UpdRet.SQL.Add('WHERE Container = :Container');
          qry_UpdRet.Parameters.ParamValues['Container'] := qry_Data.FieldByName('Container').AsString;
          qry_UpdRet.ExecSQL;
          exit;
        end;

      RetentonPeriod:= qry_RecordType.FieldbyName('cRetenTionPeriod').asInteger;

      qry_UpdRet.Close;
      qry_UpdRet.SQL.Clear;
      qry_UpdRet.SQL.Add('UPDATE Containers SET');
      qry_UpdRet.SQL.Add('  RetentionPeriod = :RetentionPeriod');
      qry_UpdRet.SQL.Add('  Destruct = :Destruct');
      qry_UpdRet.SQL.Add('WHERE Container = :Container');
      qry_UpdRet.Parameters.ParamValues['RetentionPeriod'] := RetentonPeriod;
      qry_UpdRet.Parameters.ParamValues['Destruct'] := StartoftheDay(IncMonth(mStartDate,RetentonPeriod));
      qry_UpdRet.Parameters.ParamValues['Container'] := qry_Data.FieldByName('Container').AsString;
      qry_UpdRet.ExecSQL;
    end;
  If cb_TypeT.ItemIndex = 1 Then
    begin
      If qry_Data.FieldByName('Do not Destroy').AsInteger = 1 Then
        begin
          exit;
        end;
    //-------
      If qry_RecordType.FieldByName('fDestroy').AsInteger = 1 Then
        begin
          qry_UpdRet.Close;
          qry_UpdRet.SQL.Clear;
          qry_UpdRet.SQL.Add('UPDATE Files SET');
          qry_UpdRet.SQL.Add('  Destruct = NULL, Destroy = 1');
          qry_UpdRet.SQL.Add('WHERE Filenumber = :Filenumber');
          qry_UpdRet.Parameters.ParamValues['Filenumber'] := qry_Data.FieldByName('Filenumber').AsString;
          qry_UpdRet.ExecSQL;
          exit;
        end;
      If (qry_RecordType.FieldByName('fCalcDestructOnEntryDate').AsBoolean = False)and
         (trim(qry_RecordType.FieldByName('fCalcDestructOnField').AsString) = '') Then
        begin
          exit;
        end;

      If (qry_RecordType.FieldByName('fCalcDestructOnEntryDate').AsBoolean = False)Then
        begin
          CalcDestructOnField :=  trim(qry_RecordType.FieldByName('fCalcDestructOnField').AsString);

          mStartDate := 0;
          For J := 11 to 13 Do
            begin
              If trim(qry_RecordType.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
                begin
                  mStartDate := qry_Data.FieldbyName(CalcDestructOnField).asDateTime;
                end;
            end;
        end
      else If qry_RecordType.FieldByName('fCalcDestructOnEntryDate').AsBoolean Then
        begin
          mStartDate := qry_Data.FieldbyName('EntryDate').asDateTime;
        end;

      If qry_RecordType.FieldbyName('fRetenTionPeriod').Value = Null Then
        begin
          exit;
        end;

      If mStartDate = 0 Then
        begin
          qry_UpdRet.Close;
          qry_UpdRet.SQL.Clear;
          qry_UpdRet.SQL.Add('UPDATE Files SET');
          qry_UpdRet.SQL.Add('  RetentionPeriod = NULL');
          qry_UpdRet.SQL.Add('  Destruct = NULL');
          qry_UpdRet.SQL.Add('WHERE Filenumber = :Filenumber');
          qry_UpdRet.Parameters.ParamValues['Filenumber'] := qry_Data.FieldByName('Filenumber').AsString;
          qry_UpdRet.ExecSQL;
          exit;
        end;

      RetentonPeriod:= qry_RecordType.FieldbyName('fRetenTionPeriod').asInteger;

      qry_UpdRet.Close;
      qry_UpdRet.SQL.Clear;
      qry_UpdRet.SQL.Add('UPDATE Files SET');
      qry_UpdRet.SQL.Add('  RetentionPeriod = :RetentionPeriod,');
      qry_UpdRet.SQL.Add('  Destruct = :Destruct');
      qry_UpdRet.SQL.Add('WHERE Filenumber = :Filenumber');
      qry_UpdRet.Parameters.ParamValues['RetentionPeriod'] := RetentonPeriod;
      NewDate := StartOfTheDay(IncMonth(mStartDate,RetentonPeriod));
      qry_UpdRet.Parameters.ParamValues['Destruct'] := NewDate;
      qry_UpdRet.Parameters.ParamValues['Filenumber'] := qry_Data.FieldByName('Filenumber').AsString;
      qry_UpdRet.ExecSQL;
    end;
end;


Procedure Tfram_DataManager.DoFrameCreate;
begin
  sgrd_ReplaceDet.RowCount := 2;
  sgrd_ReplaceDet.Cells[0,0] := 'Field';
  sgrd_ReplaceDet.Cells[1,0] := 'Search For';
  sgrd_ReplaceDet.Cells[0,1] := '';
  sgrd_ReplaceDet.Cells[1,1] := '';
  PageControl1.ActivePageIndex := 0;
end;

Procedure Tfram_DataManager.DoFrameDestroy;
begin
  qry_Data.Close;
  qry_UpdRet.Close;
  qry_SQL.Close;
  qry_RecordType.Close;
end;

end.
