unit repGenerator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBGrids,
  DB, ADODB, DateUtils;

type
  Tfrm_RepGenerator = class(TForm)
    pg_Reports: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grd_Results: TDBGrid;
    qry_RecordType: TADOQuery;
    qry_RecCat: TADOQuery;
    qry_Lookup: TADOQuery;
    qry_Records: TADOQuery;
    qry_eRecords: TADOQuery;
    dts_Records: TDataSource;
    dts_eRecords: TDataSource;
    ScrollBox2: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_RecordCatHead: TLabel;
    Shape1: TShape;
    Shape5: TShape;
    Shape3: TShape;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_BranchName: TEdit;
    edt_Dept: TEdit;
    edt_DeptName: TEdit;
    btn_SelDept: TButton;
    edt_RecordType: TEdit;
    btn_SelRType: TButton;
    cb_RecordCat: TComboBox;
    ScrollBox1: TScrollBox;
    lbl_Col1: TLabel;
    lbl_Col2: TLabel;
    lbl_Col3: TLabel;
    lbl_Col4: TLabel;
    lbl_Col5: TLabel;
    lbl_Col6: TLabel;
    lbl_Col9: TLabel;
    lbl_Col10: TLabel;
    lbl_Col7: TLabel;
    lbl_Col8: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    Shape6: TShape;
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    btn_FrDate1: TSpeedButton;
    lbl_btDate1: TLabel;
    btn_ToDate1: TSpeedButton;
    btn_FrDate2: TSpeedButton;
    lbl_btDate2: TLabel;
    btn_ToDate2: TSpeedButton;
    btn_FrDate3: TSpeedButton;
    lbl_btDate3: TLabel;
    btn_ToDate3: TSpeedButton;
    cb_Col1: TComboBox;
    cb_Col2: TComboBox;
    cb_Col3: TComboBox;
    cb_Col4: TComboBox;
    cb_Col5: TComboBox;
    cb_Col6: TComboBox;
    cb_Col7: TComboBox;
    cb_Col8: TComboBox;
    cb_Col9: TComboBox;
    cb_Col10: TComboBox;
    cb_Col14: TComboBox;
    cb_Col15: TComboBox;
    edt_FrDate1: TEdit;
    edt_ToDate1: TEdit;
    edt_FrDate2: TEdit;
    edt_ToDate2: TEdit;
    edt_FrDate3: TEdit;
    edt_ToDate3: TEdit;
    btn_Clear: TButton;
    SaveFile: TSaveDialog;
    btn_eRecords: TSpeedButton;
    btn_Records: TSpeedButton;
    Label9: TLabel;
    cb_RecordNumber: TComboBox;
    Label10: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    edt_DeptSort: TEdit;
    edt_RecordTypeSort: TEdit;
    edt_RecordCatSort: TEdit;
    edt_BranchSort: TEdit;
    edt_RecordNumberSort: TEdit;
    edt_ColSort1: TEdit;
    edt_ColSort2: TEdit;
    edt_ColSort3: TEdit;
    edt_ColSort4: TEdit;
    edt_ColSort5: TEdit;
    edt_ColSort6: TEdit;
    edt_ColSort7: TEdit;
    edt_ColSort8: TEdit;
    edt_ColSort9: TEdit;
    edt_ColSort10: TEdit;
    edt_ColSort12: TEdit;
    edt_ColSort13: TEdit;
    edt_ColSort14: TEdit;
    edt_ColSort15: TEdit;
    chk_ColDisplay1: TCheckBox;
    chk_ColDisplay2: TCheckBox;
    chk_ColDisplay3: TCheckBox;
    chk_ColDisplay4: TCheckBox;
    chk_ColDisplay5: TCheckBox;
    chk_ColDisplay6: TCheckBox;
    chk_ColDisplay7: TCheckBox;
    chk_ColDisplay8: TCheckBox;
    chk_ColDisplay9: TCheckBox;
    chk_ColDisplay10: TCheckBox;
    chk_ColDisplay11: TCheckBox;
    chk_ColDisplay12: TCheckBox;
    chk_ColDisplay13: TCheckBox;
    chk_ColDisplay14: TCheckBox;
    chk_ColDisplay15: TCheckBox;
    chk_DeptDisplay: TCheckBox;
    chk_RecordTypeDisplay: TCheckBox;
    chk_RecordCatDisplay: TCheckBox;
    chk_BranchDisplay: TCheckBox;
    chk_RecordNumberDisplay: TCheckBox;
    edt_DeptOrder: TEdit;
    edt_RecordTypeOrder: TEdit;
    edt_RecordCatOrder: TEdit;
    edt_BranchOrder: TEdit;
    edt_RecordNumberOrder: TEdit;
    edt_ColOrder1: TEdit;
    edt_ColOrder2: TEdit;
    edt_ColOrder3: TEdit;
    edt_ColOrder4: TEdit;
    edt_ColOrder5: TEdit;
    edt_ColOrder6: TEdit;
    edt_ColOrder7: TEdit;
    edt_ColOrder8: TEdit;
    edt_ColOrder9: TEdit;
    edt_ColOrder10: TEdit;
    edt_ColOrder11: TEdit;
    edt_ColOrder12: TEdit;
    edt_ColOrder13: TEdit;
    edt_ColOrder14: TEdit;
    edt_ColOrder15: TEdit;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    btn_ExportFile: TSpeedButton;
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRTypeClick(Sender: TObject);
    procedure btn_FrDate1Click(Sender: TObject);
    procedure btn_FrDate2Click(Sender: TObject);
    procedure btn_FrDate3Click(Sender: TObject);
    procedure btn_ToDate1Click(Sender: TObject);
    procedure btn_ToDate2Click(Sender: TObject);
    procedure btn_ToDate3Click(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ExportFileClick(Sender: TObject);
    procedure edt_BranchOrderKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BranchSortKeyPress(Sender: TObject; var Key: Char);
    procedure btn_eRecordsClick(Sender: TObject);
    procedure btn_RecordsClick(Sender: TObject);
  private
    { Private declarations }
    procedure Initialize;
  public
    { Public declarations }
  end;

var
  frm_RepGenerator: Tfrm_RepGenerator;

implementation

uses SelBranch, SelDept, SelRType, Main, getdate;

{$R *.dfm}

procedure Tfrm_RepGenerator.Initialize;
Var
  J   :Integer;
begin
  btn_Records.Visible := False;
  btn_eRecords.Visible := False;
//----
  lbl_RecordCatHead.Visible := False;
  edt_RecordCatOrder.Visible := False;
  edt_RecordCatSort.Visible := False;
  chk_RecordCatDisplay.Visible := False;
  cb_RecordCat.Visible := False;
//----
  edt_BranchOrder.Text := '';
  edt_Branch.Text := '';
  edt_BranchName.Text := '';
  edt_BranchOrder.Text := '';
  edt_BranchSort.Text := '';
  chk_BranchDisplay.Checked := True;
//----
  edt_DeptOrder.Text := '';
  edt_Dept.Text := '';
  edt_DeptName.Text := '';
  edt_DeptOrder.Text := '';
  edt_DeptSort.Text := '';
  chk_DeptDisplay.Checked := True;
//----
  edt_RecordTypeOrder.Text := '';
  edt_RecordType.Text := '';
  edt_RecordTypeOrder.Text := '';
  edt_RecordTypeSort.Text := '';
  chk_RecordTypeDisplay.Checked := True;
//----
  edt_RecordCatOrder.Text := '';
  cb_RecordCat.Text := '';
  edt_RecordCatOrder.Text := '';
  edt_RecordCatSort.Text := '';
  chk_RecordCatDisplay.Checked := True;
//----Text Fields
  For J := 1 to 10 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;
//----Date Fields
  For J := 11 to 13 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
      TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
    end;
//----Num Fields
  For J := 14 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;
end;

procedure Tfrm_RepGenerator.btn_SelBranchClick(Sender: TObject);
Var
  J   :Integer;
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      edt_BranchName.Text := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    //----
      btn_Records.Visible := False;
      btn_eRecords.Visible := False;
    //----
      lbl_RecordCatHead.Visible := False;
      edt_RecordCatOrder.Visible := False;
      edt_RecordCatSort.Visible := False;
      chk_RecordCatDisplay.Visible := False;
      cb_RecordCat.Visible := False;
    //----
      edt_DeptOrder.Text := '';
      edt_Dept.Text := '';
      edt_DeptName.Text := '';
      edt_DeptOrder.Text := '';
      edt_DeptSort.Text := '';
      chk_DeptDisplay.Checked := True;
    //----
      edt_RecordTypeOrder.Text := '';
      edt_RecordType.Text := '';
      edt_RecordTypeOrder.Text := '';
      edt_RecordTypeSort.Text := '';
      chk_RecordTypeDisplay.Checked := True;
    //----
      edt_RecordCatOrder.Text := '';
      cb_RecordCat.Text := '';
      edt_RecordCatOrder.Text := '';
      edt_RecordCatSort.Text := '';
      chk_RecordCatDisplay.Checked := True;
    //----Text Fields
      For J := 1 to 10 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
    //----Date Fields
      For J := 11 to 13 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
          TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
        end;
    //----Num Fields
      For J := 14 to 15 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_RepGenerator.btn_SelDeptClick(Sender: TObject);
Var
  J   :Integer;
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      edt_DeptName.Text := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    //----
      btn_Records.Visible := False;
      btn_eRecords.Visible := False;
    //----
      lbl_RecordCatHead.Visible := False;
      edt_RecordCatOrder.Visible := False;
      edt_RecordCatSort.Visible := False;
      chk_RecordCatDisplay.Visible := False;
      cb_RecordCat.Visible := False;
    //----
      edt_RecordTypeOrder.Text := '';
      edt_RecordType.Text := '';
      edt_RecordTypeOrder.Text := '';
      edt_RecordTypeSort.Text := '';
      chk_RecordTypeDisplay.Checked := True;
    //----
      edt_RecordCatOrder.Text := '';
      cb_RecordCat.Text := '';
      edt_RecordCatOrder.Text := '';
      edt_RecordCatSort.Text := '';
      chk_RecordCatDisplay.Checked := True;
    //----Text Fields
      For J := 1 to 10 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
    //----Date Fields
      For J := 11 to 13 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
          TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
        end;
    //----Num Fields
      For J := 14 to 15 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_RepGenerator.btn_SelRTypeClick(Sender: TObject);
Var
  J, T   :Integer;
  ACol   :String;
  AValue :String;
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
                          False,
                          True,
                          False,
                          True,
                          False) = mrOK Then
    begin
      edt_RecordType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
//==============================================================================
//============Clear Fields======================================================
//==============================================================================
      btn_Records.Visible := False;
      btn_eRecords.Visible := False;
    //----
      lbl_RecordCatHead.Visible := False;
      edt_RecordCatOrder.Visible := False;
      edt_RecordCatSort.Visible := False;
      chk_RecordCatDisplay.Visible := False;
      cb_RecordCat.Visible := False;
    //----
      edt_RecordCatOrder.Text := '';
      cb_RecordCat.Text := '';
      edt_RecordCatOrder.Text := '';
      edt_RecordCatSort.Text := '';
      chk_RecordCatDisplay.Checked := True;
    //----Text Fields
      For J := 1 to 10 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
    //----Date Fields
      For J := 11 to 13 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
          TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
          TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
          TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
        end;
    //----Num Fields
      For J := 14 to 15 Do
        begin
          TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text := '';
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
          TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible := False;
          TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked := True;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
          TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
        end;
//==============================================================================
//============Setup Fields======================================================
//==============================================================================
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT fRetentionPeriod, fDestroy, eRetentionPeriod, eDestroy');
      qry_RecordType.SQL.Add('FROM IndexDefinitions WHERE Description  = '+QuotedStr(edt_RecordType.Text));
      qry_RecordType.Open;
//-----
      If (qry_RecordType.FieldbyName('fRetentionPeriod').AsInteger <> 0)or
         (qry_RecordType.FieldbyName('fDestroy').AsInteger <> 0)Then
        begin
          btn_Records.Visible := True;
        end;
      If (qry_RecordType.FieldbyName('eRetentionPeriod').AsInteger <> 0)or
         (qry_RecordType.FieldbyName('eDestroy').AsInteger <> 0)Then
        begin
          btn_eRecords.Visible := True;
          lbl_RecordCatHead.Visible := True;
          edt_RecordCatOrder.Visible := True;
          edt_RecordCatSort.Visible := True;
          chk_RecordCatDisplay.Visible := True;
          cb_RecordCat.Visible := True;
        end;

      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15');
      qry_RecordType.SQL.Add('FROM IndexDefinitions');
      qry_RecordType.SQL.Add('WHERE Description = '+QuotedStr(edt_RecordType.Text));
      qry_RecordType.Open;
//-----
      T := 4-24;
//-----
      for J := 0 to qry_RecordType.FieldCount-1 do        //Only interested in the Description Fields
        begin
          ACol := trim(UpperCase(qry_RecordType.Fields[J].FieldName));
          AValue :=  trim(qry_RecordType.Fields[J].asString);
          If AValue = '' Then
            Continue;
          if (ACol = 'COL1') or            //Text Fields
             (ACol = 'COL2') or
             (ACol = 'COL3') or
             (ACol = 'COL4') or
             (ACol = 'COL5') or
             (ACol = 'COL6') or
             (ACol = 'COL7') or
             (ACol = 'COL8') or
             (ACol = 'COL9') or
             (ACol = 'COL10') then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;

              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Visible := True;

              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Top := T;
           end
         else if (ACol = 'COL11') or            //Date Fields
                 (ACol = 'COL12') or
                 (ACol = 'COL13') Then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;

              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_FrDate'+InttoStr(J-9))).Top := T;
              TEdit(FindComponent('edt_FrDate'+InttoStr(J-9))).Visible := True;
              TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-9))).Top := T;
              TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-9))).Visible := True;
              TLabel(FindComponent('lbl_btDate'+InttoStr(J-9))).Top := T;
              TLabel(FindComponent('lbl_btDate'+InttoStr(J-9))).Visible := True;
              TEdit(FindComponent('edt_ToDate'+InttoStr(J-9))).Top := T;
              TEdit(FindComponent('edt_ToDate'+InttoStr(J-9))).Visible := True;
              TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-9))).Top := T;
              TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-9))).Visible := True;
           end
         else if (ACol = 'COL14') or            //Number Fields
                 (ACol = 'COL15') Then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColOrder'+InttoStr(J+1))).Visible := True;

              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;

              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J+1))).Visible := True;

              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Visible := True;
           end;
       end;
//------
      cb_RecordCat.Items.Clear;
      qry_RecCat.Close;
      qry_RecCat.SQL.Clear;
      qry_RecCat.SQL.Add('SELECT c.RecCatType FROM RCRTRts r, RecordCat c, RCAuthRts a');
      qry_RecCat.SQL.Add('WHERE r.RecordCat = c.RecCatType');
      qry_RecCat.SQL.Add('AND r.RecordType = '+QuotedStr(edt_RecordType.Text));
      qry_RecCat.SQL.Add('AND c.RecCatType = a.RecordCat');
      qry_RecCat.SQL.Add('AND a.UserId = '+QuotedStr(User));
      qry_RecCat.Open;
      cb_RecordCat.Items.Append('');
      cb_RecordCat.ItemIndex := 0;
      qry_RecCat.First;
      While not qry_RecCat.EOF Do
        begin
          cb_RecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
          qry_RecCat.Next;
        end;
      edt_RecordCatOrder.Text := '';
    end;
//------
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_RepGenerator.btn_FrDate1Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate1.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_FrDate2Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate2.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_FrDate3Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate3.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_ToDate1Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate1.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_ToDate2Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate2.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_ToDate3Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate3.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_RepGenerator.btn_ClearClick(Sender: TObject);
begin
  Initialize;
end;

procedure Tfrm_RepGenerator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_ReportGen.Enabled := True;
  qry_Records.Close;
  qry_eRecords.Close;
  Action := caFree;
end;

procedure Tfrm_RepGenerator.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_RepGenerator.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure Tfrm_RepGenerator.btn_ExportFileClick(Sender: TObject);
procedure ExportCSV(eQuery: TADOQuery; Filename  :String);
var
  CSVFile :TextFile;
  first :Boolean;
  i  :integer;
  mfile :string;
begin
  If pg_Reports.ActivePageIndex <> 1 Then
    exit;
  SaveFile.Filename := Filename;
  if SaveFile.Execute then
    mfile := SaveFile.FileName;
  AssignFile(CSVFile,mfile);
  Screen.Cursor := crHourGlass;
  eQuery.First;
  eQuery.DisableControls;
  try
    ReWrite(CSVFile);
    first := true;
    for i := 0 to eQuery.FieldCount -1 do
      begin
        if not first then
          Write(CSVFile,',')
        else first  := false;
        Write(CSVFile,eQuery.Fields[i].FieldName);
      end;
    Writeln(CSVFile);

    while not eQuery.EOF do
      begin
        first := true;
        for i := 0 to eQuery.FieldCount -1 do
          begin
            if not first then
              Write(CSVFile,',')
            else first := false;
            if eQuery.Fields[i].DataType = ftString then
              Write(CSVFile,'"' + eQuery.Fields[i].AsString + '"')
            else if eQuery.Fields[i].DataType = ftFloat then
              Write(CSVFile,FloatToStrF(eQuery.Fields[i].AsFloat,ffFixed,9,2))
            else if eQuery.Fields[i].DataType = ftCurrency then
              Write(CSVFile,FloatToStrF(eQuery.Fields[i].AsFloat,ffFixed,9,2))
            else Write(CSVFile,eQuery.Fields[i].AsString);
          end;
        Writeln(CSVFile);
        eQuery.Next;
      end;
  finally
    Screen.Cursor := crDefault;
    eQuery.First;         //return Table to the first record
    eQuery.EnableControls;
    CloseFile(CSVFile);
  end;
end;


begin
  If qry_Records.IsEmpty and qry_eRecords.IsEmpty Then
    begin
      MessageDLG('No results to export', mtError,[mbOK],0);
      Exit;
    end;

  If not qry_Records.IsEmpty Then
    ExportCSV(qry_Records, 'Records');
  If not qry_eRecords.IsEmpty Then
    ExportCSV(qry_eRecords, 'eRecords');
end;

procedure Tfrm_RepGenerator.edt_BranchOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (Key <> '0')and
     (Key <> '1')and
     (Key <> '2')and
     (Key <> '3')and
     (Key <> '4')and
     (Key <> '5')and
     (Key <> '6')and
     (Key <> '7')and
     (Key <> '8')and
     (ord(Key) <> 8)and //BackSpace
     (Key <> '9')Then
    abort;
end;

procedure Tfrm_RepGenerator.edt_BranchSortKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (Key <> 'A')and
     (Key <> 'D')and
     (Key <> 'a')and
     (Key <> 'd')and
     (ord(Key) <> 8)Then //BackSpace
    abort;
end;

procedure Tfrm_RepGenerator.btn_eRecordsClick(Sender: TObject);
Var
  J, I, A    :Integer;
  TempStr  :String;
  TempStr2  :String;
  FieldList:String;
  GroupList:String;
begin
  If (edt_Branch.Text = '')and
     (edt_Dept.Text = '')and
     (edt_RecordType.Text = '')Then
    begin
      Messagedlg('No search criteria has been defined!', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_Records.Close;
  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  For I := 1 to 20 Do
    begin
      If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(chk_BranchDisplay.Checked) Then
        FieldList := FieldList + 'b.Branch, ';
      If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(chk_DeptDisplay.Checked) Then
        FieldList := FieldList + 'd.Department, ';
      If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(chk_RecordTypeDisplay.Checked) Then
        FieldList := FieldList + 'e.RecordType, ';
      If (StrtoIntDef(edt_RecordCatOrder.Text, 0) = I)AND(chk_RecordCatDisplay.Checked) Then
        FieldList := FieldList + 'e.RecordCat, ';
      If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(chk_RecordNumberDisplay.Checked) Then
        FieldList := FieldList + 'e.Filenumber AS "Metrofile File Barcode No", ';
    //---
      For J := 1 to 15 Do
        begin
          If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND(TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked) Then
            begin
              A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
              TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
              Delete(TempStr, length(TempStr)-1, 2);
              If (A >= 1)AND(A <= 10) Then
                FieldList := FieldList + 'e.Text'+InttoStr(A)+' AS "'+TempStr+'", '
              else If (A >= 11)AND(A <= 13) Then
                FieldList := FieldList + 'e.Date'+InttoStr(A-10)+' AS "'+TempStr+'", '
              else If (A >= 14)AND(A <= 15) Then
                FieldList := FieldList + 'e.Number'+InttoStr(A-13)+' AS "'+TempStr+'", '
            end;
        end;
    end;

  I := 0;

  If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(chk_BranchDisplay.Checked)AND(chk_BranchDisplay.Visible) Then
    FieldList := FieldList + 'b.Branch, ';
  If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(chk_DeptDisplay.Checked)AND(chk_DeptDisplay.Visible) Then
    FieldList := FieldList + 'd.Department, ';
  If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(chk_RecordTypeDisplay.Checked)AND(chk_RecordTypeDisplay.Visible) Then
    FieldList := FieldList + 'e.RecordType, ';
  If (StrtoIntDef(edt_RecordCatOrder.Text, 0) = I)AND(chk_RecordCatDisplay.Checked)AND(chk_RecordCatDisplay.Visible) Then
    FieldList := FieldList + 'e.RecordCat, ';
  If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(chk_RecordNumberDisplay.Checked)AND(chk_RecordNumberDisplay.Visible) Then
    FieldList := FieldList + 'e.Filenumber AS "Metrofile File Barcode No", ';
//---
  For J := 1 to 15 Do
    begin
      If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
         (TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked)AND
         (TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible) Then
        begin
          A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
          TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
          Delete(TempStr, length(TempStr)-1, 2);
          If (A >= 1)AND(A <= 10) Then
            FieldList := FieldList + 'e.Text'+InttoStr(A)+' AS "'+TempStr+'", '
          else If (A >= 11)AND(A <= 13) Then
            FieldList := FieldList + 'e.Date'+InttoStr(A-10)+' AS "'+TempStr+'", '
          else If (A >= 14)AND(A <= 15) Then
            FieldList := FieldList + 'e.Number'+InttoStr(A-13)+' AS "'+TempStr+'", '
        end;
    end;
  Delete(FieldList, length(FieldList)-1, 2);
//===========Generate the Group by List-------------------------
  GroupList := '';
  For I := 1 to 20 Do
    begin
      If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(edt_BranchSort.Text <> '') Then
        begin
          If edt_BranchSort.Text = 'A' Then
            GroupList := GroupList + 'b.Branch, '
          else GroupList := GroupList + 'b.Branch DESC, ';
        end;
      If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(edt_DeptSort.Text <> '') Then
        begin
          If edt_DeptSort.Text = 'A' Then
            GroupList := GroupList + 'd.Department, '
          else GroupList := GroupList + 'd.Department DESC, ';
        end;
      If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(edt_RecordTypeSort.Text <> '') Then
        begin
          If edt_RecordTypeSort.Text = 'A' Then
            GroupList := GroupList + 'e.RecordType, '
          else GroupList := GroupList + 'e.RecordType DESC, ';
        end;
      If (StrtoIntDef(edt_RecordCatOrder.Text, 0) = I)AND(edt_RecordCatSort.Text <> '') Then
        begin
          If edt_RecordCatSort.Text = 'A' Then
            GroupList := GroupList + 'e.RecordCat, '
          else GroupList := GroupList + 'e.RecordCat DESC, ';
        end;
      If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(edt_RecordNumberSort.Text <> '') Then
        begin
          If edt_RecordNumberSort.Text = 'A' Then
            GroupList := GroupList + 'e.Filenumber, '
          else GroupList := GroupList + 'e.Filenumber DESC, ';
        end;
    //---
      For J := 1 to 15 Do
        begin
          If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
             (TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text <> '') Then
            begin
              A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
              TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
              Delete(TempStr, length(TempStr)-1, 2);

              If TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text = 'A' Then
                begin
                  If (A >= 1)AND(A <= 10) Then
                    GroupList := GroupList + 'e.Text'+InttoStr(A)+', '
                  else If (A >= 11)AND(A <= 13) Then
                    GroupList := GroupList + 'e.Date'+InttoStr(A-10)+', '
                  else If (A >= 14)AND(A <= 15) Then
                    GroupList := GroupList + 'e.Number'+InttoStr(A-13)+', ';
                end
              else
                begin
                  If (A >= 1)AND(A <= 10) Then
                    GroupList := GroupList + 'e.Text'+InttoStr(A)+' DESC, '
                  else If (A >= 11)AND(A <= 13) Then
                    GroupList := GroupList + 'e.Date'+InttoStr(A-10)+' DESC, '
                  else If (A >= 14)AND(A <= 15) Then
                    GroupList := GroupList + 'e.Number'+InttoStr(A-13)+' DESC, ';
                end;
            end;
        end;
    end;

  I := 0;

  If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(edt_BranchSort.Text <> '') Then
    begin
      If edt_BranchSort.Text = 'A' Then
        GroupList := GroupList + 'b.Branch, '
      else GroupList := GroupList + 'b.Branch DESC, ';
    end;
  If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(edt_DeptSort.Text <> '') Then
    begin
      If edt_DeptSort.Text = 'A' Then
        GroupList := GroupList + 'd.Department, '
      else GroupList := GroupList + 'd.Department DESC, ';
    end;
  If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(edt_RecordTypeSort.Text <> '') Then
    begin
      If edt_RecordTypeSort.Text = 'A' Then
        GroupList := GroupList + 'e.RecordType, '
      else GroupList := GroupList + 'e.RecordType DESC, ';
    end;
  If (StrtoIntDef(edt_RecordCatOrder.Text, 0) = I)AND(edt_RecordCatSort.Text <> '') Then
    begin
      If edt_RecordCatSort.Text = 'A' Then
        GroupList := GroupList + 'e.RecordCat, '
      else GroupList := GroupList + 'e.RecordCat DESC, ';
    end;
  If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(edt_RecordNumberSort.Text <> '') Then
    begin
      If edt_RecordNumberSort.Text = 'A' Then
        GroupList := GroupList + 'e.Filenumber, '
      else GroupList := GroupList + 'e.Filenumber DESC, ';
    end;
//---
  For J := 1 to 15 Do
    begin
      If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
         (TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text <> '') Then
        begin
          A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
          TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
          Delete(TempStr, length(TempStr)-1, 2);

          If TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text = 'A' Then
            begin
              If (A >= 1)AND(A <= 10) Then
                GroupList := GroupList + 'e.Text'+InttoStr(A)+', '
              else If (A >= 11)AND(A <= 13) Then
                GroupList := GroupList + 'e.Date'+InttoStr(A-10)+', '
              else If (A >= 14)AND(A <= 15) Then
                GroupList := GroupList + 'e.Number'+InttoStr(A-13)+', ';
            end
          else
            begin
              If (A >= 1)AND(A <= 10) Then
                GroupList := GroupList + 'e.Text'+InttoStr(A)+' DESC, '
              else If (A >= 11)AND(A <= 13) Then
                GroupList := GroupList + 'e.Date'+InttoStr(A-10)+' DESC, '
              else If (A >= 14)AND(A <= 15) Then
                GroupList := GroupList + 'e.Number'+InttoStr(A-13)+' DESC, ';
            end;
        end;
    end;

  Delete(GroupList, length(GroupList)-1, 2);
  If GroupList = '' Then
    GroupList := 'e.eRecNo';
//------------
  qry_eRecords.SQL.Add('SELECT '+FieldList);
  qry_eRecords.SQL.Add('FROM Branches b, Departments d, eRecords e');
  qry_eRecords.SQL.Add('WHERE e.Branch = b.Branch');
  qry_eRecords.SQL.Add('AND e.Branch = d.Branch');
  qry_eRecords.SQL.Add('AND e.Department = d.Department');
//----------------Filter------------
  If edt_Branch.Text <> '' Then
    qry_eRecords.SQL.Add('AND b.Branch = '+QuotedStr(edt_Branch.Text));
  If edt_Dept.Text <> '' Then
    qry_eRecords.SQL.Add('AND d.Department = '+QuotedStr(edt_Dept.Text));
  If edt_RecordType.Text <> '' Then
    qry_eRecords.SQL.Add('AND e.RecordType = '+QuotedStr(edt_RecordType.Text));
  If cb_RecordCat.Text <> '' Then
    qry_eRecords.SQL.Add('AND e.RecordCat = '+QuotedStr(cb_RecordCat.Text));

  qry_eRecords.SQL.Add('AND ((e.RecordCat IN (');
  qry_eRecords.SQL.Add('SELECT c.RecCatType FROM RCRTRts r, RecordCat c, RCAuthRts a');
  qry_eRecords.SQL.Add('WHERE r.RecordCat = c.RecCatType');
  qry_eRecords.SQL.Add('AND c.RecCatType = a.RecordCat');
  qry_eRecords.SQL.Add('AND a.UserId = '+QuotedStr(User));
  qry_eRecords.SQL.Add('))or(RTRIM(ISNULL(e.RecordCat, '''')) = ''''))');

  If cb_RecordNumber.Text <> '' Then
    qry_eRecords.SQL.Add('AND e.Filenumber = '+QuotedStr(cb_RecordNumber.Text));
//---
  For J := 1 to 15 Do
    begin
      A := TComboBox(FindComponent('lbl_Col'+InttoStr(J))).Tag;
      If (A >= 1)AND(A <= 10) Then      //Text
        begin
          TempStr := TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            qry_eRecords.SQL.Add('AND e.Text'+InttoStr(A)+' LIKE '+QuotedStr('%'+TempStr+'%'))
        end
      else If (A >= 10)AND(A <= 13) Then   //Date
        begin
          TempStr  := TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text;
          TempStr2 := TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text;
          If (TempStr <> '')AND(TempStr2 = '') Then
            begin
              qry_eRecords.SQL.Add('AND e.Date'+InttoStr(A-10)+' = :mDate'+InttoStr(A-10));
              qry_eRecords.Parameters.ParamByName('mDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
            end
          else If (TempStr <> '')AND(TempStr2 <> '') Then
            begin
              qry_eRecords.SQL.Add('AND e.Date'+InttoStr(A-10)+' >= :mFrDate'+InttoStr(A-10));
              qry_eRecords.Parameters.ParamByName('mFrDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
              qry_eRecords.SQL.Add('AND e.Date'+InttoStr(A-10)+' < :mToDate'+InttoStr(A-10));
              qry_eRecords.Parameters.ParamByName('mToDate'+InttoStr(A-10)).Value := StartoftheDay(StrtoDate(TempStr2)+1);
            end;
        end
      else If (A >= 14)AND(A <= 15) Then   //Number
        begin
          TempStr := TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            qry_eRecords.SQL.Add('AND e.Number'+InttoStr(A-13)+' = '+TempStr);
        end;
    end;
//------------
  qry_eRecords.SQL.Add('ORDER BY '+GroupList);
//--------------
  Screen.Cursor := crHourglass;
  try
    qry_eRecords.Open;
  finally
    Screen.Cursor := crDefault;
  end;
//==============================================================================
//==============================================================================
//==============================================================================
  If qry_eRecords.IsEmpty Then
    begin
      Messagedlg('No Results found.', mtInformation, [mbOK], 0);
      exit;
    end;
  grd_Results.DataSource := dts_eRecords;
  frm_Console.AutoSizeNewColumns(grd_Results);
  pg_Reports.ActivePageIndex := 1;
end;

procedure Tfrm_RepGenerator.btn_RecordsClick(Sender: TObject);
Var
  J, I, A  :Integer;
  TempStr  :String;
  TempStr2  :String;
  FieldList:String;
  GroupList:String;
begin
  If (edt_Branch.Text = '')and
     (edt_Dept.Text = '')and
     (edt_RecordType.Text = '')Then
    begin
      Messagedlg('No search criteria has been defined!', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_eRecords.Close;
  qry_Records.Close;
  qry_Records.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  For I := 1 to 20 Do
    begin
      If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(chk_BranchDisplay.Checked) Then
        FieldList := FieldList + 'b.Branch, ';
      If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(chk_DeptDisplay.Checked) Then
        FieldList := FieldList + 'd.Department, ';
      If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(chk_RecordTypeDisplay.Checked) Then
        FieldList := FieldList + 'f.FileType, ';
      If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(chk_RecordNumberDisplay.Checked) Then
        FieldList := FieldList + 'f.Filenumber AS "Metrofile File Barcode No", ';
    //---
      For J := 1 to 15 Do
        begin
          If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND(TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked) Then
            begin
              A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
              TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
              Delete(TempStr, length(TempStr)-1, 2);
              If (A >= 1)AND(A <= 10) Then
                FieldList := FieldList + 'f.Text'+InttoStr(A)+' AS "'+TempStr+'", '
              else If (A >= 11)AND(A <= 13) Then
                FieldList := FieldList + 'f.Date'+InttoStr(A-10)+' AS "'+TempStr+'", '
              else If (A >= 14)AND(A <= 15) Then
                FieldList := FieldList + 'f.Number'+InttoStr(A-13)+' AS "'+TempStr+'", '
            end;
        end;
    end;

  I := 0;

  If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(chk_BranchDisplay.Checked)AND(chk_BranchDisplay.Visible) Then
    FieldList := FieldList + 'b.Branch, ';
  If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(chk_DeptDisplay.Checked)AND(chk_DeptDisplay.Visible) Then
    FieldList := FieldList + 'd.Department, ';
  If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(chk_RecordTypeDisplay.Checked)AND(chk_RecordTypeDisplay.Visible) Then
    FieldList := FieldList + 'f.FileType, ';
  If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(chk_RecordNumberDisplay.Checked)AND(chk_RecordNumberDisplay.Visible) Then
    FieldList := FieldList + 'f.Filenumber AS "Metrofile File Barcode No", ';
//---
  For J := 1 to 15 Do
    begin
      If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
         (TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Checked)AND
         (TCheckBox(FindComponent('chk_ColDisplay'+InttoStr(J))).Visible) Then
        begin
          A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
          TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
          Delete(TempStr, length(TempStr)-1, 2);
          If (A >= 1)AND(A <= 10) Then
            FieldList := FieldList + 'f.Text'+InttoStr(A)+' AS "'+TempStr+'", '
          else If (A >= 11)AND(A <= 13) Then
            FieldList := FieldList + 'f.Date'+InttoStr(A-10)+' AS "'+TempStr+'", '
          else If (A >= 14)AND(A <= 15) Then
            FieldList := FieldList + 'f.Number'+InttoStr(A-13)+' AS "'+TempStr+'", '
        end;
    end;
  Delete(FieldList, length(FieldList)-1, 2);
//===========Generate the Group by List-------------------------
  GroupList := '';
  For I := 1 to 20 Do
    begin
      If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(edt_BranchSort.Text <> '') Then
        begin
          If edt_BranchSort.Text = 'A' Then
            GroupList := GroupList + 'b.Branch, '
          else GroupList := GroupList + 'b.Branch DESC, ';
        end;
      If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(edt_DeptSort.Text <> '') Then
        begin
          If edt_DeptSort.Text = 'A' Then
            GroupList := GroupList + 'd.Department, '
          else GroupList := GroupList + 'd.Department DESC, ';
        end;
      If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(edt_RecordTypeSort.Text <> '') Then
        begin
          If edt_RecordTypeSort.Text = 'A' Then
            GroupList := GroupList + 'f.FileType, '
          else GroupList := GroupList + 'f.FileType DESC, ';
        end;
      If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(edt_RecordNumberSort.Text <> '') Then
        begin
          If edt_RecordNumberSort.Text = 'A' Then
            GroupList := GroupList + 'f.Filenumber, '
          else GroupList := GroupList + 'f.Filenumber DESC, ';
        end;
    //---
      For J := 1 to 15 Do
        begin
          If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
             (TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text <> '') Then
            begin
              A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
              TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
              Delete(TempStr, length(TempStr)-1, 2);

              If TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text = 'A' Then
                begin
                  If (A >= 1)AND(A <= 10) Then
                    GroupList := GroupList + 'f.Text'+InttoStr(A)+', '
                  else If (A >= 11)AND(A <= 13) Then
                    GroupList := GroupList + 'f.Date'+InttoStr(A-10)+', '
                  else If (A >= 14)AND(A <= 15) Then
                    GroupList := GroupList + 'f.Number'+InttoStr(A-13)+', ';
                end
              else
                begin
                  If (A >= 1)AND(A <= 10) Then
                    GroupList := GroupList + 'f.Text'+InttoStr(A)+' DESC, '
                  else If (A >= 11)AND(A <= 13) Then
                    GroupList := GroupList + 'f.Date'+InttoStr(A-10)+' DESC, '
                  else If (A >= 14)AND(A <= 15) Then
                    GroupList := GroupList + 'f.Number'+InttoStr(A-13)+' DESC, ';
                end;
            end;
        end;
    end;

  I := 0;

  If (StrtoIntDef(edt_BranchOrder.Text, 0) = I)AND(edt_BranchSort.Text <> '') Then
    begin
      If edt_BranchSort.Text = 'A' Then
        GroupList := GroupList + 'b.Branch, '
      else GroupList := GroupList + 'b.Branch DESC, ';
    end;
  If (StrtoIntDef(edt_DeptOrder.Text, 0) = I)AND(edt_DeptSort.Text <> '') Then
    begin
      If edt_DeptSort.Text = 'A' Then
        GroupList := GroupList + 'd.Department, '
      else GroupList := GroupList + 'd.Department DESC, ';
    end;
  If (StrtoIntDef(edt_RecordTypeOrder.Text, 0) = I)AND(edt_RecordTypeSort.Text <> '') Then
    begin
      If edt_RecordTypeSort.Text = 'A' Then
        GroupList := GroupList + 'f.FileType, '
      else GroupList := GroupList + 'f.FileType DESC, ';
    end;
  If (StrtoIntDef(edt_RecordNumberOrder.Text, 0) = I)AND(edt_RecordNumberSort.Text <> '') Then
    begin
      If edt_RecordNumberSort.Text = 'A' Then
        GroupList := GroupList + 'f.Filenumber, '
      else GroupList := GroupList + 'f.Filenumber DESC, ';
    end;
//---
  For J := 1 to 15 Do
    begin
      If (StrtoIntDef(TEdit(FindComponent('edt_ColOrder'+InttoStr(J))).Text, 0) = I)AND
         (TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text <> '') Then
        begin
          A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
          TempStr := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption;
          Delete(TempStr, length(TempStr)-1, 2);

          If TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text = 'A' Then
            begin
              If (A >= 1)AND(A <= 10) Then
                GroupList := GroupList + 'f.Text'+InttoStr(A)+', '
              else If (A >= 11)AND(A <= 13) Then
                GroupList := GroupList + 'f.Date'+InttoStr(A-10)+', '
              else If (A >= 14)AND(A <= 15) Then
                GroupList := GroupList + 'f.Number'+InttoStr(A-13)+', ';
            end
          else
            begin
              If (A >= 1)AND(A <= 10) Then
                GroupList := GroupList + 'f.Text'+InttoStr(A)+' DESC, '
              else If (A >= 11)AND(A <= 13) Then
                GroupList := GroupList + 'f.Date'+InttoStr(A-10)+' DESC, '
              else If (A >= 14)AND(A <= 15) Then
                GroupList := GroupList + 'f.Number'+InttoStr(A-13)+' DESC, ';
            end;
        end;
    end;

  Delete(GroupList, length(GroupList)-1, 2);
  If GroupList = '' Then
    GroupList := 'f.Filenumber';
//------------
  qry_Records.SQL.Add('SELECT '+FieldList);
  qry_Records.SQL.Add('FROM Branches b, Departments d, Files f');
  qry_Records.SQL.Add('WHERE f.Branch = b.Branch');
  qry_Records.SQL.Add('AND f.Branch = d.Branch');
  qry_Records.SQL.Add('AND f.Department = d.Department');
//----------------Filter------------
  If edt_Branch.Text <> '' Then
    qry_Records.SQL.Add('AND b.Branch = '+QuotedStr(edt_Branch.Text));
  If edt_Dept.Text <> '' Then
    qry_Records.SQL.Add('AND d.Department = '+QuotedStr(edt_Dept.Text));
  If edt_RecordType.Text <> '' Then
    qry_Records.SQL.Add('AND f.FileType = '+QuotedStr(edt_RecordType.Text));

  If cb_RecordNumber.Text <> '' Then
    qry_Records.SQL.Add('AND f.Filenumber = '+QuotedStr(cb_RecordNumber.Text));
//---
  For J := 1 to 15 Do
    begin
      A := TComboBox(FindComponent('lbl_Col'+InttoStr(J))).Tag;
      If (A >= 1)AND(A <= 10) Then      //Text
        begin
          TempStr := TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            qry_Records.SQL.Add('AND f.Text'+InttoStr(A)+' LIKE '+QuotedStr('%'+TempStr+'%'))
        end
      else If (A >= 10)AND(A <= 13) Then   //Date
        begin
          TempStr  := TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text;
          TempStr2 := TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text;
          If (TempStr <> '')AND(TempStr2 = '') Then
            begin
              qry_Records.SQL.Add('AND f.Date'+InttoStr(A-10)+' = :mDate'+InttoStr(A-10));
              qry_Records.Parameters.ParamByName('mDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
            end
          else If (TempStr <> '')AND(TempStr2 <> '') Then
            begin
              qry_Records.SQL.Add('AND f.Date'+InttoStr(A-10)+' >= :mFrDate'+InttoStr(A-10));
              qry_Records.Parameters.ParamByName('mFrDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
              qry_Records.SQL.Add('AND f.Date'+InttoStr(A-10)+' < :mToDate'+InttoStr(A-10));
              qry_Records.Parameters.ParamByName('mToDate'+InttoStr(A-10)).Value := StartoftheDay(StrtoDate(TempStr2)+1);
            end;
        end
      else If (A >= 14)AND(A <= 15) Then   //Number
        begin
          TempStr := TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            qry_Records.SQL.Add('AND f.Number'+InttoStr(A-13)+' = '+TempStr);
        end;
    end;
//------------
  qry_Records.SQL.Add('ORDER BY '+GroupList);
//--------------
  Screen.Cursor := crHourglass;
  try
    qry_Records.Open;
  finally
    Screen.Cursor := crDefault;
  end;
//==============================================================================
//==============================================================================
//==============================================================================
  If qry_Records.IsEmpty Then
    begin
      Messagedlg('No Results found.', mtInformation, [mbOK], 0);
      exit;
    end;
  grd_Results.DataSource := dts_Records;
  frm_Console.AutoSizeNewColumns(grd_Results);
  pg_Reports.ActivePageIndex := 1;
end;

end.
