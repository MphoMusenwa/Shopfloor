//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit TransView;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables,
  Grids, ExtCtrls, ComCtrls, Tabnotbk, ToolWin, Qrctrls, QuickRpt, ADODB,
  DateUtils, Menus;

type
  Tfrm_TransView = class(TForm)
    src_TransView: TDataSource;
    qry_TransView: TADOQuery;
    qry_User: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    date_From: TDateTimePicker;
    date_to: TDateTimePicker;
    chk_Date: TCheckBox;
    Panel4: TPanel;
    Label6: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    edt_FromSt: TEdit;
    Panel6: TPanel;
    Label8: TLabel;
    edt_ToSt: TEdit;
    GroupBox3: TGroupBox;
    Panel7: TPanel;
    Label11: TLabel;
    edt_Row: TEdit;
    Panel8: TPanel;
    Label12: TLabel;
    edt_Bay: TEdit;
    Panel9: TPanel;
    Label13: TLabel;
    edt_level: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    rep_Trx: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    qry_View: TADOQuery;
    Panel1: TPanel;
    Label4: TLabel;
    edt_Record: TEdit;
    pnl_Cont: TPanel;
    Label5: TLabel;
    edt_Container: TEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    cb_User: TComboBox;
    chk_3d: TCheckBox;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    Panel11: TPanel;
    Label10: TLabel;
    edt_Requester: TEdit;
    Panel12: TPanel;
    Label16: TLabel;
    edt_Itemnumber: TEdit;
    tb_Audit: TTabSheet;
    Panel10: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btn_showOffsite: TBitBtn;
    date_AUFrom: TDateTimePicker;
    date_AUTo: TDateTimePicker;
    DBGrid2: TDBGrid;
    qry_Audit: TADOQuery;
    dts_Audit: TDataSource;
    PopupMenu1: TPopupMenu;
    InsertAuditLocation1: TMenuItem;
    InsertViewContainer1: TMenuItem;
    InsertViewRecord1: TMenuItem;
    InsertEditingContainer1: TMenuItem;
    InsertEditingRecord1: TMenuItem;
    Panel13: TPanel;
    BitBtn1: TSpeedButton;
    DBNavigator: TDBNavigator;
    btn_Print: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    cb_TransactionType: TComboBox;
    Label21: TLabel;
    cb_AuditType: TComboBox;
    cb_UserId: TComboBox;
    Label22: TLabel;
    cb_System: TComboBox;
    Label23: TLabel;
    edt_Barcode: TEdit;
    Label20: TLabel;
    edt_Comments: TEdit;
    qry_Params: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chk_DateClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure chk_3dClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_showOffsiteClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frm_TransView: Tfrm_TransView;

implementation

uses main, SelBranch, SelDept, SelWHouse, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_TransView.FormCreate(Sender: TObject);
begin
  pnl_Cont.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);

  qry_User.Open;
  cb_User.Items.Clear;
  qry_User.First;
  cb_User.Items.Append('');
  While not qry_User.EOF Do
    begin
      cb_User.Items.Append(qry_User.FieldbyName('USERID').asString);
      qry_User.Next;
    end;
  qry_User.Close;
  date_From.date := Now;
  date_To.date := Now;

  date_AUFrom.date := Now - 7;
  date_AUTo.date := Now;
end;

procedure Tfrm_TransView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Transview.Close;
  qry_User.Close;
  qry_Audit.Close;
  frm_Console.act_Trx.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_TransView.chk_DateClick(Sender: TObject);
begin
  If not chk_Date.Checked Then
    begin
      label2.Enabled := False;
      label3.Enabled := False;
      date_From.Enabled := False;
      date_To.Enabled := False;
    end;
  If chk_Date.Checked Then
    begin
      label2.Enabled := True;
      label3.Enabled := True;
      date_From.Enabled := True;
      date_To.Enabled := True;
    end;
end;

procedure Tfrm_TransView.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Tabsheet1 Then
    begin
      btn_Print.Visible := False;
      qry_TransView.Close;
    end
  else If PageControl1.ActivePage = Tabsheet2 Then
    begin
      If edt_Branch.Text = '' Then
        begin
          Messagedlg('Please select a Branch!!', mtInformation ,[mbOK], 0);
          PageControl1.ActivePage := Tabsheet1;
          btn_Print.Visible := False;
          qry_TransView.Close;
          exit;
        end;

      qry_TransView.Close;
      qry_TransView.SQL.Clear;
      qry_TransView.SQL.Add('SELECT t.*, b.Name as "Branch_Name", d.Name AS "Dept_Name", w.Name AS "Ware_Name"');
      qry_TransView.SQL.Add('FROM');
      qry_TransView.SQL.Add('  Transa t');
      qry_TransView.SQL.Add('  LEFT OUTER JOIN Branches b ON t.Branch = b.Branch');
      qry_TransView.SQL.Add('  LEFT OUTER JOIN Departments d ON t.Branch = d.Branch AND t.Department = d.Department');
      qry_TransView.SQL.Add('  LEFT OUTER JOIN WHouse w ON t.Warehouse = w.Warehouse');
      qry_TransView.SQL.Add('WHERE t.Branch = :BR');
      qry_TransView.Parameters.ParamByName('BR').Value := edt_Branch.Text;
      If length(edt_Dept.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.DEPARTMENT = :DPT)');
          qry_TransView.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
        end;
      If chk_Date.Checked Then
        begin
          qry_TransView.SQL.Add('AND(t.TDATE >= :DFR)AND(t.TDATE <= :DTO)');
          qry_TransView.Parameters.ParamByName('DFR').Value := StartoftheDay(date_From.Date);
          qry_TransView.Parameters.ParamByName('DTO').Value := EndofTheDay(date_To.Date);
        end;
      If length(edt_WHouse.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.WAREHOUSE = :WH)');
          qry_TransView.Parameters.ParamByName('WH').Value := edt_WHouse.Text;
        end;
      If length(edt_Row.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.ROWNUM = :RW)');
          qry_TransView.Parameters.ParamByName('RW').Value := edt_Row.Text;
        end;
      If length(edt_Bay.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.BAY = :BY)');
          qry_TransView.Parameters.ParamByName('BY').Value := StrtoInt(edt_Bay.Text);
        end;
      If length(edt_Level.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.LEVELNUM = :LN)');
          qry_TransView.Parameters.ParamByName('LN').Value := StrtoInt(edt_Level.Text);
        end;
      If length(cb_TransactionType.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.Transaction_Type = :TT)');
          qry_TransView.Parameters.ParamByName('TT').Value := trim(copy(cb_TransactionType.Text, 1, 4));
        end;
      If length(cb_User.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.UserId = :ID)');
          qry_TransView.Parameters.ParamByName('ID').Value := cb_User.Text;
        end;
      If length(edt_FromSt.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.From_Status = :FS)');
          qry_TransView.Parameters.ParamByName('FS').Value := edt_FromSt.Text;
        end;
      If length(edt_ToSt.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.To_Status = :TS)');
          qry_TransView.Parameters.ParamByName('TS').Value := edt_ToSt.Text;
        end;
      If length(edt_Record.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.Filenumber = :RN)');
          qry_TransView.Parameters.ParamByName('RN').Value := edt_Record.Text;
        end;
      If length(edt_Container.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.Container = :CN)');
          qry_TransView.Parameters.ParamByName('CN').Value := edt_Container.Text;
        end;
      If length(edt_Itemnumber.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.Itemnumber = :IN)');
          qry_TransView.Parameters.ParamByName('IN').Value := edt_Itemnumber.Text;
        end;
      If length(edt_Requester.Text) > 0 Then
        begin
          qry_TransView.SQL.Add('AND(t.Requester = :REQ)');
          qry_TransView.Parameters.ParamByName('REQ').Value := edt_Requester.Text;
        end;
      qry_TransView.SQL.Add('ORDER BY t.TDATE');
      DBGrid1.Columns.Clear;
      Screen.Cursor := crHourglass;
      try
        qry_Transview.Open;
        frm_Console.AutoSizeNewColumns(DBGrid1);
      finally
        Screen.Cursor := crDefault;
      end;
      btn_Print.Visible := True;
    end
  else if PageControl1.ActivePage = tb_Audit then
    begin
      Screen.Cursor := crHourglass;
      try
       qry_Params.Close;
       qry_Params.SQL.Clear;
       qry_Params.SQL.Add('SELECT DISTINCT UserId FROM AuditTrial ORDER BY UserId');
       qry_Params.Open;
       qry_Params.First;
       cb_UserId.Items.Clear;
       While not qry_Params.EOF Do
         begin
           cb_UserId.Items.Add(qry_Params.Fields[0].AsString);
           qry_Params.Next;
         end;

       qry_Params.Close;
       qry_Params.SQL.Clear;
       qry_Params.SQL.Add('SELECT DISTINCT AuditType FROM AuditTrial ORDER BY AuditType');
       qry_Params.Open;
       qry_Params.First;
       cb_AuditType.Items.Clear;
       While not qry_Params.EOF Do
         begin
           cb_AuditType.Items.Add(qry_Params.Fields[0].AsString);
           qry_Params.Next;
         end;

       qry_Params.Close;
       qry_Params.SQL.Clear;
       qry_Params.SQL.Add('SELECT DISTINCT System FROM AuditTrial ORDER BY System');
       qry_Params.Open;
       qry_Params.First;
       cb_System.Items.Clear;
       While not qry_Params.EOF Do
         begin
           cb_System.Items.Add(qry_Params.Fields[0].AsString);
           qry_Params.Next;
         end;

      finally
       qry_Params.Close;
       Screen.Cursor := crDefault;
      end;
    end;
end;

procedure Tfrm_TransView.btn_PrintClick(Sender: TObject);
begin
  rep_Trx.Preview;
end;

procedure Tfrm_TransView.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_TransView.btn_SelDeptClick(Sender: TObject);
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
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_TransView.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  If chk_3d.Checked Then
    frm_SelWHouse.Flag3D := 1
  else frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_TransView.chk_3dClick(Sender: TObject);
begin
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '';
end;

procedure Tfrm_TransView.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_TransView.btn_showOffsiteClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    qry_Audit.Close;
    qry_Audit.SQL.Clear;
    qry_Audit.SQL.Add('SELECT * FROM AuditTrial WHERE (Date >= :FR)AND(Date <= :TO)');
    qry_Audit.Parameters.ParamByName('FR').Value := StartoftheDay(date_AUFrom.Date);
    qry_Audit.Parameters.ParamByName('TO').Value := EndoftheDay(date_AUTo.Date);
    If cb_UserId.Text <> '' then
      begin
        qry_Audit.SQL.Add('AND(UserID = :ID)');
        qry_Audit.Parameters.ParamByName('ID').Value := cb_Userid.Text;
      end;
    If cb_AuditType.Text <> '' then
      begin
        qry_Audit.SQL.Add('AND(AuditType = :AT)');
        qry_Audit.Parameters.ParamByName('AT').Value := cb_AuditType.Text;
      end;
    If cb_System.Text <> '' then
      begin
        qry_Audit.SQL.Add('AND(System = :SYS)');
        qry_Audit.Parameters.ParamByName('SYS').Value := cb_System.Text;
      end;
    If edt_Barcode.Text <> '' then
      begin
        qry_Audit.SQL.Add('AND(Barcode = :BAR)');
        qry_Audit.Parameters.ParamByName('BAR').Value := edt_Barcode.Text;
      end;
    If edt_Comments.Text <> '' then
      begin
        qry_Audit.SQL.Add('AND(Comment LIKE :COM)');
        qry_Audit.Parameters.ParamByName('COM').Value := '%' + edt_Comments.Text + '%';
      end;

    qry_Audit.SQL.Add('ORDER BY Date');
    qry_Audit.Open;
    frm_Console.AutoSizeNewColumns(DBGrid2);
  finally
    Screen.Cursor := crDefault;
  end;
  If qry_Audit.IsEmpty Then
    Messagedlg('No results found!!', mtInformation, [mbOK], 0);
end;

end.
