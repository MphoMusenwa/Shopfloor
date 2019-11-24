unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, DBCtrls,
  ComCtrls, DateUtils;

type
  Tfrm_Reports = class(TForm)
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    pnl_Parameters: TPanel;
    pnl_Branch: TPanel;
    Label9: TLabel;
    lbl_Branch: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    pnl_Department: TPanel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    pnl_RecordType: TPanel;
    Label2: TLabel;
    btn_SelRecordType: TButton;
    edt_RType: TEdit;
    pnl_FilingArea: TPanel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    dts_Reports: TDataSource;
    qry_Reports: TADOQuery;
    sp_Report: TADOStoredProc;
    btn_Preview: TSpeedButton;
    DBMemo1: TDBMemo;
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qry_ReportsAfterScroll(DataSet: TDataSet);
    procedure btn_PreviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Reports: Tfrm_Reports;

implementation

uses SelBranch, SelDept, SelRType, Main, SelWHouse, MetrofilerDataModule,
  ReportsResult, Progress;

{$R *.dfm}

procedure Tfrm_Reports.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Reports.btn_PreviewClick(Sender: TObject);
Var
   J    :Integer;
   ParamName    :String;
   ShowTime     :Boolean;
   _Dt          :TDateTime;
   Y,M,D,H,MM,S,MS :Word;
begin
  Application.CreateForm(Tfrm_ReportResult, frm_ReportResult);
  try
    frm_ReportResult.sp_Report.Close;
    frm_ReportResult.sp_Report.ProcedureName := sp_Report.ProcedureName;
    ShowTime := qry_Reports.FieldbyName('ShowTimeinDateFields').asBoolean;
    frm_ReportResult.sp_Report.Parameters.Refresh;

    For J := 0 to sp_Report.Parameters.Count-1 Do
      begin
        If UpperCase(sp_Report.Parameters.Items[J].Name) = '@BRANCH' Then
          begin
            frm_ReportResult.sp_Report.Parameters.ParamValues['@BRANCH'] := edt_Branch.Text;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@DEPARTMENT' Then
          begin
            frm_ReportResult.sp_Report.Parameters.ParamValues['@DEPARTMENT'] := edt_Dept.Text;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@RECORDTYPE' Then
          begin
            frm_ReportResult.sp_Report.Parameters.ParamValues['@RECORDTYPE'] := edt_RType.Text;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@FILINGAREA' Then
          begin
            frm_ReportResult.sp_Report.Parameters.ParamValues['@FILINGAREA'] := edt_WHouse.Text;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) <> '@RETURN_VALUE' Then
          begin
            ParamName := sp_Report.Parameters.Items[J].Name;
            ParamName := copy(ParamName, 2, length(ParamName));

            If sp_Report.Parameters.Items[J].DataType = ftDateTime Then
              begin
                DecodeDate(TDateTimePicker(FindComponent('dtp_'+ParamName)).DateTime, Y, M, D);
                If ShowTime Then
                  begin
                    DecodeTime(TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).DateTime, H,MM,S,MS);
                    _Dt := EncodeDateTime(Y,M,D,H,MM,S,MS);
                  end
                else
                  begin
                    _Dt := EncodeDateTime(Y,M,D,0,0,0,0);
                  end;
                frm_ReportResult.sp_Report.Parameters.ParamValues['@'+ParamName] := _Dt;
              end
            else frm_ReportResult.sp_Report.Parameters.ParamValues['@'+ParamName] := TEdit(FindComponent('edt_'+ParamName)).Text;
          end;
      end;
    Screen.Cursor := crHourglass;
    try
      frm_ReportResult.sp_Report.Open;
      Screen.Cursor := crDefault;
      frm_ReportResult.lbl_RowsReturned.Caption := InttoStr(frm_ReportResult.sp_Report.RecordCount)+' Rows Returned.';
      frm_Console.AutoSizeNewColumns(frm_ReportResult.DBGrid1);
      frm_ReportResult.ShowModal;
    finally
      Screen.Cursor := crDefault;
      frm_ReportResult.sp_Report.Close;
    end;
  finally
    frm_ReportResult.Free;
  end;
end;

procedure Tfrm_Reports.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
      edt_RType.Text := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Reports.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
      edt_RType.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Reports.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_Dept.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_Branch.Text,
                          edt_Dept.Text,
                          User,
                          True,
                          True,
                          True,
                          True,
                          True) = mrOK Then
    begin
      edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Reports.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := -1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Reports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_Reports.Close;
  action := caFree;
end;

procedure Tfrm_Reports.FormCreate(Sender: TObject);
begin
  qry_Reports.Close;
  qry_Reports.SQL.Clear;
  qry_Reports.SQL.Add('SELECT');
  qry_Reports.SQL.Add('   *');
  qry_Reports.SQL.Add('FROM');
  qry_Reports.SQL.Add('   Reports');
  If not frm_Console.AccessSysAdmin Then
    begin
      qry_Reports.SQL.Add('WHERE');
      qry_Reports.SQL.Add('   (ID IN (SELECT rt.ReportID FROM ReportsRts rt WHERE rt.UserId = :UserID))');
      qry_Reports.SQL.Add('   OR');
      qry_Reports.SQL.Add('   (ID IN (SELECT rt.ReportID FROM ReportsRts rt INNER JOIN RolesRts r ON rt.RoleId = r.RoleId WHERE r.UserId = :rUserID))');
      qry_Reports.Parameters.ParamByName('UserID').Value := User;
      qry_Reports.Parameters.ParamByName('rUserID').Value := User;
    end;
  qry_Reports.SQL.Add('ORDER BY');
  qry_Reports.SQL.Add('   ReportName');
  qry_Reports.Open;
end;

procedure Tfrm_Reports.qry_ReportsAfterScroll(DataSet: TDataSet);
Var
   J         :Integer;
   T         :Integer;
   ParamName :String;
   ShowTime  :Boolean;
begin
  Screen.Cursor := crHourglass;
  try
    sp_Report.Close;
    sp_Report.ProcedureName := Dataset.FieldbyName('ObjectName').asString;
    ShowTime := Dataset.FieldbyName('ShowTimeinDateFields').asBoolean;
    sp_Report.Parameters.Refresh;

    pnl_Branch.Visible := False;
    pnl_Department.Visible := False;
    pnl_RecordType.Visible := False;
    pnl_FilingArea.Visible := False;

    For J := frm_Reports.ComponentCount-1 downto 0 Do
      begin
        If frm_Reports.Components[J] Is TPanel Then
          begin
            If TPanel(frm_Reports.Components[J]).Tag = 9999 Then
              frm_Reports.Components[J].Free;
          end
        else If frm_Reports.Components[J] Is TLabel Then
          begin
            If TLabel(frm_Reports.Components[J]).Tag = 9999 Then
              frm_Reports.Components[J].Free;
          end
        else If frm_Reports.Components[J] Is TEdit Then
          begin
            If TEdit(frm_Reports.Components[J]).Tag = 9999 Then
              frm_Reports.Components[J].Free;
          end;
      end;

    T := -22;

    For J := 0 to sp_Report.Parameters.Count-1 Do
      begin
        If UpperCase(sp_Report.Parameters.Items[J].Name) = '@BRANCH' Then
          begin
            Inc(T, 28);
            pnl_Branch.Top := T;
            pnl_Branch.Visible := True;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@DEPARTMENT' Then
          begin
            Inc(T, 28);
            pnl_Department.Top := T;
            pnl_Department.Visible := True;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@RECORDTYPE' Then
          begin
            Inc(T, 28);
            pnl_RecordType.Top := T;
            pnl_RecordType.Visible := True;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) = '@FILINGAREA' Then
          begin
            Inc(T, 28);
            pnl_FilingArea.Top := T;
            pnl_FilingArea.Visible := True;
          end
        else If UpperCase(sp_Report.Parameters.Items[J].Name) <> '@RETURN_VALUE' Then
          begin
            ParamName := sp_Report.Parameters.Items[J].Name;
            ParamName := copy(ParamName, 2, length(ParamName));


            If sp_Report.Parameters.Items[J].DataType = ftDateTime Then
              begin
                //Create the Panel
                TPanel.Create(frm_Reports).Name := 'pnl_'+ParamName;
                TPanel(FindComponent('pnl_'+ParamName)).Caption := '';
                Inc(T, 28);
                TPanel(FindComponent('pnl_'+ParamName)).Top := T;
                TPanel(FindComponent('pnl_'+ParamName)).Left := 6;
                TPanel(FindComponent('pnl_'+ParamName)).Height := 28;
                TPanel(FindComponent('pnl_'+ParamName)).Width := 427;
                TPanel(FindComponent('pnl_'+ParamName)).Parent := pnl_Parameters;
                TPanel(FindComponent('pnl_'+ParamName)).Tag := 9999;
                //Create the Label
                TLabel.Create(frm_Reports).Name := 'lbl_'+ParamName;
                TLabel(FindComponent('lbl_'+ParamName)).Caption := ParamName;
                TLabel(FindComponent('lbl_'+ParamName)).Top := 6;
                TLabel(FindComponent('lbl_'+ParamName)).Left := 5;
                TLabel(FindComponent('lbl_'+ParamName)).Parent := TPanel(FindComponent('pnl_'+ParamName));
                TLabel(FindComponent('lbl_'+ParamName)).Tag := 9999;
                //Create the DatePicker
                TDateTimePicker.Create(frm_Reports).Name := 'dtp_'+ParamName;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Date := Now;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Top := 3;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Left := 73;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).width := 121;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Parent := TPanel(FindComponent('pnl_'+ParamName));
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Tag := 9999;
                TDateTimePicker(FindComponent('dtp_'+ParamName)).Kind := dtkDate;
                //Create the Time Control if required
                If ShowTime Then
                  begin
                    TDateTimePicker.Create(frm_Reports).Name := 'dtp_'+ParamName+'_Time';
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Date := Now;
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Top := 3;
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Left := 200;
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).width := 89;
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Parent := TPanel(FindComponent('pnl_'+ParamName));
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Tag := 9999;
                    TDateTimePicker(FindComponent('dtp_'+ParamName+'_Time')).Kind := dtkTime;
                  end;
              end
            else
              begin
                //Create the Panel
                TPanel.Create(frm_Reports).Name := 'pnl_'+ParamName;
                TPanel(FindComponent('pnl_'+ParamName)).Caption := '';
                Inc(T, 28);
                TPanel(FindComponent('pnl_'+ParamName)).Top := T;
                TPanel(FindComponent('pnl_'+ParamName)).Left := 6;
                TPanel(FindComponent('pnl_'+ParamName)).Height := 28;
                TPanel(FindComponent('pnl_'+ParamName)).Width := 427;
                TPanel(FindComponent('pnl_'+ParamName)).Parent := pnl_Parameters;
                TPanel(FindComponent('pnl_'+ParamName)).Tag := 9999;
                //Create the Label
                TLabel.Create(frm_Reports).Name := 'lbl_'+ParamName;
                TLabel(FindComponent('lbl_'+ParamName)).Caption := ParamName;
                TLabel(FindComponent('lbl_'+ParamName)).Top := 6;
                TLabel(FindComponent('lbl_'+ParamName)).Left := 5;
                TLabel(FindComponent('lbl_'+ParamName)).Parent := TPanel(FindComponent('pnl_'+ParamName));
                TLabel(FindComponent('lbl_'+ParamName)).Tag := 9999;
                //Create the Edit
                TEdit.Create(frm_Reports).Name := 'edt_'+ParamName;
                TEdit(FindComponent('edt_'+ParamName)).Text := '';
                TEdit(FindComponent('edt_'+ParamName)).Top := 3;
                TEdit(FindComponent('edt_'+ParamName)).Left := 73;
                TEdit(FindComponent('edt_'+ParamName)).width := 330;
                TEdit(FindComponent('edt_'+ParamName)).Parent := TPanel(FindComponent('pnl_'+ParamName));
                TEdit(FindComponent('edt_'+ParamName)).Tag := 9999;
              end;
          end;
      end;
    btn_Preview.Top := T + 33;
  finally
    Repaint;
    pnl_Parameters.Repaint;
    Screen.Cursor := crDefault;
  end;
end;

end.
