//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Req;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls,
  Grids,DBGrids, Mask, Qrctrls, quickrpt, FileCtrl, ImgList, ADODB, Variants,
  Printers;

type
  PickRecord = Record
    Branch       :String[3];
    Department   :String[2];
    Tx_No        :Integer;
  end;
  Tfrm_Requisitions = class(TForm)
    dts_Deliver: TDataSource;
    tbl_Up: TADOTable;
    Panel1: TPanel;
    qry_Record: TADOQuery;
    qry_Requester: TADOQuery;
    qry_MultiFilesSearch: TADOQuery;
    ImageList1: TImageList;
    qry_Items: TADOQuery;
    qry_GetContainer: TADOQuery;
    qry_Loc: TADOQuery;
    qry_Insert: TADOQuery;
    qry_Container: TADOQuery;
    qry_Item: TADOQuery;
    qry_SQL: TADOQuery;
    BitBtn1: TSpeedButton;
    qry_Delivery: TADOQuery;
    qry_RecCat: TADOQuery;
    ds_SearchbyRecordType: TDataSource;
    sp_SearchbyRecordType: TADOStoredProc;
    sp_SearchbyBarcode: TADOStoredProc;
    ds_SearchbyBarcode: TDataSource;
    qry_AddPick: TADOQuery;
    qry_GetRecord: TADOQuery;
    dts_MultiFilesSearch: TDataSource;
    PrintDialog: TPrintDialog;
    sp_CheckUserBarcodeAccess: TADOStoredProc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lbl_DataType: TLabel;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    Label1: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    ScrollBox2: TScrollBox;
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
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    edt_Col1: TEdit;
    edt_Col2: TEdit;
    edt_Col3: TEdit;
    edt_Col4: TEdit;
    edt_Col5: TEdit;
    edt_Col6: TEdit;
    edt_Col7: TEdit;
    edt_Col8: TEdit;
    edt_Col9: TEdit;
    edt_Col10: TEdit;
    edt_Col11: TEdit;
    edt_Col12: TEdit;
    edt_Col13: TEdit;
    edt_Col14: TEdit;
    edt_Col15: TEdit;
    btn_Search: TBitBtn;
    rgrp_SearchType: TRadioGroup;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    GroupBox1: TGroupBox;
    lbl_SearchRecordCat: TLabel;
    editBarcode: TEdit;
    btn_SelRecordType: TButton;
    edt_RType: TEdit;
    rbtn_Barcode: TRadioButton;
    rbtn_RecordType: TRadioButton;
    cb_SearchRecordCat: TComboBox;
    chk_Partial: TCheckBox;
    TabSheet4: TTabSheet;
    lbl_MetaMulti: TLabel;
    Label7: TLabel;
    lbl_BranchMulti: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lbl_FilingAreaMulti: TLabel;
    Label21: TLabel;
    lbl_DepartmentMulti: TLabel;
    rgrp_TypeMulti: TRadioGroup;
    edt_BranchMulti: TEdit;
    btn_BranchMulti: TButton;
    edt_DepartmentMulti: TEdit;
    btn_DepartmentMulti: TButton;
    edt_FilingAreaMulti: TEdit;
    btn_FilingAreaMulti: TButton;
    sb_MetaMulti: TScrollBox;
    lblTextMulti1: TLabel;
    lblTextMulti2: TLabel;
    lblTextMulti3: TLabel;
    lblTextMulti4: TLabel;
    lblTextMulti5: TLabel;
    lblTextMulti6: TLabel;
    lblTextMulti7: TLabel;
    lblTextMulti8: TLabel;
    lblTextMulti9: TLabel;
    lblTextMulti10: TLabel;
    lblDateMulti1: TLabel;
    lblDateMulti2: TLabel;
    lblDateMulti3: TLabel;
    lblNumMulti1: TLabel;
    lblNumMulti2: TLabel;
    mem_TextMulti1: TMemo;
    mem_TextMulti2: TMemo;
    mem_TextMulti3: TMemo;
    mem_TextMulti4: TMemo;
    mem_TextMulti5: TMemo;
    mem_TextMulti6: TMemo;
    mem_TextMulti7: TMemo;
    mem_TextMulti8: TMemo;
    mem_TextMulti9: TMemo;
    mem_TextMulti10: TMemo;
    edt_DateMulti1: TEdit;
    edt_DateMulti2: TEdit;
    edt_DateMulti3: TEdit;
    edt_NumMulti1: TEdit;
    edt_NumMulti2: TEdit;
    GroupBox3: TGroupBox;
    btn_RecordTypeMulti: TButton;
    edt_RecordTypeMulti: TEdit;
    rbtn_RecordTypeMulti: TRadioButton;
    btn_SearchMulti: TBitBtn;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    grd_Results: TDBGrid;
    Panel2: TPanel;
    Label6: TLabel;
    btn_ViewItems: TSpeedButton;
    btn_ViewFiles: TSpeedButton;
    Panel4: TPanel;
    editPickingSend: TBitBtn;
    edtPickCancel: TBitBtn;
    btn_Print: TBitBtn;
    tv_PickingSlip: TTreeView;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    lbl_RTot: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    btn_RemovePick: TBitBtn;
    cb_ReqName: TComboBox;
    cb_ReqUserID: TComboBox;
    btn_SelAllItems: TBitBtn;
    DBNavigator2: TDBNavigator;
    cb_Delivery: TComboBox;
    TabSheet3: TTabSheet;
    rep_Result: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    lbl_Barcode: TQRLabel;
    ql_Text1: TQRLabel;
    ql_Text2: TQRLabel;
    ql_Text3: TQRLabel;
    ql_Text4: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    qrtxt_Barcode: TQRDBText;
    qrlbl4: TQRDBText;
    qrlbl3: TQRDBText;
    qrlbl2: TQRDBText;
    qrlbl1: TQRDBText;
    QRDBText2: TQRDBText;
    pnlEditUser: TPanel;
    Bevel3: TBevel;
    lbl_CtrlAuthCode: TLabel;
    lbl_CtrlSurname: TLabel;
    lbl_CtrlName: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label28: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edt_UserId: TDBEdit;
    edt_Surname: TDBEdit;
    edt_FirstName: TDBEdit;
    edt_Tel: TDBEdit;
    mem_DelAddr: TDBMemo;
    edt_eMail: TDBEdit;
    edt_Inits: TDBEdit;
    edt_Designation: TDBEdit;
    edt_EmployeeNo: TDBEdit;
    edt_Fax: TDBEdit;
    edt_Cell: TDBEdit;
    edt_CostCentre: TDBEdit;
    edt_InternalDept: TDBEdit;
    qry_AddRequester: TADOQuery;
    dts_AddRequester: TDataSource;
    DBNavigator1: TDBNavigator;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPickCancelClick(Sender: TObject);
    procedure editPickingSendClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_RemovePickClick(Sender: TObject);
    procedure tv_PickingSlipDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tv_PickingSlipDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure rgrp_SearchTypeClick(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbtn_BarcodeClick(Sender: TObject);
    procedure rbtn_RecordTypeClick(Sender: TObject);
    procedure rep_ResultBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure edt_RTypeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_SelAllItemsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_ViewItemsClick(Sender: TObject);
    procedure btn_BranchMultiClick(Sender: TObject);
    procedure btn_DepartmentMultiClick(Sender: TObject);
    procedure rgrp_TypeMultiClick(Sender: TObject);
    procedure btn_RecordTypeMultiClick(Sender: TObject);
    procedure edt_FilingAreaMultiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RecordTypeMultiChange(Sender: TObject);
    procedure btn_SearchMultiClick(Sender: TObject);
    procedure grd_ResultsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure grd_ResultsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_SearchRecordCatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_BranchChange(Sender: TObject);
    procedure edt_DeptChange(Sender: TObject);
    procedure edt_BranchMultiChange(Sender: TObject);
    procedure edt_DepartmentMultiChange(Sender: TObject);
    procedure edt_BranchMultiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DepartmentMultiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RecordTypeMultiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ViewFilesClick(Sender: TObject);
    procedure dts_AddRequesterStateChange(Sender: TObject);
    procedure cb_ReqNameSelect(Sender: TObject);
    procedure qry_AddRequesterAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    AddedPicks  :Array of PickRecord;
//-------
    function AddContainer():Boolean;
    function AddRecord():Boolean;
    function AddItem():Boolean;

    function VerifyContainerStatus(ContainerNumber :String):Boolean;
    function VerifyRecordStatus(RecordNumber :String):Boolean;
    function VerifyItemStatus(ItemNumber :String):Boolean;
    function ReqContainer(ContainerNumber :String):Boolean;
    function ReqRecord(RecordNumber :String):Boolean;
    function ReqItem(ItemNumber :String):Boolean;
    function CheckUserBarcodeAccess(Barcode, Requester :String):Boolean;
//-------
    function GeneratePickHead(Branch, Department, DeliveryType :String):Integer;
    Procedure SetupSearchFields;
    Procedure SetupSearchFieldsMulti;
    procedure BuildRequester(DefaultSelect  :String);
  public
    { Public declarations }
  end;

var
  frm_Requisitions  :Tfrm_Requisitions;
  Tipe              :Integer;

implementation

uses main, SelBranch, SelDept, SelRType, SelWHouse, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_Requisitions.BuildRequester(DefaultSelect  :String);
Var
  TempStr   :String;
begin
  cb_ReqUserID.Items.Clear;
  cb_ReqName.Items.Clear;

  qry_Requester.Open;
  qry_Requester.first;

  If frm_Console.AccessRight(49) Then
    begin
      cb_ReqName.Items.Append('Add New Requester...');
      cb_ReqUserID.Items.Append('Add New Requester...');
    end;

  while not qry_requester.eof do
    begin
      TempStr := trim(trim(qry_Requester.FieldByname('Name').AsString) + ' ' + trim(qry_Requester.FieldByname('Surname').AsString));
      If TempStr <> '' Then
        begin
          cb_ReqName.Items.Append(TempStr);
          cb_ReqUserID.Items.Append(trim(qry_Requester.FieldByname('UserId').AsString));
          If DefaultSelect = trim(qry_Requester.FieldByname('UserId').AsString) Then
            cb_ReqName.ItemIndex := cb_ReqName.Items.IndexOf(TempStr);
        end;
      qry_Requester.Next;
    end;
  qry_Requester.Close;
end;

procedure Tfrm_Requisitions.FormCreate(Sender: TObject);
begin
  lbl_SearchRecordCat.Visible := false;
  cb_SearchRecordCat.Visible := false;

  rgrp_SearchType.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);
  rgrp_TypeMulti.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);

  PageControl1.ActivePage := Tabsheet1;
  Tabsheet3.TabVisible := False;

  Screen.Cursor := crHourglass;
//=====Don't display fields = no record type selected======
  Scrollbox2.Visible := False;
  sb_MetaMulti.Visible := False;

  BuildRequester('!@#$%');
//==============================================================================
  If (frm_Console.AccessSysAdmin) Then
    begin
      qry_Delivery.Close;
      qry_Delivery.SQL.Clear;
      qry_Delivery.SQL.Add('SELECT');
      qry_Delivery.SQL.Add('	d.Description');
      qry_Delivery.SQL.Add('FROM');
      qry_Delivery.SQL.Add('	Delivery d');
      qry_Delivery.SQL.Add('WHERE');
      qry_Delivery.SQL.Add('	d.Description <> ''Filing Clerk''');
      qry_Delivery.SQL.Add('ORDER BY d.Description');
      qry_Delivery.Open;
    end
  else
    begin
      qry_Delivery.Close;
      qry_Delivery.SQL.Clear;
      qry_Delivery.SQL.Add('SELECT');
      qry_Delivery.SQL.Add('	d.Description');
      qry_Delivery.SQL.Add('FROM');
      qry_Delivery.SQL.Add('	Delivery d');
      qry_Delivery.SQL.Add('WHERE');
      qry_Delivery.SQL.Add('	d.Description <> ''Filing Clerk''');
      qry_Delivery.SQL.Add('	AND (');
      qry_Delivery.SQL.Add('');
      qry_Delivery.SQL.Add('(d.Description IN (SELECT a.DeliveryType FROM DTAuthRts a WHERE a.UserId = :ID1))');
      qry_Delivery.SQL.Add('OR');
      qry_Delivery.SQL.Add('(d.Description IN (SELECT a.DeliveryType FROM DTAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = :ID2))');
      qry_Delivery.SQL.Add(')');
      qry_Delivery.SQL.Add('ORDER BY d.Description');
      qry_Delivery.Parameters.ParamByName('ID1').Value := User;
      qry_Delivery.Parameters.ParamByName('ID2').Value := User;
      qry_Delivery.Open;
    end;
  cb_Delivery.Items.Clear;
  While not qry_Delivery.EOF Do
    begin
      cb_Delivery.Items.Append(trim(qry_Delivery.FieldbyName('Description').AsString));
      qry_Delivery.Next;
    end;
  qry_Delivery.Close;
//==============================================================================
  rgrp_SearchTypeClick(rgrp_SearchType);
  rgrp_TypeMultiClick(rgrp_TypeMulti);
  Screen.Cursor := crDefault;

  chk_Partial.checked := (frm_Console.PartialSearch = 1);
end;

procedure Tfrm_Requisitions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_requester.Active := false;
  frm_Console.act_Reqs.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_Requisitions.edtPickCancelClick(Sender: TObject);
begin
  If MessageDlg('Are you sure you want to clear the Picking List?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
  tv_PickingSlip.Items.Clear;
end;

procedure Tfrm_Requisitions.editPickingSendClick(Sender: TObject);
var
  i           :integer;
  TempTreeRecord      :TTreeNode;
  Z,A                 :Integer;
begin
  SetLength(AddedPicks, 0);
  Screen.Cursor := crHourglass;
  try
//==============================================================================
    If cb_ReqName.Text = '' then
      begin
        MessageDlg('Select a Requester!!',mtError,[mbOK],0);
        exit;
      end;
//==============================================================================
    If cb_Delivery.Text = '' then
      begin
        MessageDlg('Select a Delivery Method!!',mtError,[mbOK],0);
        exit;
      end;
//==============================================================================
    If tv_PickingSlip.Items.Count = 0 then
      begin
        MessageDlg('No Picking List entries created',mtError,[mbOK],0);
        exit;
      end;
    If tv_PickingSlip.Items.Count > 0 then
      begin
        For I := 0 to tv_PickingSlip.Items.Count-1 do
          begin
            TempTreeRecord := tv_PickingSlip.Items.Item[I];
            If (TempTreeRecord.Level = 0)and(TempTreeRecord.ImageIndex = 1) then//Record
              begin
//----
                If TempTreeRecord.HasChildren Then
                  begin
                    For Z := 0 to TempTreeRecord.Count-1 Do
                      begin
                        If not VerifyItemStatus(TempTreeRecord.Item[Z].Text) Then
                          exit;
                      end;
                  end
                else
                  begin
                    If not VerifyRecordStatus(TempTreeRecord.Text) Then
                      exit;
                  end;
//----
              end
            else If (TempTreeRecord.Level = 0)and(TempTreeRecord.ImageIndex = 0) then//Container
              begin
                If not VerifyContainerStatus(TempTreeRecord.Text) Then
                  exit;
//---Records in Container
                If TempTreeRecord.HasChildren Then //Records
                  begin
                    for Z := 0 to TempTreeRecord.Count-1 do
                      begin
//---Items in Record
                        If TempTreeRecord.Item[Z].HasChildren Then
                          begin
                            for A := 0 to TempTreeRecord.Item[Z].Count-1 do
                              begin
                                If not VerifyItemStatus(TempTreeRecord.Item[Z].Item[A].Text) Then
                                  exit;
                              end
                          end
                        else
                          begin
                            If not VerifyRecordStatus(TempTreeRecord.Item[Z].Text) Then
                              exit;
                          end;
                      end;
                  end;
              end;
          end; //For I = 0 to
      end;
//==================Finished checking for entries to create=====================
//==============================================================================
//========================Details===============================================
//========================Details===============================================
//========================Details===============================================
    If tv_PickingSlip.Items.Count > 0 then
      begin
        For I := 0 to tv_PickingSlip.Items.Count-1 do
          begin
            TempTreeRecord := tv_PickingSlip.Items.Item[I];
            If (TempTreeRecord.Level = 0)and(TempTreeRecord.ImageIndex = 1) then//Record
              begin
//---------------Request Items
                If TempTreeRecord.HasChildren Then
                  begin
                    for Z := 0 to TempTreeRecord.Count-1 do
                      ReqItem(TempTreeRecord.Item[Z].Text);
                  end
//---------------else Request Record
                else
                  begin
                    ReqRecord(TempTreeRecord.Text);
                  end;
//----
              end
            else If (TempTreeRecord.Level = 0)and(TempTreeRecord.ImageIndex = 0) then//Container
              begin
//---------------Request Items
                If TempTreeRecord.HasChildren Then
                  begin
                    for Z := 0 to TempTreeRecord.Count-1 do
                      begin
                        If TempTreeRecord.Item[Z].HasChildren Then
                          begin
                            for A := 0 to TempTreeRecord.Item[Z].Count-1 do
                              begin
                                ReqItem(TempTreeRecord.Item[Z].Item[A].Text);
                              end;
                          end
//---------------Request Record
                        else
                          begin
                            ReqRecord(TempTreeRecord.Item[Z].Text);
                          end;
                      end;
                  end
                else
                  begin
                    ReqContainer(TempTreeRecord.Text);
                  end;
              end;
          end; //For I = 0 to
      end;
    MessageDlg('Pick list created',mtInformation,[mbOK],0);
    tv_PickingSlip.Items.Clear;
    PageControl1.ActivePageIndex := 0;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Requisitions.btn_BranchMultiClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_BranchMulti.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_BranchMulti.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_DepartmentMulti.Text := '';
      lbl_DepartmentMulti.Caption := '---';
      edt_RecordTypeMulti.Text := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Requisitions.btn_DepartmentMultiClick(Sender: TObject);
begin
  If length(edt_BranchMulti.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_BranchMulti.Text, User) = mrOK Then
    begin
      edt_DepartmentMulti.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_DepartmentMulti.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
      edt_RecordTypeMulti.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Requisitions.btn_PrintClick(Sender: TObject);
begin
  If not PrintDialog.Execute Then
    exit;

  rep_Result.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  rep_Result.Print;
end;

procedure Tfrm_Requisitions.btn_SearchClick(Sender: TObject);
var
  J,A            :Integer;
  LabelStr       :String;
  FillInFlag     :Boolean;
begin
//=================================================================
//==============Check if requred fields contains values
//=================================================================
  if (length(edt_Branch.Text) = 0) Then
    begin
      MessageDlg('Please select the Branch!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_Dept.Text) = 0) then
    begin
      MessageDlg('Please select the Department!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_RType.Text) = 0)and(rbtn_RecordType.Checked) Then
    begin
      MessageDlg('Please select the Record Type!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;

  if (length(editBarcode.Text) = 0)and(rbtn_Barcode.Checked) Then
    begin
      MessageDlg('Please scan/enter the Barcode!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (rbtn_RecordType.Checked) Then
    begin
      FillInFlag := False;
      if (edt_Col1.Text <> '')and(edt_Col1.Visible) Then FillInFlag := True;
      if (edt_Col2.Text <> '')and(edt_Col2.Visible) Then FillInFlag := True;
      if (edt_Col3.Text <> '')and(edt_Col3.Visible) Then FillInFlag := True;
      if (edt_Col4.Text <> '')and(edt_Col4.Visible) Then FillInFlag := True;
      if (edt_Col5.Text <> '')and(edt_Col5.Visible) Then FillInFlag := True;
      if (edt_Col6.Text <> '')and(edt_Col6.Visible) Then FillInFlag := True;
      if (edt_Col7.Text <> '')and(edt_Col7.Visible) Then FillInFlag := True;
      if (edt_Col8.Text <> '')and(edt_Col8.Visible) Then FillInFlag := True;
      if (edt_Col9.Text <> '')and(edt_Col9.Visible) Then FillInFlag := True;
      if (edt_Col10.Text <> '')and(edt_Col10.Visible) Then FillInFlag := True;
      if (edt_Col11.Text <> '')and(edt_Col11.Visible) Then FillInFlag := True;
      if (edt_Col12.Text <> '')and(edt_Col12.Visible) Then FillInFlag := True;
      if (edt_Col13.Text <> '')and(edt_Col13.Visible) Then FillInFlag := True;
      if (edt_Col14.Text <> '')and(edt_Col14.Visible) Then FillInFlag := True;
      if (edt_Col15.Text <> '')and(edt_Col15.Visible) Then FillInFlag := True;

      if not FillInFlag Then
        begin
          MessageDlg('Please specify some search criteria!!',mtError,[mbOK],0);
          Screen.Cursor := crDefault;
          exit;
        end;
    end;
//====================Container=================================================
  If rgrp_SearchType.ItemIndex = 0 Then
    begin
      If rbtn_RecordType.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManRecordType, edt_RType.Text);

          sp_SearchbyRecordType.Close;
          For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
            sp_SearchbyRecordType.Parameters[J].Value := null;
          sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'CONTAINERS';
          sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RType.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

          For J := 1 to 15 Do
            begin
              If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
                begin
                  A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
                  LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
                  If LabelStr <> '' Then
                    begin
                      If (A >= 1)and(A <= 10)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                        end
                      else if (A >= 11)and(A <= 13)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                        end
                      else if (A >= 14)and(A <= 15)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                        end;
                    end;
                end;
            end;

          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyRecordType;
            sp_SearchbyRecordType.Open;
            sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
            sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyRecordType.FieldByName('HasFiles').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyRecordType.RecordCount);
          btn_ViewItems.Visible := False;
          btn_ViewFiles.Visible := True;
          If not sp_SearchbyRecordType.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end
      else if rbtn_Barcode.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManDepartment, edt_Dept.Text);

          sp_SearchbyBarcode.Close;
          For J := 0 to sp_SearchbyBarcode.Parameters.Count-1 Do
            sp_SearchbyBarcode.Parameters[J].Value := null;
          sp_SearchbyBarcode.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyBarcode.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyBarcode.Parameters.ParamByName('@SearchType').Value := 'CONTAINERS';
          sp_SearchbyBarcode.Parameters.ParamByName('@Barcode').Value := editBarcode.Text;
          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyBarcode.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyBarcode.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyBarcode;
            sp_SearchbyBarcode.Open;
            sp_SearchbyBarcode.FieldByName('ReqAble').Visible := False;
            sp_SearchbyBarcode.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyBarcode.FieldByName('HasFiles').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyBarcode.RecordCount);
          btn_ViewItems.Visible := False;
          btn_ViewFiles.Visible := True;
          If not sp_SearchbyBarcode.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end;
    end;
//=======================Files==================================================
  If rgrp_SearchType.ItemIndex = 1 Then
    begin
      If rbtn_RecordType.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RType.Text);
          if cb_SearchRecordCat.Visible then
            dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordCat, cb_SearchRecordCat.Text)
          else
            dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordCat, '');

          sp_SearchbyRecordType.Close;
          For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
            sp_SearchbyRecordType.Parameters[J].Value := null;
          sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'FILES';
          sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RType.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

          For J := 1 to 15 Do
            begin
              If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
                begin
                  A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
                  LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
                  If LabelStr <> '' Then
                    begin
                      If (A >= 1)and(A <= 10)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                        end
                      else if (A >= 11)and(A <= 13)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                        end
                      else if (A >= 14)and(A <= 15)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                        end;
                    end;
                end;
            end;

          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyRecordType;
            sp_SearchbyRecordType.Open;
            sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
            sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyRecordType.FieldByName('ReqAbleInternally').Visible := False;
            sp_SearchbyRecordType.FieldByName('HasItems').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyRecordType.RecordCount);
          btn_ViewItems.Visible := True;
          btn_ViewFiles.Visible := False;
          If not sp_SearchbyRecordType.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end
      else if rbtn_Barcode.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);

          sp_SearchbyBarcode.Close;
          For J := 0 to sp_SearchbyBarcode.Parameters.Count-1 Do
            sp_SearchbyBarcode.Parameters[J].Value := null;
          sp_SearchbyBarcode.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyBarcode.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyBarcode.Parameters.ParamByName('@SearchType').Value := 'FILES';
          sp_SearchbyBarcode.Parameters.ParamByName('@Barcode').Value := editBarcode.Text;
          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyBarcode.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyBarcode.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyBarcode;
            sp_SearchbyBarcode.Open;
            sp_SearchbyBarcode.FieldByName('ReqAble').Visible := False;
            sp_SearchbyBarcode.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyBarcode.FieldByName('ReqAbleInternally').Visible := False;
            sp_SearchbyBarcode.FieldByName('HasItems').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyBarcode.RecordCount);
          btn_ViewItems.Visible := True;
          btn_ViewFiles.Visible := False;
          If not sp_SearchbyBarcode.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end;
    end;
//=======================Items==================================================
  If rgrp_SearchType.ItemIndex = 2 Then
    begin
      If rbtn_RecordType.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RType.Text);

          sp_SearchbyRecordType.Close;
          For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
            sp_SearchbyRecordType.Parameters[J].Value := null;
          sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'ITEMS';
          sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RType.Text;
          sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

          For J := 1 to 15 Do
            begin
              If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
                begin
                  A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
                  LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
                  If LabelStr <> '' Then
                    begin
                      If (A >= 1)and(A <= 10)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                        end
                      else if (A >= 11)and(A <= 13)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                        end
                      else if (A >= 14)and(A <= 15)Then
                        begin
                          sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                        end;
                    end;
                end;
            end;

          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyRecordType;
            sp_SearchbyRecordType.Open;
            sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
            sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyRecordType.FieldByName('ReqAbleInternally').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyRecordType.RecordCount);
          btn_ViewItems.Visible := False;
          btn_ViewFiles.Visible := False;
          If not sp_SearchbyRecordType.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end
      else if rbtn_Barcode.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);

          sp_SearchbyBarcode.Close;
          For J := 0 to sp_SearchbyBarcode.Parameters.Count-1 Do
            sp_SearchbyBarcode.Parameters[J].Value := null;
          sp_SearchbyBarcode.Parameters.ParamByName('@ReqUserId').Value := User;
          sp_SearchbyBarcode.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
          sp_SearchbyBarcode.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
          sp_SearchbyBarcode.Parameters.ParamByName('@SearchType').Value := 'ITEMS';
          sp_SearchbyBarcode.Parameters.ParamByName('@Barcode').Value := editBarcode.Text;
          If trim(edt_WHouse.Text) <> '' Then
            sp_SearchbyBarcode.Parameters.ParamByName('@Warehouse').Value := edt_WHouse.Text;

          sp_SearchbyBarcode.Parameters.ParamByName('@ShowImageStatus').Value := False;
    //--------
          Screen.Cursor := CrHourglass;
          try
            grd_Results.Columns.Clear;
            grd_Results.DataSource := ds_SearchbyBarcode;
            sp_SearchbyBarcode.Open;
            sp_SearchbyBarcode.FieldByName('ReqAble').Visible := False;
            sp_SearchbyBarcode.FieldByName('IssueStatus').Visible := False;
            sp_SearchbyBarcode.FieldByName('ReqAbleInternally').Visible := False;
            frm_Console.AutoSizeNewColumns(grd_Results);
            PageControl1.ActivePage := Tabsheet2;
          finally
            Screen.Cursor := CrDefault;
          end;
          lbl_RTot.Caption := InttoStr(sp_SearchbyBarcode.RecordCount);
          btn_ViewItems.Visible := False;
          btn_ViewFiles.Visible := False;
          If not sp_SearchbyBarcode.isEmpty Then
            exit;
          MessageDLG('No records found',mtInformation,[mbOK],0);
        end;
    end;
end;

procedure Tfrm_Requisitions.btn_RecordTypeMultiClick(Sender: TObject);
begin
  If length(edt_DepartmentMulti.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(True,
                          edt_BranchMulti.Text,
                          edt_DepartmentMulti.Text,
                          User,
                          (rgrp_TypeMulti.ItemIndex = 0),
                          (rgrp_TypeMulti.ItemIndex = 1),
                          (rgrp_TypeMulti.ItemIndex = 2),
                          False,
                          False) = mrOK Then
    begin
      If frm_SelRType.IsGen Then
        edt_RecordTypeMulti.Text := '"General Search"'
      else edt_RecordTypeMulti.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
      lbl_DataType.Caption := 'Record Type Details:';
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Requisitions.btn_RemovePickClick(Sender: TObject);
begin
  try
    tv_PickingSlip.Selected.Delete;
  except
    Showmessage('Please select a Node first!!');
  end;
end;


procedure Tfrm_Requisitions.tv_PickingSlipDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  If (Source = grd_Results)Then
    Accept := True
  else Accept := False;
end;

procedure Tfrm_Requisitions.tv_PickingSlipDragDrop(Sender, Source: TObject;
  X, Y: Integer);
Var
  J                       :Integer;
begin
  If UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'CONTAINER' Then
    AddContainer()
  else if UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'FILENUMBER' Then
    AddRecord()
  else if UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'ITEMNUMBER' Then
    AddItem();
  For J := 0 to tv_PickingSlip.Items.Count-1 Do
    If tv_PickingSlip.Items.Item[J].Level = 0 Then
      tv_PickingSlip.Items.Item[J].Expand(True);
end;

procedure Tfrm_Requisitions.btn_SelBranchClick(Sender: TObject);
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

procedure Tfrm_Requisitions.btn_SelDeptClick(Sender: TObject);
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

procedure Tfrm_Requisitions.rgrp_SearchTypeClick(Sender: TObject);
VAR
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
begin
Screen.Cursor := crHourglass;
try
  edt_RType.Text := '';
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '---';

  If rgrp_SearchType.ItemIndex = 0 Then
    begin
      rbtn_RecordType.Caption := 'Container Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManRecordType);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_Dept.Text := '';
              lbl_Dept.Caption := '---';
              edt_RType.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_Branch.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_Branch.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RType.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_Dept.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_Branch.Text,
                                  edt_Dept.Text,
                                  User,
                                  (rgrp_SearchType.ItemIndex = 0),
                                  (rgrp_SearchType.ItemIndex = 1),
                                  (rgrp_SearchType.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_DataType.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
  If rgrp_SearchType.ItemIndex = 1 Then
    begin
      rbtn_RecordType.Caption := 'File Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);
      RecordCatCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordCat);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_Dept.Text := '';
              lbl_Dept.Caption := '---';
              edt_RType.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_Branch.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_Branch.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RType.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_Dept.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_Branch.Text,
                                  edt_Dept.Text,
                                  User,
                                  (rgrp_SearchType.ItemIndex = 0),
                                  (rgrp_SearchType.ItemIndex = 1),
                                  (rgrp_SearchType.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_DataType.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
      if cb_SearchRecordCat.Visible then
        If cb_SearchRecordCat.Items.IndexOf(RecordCatCookie) <> -1 Then
          cb_SearchRecordCat.ItemIndex := cb_SearchRecordCat.Items.IndexOf(RecordCatCookie);
    end;
  If rgrp_SearchType.ItemIndex = 2 Then
    begin
      rbtn_RecordType.Caption := 'Item Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_Dept.Text := '';
              lbl_Dept.Caption := '---';
              edt_RType.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_Branch.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_Branch.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RType.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_Dept.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_Branch.Text,
                                  edt_Dept.Text,
                                  User,
                                  (rgrp_SearchType.ItemIndex = 0),
                                  (rgrp_SearchType.ItemIndex = 1),
                                  (rgrp_SearchType.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_DataType.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure Tfrm_Requisitions.rgrp_TypeMultiClick(Sender: TObject);
VAR
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
begin
Screen.Cursor := crHourglass;
try
  edt_RecordTypeMulti.Text := '';
  edt_FilingAreaMulti.Text := '';
  lbl_FilingAreaMulti.Caption := '---';

  If rgrp_TypeMulti.ItemIndex = 0 Then
    begin
      rbtn_RecordTypeMulti.Caption := 'Container Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManRecordType);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_BranchMulti.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_BranchMulti.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_DepartmentMulti.Text := '';
              lbl_DepartmentMulti.Caption := '---';
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_BranchMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_BranchMulti.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_DepartmentMulti.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_DepartmentMulti.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_DepartmentMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;

          frm_SelRType.OpenDbOnly(edt_BranchMulti.Text,
                                  edt_DepartmentMulti.Text,
                                  User,
                                  (rgrp_TypeMulti.ItemIndex = 0),
                                  (rgrp_TypeMulti.ItemIndex = 1),
                                  (rgrp_TypeMulti.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RecordTypeMulti.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_MetaMulti.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
  If rgrp_TypeMulti.ItemIndex = 1 Then
    begin
      rbtn_RecordTypeMulti.Caption := 'File Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);
      RecordCatCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordCat);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_BranchMulti.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_BranchMulti.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_DepartmentMulti.Text := '';
              lbl_DepartmentMulti.Caption := '---';
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_BranchMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_BranchMulti.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_DepartmentMulti.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_DepartmentMulti.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_DepartmentMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_BranchMulti.Text,
                                  edt_DepartmentMulti.Text,
                                  User,
                                  (rgrp_TypeMulti.ItemIndex = 0),
                                  (rgrp_TypeMulti.ItemIndex = 1),
                                  (rgrp_TypeMulti.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RecordTypeMulti.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_MetaMulti.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
  If rgrp_TypeMulti.ItemIndex = 2 Then
    begin
      rbtn_RecordTypeMulti.Caption := 'Item Record Type';

      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_BranchMulti.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_BranchMulti.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
              edt_DepartmentMulti.Text := '';
              lbl_DepartmentMulti.Caption := '---';
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_BranchMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_BranchMulti.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_DepartmentMulti.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_DepartmentMulti.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
              edt_RecordTypeMulti.Text := '';
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_DepartmentMulti.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_BranchMulti.Text,
                                  edt_DepartmentMulti.Text,
                                  User,
                                  (rgrp_TypeMulti.ItemIndex = 0),
                                  (rgrp_TypeMulti.ItemIndex = 1),
                                  (rgrp_TypeMulti.ItemIndex = 2),
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RecordTypeMulti.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
              lbl_MetaMulti.Caption := 'Record Type Details:';
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure Tfrm_Requisitions.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_Dept.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(True,
                          edt_Branch.Text,
                          edt_Dept.Text,
                          User,
                          (rgrp_SearchType.ItemIndex = 0),
                          (rgrp_SearchType.ItemIndex = 1),
                          (rgrp_SearchType.ItemIndex = 2),
                          False,
                          False) = mrOK Then
    begin
      If frm_SelRType.IsGen Then
        edt_RType.Text := '"General Search"'
      else edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
      lbl_DataType.Caption := 'Record Type Details:';
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Requisitions.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  Case rgrp_SearchType.ItemIndex of
    0 : frm_SelWHouse.Flag3D := 1;
    1 : frm_SelWHouse.Flag3D := 0;
  end;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Requisitions.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
end;

procedure Tfrm_Requisitions.rbtn_BarcodeClick(Sender: TObject);
begin
  if rbtn_Barcode.Checked Then
    begin
      edt_RType.Visible := False;
      btn_SelRecordType.Visible := False;
      lbl_SearchRecordCat.Visible := False;
      cb_SearchRecordCat.Visible := False;
      editBarcode.Visible := True;
      tv_PickingSlip.Items.Clear;
     end;
end;

procedure Tfrm_Requisitions.rbtn_RecordTypeClick(Sender: TObject);
begin
  if rbtn_RecordType.Checked Then
    begin
      edt_RType.Visible := True;
      btn_SelRecordType.Visible := True;
      SetupSearchFields;
      editBarcode.Visible := False;
      tv_PickingSlip.Items.Clear;
    end;
end;

procedure Tfrm_Requisitions.rep_ResultBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  rep_Result.DataSet := grd_Results.DataSource.DataSet;

  lbl_Barcode.Caption := grd_Results.DataSource.DataSet.Fields[0].FieldName;
  qrtxt_Barcode.DataSet := grd_Results.DataSource.DataSet;
  qrtxt_Barcode.DataField  := grd_Results.DataSource.DataSet.Fields[0].FieldName;

  qrlbl1.DataSet := grd_Results.DataSource.DataSet;
  qrlbl2.DataSet := grd_Results.DataSource.DataSet;
  qrlbl3.DataSet := grd_Results.DataSource.DataSet;
  qrlbl4.DataSet := grd_Results.DataSource.DataSet;
  QRDBText2.DataSet := grd_Results.DataSource.DataSet;

  If (grd_Results.DataSource.DataSet.Fields[0].FieldName = 'Filenumber')or
     (grd_Results.DataSource.DataSet.Fields[0].FieldName = 'Itemnumber')Then
    begin
      If grd_Results.DataSource.DataSet.FieldCount > 6 Then
        qrlbl1.DataField := grd_Results.DataSource.DataSet.Fields[6].Fieldname
      else qrlbl1.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 7 Then
        qrlbl2.DataField := grd_Results.DataSource.DataSet.Fields[7].Fieldname
      else qrlbl2.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 8 Then
        qrlbl3.DataField := grd_Results.DataSource.DataSet.Fields[8].Fieldname
      else qrlbl3.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 9 Then
        qrlbl4.DataField := grd_Results.DataSource.DataSet.Fields[9].Fieldname
      else qrlbl4.DataField := '';

      QRDBText2.DataField := grd_Results.DataSource.DataSet.Fields[2].Fieldname
    end
  else
    begin
      If grd_Results.DataSource.DataSet.FieldCount > 5 Then
        qrlbl1.DataField := grd_Results.DataSource.DataSet.Fields[5].Fieldname
      else qrlbl1.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 6 Then
        qrlbl2.DataField := grd_Results.DataSource.DataSet.Fields[6].Fieldname
      else qrlbl2.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 7 Then
        qrlbl3.DataField := grd_Results.DataSource.DataSet.Fields[7].Fieldname
      else qrlbl3.DataField := '';
      If grd_Results.DataSource.DataSet.FieldCount > 8 Then
        qrlbl4.DataField := grd_Results.DataSource.DataSet.Fields[8].Fieldname
      else qrlbl4.DataField := '';

      QRDBText2.DataField := grd_Results.DataSource.DataSet.Fields[1].Fieldname
    end;
end;

function Tfrm_Requisitions.VerifyContainerStatus(ContainerNumber :String):Boolean;
Var
  mloc, mWare   :String;
begin
  Result := False;
  try
//---
    qry_GetContainer.Close;
    qry_GetContainer.SQL.Clear;
    qry_GetContainer.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CO');
    qry_GetContainer.Parameters.ParamByName('CO').Value := ContainerNumber;
    qry_GetContainer.Open;
//---
    IF qry_GetContainer.IsEmpty Then
      begin
        MessageDlg('Container '+ContainerNumber+' not found in system!!', mtError,[mbOk], 0);
        exit;
      end;
//---
    If not CheckUserBarcodeAccess(ContainerNumber, cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex]) Then
      begin
        MessageDlg('Requester '+cb_ReqName.Text+' has insufficient Rights to Receive '+ContainerNumber+'.', mtInformation,[mbOk], 0);
        exit;
      end;
//---
    If qry_GetContainer['IssueStatus'] = 'MET' then
      begin
        MessageDlg('Container '+ContainerNumber+' is off Site!!', mtInformation,[mbOk], 0);
        exit;
      end;
//---
    If (qry_GetContainer['IssueStatus'] <> 'IN')and(qry_GetContainer['IssueStatus'] <> 'MIN')then
      begin
        MessageDlg('Container '+ContainerNumber+' is not IN!!', mtInformation,[mbOk], 0);
        exit;
      end;
//---
    mware := qry_GetContainer.FieldbyName('Warehouse').asString;
    mloc := qry_GetContainer.FieldbyName('Locno').asString;
    qry_GetContainer.Close;
    qry_GetContainer.SQL.Clear;
    qry_GetContainer.SQL.Add('SELECT * FROM LOCATION WHERE(WAREHOUSE = :WH)AND(LOCNO = :LN)');
    qry_GetContainer.Parameters.ParamByName('WH').Value := mware;
    qry_GetContainer.Parameters.ParamByName('LN').Value := mloc;
    qry_GetContainer.Open;
    If qry_GetContainer.IsEmpty Then
      begin
        MessageDlg('File is in a Container; Location invalid for Container: '+ContainerNumber+'!', mtError,[mbOk], 0);
        exit;
      end;
    Result := True;
  finally
    qry_GetContainer.Close;
  end;
end;

function Tfrm_Requisitions.VerifyRecordStatus(RecordNumber :String):Boolean;
Var
  mloc, mWare   :String;
begin
  Result := False;
  try
    qry_Record.Close;
    qry_Record.SQL.Clear;
    qry_Record.SQL.Add('SELECT IssueStatus, LocNo, Warehouse FROM FILES WHERE FILENUMBER = :FN');
    qry_Record.Parameters.ParamByName('FN').Value := RecordNumber;
//    qry_Record.RequestLive := True;
    qry_Record.Open;
//-----
    If qry_Record.IsEmpty Then
      begin
        MessageDlg('File '+Recordnumber+' not found in database!!', mtInformation,[mbOk], 0);
        exit;
      end;
//---
    If not CheckUserBarcodeAccess(Recordnumber, cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex]) Then
      begin
        MessageDlg('Requester '+cb_ReqName.Text+' has insufficient Rights to Receive '+Recordnumber+'.', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] = 'CON' then
      begin
        Result := True;
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] = 'MET' then
      begin
        MessageDlg('File "'+Recordnumber+'" is off Site ', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] = 'PW' then
      begin
        MessageDlg('File "'+Recordnumber+'" has been Permanently Withdrawn.', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] = 'DES' then
      begin
        MessageDlg('File "'+Recordnumber+'" has been Destroyed.', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] = 'MI' then
      begin
        MessageDlg('File "'+Recordnumber+'" has been flagged for interfiling. Please use the "Match Items" in the Filing Area Module.', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    If qry_Record['IssueStatus'] <> 'IN' then
      begin
        MessageDlg('File "'+Recordnumber+'" is not in the Filing Area.', mtInformation,[mbOk], 0);
        exit;
      end;
//-----
    mloc := qry_Record.FieldByName('locno').AsString;
    mware := qry_Record.FieldByName('warehouse').AsString;
//---
    qry_Record.Close;
    qry_Record.SQL.Clear;
    qry_Record.SQL.Add('SELECT Warehouse, LocNo FROM LOCATION WHERE(LOCNO = :LN)AND(WAREHOUSE = :WH)');
    qry_Record.Parameters.ParamByName('LN').Value := mloc;
    qry_Record.Parameters.ParamByName('WH').Value := mware;
    qry_Record.Open;
    If qry_Record.IsEmpty Then
      begin
        MessageDlg('Location invalid for File '+RecordNumber+'!', mtError,[mbOk], 0);
        exit;
      end;

    Result := True;
  finally
    qry_Record.Close;
  end;
end;

function Tfrm_Requisitions.VerifyItemStatus(ItemNumber :String):Boolean;
begin
  Result := False;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT * FROM Delivery WHERE Description = :DS');
    qry_SQL.Parameters.ParamByName('DS').Value := cb_Delivery.Text;
    qry_SQL.Open;
    If qry_SQL.FieldByName('RequisitionType').AsString = 'Destruction' Then
      begin
        qry_SQL.Close;
        MessageDlg('Items cannot be requested for Destruction.', mtInformation, [mbOk], 0);
        exit;
      end;
    If qry_SQL.FieldByName('RequisitionType').AsString = 'Off-Site' Then
      begin
        qry_SQL.Close;
        MessageDlg('Items cannot be requested for Off-Site.', mtInformation, [mbOk], 0);
        exit;
      end;
    qry_SQL.Close;

    qry_Items.Close;
    qry_Items.SQL.Clear;
    qry_Items.SQL.Add('SELECT * FROM ITEMS WHERE ITEMNUMBER = :IN');
    qry_Items.Parameters.ParamByName('IN').Value := Itemnumber;
    qry_Items.Open;
    If qry_Items.IsEmpty Then
      begin
        MessageDlg('Item: '+Itemnumber+' not found in the system!!', mtError,[mbOk], 0);
        exit;
      end; //isEmpty
//---
    If not CheckUserBarcodeAccess(Itemnumber, cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex]) Then
      begin
        MessageDlg('Requester '+cb_ReqName.Text+' has insufficient Rights to Receive '+Itemnumber+'.', mtInformation,[mbOk], 0);
        exit;
      end;
    If qry_Items.FieldByName('Status').asString = 'O' then
      begin
        MessageDlg('Item "'+Itemnumber+'" is out.', mtInformation,[mbOk], 0);
        exit;
      end;
    If qry_Items.FieldByName('Status').asString = 'R' then
      begin
        MessageDlg('Item "'+Itemnumber+'" is received.', mtInformation,[mbOk], 0);
        exit;
      end;
    If qry_Items.FieldByName('Status').asString = 'PW' then
      begin
        MessageDlg('Item "'+Itemnumber+'" is Permanently Withdrawn.', mtInformation,[mbOk], 0);
        exit;
      end;
    If (qry_Items.FieldByName('Status').asString <> 'I')and
       (qry_Items.FieldByName('Status').asString <> 'L')then
      begin
        MessageDlg('Item "'+Itemnumber+'" is not IN.', mtInformation,[mbOk], 0);
        exit;
      end;
//------------------Check RecordStatus if necessary-----------------------------
    If (qry_Items.FieldByName('Status').asString <> 'L')Then
      If not VerifyRecordStatus(qry_Items.FieldByName('Filenumber').asString) Then
        exit;

    Result := True;
  finally
    qry_Items.Close;
  end;
end;


function Tfrm_Requisitions.ReqContainer(ContainerNumber :String):Boolean;
Var
  mloc, mWare   :String;
  mTxNo, mrecpos   :Integer;
  mBranch, mDept   :String;
begin
  qry_Container.Close;
  qry_Container.SQL.Clear;
  qry_Container.SQL.Add('SELECT * FROM Containers WHERE Container = :Container');
  qry_Container.Parameters.ParamValues['Container'] := Containernumber;
  qry_Container.Open;

  mloc := trim(qry_Container.FieldByName('locno').AsString);
  mware := trim(qry_Container.FieldByName('warehouse').AsString);
  mBranch := trim(qry_Container.FieldByName('Branch').AsString);
  mDept := trim(qry_Container.FieldByName('Department').AsString);
  mRecPos := 0;
//==============================================================================
  qry_Loc.Close;
  qry_Loc.SQL.Clear;
  qry_Loc.SQL.Add('SELECT * FROM Location');
  qry_Loc.SQL.Add('WHERE Warehouse = :mWare AND LocNo = :mLocNo');
  qry_Loc.Parameters.ParamValues['mWare'] := mware;
  qry_Loc.Parameters.ParamValues['mLocNo'] := mloc;
  qry_Loc.Open;

  mTxNo := GeneratePickHead(mBranch, mDept, cb_Delivery.Text);

  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO PickD(Container, Tx_No, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, Matched, TrType)');
  qry_Insert.SQL.Add('Values(:Container, :Tx_No, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :Matched, :TrType)');
  qry_Insert.Parameters.ParamByName('Container').Value := ContainerNumber;
  qry_Insert.Parameters.ParamByName('Tx_No').Value := mTxNo;
  qry_Insert.Parameters.ParamByName('Warehouse').Value := mWare;
  qry_Insert.Parameters.ParamByName('Row').Value := qry_Loc.FieldByName('rownum').AsString;
  qry_Insert.Parameters.ParamByName('LevelNum').Value := qry_Loc.FieldByName('LevelNum').AsInteger;
  qry_Insert.Parameters.ParamByName('Bay').Value := qry_Loc.FieldByName('Bay').AsInteger;
  qry_Insert.Parameters.ParamByName('LocNo').Value := mLoc;
  qry_Insert.Parameters.ParamByName('RecordNo').Value := mrecpos;
  qry_Insert.Parameters.ParamByName('Matched').Value := 0;
  qry_Insert.Parameters.ParamByName('TrType').Value := 'CON';
  qry_Insert.ExecSQL;
//------Update Container----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('UPDATE Containers SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
  qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
  qry_Insert.SQL.Add('WHERE Container = :Container');
  qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
  qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
  qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
  qry_Insert.Parameters.ParamValues['Container'] := Containernumber;
  qry_Insert.ExecSQL;
//------Audit Entry----------
  dm_Metrofiler.InsAudit('Requested Container', 0, 0, Containernumber, '', 0);
  Result := True;
end;

function Tfrm_Requisitions.ReqRecord(RecordNumber :String):Boolean;
Var
  mloc, mWare   :String;
  mTxNo, mrecpos   :Integer;
  mBranch, mDept   :String;
  mContainer       :String;
begin
  qry_Record.Close;
  qry_Record.SQL.Clear;
  qry_Record.SQL.Add('SELECT Filenumber, IssueStatus, ContainerNo, LocNo, Warehouse, Branch, Department, RecordNo');
  qry_Record.SQL.Add('FROM Files WHERE Filenumber = :Filenumber');
  qry_Record.Parameters.ParamByName('Filenumber').Value := RecordNumber;
  qry_Record.Open;

  If qry_Record.FieldByName('ISSUESTATUS').AsString = 'CON' Then
    begin
      mContainer := qry_Record.FieldbyName('ContainerNo').AsString;

      qry_Container.Close;
      qry_Container.SQL.Clear;
      qry_Container.SQL.Add('SELECT Container, IssueStatus, LocNo, Warehouse, Branch, Department FROM Containers WHERE Container = :Container');
      qry_Container.Parameters.ParamByName('Container').Value := mContainer;
      qry_Container.Open;

      mloc := trim(qry_Container.FieldByName('locno').AsString);
      mware := trim(qry_Container.FieldByName('warehouse').AsString);
      mBranch := trim(qry_Container.FieldByName('Branch').AsString);
      mDept := trim(qry_Container.FieldByName('Department').AsString);
      mRecPos := 0;
    end
  else
    begin
      mContainer := '';

      mloc := trim(qry_Record.FieldByName('locno').AsString);
      mware := trim(qry_Record.FieldByName('warehouse').AsString);
      mBranch := trim(qry_Record.FieldByName('Branch').AsString);
      mDept := trim(qry_Record.FieldByName('Department').AsString);
      mrecpos := qry_Record.FieldByName('recordno').AsInteger;
    end;
//==============================================================================
  qry_Loc.Close;
  qry_Loc.SQL.Clear;
  qry_Loc.SQL.Add('SELECT * FROM Location');
  qry_Loc.SQL.Add('WHERE Warehouse = :mWare AND LocNo = :mLocNo');
  qry_Loc.Parameters.ParamValues['mWare'] := mware;
  qry_Loc.Parameters.ParamValues['mLocNo'] := mloc;
  qry_Loc.Open;

  mTxNo := GeneratePickHead(mBranch, mDept, cb_Delivery.Text);

  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO PickD(Container, Barcode, Tx_No, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, Matched, TrType)');
  qry_Insert.SQL.Add('Values(:Container, :Barcode, :Tx_No, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :Matched, :TrType)');
  If mContainer <> '' Then
    qry_Insert.Parameters.ParamByName('Container').Value := mContainer
  else
    begin
      qry_Insert.Parameters.ParamByName('Container').Value := Null;
      qry_Insert.Parameters.ParamByName('Container').DataType := ftString;
    end;
  qry_Insert.Parameters.ParamByName('Barcode').Value := RecordNumber;
  qry_Insert.Parameters.ParamByName('Tx_No').Value := mTxNo;
  qry_Insert.Parameters.ParamByName('Warehouse').Value := mWare;
  qry_Insert.Parameters.ParamByName('Row').Value := qry_Loc.FieldByName('rownum').AsString;
  qry_Insert.Parameters.ParamByName('LevelNum').Value := qry_Loc.FieldByName('LevelNum').AsInteger;
  qry_Insert.Parameters.ParamByName('Bay').Value := qry_Loc.FieldByName('Bay').AsInteger;
  qry_Insert.Parameters.ParamByName('LocNo').Value := mLoc;
  qry_Insert.Parameters.ParamByName('RecordNo').Value := mrecpos;
  qry_Insert.Parameters.ParamByName('Matched').Value := 0;
  qry_Insert.Parameters.ParamByName('TrType').Value := 'RECORD';
  qry_Insert.ExecSQL;
//------Update Container----------
  If mContainer <> '' Then
    begin
      qry_Insert.Close;
      qry_Insert.SQL.Clear;
      qry_Insert.SQL.Add('UPDATE Containers SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
      qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
      qry_Insert.SQL.Add('WHERE Container = :Container');
      qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
      qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
      qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
      qry_Insert.Parameters.ParamValues['Container'] := mContainer;
      qry_Insert.ExecSQL;
    end;
//------Update Record----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('UPDATE Files SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
  qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
  qry_Insert.SQL.Add('WHERE Filenumber = :Filenumber');
  qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
  qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
  qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
  qry_Insert.Parameters.ParamValues['Filenumber'] := RecordNumber;
  qry_Insert.ExecSQL;
//------Audit Entry----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO Audit (UserID, Comments)');
  qry_Insert.SQL.Add('VALUES (:UserID, :Comments)');
  qry_Insert.Parameters.ParamByName('UserId').Value := User;
  qry_Insert.ExecSQL;
  If mContainer <> '' Then
    dm_Metrofiler.InsAudit('Requested File', 0, 0, RecordNumber, 'In Container '+mContainer, 0)
  else dm_Metrofiler.InsAudit('Requested File', 0, 0, RecordNumber, '', 0);
//------Requisition Que Entry----------
  If frm_Console.TrackandTraceActive = 1 Then
    begin
      qry_Insert.Close;
      qry_Insert.SQL.Clear;
      qry_Insert.SQL.Add('INSERT INTO RequisitionQue (ReqUserID, Barcode)');
      qry_Insert.SQL.Add('VALUES (:ReqUserID, :Barcode)');
      qry_Insert.Parameters.ParamByName('ReqUserID').Value := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
      qry_Insert.Parameters.ParamByName('Barcode').Value := RecordNumber;
      qry_Insert.ExecSQL;
    end;
  Result := True;
end;

function Tfrm_Requisitions.ReqItem(ItemNumber :String):Boolean;
Var
  mloc, mWare   :String;
  mTxNo, mrecpos   :Integer;
  mBranch, mDept   :String;
  mContainer       :String;
  mRecordnumber    :String;
begin
  qry_Item.Close;
  qry_Item.SQL.Clear;
  qry_Item.SQL.Add('SELECT * FROM Items WHERE Itemnumber = :Itemnumber');
  qry_Item.Parameters.ParamByName('Itemnumber').Value := ItemNumber;
  qry_Item.Open;
  mRecordNumber := qry_Item.FieldbyName('FILENUMBER').AsString;
  If qry_Item.FieldbyName('STATUS').asString = 'L' Then
    begin
      mloc := trim(qry_Item.FieldByName('locno').AsString);
      mware := trim(qry_Item.FieldByName('warehouse').AsString);
      mrecpos := qry_Item.FieldByName('recordno').AsInteger;

      qry_Record.Close;
      qry_Record.SQL.Clear;
      qry_Record.SQL.Add('SELECT Filenumber, IssueStatus, ContainerNo, LocNo, Warehouse, Branch, Department, RecordNo');
      qry_Record.SQL.Add('FROM Files WHERE Filenumber = :Filenumber');
      qry_Record.Parameters.ParamByName('Filenumber').Value := mRecordNumber;
      qry_Record.Open;
      mBranch := trim(qry_Record.FieldByName('Branch').AsString);
      mDept := trim(qry_Record.FieldByName('Department').AsString);
      mContainer := '';
      mRecordNumber := '';
    end
  else
    begin
      qry_Record.Close;
      qry_Record.SQL.Clear;
      qry_Record.SQL.Add('SELECT Filenumber, IssueStatus, ContainerNo, LocNo, Warehouse, Branch, Department, RecordNo');
      qry_Record.SQL.Add('FROM Files WHERE Filenumber = :Filenumber');
      qry_Record.Parameters.ParamByName('Filenumber').Value := mRecordNumber;
      qry_Record.Open;

      If qry_Record.FieldByName('ISSUESTATUS').AsString = 'CON' Then
        begin
          mContainer := qry_Record.FieldbyName('ContainerNo').AsString;

          qry_Container.Close;
          qry_Container.SQL.Clear;
          qry_Container.SQL.Add('SELECT * FROM Containers WHERE Container = :Container');
          qry_Container.Parameters.ParamByName('Container').Value := mContainer;
          qry_Container.Open;

          mloc := trim(qry_Container.FieldByName('locno').AsString);
          mware := trim(qry_Container.FieldByName('warehouse').AsString);
          mBranch := trim(qry_Container.FieldByName('Branch').AsString);
          mDept := trim(qry_Container.FieldByName('Department').AsString);
          mRecPos := 0;
        end
      else
        begin
          mContainer := '';

          mloc := trim(qry_Record.FieldByName('locno').AsString);
          mware := trim(qry_Record.FieldByName('warehouse').AsString);
          mBranch := trim(qry_Record.FieldByName('Branch').AsString);
          mDept := trim(qry_Record.FieldByName('Department').AsString);
          mrecpos := qry_Record.FieldByName('recordno').AsInteger;
        end;
    end;
//==============================================================================
  qry_Loc.Close;
  qry_Loc.SQL.Clear;
  qry_Loc.SQL.Add('SELECT * FROM Location');
  qry_Loc.SQL.Add('WHERE Warehouse = :mWare AND LocNo = :mLocNo');
  qry_Loc.Parameters.ParamValues['mWare'] := mware;
  qry_Loc.Parameters.ParamValues['mLocNo'] := mloc;
  qry_Loc.Open;

  mTxNo := GeneratePickHead(mBranch, mDept, cb_Delivery.Text);

  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO PickD(Container, Barcode, Itemnumber, Tx_No, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, Matched, TrType)');
  qry_Insert.SQL.Add('Values(:Container, :Barcode, :Itemnumber, :Tx_No, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :Matched, :TrType)');
  If mContainer <> '' Then
    qry_Insert.Parameters.ParamByName('Container').Value := mContainer
  else
    begin
      qry_Insert.Parameters.ParamByName('Container').Value := null;
      qry_Insert.Parameters.ParamByName('Container').DataType := ftString;
    end;
  qry_Insert.Parameters.ParamByName('Barcode').Value := mRecordNumber;
  qry_Insert.Parameters.ParamByName('Tx_No').Value := mTxNo;
  qry_Insert.Parameters.ParamByName('Warehouse').Value := mWare;
  qry_Insert.Parameters.ParamByName('Row').Value := qry_Loc.FieldByName('rownum').AsString;
  qry_Insert.Parameters.ParamByName('LevelNum').Value := qry_Loc.FieldByName('LevelNum').AsInteger;
  qry_Insert.Parameters.ParamByName('Bay').Value := qry_Loc.FieldByName('Bay').AsInteger;
  qry_Insert.Parameters.ParamByName('LocNo').Value := mLoc;
  qry_Insert.Parameters.ParamByName('RecordNo').Value := mrecpos;
  qry_Insert.Parameters.ParamByName('Matched').Value := 0;
  qry_Insert.Parameters.ParamByName('ItemNumber').Value := Itemnumber;
  qry_Insert.Parameters.ParamByName('TrType').Value := 'ITEM';
  qry_Insert.ExecSQL;
//------Update Container----------
  If mContainer <> '' Then
    begin
      qry_Insert.Close;
      qry_Insert.SQL.Clear;
      qry_Insert.SQL.Add('UPDATE Containers SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
      qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
      qry_Insert.SQL.Add('WHERE Container = :Container');
      qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
      qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
      qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
      qry_Insert.Parameters.ParamValues['Container'] := mContainer;
      qry_Insert.ExecSQL;
    end;
//------Update Record----------
  If mRecordNumber <> '' Then
    begin
      qry_Insert.Close;
      qry_Insert.SQL.Clear;
      qry_Insert.SQL.Add('UPDATE Files SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
      qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
      qry_Insert.SQL.Add('WHERE Filenumber = :Filenumber');
      qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
      qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
      qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
      qry_Insert.Parameters.ParamValues['Filenumber'] := mRecordNumber;
      qry_Insert.ExecSQL;
    end;
//------Update Item----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('UPDATE Items SET Status = ''RQ'', IssuedOn = GETDATE(),');
  qry_Insert.SQL.Add('IssuedUserID = :IssuedUserID, IssuedTo = :IssuedTo, ItTxNo = :ItTxNo, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
  qry_Insert.SQL.Add('WHERE Itemnumber = :Itemnumber');
  qry_Insert.Parameters.ParamValues['IssuedUserID'] := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
  qry_Insert.Parameters.ParamValues['IssuedTo'] := cb_ReqName.Text;
  qry_Insert.Parameters.ParamValues['ItTxNo'] := mTxNo;
  qry_Insert.Parameters.ParamValues['Itemnumber'] := Itemnumber;
  qry_Insert.ExecSQL;
//------Audit Entry----------
  If mContainer <> '' Then
    dm_Metrofiler.InsAudit('Requested Item', 0, 0, Itemnumber, 'In Container '+mContainer+' / File '+mRecordNumber, 0)
  else dm_Metrofiler.InsAudit('Requested Item', 0, 0, Itemnumber, 'In File '+mRecordNumber, 0);
//------Requisition Que Entry----------
  If frm_Console.TrackandTraceActive = 1 Then
    begin
      qry_Insert.Close;
      qry_Insert.SQL.Clear;
      qry_Insert.SQL.Add('INSERT INTO RequisitionQue (ReqUserID, Barcode)');
      qry_Insert.SQL.Add('VALUES (:ReqUserID, :Barcode)');
      qry_Insert.Parameters.ParamByName('ReqUserID').Value := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
      qry_Insert.Parameters.ParamByName('Barcode').Value := Itemnumber;
      qry_Insert.ExecSQL;
    end;
  Result := True;
end;

function Tfrm_Requisitions.GeneratePickHead(Branch, Department, DeliveryType :String):Integer;
Var
   J  :Integer;

begin
  If length(AddedPicks) > 0 Then
    begin
      For J := Low(AddedPicks) to High(AddedPicks) Do
        begin
          If (AddedPicks[J].Branch = Branch)AND
             (AddedPicks[J].Department = Department)Then
            begin
              Result := AddedPicks[J].Tx_No;
              exit;
            end;
        end;
    end;

  qry_AddPick.Close;
  qry_AddPick.SQL.Clear;
  qry_AddPick.SQL.Add('SET NOCOUNT On');
  qry_AddPick.SQL.Add('DECLARE @Tx_No int');
  qry_AddPick.SQL.Add('EXEC [dbo].[GenPickTxNo] :Branch,:Department,:UserID,:Requester,:RequesterUserID,:Type,:TypeDesc,:DeliveryType,:DeliveryAddress,Comments,@Tx_No OUTPUT');
  qry_AddPick.SQL.Add('SET NOCOUNT Off');
  qry_AddPick.SQL.Add('SELECT @Tx_No AS Tx_No');
//----
  qry_AddPick.Parameters.ParamByName('Branch').Value := Branch;
  qry_AddPick.Parameters.ParamByName('Department').Value := Department;
  qry_AddPick.Parameters.ParamByName('UserID').Value := User;
  qry_AddPick.Parameters.ParamByName('Requester').Value := cb_ReqName.Text;
  qry_AddPick.Parameters.ParamByName('RequesterUserID').Value := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Delivery WHERE Description = :DS');
  qry_SQL.Parameters.ParamByName('DS').Value := DeliveryType;
  qry_SQL.Open;
  If qry_SQL.FieldByName('RequisitionType').AsString = 'Normal Requisition' Then
    begin
      qry_AddPick.Parameters.ParamByName('Type').Value := 'RR';
      qry_AddPick.Parameters.ParamByName('TypeDesc').Value := 'Retrieval';
    end
  else If qry_SQL.FieldByName('RequisitionType').AsString = 'Destruction' Then
    begin
      qry_AddPick.Parameters.ParamByName('Type').Value := 'DD';
      qry_AddPick.Parameters.ParamByName('TypeDesc').Value := 'Destruction';
    end
  else If qry_SQL.FieldByName('RequisitionType').AsString = 'Permanent Withdrawal' Then
    begin
      qry_AddPick.Parameters.ParamByName('Type').Value := 'PW';
      qry_AddPick.Parameters.ParamByName('TypeDesc').Value := 'Perm/Withdraw';
    end
  else If qry_SQL.FieldByName('RequisitionType').AsString = 'Off-Site' Then
    begin
      qry_AddPick.Parameters.ParamByName('Type').Value := 'OS';
      qry_AddPick.Parameters.ParamByName('TypeDesc').Value := 'Off-Site';
    end;
  qry_SQL.Close;
//----
  qry_AddPick.Parameters.ParamByName('DeliveryType').Value := DeliveryType;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT UserId, Address AS "DeliveryAddress", CostCentre, InternalDept FROM AuthCodes WHERE UserId = :UserId');
  qry_SQL.Parameters.ParamByName('UserId').Value := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
  qry_SQL.Open;
  If (not(qry_SQL.IsEmpty))and(frm_Console.AccessRight(37)) Then
    begin
      qry_AddPick.Parameters.ParamByName('DeliveryAddress').Value := qry_SQL.FieldbyName('DeliveryAddress').asString;
    end
  else
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Branch, Department, Delivery_Address AS "DeliveryAddress" FROM Departments');
      qry_SQL.SQL.Add('WHERE Branch = :Branch AND Department = :Department');
      qry_SQL.Parameters.ParamByName('Branch').Value := Branch;
      qry_SQL.Parameters.ParamByName('Department').Value := Department;
      qry_SQL.Open;
      qry_AddPick.Parameters.ParamByName('DeliveryAddress').Value := qry_SQL.FieldbyName('DeliveryAddress').asString;
    end;
  qry_SQL.Close;
//----
  qry_AddPick.Open;
  Result := qry_AddPick.Fields[0].AsInteger;
  Setlength(AddedPicks, length(AddedPicks)+1);
  AddedPicks[length(AddedPicks)-1].Branch := Branch;
  AddedPicks[length(AddedPicks)-1].Department := Department;
  AddedPicks[length(AddedPicks)-1].Tx_No := Result;
  qry_AddPick.Close;
end;



procedure Tfrm_Requisitions.grd_ResultsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure Tfrm_Requisitions.grd_ResultsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  If (ssLeft in Shift)and(not TDBGrid(Sender).Dragging()) Then
    begin
      If ((rbtn_Barcode.checked)and(not sp_SearchbyBarcode.IsEmpty))OR
         ((rbtn_RecordType.checked)and(not sp_SearchbyRecordType.IsEmpty))Then
        TDBGrid(Sender).BeginDrag(False, 5);
    end;
end;

procedure Tfrm_Requisitions.qry_AddRequesterAfterPost(DataSet: TDataSet);
begin
  BuildRequester(Dataset.FieldByName('UserId').AsString);
end;

Procedure Tfrm_Requisitions.SetupSearchFields;
Var
   RecordType :String;
   ColNames   :Array[1..15] of String;
   J, I       :Integer;
   MaxLblLen  :Integer;
begin
  RecordType := edt_RType.Text;

  ScrollBox2.Visible := (RecordType <> '');
  lbl_DataType.Visible := (RecordType <> '');
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;

  lbl_SearchRecordCat.Visible := false;
  cb_SearchRecordCat.Visible := false;

  If RecordType = '' then
    exit;

  If RecordType = '"General Search"' Then
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT ''Text1'' Col1, ''Text2'' Col2, ''Text3'' Col3, ''Text4'' Col4, ''Text5'' Col5, ''Text6'' Col6, ''Text7'' Col7, ''Text8'' Col8, ''Text9'' Col9, ''Text10'' Col10,');
     qry_SQL.SQL.Add('''Date1'' Col11, ''Date2'' Col12, ''Date3'' Col13,');
     qry_SQL.SQL.Add('''Number1'' Col14, ''Number2'' Col15');
     qry_SQL.Open;
   end
  else
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :DS');
     qry_SQL.Parameters.ParambyName('DS').Value := RecordType;
     qry_SQL.Open;

     If rgrp_SearchType.ItemIndex = 1 Then
       If qry_SQL.FieldByName('UseRecordCat').AsBoolean Then
         begin
           lbl_SearchRecordCat.Visible := true;
           cb_SearchRecordCat.Visible := true;
         end;
   end;

  For J := 1 to 15 Do
    ColNames[J] := trim(qry_SQL.FieldbyName('Col'+InttoStr(J)).AsString);
  qry_SQL.Close;
//----
  MaxLblLen := 0;
  I := 0;
  For J := 1 to 15 Do
    begin
      If ColNames[J] <> '' Then
        begin
          Inc(I);
          If (J >= 1)AND(J <= 10) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 300;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end;
          TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
          TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
        end;
    end;

  qry_SQL.Close;

  For J := 1 to 15 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Left := MaxLblLen+8;
    end;
end;

procedure Tfrm_Requisitions.edt_BranchChange(Sender: TObject);
begin
  edt_Dept.Text := '';
  lbl_Dept.Caption := '---';
end;

procedure Tfrm_Requisitions.edt_BranchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '---';
    end;
end;

procedure Tfrm_Requisitions.edt_BranchMultiChange(Sender: TObject);
begin
  edt_DepartmentMulti.Text := '';
  lbl_DepartmentMulti.Caption := '---';
end;

procedure Tfrm_Requisitions.edt_BranchMultiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_BranchMulti.Text := '';
      lbl_BranchMulti.Caption := '---';
    end;
end;

procedure Tfrm_Requisitions.edt_DepartmentMultiChange(Sender: TObject);
begin
  edt_RecordTypeMulti.Text := '';
end;

procedure Tfrm_Requisitions.edt_DepartmentMultiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_DepartmentMulti.Text := '';
      lbl_DepartmentMulti.Caption := '---';
    end;
end;

procedure Tfrm_Requisitions.edt_DeptChange(Sender: TObject);
begin
  edt_RType.Text := '';
end;

procedure Tfrm_Requisitions.edt_DeptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
    end;
end;

procedure Tfrm_Requisitions.edt_FilingAreaMultiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_FilingAreaMulti.Text := '';
      lbl_FilingAreaMulti.Caption := '';
    end;
end;

procedure Tfrm_Requisitions.edt_RecordTypeMultiChange(Sender: TObject);
begin
  SetupSearchFieldsMulti;
end;

procedure Tfrm_Requisitions.edt_RecordTypeMultiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RecordTypeMulti.Text := '';
    end;
end;

procedure Tfrm_Requisitions.edt_RTypeChange(Sender: TObject);
begin
  SetupSearchFields;
//------
  cb_SearchRecordCat.Items.Clear;
  If cb_SearchRecordCat.Visible Then
    begin
      if frm_Console.AccessSysAdmin then
        begin
          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT');
          qry_RecCat.SQL.Add('	r.RecCatType');
          qry_RecCat.SQL.Add('FROM');
          qry_RecCat.SQL.Add('	RecordCat r');
          qry_RecCat.SQL.Add('	INNER JOIN RCRTRts s ON r.RecCatType = s.RecordCat');
          qry_RecCat.SQL.Add('WHERE');
          qry_RecCat.SQL.Add('	s.RecordType = :RecordType');
          qry_RecCat.SQL.Add('ORDER BY');
          qry_RecCat.SQL.Add('	RecCatType');
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RType.Text;
          qry_RecCat.Open;
          cb_SearchRecordCat.Items.Append('');
          cb_SearchRecordCat.ItemIndex := 0;
          qry_RecCat.First;
          While not qry_RecCat.EOF Do
            begin
              cb_SearchRecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
              qry_RecCat.Next;
            end;
        end
      else
        begin
          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT');
          qry_RecCat.SQL.Add('	r.RecCatType');
          qry_RecCat.SQL.Add('FROM');
          qry_RecCat.SQL.Add('	RecordCat r');
          qry_RecCat.SQL.Add('	INNER JOIN RCRTRts s ON r.RecCatType = s.RecordCat');
          qry_RecCat.SQL.Add('WHERE');
          qry_RecCat.SQL.Add('	s.RecordType = :RecordType AND');
          qry_RecCat.SQL.Add('(');
          qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = :ID1))');
          qry_RecCat.SQL.Add('OR');
          qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts o ON a.RoleId = o.RoleId WHERE o.UserId = :ID2))');
          qry_RecCat.SQL.Add(')');
          qry_RecCat.SQL.Add('ORDER BY');
          qry_RecCat.SQL.Add('	RecCatType');
          qry_RecCat.Parameters.ParamByName('ID1').Value := User;
          qry_RecCat.Parameters.ParamByName('ID2').Value := User;
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RType.Text;
          qry_RecCat.Open;
          cb_SearchRecordCat.Items.Append('');
          cb_SearchRecordCat.ItemIndex := 0;
          qry_RecCat.First;
          While not qry_RecCat.EOF Do
            begin
              cb_SearchRecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
              qry_RecCat.Next;
            end;
        end;
    end;
end;

procedure Tfrm_Requisitions.edt_RTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RType.Text := '';
    end;
end;

procedure Tfrm_Requisitions.BitBtn1Click(Sender: TObject);
begin
  If (tv_PickingSlip.Items.Count > 0 ) Then
    begin
      If Messagedlg('You have an unprocessed Picking List. Do you realy want to exit?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;
    end;
  Close;
end;

function Tfrm_Requisitions.AddContainer():Boolean;
Var
  CTemp                   :TTreeNode;
  J                       :Integer;
  Flag                    :Boolean;
begin
//==============================================================================
//==============================================================================
  Flag := False;
  For J := 0 to tv_PickingSlip.Items.Count-1 Do
    begin
      CTemp  := tv_PickingSlip.Items.Item[J];
      If CTemp.Level = 0 Then
        begin
          If CTemp.Text = grd_Results.DataSource.DataSet.FieldByName('CONTAINER').asString then
            begin
              CTemp.DeleteChildren;
              Flag := True;
              break;
            end;
        end;
    end;
  If not Flag Then
    begin
      CTemp := tv_PickingSlip.Items.Add(nil, grd_Results.DataSource.DataSet.FieldbyName('CONTAINER').asString);
      CTemp.ImageIndex := 0;
      CTemp.SelectedIndex := 0;
      CTemp.DeleteChildren;
    end;
//==============================================================================
//--------------------------BuildAccessList-------------------------------------

//==============================================================================
  Result := True;
end;

function Tfrm_Requisitions.AddRecord():Boolean;
Var
  CTemp                   :TTreeNode;
  RTemp                   :TTreeNode;
  J                       :Integer;
  Flag                    :Boolean;
  CFlag                   :Boolean;
  Z                    :Integer;
begin
//==============================================================================
//==============================================================================
      If grd_Results.DataSource.DataSet.FieldByName('ISSUESTATUS').asString = 'CON' Then
        begin
          CFlag := False;
          Flag := False;
          For J := 0 to tv_PickingSlip.Items.Count-1 Do
            begin
              CTemp  := tv_PickingSlip.Items.Item[J];
              If CTemp.Level = 0 Then
                begin
                  If CTemp.Text = grd_Results.DataSource.DataSet.FieldByName('CONTAINER').asString then
                    begin
                      CFlag := True;
                      For Z := 0 to CTemp.Count-1 Do
                        If CTemp.Item[Z].Text = grd_Results.DataSource.DataSet.FieldbyName('Filenumber').asString Then
                          begin
                            CTemp.Item[Z].DeleteChildren;
                            Flag := True;
                            Break;
                          end;
                        break;
                    end;
                end;
            end;
          If not CFlag Then
            begin
              If not qry_GetContainer.Active Then
                begin
                  qry_GetContainer.Active := False;
                  qry_GetContainer.SQL.Clear;
                  qry_GetContainer.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CO');
                  qry_GetContainer.Parameters.ParamByName('CO').Value := grd_Results.DataSource.DataSet.FieldByName('CONTAINER').asString;
                  qry_GetContainer.Active := True;
                end;

              CTemp := tv_PickingSlip.Items.Add(nil, qry_GetContainer.FieldbyName('CONTAINER').asString);
              CTemp.ImageIndex := 0;
              CTemp.SelectedIndex := 0;
            end;
          IF not Flag Then
            begin
              qry_GetRecord.Active := False;
              qry_GetRecord.SQL.Clear;
              qry_GetRecord.SQL.Add('SELECT * FROM Files WHERE Filenumber = :FN');
              qry_GetRecord.Parameters.ParamByName('FN').Value := grd_Results.DataSource.DataSet.FieldByName('FILENUMBER').asString;
              qry_GetRecord.Active := True;

              RTemp := tv_PickingSlip.Items.AddChild(CTemp, qry_GetRecord.FieldbyName('FILENUMBER').asString);
              RTemp.ImageIndex := 1;
              RTemp.SelectedIndex := 1;
            end;

          rTemp.DeleteChildren;
        end
      else
        begin
          Flag := False;
          For J := 0 to tv_PickingSlip.Items.Count-1 Do
            begin
              RTemp  := tv_PickingSlip.Items.Item[J];
              If RTemp.Level = 0 Then
                begin
                  If RTemp.Text = grd_Results.DataSource.DataSet.FieldByName('FILENUMBER').asString then
                    begin
                      RTemp.DeleteChildren;
                      Flag := True;
                    end;
                end;
            end;
          If not Flag Then
            begin
              RTemp := tv_PickingSlip.Items.Add(nil, grd_Results.DataSource.DataSet.FieldbyName('FILENUMBER').asString);
              RTemp.ImageIndex := 1;
              RTemp.SelectedIndex := 1;
              RTemp.DeleteChildren;
            end;
        end;
//==============================================================================
//==============================================================================
  Result := True;
end;

function Tfrm_Requisitions.AddItem():Boolean;
Var
  CTemp                   :TTreeNode;
  RTemp                   :TTreeNode;
  ITemp                   :TTreeNode;
  J                       :Integer;
  Flag                    :Boolean;
  CFlag                   :Boolean;
  IFlag                   :Boolean;
  B, Z                    :Integer;
begin
      qry_GetRecord.Active := False;
      qry_GetRecord.SQL.Clear;
      qry_GetRecord.SQL.Add('SELECT * FROM files WHERE Filenumber = :FN');
      qry_GetRecord.Parameters.ParamByName('FN').Value := grd_Results.DataSource.DataSet.FieldbyName('FILENUMBER').asString;
      qry_GetRecord.Active := True;
      IF not qry_GetRecord.IsEmpty Then
        begin
          If qry_GetRecord.FieldByName('ISSUESTATUS').asString = 'CON' Then
            begin
              Flag := False;
              For J := 0 to tv_PickingSlip.Items.Count-1 Do
                begin
                  CTemp  := tv_PickingSlip.Items.Item[J];
                  If CTemp.Level = 0 Then
                    begin
                      If CTemp.Text = qry_GetRecord.FieldByName('CONTAINERNO').asString then
                        begin
                          Flag := True;
                          CFlag := False;
                          for Z := 0 to CTemp.Count-1 do
                            IF CTemp.Item[Z].Text = qry_GetRecord.FieldbyName('FILENUMBER').asString Then
                              begin
                                CFlag := True;
                                RTemp := CTemp.Item[Z];
                                IFlag := False;
                                for B := 0 to RTemp.Count-1 do
                                  If RTemp.Item[B].Text = grd_Results.DataSource.DataSet.FieldbyName('ITEMNUMBER').asString Then
                                    IFlag := True;
                                If not IFlag Then
                                  begin
                                     ITemp := tv_PickingSlip.Items.AddChild(RTemp, grd_Results.DataSource.DataSet.fieldbyName('ITEMNUMBER').asString);
                                     ITemp.ImageIndex := 2;
                                     ITemp.SelectedIndex := 2;
                                  end;
                              end;
                          If not CFlag Then
                            begin
                              RTemp := tv_PickingSlip.Items.AddChild(CTemp, qry_GetRecord.FieldbyName('FILENUMBER').asString);
                              RTemp.ImageIndex := 1;
                              RTemp.SelectedIndex := 1;
                              ITemp := tv_PickingSlip.Items.AddChild(RTemp, grd_Results.DataSource.DataSet.fieldbyName('ITEMNUMBER').asString);
                              ITemp.ImageIndex := 2;
                              ITemp.SelectedIndex := 2;
                            end;
                        end;
                    end;
                end;
              If not Flag Then
                begin
                  CTemp := tv_PickingSlip.Items.Add(Nil, qry_GetRecord.FieldbyName('CONTAINERNO').asString);
                  CTemp.ImageIndex := 0;
                  CTemp.SelectedIndex := 0;
                  RTemp := tv_PickingSlip.Items.AddChild(CTemp, qry_GetRecord.FieldbyName('FILENUMBER').asString);
                  RTemp.ImageIndex := 1;
                  RTemp.SelectedIndex := 1;
                  ITemp := tv_PickingSlip.Items.AddChild(RTemp, grd_Results.DataSource.DataSet.fieldbyName('ITEMNUMBER').asString);
                  ITemp.ImageIndex := 2;
                  ITemp.SelectedIndex := 2;
                end;
            end
          else
//==================================Not in Container===========================
            begin
              Flag := False;
              For J := 0 to tv_PickingSlip.Items.Count-1 Do
                begin
                  RTemp  := tv_PickingSlip.Items.Item[J];
                  If RTemp.Level = 0 Then
                    begin
                      If RTemp.Text = qry_GetRecord.FieldByName('FILENUMBER').asString then
                        begin
                          Flag := True;
                          IFlag := False;
                          for Z := 0 to RTemp.Count-1 do
                            IF RTemp.Item[Z].Text = grd_Results.DataSource.DataSet.FieldbyName('ITEMNUMBER').asString Then
                              IFlag := True;
                            If not IFlag Then
                              begin
                                ITemp := tv_PickingSlip.Items.AddChild(RTemp, grd_Results.DataSource.DataSet.fieldbyName('ITEMNUMBER').asString);
                                ITemp.ImageIndex := 2;
                                ITemp.SelectedIndex := 2;
                              end;
                        end;
                    end;
                end;
              If not Flag Then
                begin
                  RTemp := tv_PickingSlip.Items.AddChild(Nil, qry_GetRecord.FieldbyName('FILENUMBER').asString);
                  RTemp.ImageIndex := 1;
                  RTemp.SelectedIndex := 1;
                  ITemp := tv_PickingSlip.Items.AddChild(RTemp, grd_Results.DataSource.DataSet.fieldbyName('ITEMNUMBER').asString);
                  ITemp.ImageIndex := 2;
                  ITemp.SelectedIndex := 2;
                end;
            end;
        end;
//==============================================================================
//==============================================================================
  Result := True;
end;



procedure Tfrm_Requisitions.btn_SelAllItemsClick(Sender: TObject);
Var
  J                       :Integer;
begin
  Screen.Cursor := crHourglass;
  try
    grd_Results.DataSource.DataSet.DisableControls;
    grd_Results.DataSource.DataSet.First;
    While not grd_Results.DataSource.DataSet.EOF Do
      begin
        If UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'CONTAINER' Then
          begin
            If (trim(UpperCase(grd_Results.DataSource.DataSet.FieldByName('ISSUESTATUS').asString)) = 'IN')Then
              AddContainer();
          end
        else If UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'FILENUMBER' Then
          begin
            If (trim(UpperCase(grd_Results.DataSource.DataSet.FieldByName('ISSUESTATUS').asString)) = 'IN')Then
              AddRecord();
          end
        else If UpperCase(grd_Results.DataSource.DataSet.Fields[0].FieldName) = 'ITEMNUMBER' Then
          begin
            If (trim(UpperCase(grd_Results.DataSource.DataSet.FieldByName('ISSUESTATUS').asString)) = 'L')OR
               (trim(UpperCase(grd_Results.DataSource.DataSet.FieldByName('ISSUESTATUS').asString)) = 'I')Then
              AddItem();
          end;
        grd_Results.DataSource.DataSet.Next;
      end;
  finally
    Screen.Cursor := crDefault;
    grd_Results.DataSource.DataSet.First;
    grd_Results.DataSource.DataSet.EnableControls;

    For J := 0 to tv_PickingSlip.Items.Count-1 Do
      If tv_PickingSlip.Items.Item[J].Level = 0 Then
        tv_PickingSlip.Items.Item[J].Expand(True);
  end;
end;

procedure Tfrm_Requisitions.FormResize(Sender: TObject);
begin
   btn_RemovePick.Left := Width - 293;
   btn_ViewItems.Left := Width - 477;
   btn_ViewFiles.Left := Width - 477;
end;

procedure Tfrm_Requisitions.btn_ViewFilesClick(Sender: TObject);
Var
  mBarcode   :String;
begin
  If btn_ViewFiles.Caption = 'View Files' Then
    begin
      mBarcode := grd_Results.DataSource.DataSet.FieldbyName('CONTAINER').AsString;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT COUNT(*) FROM Files WHERE ContainerNo = :ContainerNo');
      qry_SQL.Parameters.ParamByName('ContainerNo').Value := mBarcode;
      qry_SQL.Open;
      If qry_SQL.Fields[0].AsInteger = 0 Then
        begin
          MessageDLG('Container '+mBarcode+' has no Files.',mtInformation,[mbOK],0);
          qry_SQL.Close;
          exit;
        end;

      sp_SearchbyBarcode.Close;
      sp_SearchbyBarcode.Parameters.ParamByName('@ReqUserId').Value := User;
      sp_SearchbyBarcode.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
      sp_SearchbyBarcode.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
      sp_SearchbyBarcode.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
      sp_SearchbyBarcode.Parameters.ParamByName('@SearchType').Value := 'FILES';
      sp_SearchbyBarcode.Parameters.ParamByName('@Barcode').Value := mBarcode;
      sp_SearchbyBarcode.Parameters.ParamByName('@ShowImageStatus').Value := False;
//--------
      Screen.Cursor := CrHourglass;
      try
        grd_Results.Columns.Clear;
        grd_Results.DataSource := ds_SearchbyBarcode;
        sp_SearchbyBarcode.Open;
        sp_SearchbyBarcode.FieldByName('ReqAble').Visible := False;
        sp_SearchbyBarcode.FieldByName('IssueStatus').Visible := False;
        sp_SearchbyBarcode.FieldByName('ReqAbleInternally').Visible := False;
        sp_SearchbyBarcode.FieldByName('HasItems').Visible := False;        
        frm_Console.AutoSizeNewColumns(grd_Results);
        PageControl1.ActivePage := Tabsheet2;
        btn_ViewFiles.Caption := 'View Containers';
      finally
        Screen.Cursor := CrDefault;
      end;
      lbl_RTot.Caption := InttoStr(sp_SearchbyBarcode.RecordCount);
      If not sp_SearchbyBarcode.isEmpty Then
        exit;
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end
  else
    begin
      btn_Search.Click;
      btn_ViewFiles.Caption := 'View Files';
    end;
end;

procedure Tfrm_Requisitions.btn_ViewItemsClick(Sender: TObject);
Var
  mBarcode   :String;
begin
  If btn_ViewItems.Caption = 'View Items' Then
    begin
      mBarcode := grd_Results.DataSource.DataSet.FieldbyName('FILENUMBER').AsString;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT COUNT(*) FROM Items WHERE Filenumber = :Filenumber');
      qry_SQL.Parameters.ParamByName('Filenumber').Value := mBarcode;
      qry_SQL.Open;
      If qry_SQL.Fields[0].AsInteger = 0 Then
        begin
          MessageDLG('Barcode '+mBarcode+' has no Items.',mtInformation,[mbOK],0);
          qry_SQL.Close;
          exit;
        end;

      sp_SearchbyBarcode.Close;
      sp_SearchbyBarcode.Parameters.ParamByName('@ReqUserId').Value := User;
      sp_SearchbyBarcode.Parameters.ParamByName('@Branch').Value :=  edt_Branch.Text;
      sp_SearchbyBarcode.Parameters.ParamByName('@Department').Value := edt_Dept.Text;
      sp_SearchbyBarcode.Parameters.ParamByName('@Module').Value := 'REQUISITIONS';
      sp_SearchbyBarcode.Parameters.ParamByName('@SearchType').Value := 'ITEMS';
      sp_SearchbyBarcode.Parameters.ParamByName('@Barcode').Value := mBarcode;
      sp_SearchbyBarcode.Parameters.ParamByName('@ShowImageStatus').Value := False;
//--------
      Screen.Cursor := CrHourglass;
      try
        grd_Results.Columns.Clear;
        grd_Results.DataSource := ds_SearchbyBarcode;
        sp_SearchbyBarcode.Open;
        sp_SearchbyBarcode.FieldByName('ReqAble').Visible := False;
        sp_SearchbyBarcode.FieldByName('IssueStatus').Visible := False;
        sp_SearchbyBarcode.FieldByName('ReqAbleInternally').Visible := False;
        frm_Console.AutoSizeNewColumns(grd_Results);
        PageControl1.ActivePage := Tabsheet2;
        btn_ViewItems.Caption := 'View Files';
      finally
        Screen.Cursor := CrDefault;
      end;
      lbl_RTot.Caption := InttoStr(sp_SearchbyBarcode.RecordCount);
      If not sp_SearchbyBarcode.isEmpty Then
        exit;
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end
  else
    begin
      btn_Search.Click;
      btn_ViewItems.Caption := 'View Items';
    end;
end;

procedure Tfrm_Requisitions.cb_ReqNameSelect(Sender: TObject);
begin
  If cb_ReqName.Text = 'Add New Requester...' Then
    begin
      qry_AddRequester.Close;
      qry_AddRequester.SQL.Clear;
      qry_AddRequester.SQL.Add('SELECT * FROM AuthCodes');
      qry_AddRequester.Open;
      qry_AddRequester.Insert;
      qry_AddRequester['UserType'] := 'R';
      qry_AddRequester['valid_Option'] := 0;
      qry_AddRequester['OutOfOffice_option'] := 0;
      qry_AddRequester['ProxyLoc'] := 0;
      qry_AddRequester['sysadmin'] := 0;
      qry_AddRequester['WorkPlaceID'] := dm_Metrofiler.CreateGuid;
    end;
end;

procedure Tfrm_Requisitions.cb_SearchRecordCatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      cb_SearchRecordCat.ItemIndex := 0;
    end;
end;

Procedure Tfrm_Requisitions.SetupSearchFieldsMulti;
Var
   RecordType :String;
   ColNames   :Array[1..15] of String;
   J, T       :Integer;
   MaxLblLen  :Integer;
begin
  RecordType := edt_RecordTypeMulti.Text;

  sb_MetaMulti.Visible := (RecordType <> '');
  lbl_MetaMulti.Visible := (RecordType <> '');
  For J := 1 to 10 Do
    begin
      TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Visible := False;
      TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Visible := False;
    end;
  For J := 1 to 3 Do
    begin
      TLabel(FindComponent('lblDateMulti'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_DateMulti'+InttoStr(J))).Visible := False;
    end;
  For J := 1 to 2 Do
    begin
      TLabel(FindComponent('lblNumMulti'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_NumMulti'+InttoStr(J))).Visible := False;
    end;

  If RecordType = '' then
    exit;

  If RecordType = '"General Search"' Then
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT ''Text1'' Col1, ''Text2'' Col2, ''Text3'' Col3, ''Text4'' Col4, ''Text5'' Col5, ''Text6'' Col6, ''Text7'' Col7, ''Text8'' Col8, ''Text9'' Col9, ''Text10'' Col10,');
     qry_SQL.SQL.Add('''Date1'' Col11, ''Date2'' Col12, ''Date3'' Col13,');
     qry_SQL.SQL.Add('''Number1'' Col14, ''Number2'' Col15');
     qry_SQL.Open;
   end
  else
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :DS');
     qry_SQL.Parameters.ParambyName('DS').Value := RecordType;
     qry_SQL.Open;
   end;

  For J := 1 to 15 Do
    ColNames[J] := trim(qry_SQL.FieldbyName('Col'+InttoStr(J)).AsString);
  qry_SQL.Close;
//----
  MaxLblLen := 0;
  T := 0;
  For J := 1 to 15 Do
    begin
      If ColNames[J] <> '' Then
        begin
          If (J >= 1)AND(J <= 10) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Caption := ColNames[J]+' :';
              TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Top := T + 10;
              TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Visible := True;
              TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Text := '';
              TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Tag := J;
              TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Width := 300;
              TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Top := T + 7;
              TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Visible := True;

              T := T + 51;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lblDateMulti'+InttoStr(J-10))).Caption := ColNames[J]+' :';
              TLabel(FindComponent('lblDateMulti'+InttoStr(J-10))).Top := T + 10;
              TLabel(FindComponent('lblDateMulti'+InttoStr(J-10))).Visible := True;
              TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text := '';
              TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Tag := J;
              TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Width := 120;
              TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Top := T + 7;
              TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Visible := True;

              T := T + 22;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lblNumMulti'+InttoStr(J-13))).Caption := ColNames[J]+' :';
              TLabel(FindComponent('lblNumMulti'+InttoStr(J-13))).Top := T + 10;
              TLabel(FindComponent('lblNumMulti'+InttoStr(J-13))).Visible := True;
              TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text := '';
              TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Tag := J;
              TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Width := 120;
              TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Top := T + 7;
              TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Visible := True;

              T := T + 22;
            end;
        end;
    end;

  qry_SQL.Close;

  For J := 1 to 10 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(FindComponent('lblTextMulti'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Left := MaxLblLen+8;
    end;
  For J := 11 to 13 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lblDateMulti'+InttoStr(J-10))).Width := MaxLblLen+5;
      TLabel(FindComponent('lblDateMulti'+InttoStr(J-10))).Left := 2;
//-------Set Edit Size Properties
      TMemo(FindComponent('edt_DateMulti'+InttoStr(J-10))).Left := MaxLblLen+8;
    end;
  For J := 14 to 15 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lblNumMulti'+InttoStr(J-13))).Width := MaxLblLen+5;
      TLabel(FindComponent('lblNumMulti'+InttoStr(J-13))).Left := 2;
//-------Set Edit Size Properties
      TMemo(FindComponent('edt_NumMulti'+InttoStr(J-13))).Left := MaxLblLen+8;
    end;
end;

procedure Tfrm_Requisitions.btn_SearchMultiClick(Sender: TObject);
function ConvertLinestoCommaStr(Lines   :TStrings):String;
Var
  TempStr   :String;
  J        :Integer;
begin
  TempStr := '';
  For J := 0 to Lines.Count-1 Do
    begin
      If J < (Lines.Count-1) Then
        TempStr := TempStr + QuotedStr(Lines.Strings[J])+','
      else TempStr := TempStr + QuotedStr(Lines.Strings[J]);
    end;
  Result := TempStr;
end;


var
  j              :Integer;
  LabelStr       :String;
  FillInFlag     :Boolean;
begin
//=================================================================
//==============Check if requred fields contains values
//=================================================================
  if (length(edt_BranchMulti.Text) = 0) Then
    begin
      MessageDlg('Please select the Branch!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_DepartmentMulti.Text) = 0) then
    begin
      MessageDlg('Please select the Department!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_RecordTypeMulti.Text) = 0)and(rbtn_RecordTypeMulti.Checked) Then
    begin
      MessageDlg('Please select the Record Type!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;

  if (rbtn_RecordTypeMulti.Checked) Then
    begin
      FillInFlag := False;
      if (mem_TextMulti1.Text <> '')and(mem_TextMulti1.Visible) Then FillInFlag := True;
      if (mem_TextMulti2.Text <> '')and(mem_TextMulti2.Visible) Then FillInFlag := True;
      if (mem_TextMulti3.Text <> '')and(mem_TextMulti3.Visible) Then FillInFlag := True;
      if (mem_TextMulti4.Text <> '')and(mem_TextMulti4.Visible) Then FillInFlag := True;
      if (mem_TextMulti5.Text <> '')and(mem_TextMulti5.Visible) Then FillInFlag := True;
      if (mem_TextMulti6.Text <> '')and(mem_TextMulti6.Visible) Then FillInFlag := True;
      if (mem_TextMulti7.Text <> '')and(mem_TextMulti7.Visible) Then FillInFlag := True;
      if (mem_TextMulti8.Text <> '')and(mem_TextMulti8.Visible) Then FillInFlag := True;
      if (mem_TextMulti9.Text <> '')and(mem_TextMulti9.Visible) Then FillInFlag := True;
      if (mem_TextMulti10.Text <> '')and(mem_TextMulti10.Visible) Then FillInFlag := True;
      if (edt_DateMulti1.Text <> '')and(edt_DateMulti1.Visible) Then FillInFlag := True;
      if (edt_DateMulti2.Text <> '')and(edt_DateMulti2.Visible) Then FillInFlag := True;
      if (edt_DateMulti3.Text <> '')and(edt_DateMulti3.Visible) Then FillInFlag := True;
      if (edt_NumMulti1.Text <> '')and(edt_NumMulti1.Visible) Then FillInFlag := True;
      if (edt_NumMulti2.Text <> '')and(edt_NumMulti2.Visible) Then FillInFlag := True;

      if not FillInFlag Then
        begin
          MessageDlg('Please specify some search criteria!!',mtError,[mbOK],0);
          Screen.Cursor := crDefault;
          exit;
        end;
    end;
//====================Container=================================================
  If rgrp_TypeMulti.ItemIndex = 0 Then
    begin
      If rbtn_RecordTypeMulti.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManRecordType, edt_RType.Text);

          qry_MultiFilesSearch.Close;
          qry_MultiFilesSearch.SQL.Clear;
          qry_MultiFilesSearch.SQL.Add('SELECT');
          qry_MultiFilesSearch.SQL.Add('Container, IssueStatus, IssuedTo, IssuedOn, FileType AS "RecordType"');
//-------------
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :RecordType');
          qry_SQL.Parameters.ParamByName('RecordType').Value := edt_RecordTypeMulti.Text;
          qry_SQL.Open;
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    qry_MultiFilesSearch.SQL.Add(',Text'+InttoStr(J)+' AS ['+labelStr+']')
                  else if (J >= 11)and(J <= 13)Then
                    qry_MultiFilesSearch.SQL.Add(',Date'+InttoStr(J-10)+' AS ['+labelStr+']')
                  else if (J >= 14)and(J <= 15)Then
                    qry_MultiFilesSearch.SQL.Add(',Number'+InttoStr(J-13)+' AS ['+labelStr+']');
                end;
            end;
          qry_MultiFilesSearch.SQL.Add('FROM');
          qry_MultiFilesSearch.SQL.Add('   Containers');
          qry_MultiFilesSearch.SQL.Add('WHERE');
          qry_MultiFilesSearch.SQL.Add('   Branch = :Branch');
          qry_MultiFilesSearch.Parameters.ParamByName('Branch').Value := edt_BranchMulti.Text;
          qry_MultiFilesSearch.SQL.Add('   AND Department = :Department');
          qry_MultiFilesSearch.Parameters.ParamByName('Department').Value := edt_DepartmentMulti.Text;
          If edt_RType.Text <> '"General Search"' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND FileType = :FileType');
              qry_MultiFilesSearch.Parameters.ParamByName('FileType').Value := edt_RecordTypeMulti.Text;
            end;
          IF trim(edt_FilingAreaMulti.Text) <> '' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND Warehouse = :Warehouse');
              qry_MultiFilesSearch.Parameters.ParamByName('Warehouse').Value := edt_FilingAreaMulti.Text;
            end;
//--------------
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    begin
                      If trim(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Text'+InttoStr(J)+' IN (SELECT s FROM dbo.Metrofilerweb_ParseCSVString(:Text'+InttoStr(J)+'))');
                          qry_MultiFilesSearch.Parameters.ParamByName('Text'+InttoStr(J)).Value :=  ConvertLinestoCommaStr(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Lines);
                        end;
                    end
                  else if (J >= 11)and(J <= 13)Then
                    begin
                      If trim(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Date'+InttoStr(J-10)+' = :Date'+InttoStr(J-10));
                          qry_MultiFilesSearch.Parameters.ParamByName('Date'+InttoStr(J-10)).Value := StrtoDate(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text);
                        end;
                    end
                  else if (J >= 14)and(J <= 15)Then
                    begin
                      If trim(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Number'+InttoStr(J-13)+' = :Number'+InttoStr(J-13));
                          qry_MultiFilesSearch.Parameters.ParamByName('Number'+InttoStr(J-13)).Value := StrtoInt(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text);
                        end;
                    end;
                end;
            end;
//--------------
          qry_MultiFilesSearch.SQL.Add('ORDER BY Container');
        end;
      btn_ViewItems.Visible := False;
      btn_ViewFiles.Visible := True;
    end;
//=======================Files==================================================
  If rgrp_TypeMulti.ItemIndex = 1 Then
    begin
      If rbtn_RecordTypeMulti.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RType.Text);

          qry_MultiFilesSearch.Close;
          qry_MultiFilesSearch.SQL.Clear;
          qry_MultiFilesSearch.SQL.Add('SELECT');
          qry_MultiFilesSearch.SQL.Add('Filenumber, ContainerNo AS "Container", IssueStatus, IssuedTo, IssuedOn, FileType AS "RecordType"');
//-------------
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :RecordType');
          qry_SQL.Parameters.ParamByName('RecordType').Value := edt_RecordTypeMulti.Text;
          qry_SQL.Open;
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    qry_MultiFilesSearch.SQL.Add(',Text'+InttoStr(J)+' AS ['+labelStr+']')
                  else if (J >= 11)and(J <= 13)Then
                    qry_MultiFilesSearch.SQL.Add(',Date'+InttoStr(J-10)+' AS ['+labelStr+']')
                  else if (J >= 14)and(J <= 15)Then
                    qry_MultiFilesSearch.SQL.Add(',Number'+InttoStr(J-13)+' AS ['+labelStr+']');
                end;
            end;
          qry_MultiFilesSearch.SQL.Add('FROM');
          qry_MultiFilesSearch.SQL.Add('   Files');
          qry_MultiFilesSearch.SQL.Add('WHERE');
          qry_MultiFilesSearch.SQL.Add('   Branch = :Branch');
          qry_MultiFilesSearch.Parameters.ParamByName('Branch').Value := edt_BranchMulti.Text;
          qry_MultiFilesSearch.SQL.Add('   AND Department = :Department');
          qry_MultiFilesSearch.Parameters.ParamByName('Department').Value := edt_DepartmentMulti.Text;
          If edt_RType.Text <> '"General Search"' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND FileType = :FileType');
              qry_MultiFilesSearch.Parameters.ParamByName('FileType').Value := edt_RecordTypeMulti.Text;
            end;
          IF trim(edt_FilingAreaMulti.Text) <> '' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND Warehouse = :Warehouse');
              qry_MultiFilesSearch.Parameters.ParamByName('Warehouse').Value := edt_FilingAreaMulti.Text;
            end;
//--------------
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    begin
                      If trim(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Text'+InttoStr(J)+' IN (SELECT s FROM dbo.Metrofilerweb_ParseCSVString(:Text'+InttoStr(J)+'))');
                          qry_MultiFilesSearch.Parameters.ParamByName('Text'+InttoStr(J)).Value :=  ConvertLinestoCommaStr(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Lines);
                        end;
                    end
                  else if (J >= 11)and(J <= 13)Then
                    begin
                      If trim(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Date'+InttoStr(J-10)+' = :Date'+InttoStr(J-10));
                          qry_MultiFilesSearch.Parameters.ParamByName('Date'+InttoStr(J-10)).Value := StrtoDate(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text);
                        end;
                    end
                  else if (J >= 14)and(J <= 15)Then
                    begin
                      If trim(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND Number'+InttoStr(J-13)+' = :Number'+InttoStr(J-13));
                          qry_MultiFilesSearch.Parameters.ParamByName('Number'+InttoStr(J-13)).Value := StrtoInt(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text);
                        end;
                    end;
                end;
            end;
//--------------
          qry_MultiFilesSearch.SQL.Add('ORDER BY Filenumber');
        end;
      btn_ViewItems.Visible := True;
      btn_ViewFiles.Visible := False;
    end;
//=======================Items==================================================
  If rgrp_TypeMulti.ItemIndex = 2 Then
    begin
      If rbtn_RecordTypeMulti.Checked Then
        begin
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_Branch.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_Dept.Text);
          dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RType.Text);

          qry_MultiFilesSearch.Close;
          qry_MultiFilesSearch.SQL.Clear;
          qry_MultiFilesSearch.SQL.Add('SELECT');
          qry_MultiFilesSearch.SQL.Add('i.Itemnumber, i.Filenumber, i.Status AS "IssueStatus", i.IssuedTo, i.IssuedOn, i.FileType AS "RecordType"');
//-------------
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :RecordType');
          qry_SQL.Parameters.ParamByName('RecordType').Value := edt_RecordTypeMulti.Text;
          qry_SQL.Open;
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    qry_MultiFilesSearch.SQL.Add(',i.Text'+InttoStr(J)+' AS ['+labelStr+']')
                  else if (J >= 11)and(J <= 13)Then
                    qry_MultiFilesSearch.SQL.Add(',i.Date'+InttoStr(J-10)+' AS ['+labelStr+']')
                  else if (J >= 14)and(J <= 15)Then
                    qry_MultiFilesSearch.SQL.Add(',i.Number'+InttoStr(J-13)+' AS ['+labelStr+']');
                end;
            end;
          qry_MultiFilesSearch.SQL.Add('FROM');
          qry_MultiFilesSearch.SQL.Add('   Items i');
          qry_MultiFilesSearch.SQL.Add('   INNER JOIN Files f ON i.Filenumber = f.Filenumber');
          qry_MultiFilesSearch.SQL.Add('WHERE');
          qry_MultiFilesSearch.SQL.Add('   f.Branch = :Branch');
          qry_MultiFilesSearch.Parameters.ParamByName('Branch').Value := edt_BranchMulti.Text;
          qry_MultiFilesSearch.SQL.Add('   AND f.Department = :Department');
          qry_MultiFilesSearch.Parameters.ParamByName('Department').Value := edt_DepartmentMulti.Text;
          If edt_RType.Text <> '"General Search"' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND i.FileType = :FileType');
              qry_MultiFilesSearch.Parameters.ParamByName('FileType').Value := edt_RecordTypeMulti.Text;
            end;
          IF trim(edt_FilingAreaMulti.Text) <> '' Then
            begin
              qry_MultiFilesSearch.SQL.Add('   AND i.Warehouse = :Warehouse');
              qry_MultiFilesSearch.Parameters.ParamByName('Warehouse').Value := edt_FilingAreaMulti.Text;
            end;
//--------------
          For J := 1 to 15 Do
            begin
              labelStr := trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString);
              If labelStr <> '' Then
                begin
                  If (J >= 1)and(J <= 10)Then
                    begin
                      If trim(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND i.Text'+InttoStr(J)+' IN (SELECT s FROM dbo.Metrofilerweb_ParseCSVString(:Text'+InttoStr(J)+'))');
                          qry_MultiFilesSearch.Parameters.ParamByName('Text'+InttoStr(J)).Value :=  ConvertLinestoCommaStr(TMemo(FindComponent('mem_TextMulti'+InttoStr(J))).Lines);
                        end;
                    end
                  else if (J >= 11)and(J <= 13)Then
                    begin
                      If trim(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND i.Date'+InttoStr(J-10)+' = :Date'+InttoStr(J-10));
                          qry_MultiFilesSearch.Parameters.ParamByName('Date'+InttoStr(J-10)).Value := StrtoDate(TEdit(FindComponent('edt_DateMulti'+InttoStr(J-10))).Text);
                        end;
                    end
                  else if (J >= 14)and(J <= 15)Then
                    begin
                      If trim(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text) <> '' Then
                        begin
                          qry_MultiFilesSearch.SQL.Add('    AND i.Number'+InttoStr(J-13)+' = :Number'+InttoStr(J-13));
                          qry_MultiFilesSearch.Parameters.ParamByName('Number'+InttoStr(J-13)).Value := StrtoInt(TEdit(FindComponent('edt_NumMulti'+InttoStr(J-13))).Text);
                        end;
                    end;
                end;
            end;
//--------------
          qry_MultiFilesSearch.SQL.Add('ORDER BY i.Itemnumber');
        end;
      btn_ViewItems.Visible := False;
      btn_ViewFiles.Visible := False;
    end;
//==============================================================================
  Screen.Cursor := CrHourglass;
  try
    grd_Results.Columns.Clear;
    grd_Results.DataSource := dts_MultiFilesSearch;
    qry_MultiFilesSearch.Open;
    frm_Console.AutoSizeNewColumns(grd_Results);
    PageControl1.ActivePage := Tabsheet2;
  finally
    Screen.Cursor := CrDefault;
  end;
  lbl_RTot.Caption := InttoStr(qry_MultiFilesSearch.RecordCount);
  If not qry_MultiFilesSearch.isEmpty Then
    exit;
  MessageDLG('No records found',mtInformation,[mbOK],0);
end;

function Tfrm_Requisitions.CheckUserBarcodeAccess(Barcode, Requester :String):Boolean;
begin
  sp_CheckUserBarcodeAccess.Close;
  sp_CheckUserBarcodeAccess.Parameters.ParamByName('@Barcode').Value := Barcode;
  sp_CheckUserBarcodeAccess.Parameters.ParamByName('@UserId').Value := Requester;
  sp_CheckUserBarcodeAccess.Parameters.ParamByName('@Access').Value := false;
  sp_CheckUserBarcodeAccess.ExecProc;
  Result := sp_CheckUserBarcodeAccess.Parameters.ParamByName('@Access').Value;
end;

procedure Tfrm_Requisitions.dts_AddRequesterStateChange(Sender: TObject);
begin
  pnlEditUser.Top := panel5.Top - 120;
  pnlEditUser.Visible :=  (qry_AddRequester.State = dsInsert);
end;

end.

