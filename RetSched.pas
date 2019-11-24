//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit RetSched;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls,
  Grids,DBGrids, Mask, Qrctrls, quickrpt, FileCtrl, ImgList, ADODB, CheckLst,
  DateUtils, Variants;

type
  PickRecord = Record
    Branch       :String[3];
    Department   :String[2];
    Tx_No        :Integer;
  end;
  Tfrm_RetSched = class(TForm)
    dts_Requester: TDataSource;
    tbl_Up: TADOTable;
    Panel1: TPanel;
    qry_FilesMain: TADOQuery;
    dts_Files: TDataSource;
    qry_Record: TADOQuery;
    tbl_Pick: TADOTable;
    qry_Requester: TADOQuery;
    qry_RecordType: TADOQuery;
    qry_FilesSearch: TADOQuery;
    dts_FilesSearch: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lbl_DataType: TLabel;
    btn_Search: TBitBtn;
    qry_GetName: TADOQuery;
    TabSheet2: TTabSheet;
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
    DetailBand1: TQRBand;
    qrtxt_Barcode: TQRDBText;
    qrlbl4: TQRDBText;
    qrlbl3: TQRDBText;
    qrlbl2: TQRDBText;
    qrlbl1: TQRDBText;
    qry_ItemsMain: TADOQuery;
    dts_ItemsMain: TDataSource;
    ImageList1: TImageList;
    qry_CheckRecord: TADOQuery;
    qry_Items: TADOQuery;
    qry_GetRecord: TADOQuery;
    rgrp_SearchType: TRadioGroup;
    qry_ContainersSearch: TADOQuery;
    dts_SearchContainers: TDataSource;
    qry_GetRecordType: TADOQuery;
    qry_TreeContainers: TADOQuery;
    qry_TreeRecords: TADOQuery;
    qry_TreeItems: TADOQuery;
    qry_CheckContainer: TADOQuery;
    qry_GetContainer: TADOQuery;
    qry_GetAutoInc: TADOQuery;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    Label1: TLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    qry_AddPick: TADOQuery;
    qry_OffSiteChk: TADOQuery;
    qry_InsAudit: TADOQuery;
    qry_Loc: TADOQuery;
    qry_Insert: TADOQuery;
    qry_Container: TADOQuery;
    qry_Item: TADOQuery;
    qry_SQL: TADOQuery;
    qry_CheckItemsAllIn: TADOQuery;
    BitBtn1: TSpeedButton;
    ScrollBox3: TScrollBox;
    Panel3: TPanel;
    grd_Results: TDBGrid;
    Panel4: TPanel;
    editPickingSend: TBitBtn;
    edtPickCancel: TBitBtn;
    btn_Print: TBitBtn;
    tv_PickingSlip: TTreeView;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    lbl_RTot: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    btn_RemovePick: TBitBtn;
    cb_ReqName: TComboBox;
    cb_ReqUserID: TComboBox;
    btn_SelAllItems: TBitBtn;
    DBNavigator2: TDBNavigator;
    Panel2: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    btn_SelRecordType: TButton;
    edt_RType: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    rgrp_Ret: TRadioGroup;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    dtp_Start: TDateTimePicker;
    dtp_End: TDateTimePicker;
    rgrp_reqtype: TRadioGroup;
    Label4: TLabel;
    cb_Delivery: TComboBox;
    qry_Delivery: TADOQuery;
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
    procedure qry_FilesSearchAfterOpen(DataSet: TDataSet);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure rgrp_SearchTypeClick(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rep_ResultBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure edt_RTypeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_SelAllItemsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    AddedPicks  :Array of PickRecord;
    ColNames   :Array[1..15] of String;
//-------
    function AddContainer():Boolean;
    function AddRecord():Boolean;

    function VerifyContainerStatus(ContainerNumber :String):Boolean;
    function VerifyRecordStatus(RecordNumber :String):Boolean;
    function ReqContainer(ContainerNumber :String):Boolean;
    function ReqRecord(RecordNumber :String):Boolean;
//-------
    function GeneratePickHead(Branch, Department :String):Integer;
    Procedure SetupSearchFields;
  public
    { Public declarations }
  end;

var
  frm_RetSched  :Tfrm_RetSched;
  Tipe              :Integer;

implementation

uses main, SelBranch, SelDept, SelRType, SelWHouse, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_RetSched.FormCreate(Sender: TObject);
Var
  TempStr   :String;
begin
  rgrp_SearchType.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);
  dtp_Start.Date := now;
  dtp_End.Date := now;

  PageControl1.ActivePage := Tabsheet1;
  Tabsheet3.TabVisible := False;

  Screen.Cursor := crHourglass;
//============================build the Requester===============================
  cb_ReqUserID.Items.Clear;
  cb_ReqName.Items.Clear;

  qry_Requester.Open;
  qry_Requester.first;
  while not qry_requester.eof do
    begin
      TempStr := trim(trim(qry_Requester.FieldByname('Name').AsString) + ' ' + trim(qry_Requester.FieldByname('Surname').AsString));
      If TempStr <> '' Then
        begin
          cb_ReqName.Items.Append(TempStr);
          cb_ReqUserID.Items.Append(trim(qry_Requester.FieldByname('UserId').AsString));
        end;

      qry_Requester.Next;
    end;
  qry_Requester.Close;
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
  Screen.Cursor := crDefault;
end;

procedure Tfrm_RetSched.FormResize(Sender: TObject);
begin
   btn_RemovePick.Left := Width - 293;
end;

procedure Tfrm_RetSched.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_requester.Active := false;
  frm_Console.act_RecMovSched.Enabled := true;
  Action := caFree;
end;


procedure Tfrm_RetSched.edtPickCancelClick(Sender: TObject);
begin
  tv_PickingSlip.Items.Clear;
end;

procedure Tfrm_RetSched.editPickingSendClick(Sender: TObject);
var
  i           :integer;
  TempTreeRecord      :TTreeNode;
  Z                   :Integer;
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
                If not VerifyRecordStatus(TempTreeRecord.Text) Then
                  exit;
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
                        If not VerifyRecordStatus(TempTreeRecord.Item[Z].Text) Then
                          exit;
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
                ReqRecord(TempTreeRecord.Text);
              end
            else If (TempTreeRecord.Level = 0)and(TempTreeRecord.ImageIndex = 0) then//Container
              begin
//---------------Request Items
                If TempTreeRecord.HasChildren Then
                  begin
                    for Z := 0 to TempTreeRecord.Count-1 do
                      begin
                        ReqRecord(TempTreeRecord.Item[Z].Text);
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

procedure Tfrm_RetSched.btn_PrintClick(Sender: TObject);
begin
  rep_Result.Print;
end;

procedure Tfrm_RetSched.btn_SearchClick(Sender: TObject);
var
  J              :Integer;
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
  if (length(edt_RType.Text) = 0) Then
    begin
      MessageDlg('Please select the Record Type!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  If rgrp_Ret.ItemIndex = 4 Then
    rgrp_reqtype.ItemIndex := 1
  else rgrp_reqtype.ItemIndex := 0;
//====================Container=================================================
  If rgrp_SearchType.ItemIndex = 0 Then
    begin
      qry_FilesSearch.Close;
      qry_FilesSearch.SQL.Clear;
      qry_FilesSearch.SQL.Add('SELECT');
      qry_FilesSearch.SQL.Add('  Container, IssueStatus, IssuedTo, FileType AS "RecordType", ');
      For J := 1 to 15 Do
        begin
          If trim(ColNames[J]) <> '' Then
            begin
              If (J >= 1)and(J <= 10)Then
                qry_FilesSearch.SQL.Add('Text'+InttoStr(J)+' "'+ColNames[J]+'",')
              else if (J >= 10)and(J <= 13)Then
                qry_FilesSearch.SQL.Add('Date'+InttoStr(J-10)+' "'+ColNames[J]+'",')
              else if (J >= 14)and(J <= 15)Then
                qry_FilesSearch.SQL.Add('Number'+InttoStr(J-13)+' "'+ColNames[J]+'",');
            end;
        end;
      Case rgrp_Ret.ItemIndex of
        0 : qry_FilesSearch.SQL.Add('''==>WIP'' AS [From To], ');
        1 : qry_FilesSearch.SQL.Add('''WIP==>AONS'' AS [From To], ');
        2 : qry_FilesSearch.SQL.Add('''AONS==>SAONS'' AS [From To], ');
        3 : qry_FilesSearch.SQL.Add('''SAONS==>IONS'' AS [From To], ');
        4 : qry_FilesSearch.SQL.Add('''==>DESTROY'' AS [From To], ');
      end;
      Case rgrp_Ret.ItemIndex of
        0 : qry_FilesSearch.SQL.Add('EntryDate AS [Move Date]');
        1 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(WIP, 0), EntryDate) AS [Move Date]');
        2 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) AS [Move Date]');
        3 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) AS [Move Date]');
        4 : qry_FilesSearch.SQL.Add('Destruct AS [Move Date]');
      end;

      qry_FilesSearch.SQL.Add('FROM');
      qry_FilesSearch.SQL.Add('   Containers');
      qry_FilesSearch.SQL.Add('WHERE');
      qry_FilesSearch.SQL.Add('   Code = :Code');
      qry_FilesSearch.SQL.Add('   AND Branch = :Branch');
      qry_FilesSearch.SQL.Add('   AND Department = :Department');
      If edt_RType.Text <> '"General Search"' Then
        qry_FilesSearch.SQL.Add('   AND FileType = :FileType');
      If trim(edt_WHouse.Text) <> '' Then
        qry_FilesSearch.SQL.Add('   AND Warehouse = :Warehouse');
//--------------Retention
      If rgrp_Ret.ItemIndex = 0 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND EntryDate >= :mStart');
          qry_FilesSearch.SQL.Add('   AND EntryDate <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 1 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(WIP, 0), EntryDate) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(WIP, 0), EntryDate) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 2 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(AONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 3 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(AONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(SAONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 4 Then
        begin
          qry_FilesSearch.SQL.Add('   AND Destruct >= :mStart');
          qry_FilesSearch.SQL.Add('   AND Destruct <= :mEnd');
          qry_FilesSearch.SQL.Add('   AND Destroy = 0');
        end;
      qry_FilesSearch.SQL.Add('ORDER BY Container');
      try
        qry_FilesSearch.Open;
      finally
        Screen.cursor := crDefault;
      end;
    end;
  If rgrp_SearchType.ItemIndex = 1 Then      //Files
    begin
      qry_FilesSearch.Close;
      qry_FilesSearch.SQL.Clear;
      qry_FilesSearch.SQL.Add('SELECT');
      qry_FilesSearch.SQL.Add('  Filenumber, IssueStatus, IssuedTo, FileType AS "RecordType", ');
      For J := 1 to 15 Do
        begin
          If trim(ColNames[J]) <> '' Then
            begin
              If (J >= 1)and(J <= 10)Then
                qry_FilesSearch.SQL.Add('Text'+InttoStr(J)+' "'+ColNames[J]+'",')
              else if (J >= 10)and(J <= 13)Then
                qry_FilesSearch.SQL.Add('Date'+InttoStr(J-10)+' "'+ColNames[J]+'",')
              else if (J >= 14)and(J <= 15)Then
                qry_FilesSearch.SQL.Add('Number'+InttoStr(J-13)+' "'+ColNames[J]+'",');
            end;
        end;
      Case rgrp_Ret.ItemIndex of
        0 : qry_FilesSearch.SQL.Add('''==>WIP'' AS [From To], ');
        1 : qry_FilesSearch.SQL.Add('''WIP==>AONS'' AS [From To], ');
        2 : qry_FilesSearch.SQL.Add('''AONS==>SAONS'' AS [From To], ');
        3 : qry_FilesSearch.SQL.Add('''SAONS==>IONS'' AS [From To], ');
        4 : qry_FilesSearch.SQL.Add('''==>DESTROY'' AS [From To], ');
      end;
      Case rgrp_Ret.ItemIndex of
        0 : qry_FilesSearch.SQL.Add('EntryDate AS [Move Date]');
        1 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(WIP, 0), EntryDate) AS [Move Date]');
        2 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) AS [Move Date]');
        3 : qry_FilesSearch.SQL.Add('DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) AS [Move Date]');
        4 : qry_FilesSearch.SQL.Add('Destruct AS [Move Date]');
      end;

      qry_FilesSearch.SQL.Add('FROM');
      qry_FilesSearch.SQL.Add('   Files');
      qry_FilesSearch.SQL.Add('WHERE');
      qry_FilesSearch.SQL.Add('   Code = :Code');
      qry_FilesSearch.SQL.Add('   AND Branch = :Branch');
      qry_FilesSearch.SQL.Add('   AND Department = :Department');
      If edt_RType.Text <> '"General Search"' Then
        qry_FilesSearch.SQL.Add('   AND FileType = :FileType');
      If trim(edt_WHouse.Text) <> '' Then
        qry_FilesSearch.SQL.Add('   AND Warehouse = :Warehouse');
//--------------Retention
      If rgrp_Ret.ItemIndex = 0 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND EntryDate >= :mStart');
          qry_FilesSearch.SQL.Add('   AND EntryDate <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 1 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(WIP, 0), EntryDate) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(WIP, 0), EntryDate) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 2 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(AONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate)) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 3 Then
        begin
          qry_FilesSearch.SQL.Add('   AND ISNULL(WIP, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(AONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND ISNULL(SAONS, 0) > 0');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) >= :mStart');
          qry_FilesSearch.SQL.Add('   AND DATEADD(month, ISNULL(SAONS, 0), DATEADD(month, ISNULL(AONS, 0), DATEADD(month, ISNULL(WIP, 0), EntryDate))) <= :mEnd');
        end;
      If rgrp_Ret.ItemIndex = 4 Then
        begin
          qry_FilesSearch.SQL.Add('   AND Destruct >= :mStart');
          qry_FilesSearch.SQL.Add('   AND Destruct <= :mEnd');
          qry_FilesSearch.SQL.Add('   AND Destroy = 0');
        end;
      qry_FilesSearch.Parameters.ParamValues['Code'] := CompsCode;
      qry_FilesSearch.Parameters.ParamValues['Branch'] := edt_Branch.Text;
      qry_FilesSearch.Parameters.ParamValues['Department'] := edt_Dept.Text;;
      If edt_RType.Text <> '"General Search"' Then
        qry_FilesSearch.Parameters.ParamValues['FileType'] := edt_RType.Text;
      If trim(edt_WHouse.Text) <> '' Then
        qry_FilesSearch.Parameters.ParamValues['Warehouse'] := edt_WHouse.Text;

      qry_FilesSearch.Parameters.ParamValues['mStart'] := StartoftheDay(dtp_Start.datetime);
      qry_FilesSearch.Parameters.ParamValues['mEnd'] := EndoftheDay(dtp_End.datetime);
      qry_FilesSearch.SQL.Add('ORDER BY Filenumber');
      Screen.cursor := crHourglass;
      try
        qry_FilesSearch.Open;
      finally
        Screen.cursor := crDefault;
      end;
    end;
  If qry_FilesSearch.isEmpty then
    Begin
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end
  else
    begin
      frm_Console.AutoSizeNewColumns(grd_Results);
      PageControl1.ActivePage := Tabsheet2;
    end;
end;

procedure Tfrm_RetSched.btn_RemovePickClick(Sender: TObject);
begin
  try
    tv_PickingSlip.Selected.Delete;
  except
    Showmessage('Please select a Node first!!');
  end;
end;


procedure Tfrm_RetSched.tv_PickingSlipDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  If (Source = grd_Results)Then
    Accept := True
  else Accept := False;
end;

procedure Tfrm_RetSched.tv_PickingSlipDragDrop(Sender, Source: TObject;
  X, Y: Integer);
Var
  J                       :Integer;
begin
  If UpperCase(qry_FilesSearch.Fields[0].FieldName) = 'CONTAINER' Then
    begin
      AddContainer();
    end
  else If UpperCase(qry_FilesSearch.Fields[0].FieldName) = 'FILENUMBER' Then
    begin
      AddRecord();
    end;
  For J := 0 to tv_PickingSlip.Items.Count-1 Do
    If tv_PickingSlip.Items.Item[J].Level = 0 Then
      tv_PickingSlip.Items.Item[J].Expand(True);
end;

procedure Tfrm_RetSched.qry_FilesSearchAfterOpen(DataSet: TDataSet);
begin
  lbl_RTot.Caption := InttoStr(Dataset.RecordCount);
end;

procedure Tfrm_RetSched.btn_SelBranchClick(Sender: TObject);
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

procedure Tfrm_RetSched.btn_SelDeptClick(Sender: TObject);
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

procedure Tfrm_RetSched.rgrp_SearchTypeClick(Sender: TObject);
begin
  edt_RType.Text := '';
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '---';
end;

procedure Tfrm_RetSched.btn_SelRecordTypeClick(Sender: TObject);
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
                          rgrp_SearchType.ItemIndex = 0,
                          rgrp_SearchType.ItemIndex = 1,
                          rgrp_SearchType.ItemIndex = 2,
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

procedure Tfrm_RetSched.btn_SelWHouseClick(Sender: TObject);
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

procedure Tfrm_RetSched.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '';
    end;
end;

procedure Tfrm_RetSched.rep_ResultBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  lbl_Barcode.Caption := qry_FilesSearch.Fields[0].FieldName;
  qrtxt_Barcode.DataField  := qry_FilesSearch.Fields[0].FieldName;
  
  If qry_FilesSearch.FieldCount > 5 Then
    qrlbl1.DataField := qry_FilesSearch.Fields[5].Fieldname
  else qrlbl1.DataField := '';
  If qry_FilesSearch.FieldCount > 6 Then
    qrlbl2.DataField := qry_FilesSearch.Fields[6].Fieldname
  else qrlbl2.DataField := '';
  If qry_FilesSearch.FieldCount > 7 Then
    qrlbl3.DataField := qry_FilesSearch.Fields[7].Fieldname
  else qrlbl3.DataField := '';
  If qry_FilesSearch.FieldCount > 8 Then
    qrlbl4.DataField := qry_FilesSearch.Fields[8].Fieldname
  else qrlbl4.DataField := '';
end;

function Tfrm_RetSched.VerifyContainerStatus(ContainerNumber :String):Boolean;
Var
  mloc, mWare   :String;
begin
  Result := False;
  try
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

function Tfrm_RetSched.VerifyRecordStatus(RecordNumber :String):Boolean;
Var
  mloc, mWare   :String;
begin
  Result := False;
  try
    qry_Record.Close;
    qry_Record.SQL.Clear;
    qry_Record.SQL.Add('SELECT * FROM FILES WHERE FILENUMBER = :FN');
    qry_Record.Parameters.ParamByName('FN').Value := RecordNumber;
//    qry_Record.RequestLive := True;
    qry_Record.Open;
//-----
    If qry_Record.IsEmpty Then
      begin
        MessageDlg('File '+Recordnumber+' not found in database!!', mtInformation,[mbOk], 0);
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
    qry_Record.SQL.Add('SELECT * FROM LOCATION WHERE(WAREHOUSE = :WH)AND(LOCNO = :LN)');
    qry_Record.Parameters.ParamByName('WH').Value := mware;
    qry_Record.Parameters.ParamByName('LN').Value := mloc;
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

function Tfrm_RetSched.ReqContainer(ContainerNumber :String):Boolean;
Var
  mloc, mWare   :String;
  mTxNo, mrecpos   :Integer;
  mBranch, mDept   :String;
begin
  qry_Container.Close;
  qry_Container.SQL.Clear;
  qry_Container.SQL.Add('SELECT * FROM Containers WHERE Container = '+QuotedStr(Containernumber));
  qry_Container.Open;

  mloc := trim(qry_Container.FieldByName('locno').AsString);
  mware := trim(qry_Container.FieldByName('warehouse').AsString);
  mBranch := trim(qry_Container.FieldByName('Branch').AsString);
  mDept := trim(qry_Container.FieldByName('Department').AsString);
  mRecPos := 0;
//==============================================================================
  qry_Loc.Close;
  qry_Loc.SQL.Clear;
  qry_Loc.SQL.Add('SELECT * FROM LOCATION');
  qry_Loc.SQL.Add('WHERE WAREHOUSE = '+QuotedStr(mware));
  qry_Loc.SQL.Add('AND LOCNO = '+QuotedStr(mLoc));
  qry_Loc.Open;

  mTxNo := GeneratePickHead(mBranch, mDept);

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
  qry_Insert.SQL.Add('IssuedUserID = '+QuotedStr(cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex])+',  IssuedTo = '+QuotedStr(cb_ReqName.Text)+', ItTxNo = '+InttoStr(mTxNo)+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
  qry_Insert.SQL.Add('WHERE Container = '+QuotedStr(Containernumber));
  qry_Insert.ExecSQL;
//------Audit Entry----------
  dm_Metrofiler.InsAudit('Requested Container', 0, 0, Containernumber, '', 0);
  Result := True;
end;

function Tfrm_RetSched.ReqRecord(RecordNumber :String):Boolean;
Var
  mloc, mWare   :String;
  mTxNo, mrecpos   :Integer;
  mBranch, mDept   :String;
  mContainer       :String;
begin
  qry_Record.Close;
  qry_Record.SQL.Clear;
  qry_Record.SQL.Add('SELECT * FROM FILES WHERE FILENUMBER = '+QuotedStr(RecordNumber));
  qry_Record.Open;

  If qry_Record.FieldByName('ISSUESTATUS').AsString = 'CON' Then
    begin
      mContainer := qry_Record.FieldbyName('ContainerNo').AsString;

      qry_Container.Close;
      qry_Container.SQL.Clear;
      qry_Container.SQL.Add('SELECT * FROM Containers WHERE Container = '+QuotedStr(mContainer));
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
  qry_Loc.SQL.Add('SELECT * FROM LOCATION');
  qry_Loc.SQL.Add('WHERE WAREHOUSE = '+QuotedStr(mware));
  qry_Loc.SQL.Add('AND LOCNO = '+QuotedStr(mLoc));
  qry_Loc.Open;

  mTxNo := GeneratePickHead(mBranch, mDept);

  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO PickD(Container, Barcode, Tx_No, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, Matched, TrType)');
  qry_Insert.SQL.Add('Values(:Container, :Barcode, :Tx_No, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :Matched, :TrType)');
  If mContainer <> '' Then
    qry_Insert.Parameters.ParamByName('Container').Value := mContainer
  else
    begin
      qry_Insert.Parameters.ParamByName('Container').DataType := ftString;
//      qry_Insert.Parameters.ParamByName('Container').Clear;
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
      qry_Insert.SQL.Add('IssuedUserID = '+QuotedStr(cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex])+',  IssuedTo = '+QuotedStr(cb_ReqName.Text)+', ItTxNo = '+InttoStr(mTxNo)+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
      qry_Insert.SQL.Add('WHERE Container = '+QuotedStr(mContainer));
      qry_Insert.ExecSQL;
    end;
//------Update Record----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('UPDATE Files SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
  qry_Insert.SQL.Add('IssuedUserID = '+QuotedStr(cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex])+',  IssuedTo = '+QuotedStr(cb_ReqName.Text)+', ItTxNo = '+InttoStr(mTxNo)+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
  qry_Insert.SQL.Add('WHERE Filenumber = '+QuotedStr(RecordNumber));
  qry_Insert.ExecSQL;
//------Audit Entry----------
  qry_Insert.Close;
  qry_Insert.SQL.Clear;
  qry_Insert.SQL.Add('INSERT INTO Audit (UserID, Comments)');
  qry_Insert.SQL.Add('VALUES (:UserID, :Comments)');
  qry_Insert.Parameters.ParamByName('UserId').Value := User;
  If mContainer <> '' Then
    dm_Metrofiler.InsAudit('Requested File', 0, 0, RecordNumber, 'In Container '+mContainer, 0)
  else
    dm_Metrofiler.InsAudit('Requested File', 0, 0, RecordNumber, '', 0);
  qry_Insert.ExecSQL;
  Result := True;
end;

function Tfrm_RetSched.GeneratePickHead(Branch, Department :String):Integer;
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
  qry_AddPick.SQL.Add('INSERT INTO Pick (Requester, RequesterUserID, Deliver, TxDate, UserID, Status, [Type], TypeDesc, Branch, Department, DeliveryAddress, CostCentre, InternalDept)');
  qry_AddPick.SQL.Add('VALUES(:pRequester, :pRequesterUserID, :pDeliver, GetDate(), :pUserID, ''O'', :pType, :pTypeDesc, :pBranch, :pDepartment, :pDeliveryAddress, :pCostCentre, :pInternalDept)');
  qry_AddPick.SQL.Add('SET NOCOUNT Off');
  qry_AddPick.SQL.Add('SELECT @@IDENTITY');
  qry_AddPick.Parameters.ParamByName('pRequester').Value := cb_ReqName.Text;
  qry_AddPick.Parameters.ParamByName('pRequesterUserID').Value := cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex];
  qry_AddPick.Parameters.ParamByName('pDeliver').Value := trim(cb_Delivery.Text);
  qry_AddPick.Parameters.ParamByName('pUserID').Value := User;
  If rgrp_Ret.ItemIndex = 4 Then
    begin
      qry_AddPick.Parameters.ParamByName('pType').Value := 'DD';
      qry_AddPick.Parameters.ParamByName('pTypeDesc').Value := 'Destruction';
    end
  else
    begin
      qry_AddPick.Parameters.ParamByName('pType').Value := 'RR';
      qry_AddPick.Parameters.ParamByName('pTypeDesc').Value := 'Retrieval';
    end;
  qry_AddPick.Parameters.ParamByName('pBranch').Value := Branch;
  qry_AddPick.Parameters.ParamByName('pDepartment').Value := Department;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT UserId, Address AS "DeliveryAddress", CostCentre, InternalDept FROM AuthCodes WHERE UserId = '+quotedStr(cb_ReqUserID.Items.Strings[cb_ReqName.ItemIndex]));
  qry_SQL.Open;
  If (not(qry_SQL.IsEmpty))and(frm_Console.AccessRight(37)) Then
    begin
      qry_AddPick.Parameters.ParamByName('pDeliveryAddress').Value := qry_SQL.FieldbyName('DeliveryAddress').asString;
      qry_AddPick.Parameters.ParamByName('pCostCentre').Value := qry_SQL.FieldbyName('CostCentre').asString;
      qry_AddPick.Parameters.ParamByName('pInternalDept').Value := qry_SQL.FieldbyName('InternalDept').asString;
    end
  else
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Branch, Department, Delivery_Address AS "DeliveryAddress" FROM Departments');
      qry_SQL.SQL.Add('WHERE Branch = '+QuotedStr(Branch)+' AND Department = '+QuotedStr(Department));
      qry_SQL.Open;
      qry_AddPick.Parameters.ParamByName('pDeliveryAddress').Value := qry_SQL.FieldbyName('DeliveryAddress').asString;
      qry_AddPick.Parameters.ParamByName('pCostCentre').Value := qry_SQL.FieldbyName('CostCentre').asString;
      qry_AddPick.Parameters.ParamByName('pInternalDept').Value := qry_SQL.FieldbyName('InternalDept').asString;
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



Procedure Tfrm_RetSched.SetupSearchFields;
Var
   RecordType :String;
   J          :Integer;
begin
  RecordType := edt_RType.Text;

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
end;

procedure Tfrm_RetSched.edt_RTypeChange(Sender: TObject);
begin
  SetupSearchFields;
end;

procedure Tfrm_RetSched.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

function Tfrm_RetSched.AddContainer():Boolean;
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
          If CTemp.Text = qry_FilesSearch.FieldByName('CONTAINER').asString then
            begin
              CTemp.DeleteChildren;
              Flag := True;
              break;
            end;
        end;
    end;
  If not Flag Then
    begin
      CTemp := tv_PickingSlip.Items.Add(nil, qry_FilesSearch.FieldbyName('CONTAINER').asString);
      CTemp.ImageIndex := 0;
      CTemp.SelectedIndex := 0;
      CTemp.DeleteChildren;
    end;
//==============================================================================
//==============================================================================
  Result := True;
end;

function Tfrm_RetSched.AddRecord():Boolean;
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
      If qry_FilesSearch.FieldByName('ISSUESTATUS').asString = 'CON' Then
        begin
          CFlag := False;
          Flag := False;
          For J := 0 to tv_PickingSlip.Items.Count-1 Do
            begin
              CTemp  := tv_PickingSlip.Items.Item[J];
              If CTemp.Level = 0 Then
                begin
                  If CTemp.Text = qry_filesSearch.FieldByName('CONTAINER').asString then
                    begin
                      CFlag := True;
                      For Z := 0 to CTemp.Count-1 Do
                        If CTemp.Item[Z].Text = qry_filesSearch.FieldbyName('Filenumber').asString Then
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
              If not qry_ContainersSearch.Active Then
                begin
                  qry_ContainersSearch.Active := False;
                  qry_ContainersSearch.SQL.Clear;
                  qry_ContainersSearch.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CO');
                  qry_ContainersSearch.Parameters.ParamByName('CO').Value := qry_filesSearch.FieldByName('CONTAINER').asString;
                  qry_ContainersSearch.Active := True;
                end;

              CTemp := tv_PickingSlip.Items.Add(nil, qry_ContainersSearch.FieldbyName('CONTAINER').asString);
              CTemp.ImageIndex := 0;
              CTemp.SelectedIndex := 0;
            end;
          IF not Flag Then
            begin
              qry_GetRecord.Active := False;
              qry_GetRecord.SQL.Clear;
              qry_GetRecord.SQL.Add('SELECT * FROM Files WHERE Filenumber = :FN');
              qry_GetRecord.Parameters.ParamByName('FN').Value := qry_filesSearch.FieldByName('FILENUMBER').asString;
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
                  If RTemp.Text = qry_filesSearch.FieldByName('FILENUMBER').asString then
                    begin
                      RTemp.DeleteChildren;
                      Flag := True;
                    end;
                end;
            end;
          If not Flag Then
            begin
              RTemp := tv_PickingSlip.Items.Add(nil, qry_FilesSearch.FieldbyName('FILENUMBER').asString);
              RTemp.ImageIndex := 1;
              RTemp.SelectedIndex := 1;
              RTemp.DeleteChildren;
            end;
        end;
//==============================================================================
//==============================================================================
  Result := True;
end;


procedure Tfrm_RetSched.btn_SelAllItemsClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    qry_FilesSearch.DisableControls;
    qry_FilesSearch.First;
    While not qry_FilesSearch.EOF Do
      begin
  //==============================================================================
  //==============================================================================
        If (trim(qry_FilesSearch.FieldByName('ISSUESTATUS').asString) = 'IN')Then
          begin
            If UpperCase(qry_FilesSearch.Fields[0].FieldName) = 'CONTAINER' Then
              begin
                AddContainer();
              end
            else If UpperCase(qry_FilesSearch.Fields[0].FieldName) = 'FILENUMBER' Then
              begin
                AddRecord();
              end;
          end;
        qry_FilesSearch.Next;
      end;
  finally
    Screen.Cursor := crDefault;
    qry_FilesSearch.First;
    qry_FilesSearch.EnableControls;
  end;
end;

end.

