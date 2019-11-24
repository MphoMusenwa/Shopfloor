unit eRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ImgList, StdActns, BandActn,
  DB, ADODB, Mask, DBCtrls, framImageViewer, 
  framHTMLViewer, ShellAPI, Mapi, OleCtrls, DebenuPDFLibrary,
  framThumbnails, Menus, DateUtils, ImageEnIO, ieview, iemview, DBCGrids;

type
  PFieldRec = ^TFieldRec;
  TFieldRec = record
    FieldName:String;
    PKey     :String;
    NodeType :String[1];
    eRecNo   :Integer;
    ImgNo    :Integer;
  end;
  Tfrm_eRecords = class(TForm)
    pnl_LeftMain: TPanel;
    pnl_Info: TPanel;
    pg_Search: TPageControl;
    tb_FavFolders: TTabSheet;
    tb_AllFold: TTabSheet;
    scrl_IndexInfoBox: TScrollBox;
    Panel4: TPanel;
    Label1: TLabel;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    tree_AllFold: TTreeView;
    pnl_Search: TPanel;
    btn_SpecSrch: TSpeedButton;
    btn_CrossQSrch: TSpeedButton;
    splitter: TSplitter;
    Panel1: TPanel;
    Label2: TLabel;
    img_Top_Down: TImage;
    img_Top_Up: TImage;
    Image1: TImage;
    Image2: TImage;
    img_Bottom_Down: TImage;
    img_Bottom_Up: TImage;
    qry_Search: TADOQuery;
    ImageList1: TImageList;
    qry_SQL: TADOQuery;
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
    DTS_Details: TDataSource;
    qry_Tree: TADOQuery;
    Splitter1: TSplitter;
    pm_Tree: TPopupMenu;
    DeleteImage1: TMenuItem;
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    edt_Col11: TEdit;
    edt_Col12: TEdit;
    edt_Col13: TEdit;
    edt_Col14: TEdit;
    edt_Col15: TEdit;
    TimerRefresh: TTimer;
    eMailImage1: TMenuItem;
    LauncheRecord1: TMenuItem;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    btn_Prior: TSpeedButton;
    btn_Next: TSpeedButton;
    btn_ShellExec: TSpeedButton;
    btn_eMail: TSpeedButton;
    btn_Inbox: TSpeedButton;
    btn_eRecordDataManager: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_EMailPDF: TSpeedButton;
    btn_Forward: TSpeedButton;
    Panel2: TPanel;
    Scroll_ImageViewer: TPanel;
    pnl_Comments: TPanel;
    splitter_Comments: TSplitter;
    btn_AddComment: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    qry_Comments: TADOQuery;
    dts_Comments: TDataSource;
    ScrollBox1: TScrollBox;
    tv_Inbox: TTreeView;
    pm_TreeInbox: TPopupMenu;
    eMailImage2: TMenuItem;
    LauncheRecord2: TMenuItem;
    DeleteImage2: TMenuItem;
    RemovefromInbox1: TMenuItem;
    qry_TreeInbox: TADOQuery;
    FilterData1: TMenuItem;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Act_CloseExecute(Sender: TObject);
    procedure act_InBoxExecute(Sender: TObject);
    procedure img_Top_UpClick(Sender: TObject);
    procedure img_Top_DownClick(Sender: TObject);
    procedure img_Bottom_UpClick(Sender: TObject);
    procedure img_Bottom_DownClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SpecSrchClick(Sender: TObject);
    procedure tree_AllFoldChange(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_PriorClick(Sender: TObject);
    procedure btn_NextClick(Sender: TObject);
    procedure qry_SearchAfterScroll(DataSet: TDataSet);
    procedure qry_SearchAfterOpen(DataSet: TDataSet);
    procedure btn_CrossQSrchClick(Sender: TObject);
    procedure btn_ShellExecClick(Sender: TObject);
    procedure btn_eMailClick(Sender: TObject);
    procedure btn_InboxClick(Sender: TObject);
    procedure qry_SearchAfterClose(DataSet: TDataSet);
    procedure DeleteImage1Click(Sender: TObject);
    procedure tree_AllFoldMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure btn_eRecordDataManagerClick(Sender: TObject);
    procedure tree_AllFoldExpanded(Sender: TObject; Node: TTreeNode);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_EMailPDFClick(Sender: TObject);
    procedure btn_ForwardClick(Sender: TObject);
    procedure eMailImage1Click(Sender: TObject);
    procedure LauncheRecord1Click(Sender: TObject);
    procedure tree_AllFoldDblClick(Sender: TObject);
    procedure btn_AddCommentClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pg_SearchChange(Sender: TObject);
    procedure DeleteImage2Click(Sender: TObject);
    procedure RemovefromInbox1Click(Sender: TObject);
    procedure FilterData1Click(Sender: TObject);
  private
    { Private declarations }
    OriginalSQLText  :String;
    OriginalSQLTextInbox   :String;
    OrderbyClause :String;
    CurrFileName    :String;
    BusyFlag     :Boolean;
    DrawThumbnails  :Boolean;
    LastDocumentDisplayed   :Integer;
    SavedZoom               :Single;
    SavedX, SavedY          :Integer;
    SearchType      :smallint;
    function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
    procedure SendFile(attached: String);
    function GetChildCount(TreeNode :TTreeNode):Integer;
    procedure DisplayeRecordInbox;
    Procedure DoCrossQuerySearch();
    procedure DoSpecificSearch();
 public
    { Public declarations }
    procedure DisplayeRecord(Itemnumber, Filenumber  :String);
    procedure DisplayeRecordTrxNo(TrxNo  :Integer);
    procedure DisplayThumbnail(tImageNo  :Integer);
    function SaveView(Zoom :Single; X, Y  :Integer):Boolean;
    function LoadView(VAR Zoom :Single; VAR X, Y  :Integer):Boolean;
  end;

var
  frm_eRecords: Tfrm_eRecords;

implementation

uses main, ePending, eRecSrchSpec, MetrofilerDataModule, eRecSrchQry, framRichEditViewer,
  eRecDataMan, eRecordsCommentAdd, eRecordsForward, eRecordFilter;

{$R *.dfm}

procedure Tfrm_eRecords.FilterData1Click(Sender: TObject);
begin
  If frm_eRecordFullTextFilter.ShowModal = mrOK Then
    If SearchType = 0 Then
      DoSpecificSearch()
    else If SearchType = 1 Then
      DoCrossQuerySearch();
end;

procedure Tfrm_eRecords.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_eRecords.Enabled := True;
  frm_Console.feRecords := Nil;
  Action := caFree;  
end;

procedure Tfrm_eRecords.Act_CloseExecute(Sender: TObject);
begin
Close;
end;

procedure Tfrm_eRecords.act_InBoxExecute(Sender: TObject);
begin
//  act_InBox.Enabled := False;
  Application.CreateForm(Tfrm_ePending, frm_ePending);
end;


procedure Tfrm_eRecords.img_Top_UpClick(Sender: TObject);
Var
  J   :Integer;
begin
  img_Top_Up.Visible := False;
  img_Top_Down.Visible := True;
  J := 135;
  While J > 30 Do
    begin
      Dec(J, 5);
      pnl_Search.Height := J;
      Application.ProcessMessages;
      Sleep(1);
    end;
end;

procedure Tfrm_eRecords.img_Top_DownClick(Sender: TObject);
Var
  J   :Integer;
begin
  img_Top_Up.Visible := True;
  img_Top_Down.Visible := False;
  J := 30;
  While J < 135 Do
    begin
      Inc(J, 5);
      pnl_Search.Height := J;
      Application.ProcessMessages;
      Sleep(1);
    end;
end;

procedure Tfrm_eRecords.img_Bottom_UpClick(Sender: TObject);
Var
  J   :Integer;
begin
  img_Bottom_Up.Visible := False;
  img_Bottom_Down.Visible := True;
  J := pnl_Info.Height;
  If J < 135 Then
    begin
      Repeat
        Application.ProcessMessages;
        Sleep(1);
        Inc(J, 5);
        pnl_Info.Height := J;
      Until J >= 135;
      J := 135;
      pnl_Info.Height := J;
    end;
end;

procedure Tfrm_eRecords.img_Bottom_DownClick(Sender: TObject);
 Var
  J   :Integer;
begin
  img_Bottom_Up.Visible := True;
  img_Bottom_Down.Visible := False;
  J := pnl_Info.Height;
  Repeat
    Application.ProcessMessages;
    Sleep(1);
    Dec(J, 5);
    pnl_Info.Height := J;
  Until J <= 30;
  J := 30;
  pnl_Info.Height := J;
end;

procedure Tfrm_eRecords.FormCreate(Sender: TObject);
Var
  TreeNode  :TTreeNode;
  J  :Integer;
begin
  frm_eRecordFullTextFilter.mem_Filters.Lines.Clear;
  FilterData1.Visible := frm_Console.FullTextSearch = 1;
  TimerRefresh.Enabled := False;
  LastDocumentDisplayed := 0;
  BusyFlag := False;
  pnl_Search.Height := 30;
  pnl_Info.Height := 30;
  TreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TreeNode.ImageIndex := 0;
  TreeNode.SelectedIndex := 0;
  frm_SearcheRecords.Initialize(True);
  frm_SearcheRecordsCross.Initialize(True);
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;


  DeleteImage1.Visible := frm_Console.AccessRight(9);
  DeleteImage2.Visible := frm_Console.AccessRight(9);

  btn_ShellExec.Visible := frm_Console.AccessRight(8);
  LauncheRecord2.Visible := frm_Console.AccessRight(8);
  LauncheRecord1.Visible := frm_Console.AccessRight(8);

  btn_eMail.Visible := frm_Console.AccessRight(8);
  btn_eMailPDF.Visible := frm_Console.AccessRight(8);
  eMailImage1.Visible := frm_Console.AccessRight(8);
  eMailImage2.Visible := frm_Console.AccessRight(8);

  btn_eRecordDataManager.Visible := frm_Console.AccessRight(10);
  btn_Forward.Visible := frm_Console.AccessRight(50);

  If (frm_Console.feRecMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      btn_Inbox.Visible := frm_Console.AccessRight(12);
    end
  else
    begin
      btn_Inbox.Visible := false;
    end;
//---
  SavedZoom := -1;
  SavedY := -1;
  SavedX := -1;
//---
  frm_SearcheRecords.chk_Partial.checked := (frm_Console.PartialSearch = 1);
  frm_SearcheRecordsCross.chk_Partial.checked := (frm_Console.PartialSearch = 1);
end;

procedure Tfrm_eRecords.FormResize(Sender: TObject);
begin
  DBCtrlGrid1.RowCount := Trunc(DBCtrlGrid1.Height / 75);
end;

Procedure Tfrm_eRecords.DoSpecificSearch();
Var
  J, I, A, T  :Integer;
  TempStr  :String;
  TempStr2  :String;
  FieldList:String;
  GroupList:String;
  SortList :String;
  LastField:Array[0..100] of String[100];
  LastTreeNode:Array[0..100] of TTreeNode;
  TopTreeNode  :TTreeNode;
  TmpTreeNode  :TTreeNode;
  FieldRecPtr: PFieldRec;
  ChangeFlag :Boolean;
  ImageIndex :Integer;
  FileN, DocType, sFilter   :String;
  ExpandedFlag  :Boolean;
begin
  qry_Tree.Close;
  qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  FieldList := FieldList + 'e.Branch, b.Name AS "BranchName", ';
  FieldList := FieldList + 'e.Department, d.Name AS "DeptName", ';
  FieldList := FieldList + 'e.RecordType, e.RecordCat, ';
//---
  For A := 1 to 15 Do
    begin
      If (A >= 1)AND(A <= 10) Then
        FieldList := FieldList + 'e.Text'+InttoStr(A)+', '
      else If (A >= 11)AND(A <= 13) Then
        FieldList := FieldList + 'e.Date'+InttoStr(A-10)+', '
      else If (A >= 14)AND(A <= 15) Then
        FieldList := FieldList + 'e.Number'+InttoStr(A-13)+', '
    end;
//===========Generate the Group by List-------------------------
  GroupList := '';
  For I := 1 to 19 Do
    begin
      If StrtoIntDef(frm_SearcheRecords.edt_BranchGroup.Text, 0) = I Then
        If frm_SearcheRecords.cb_BranchSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.Branch, '
        else GroupList := GroupList + 'e.Branch DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_DeptGroup.Text, 0) = I Then
        If frm_SearcheRecords.cb_DeptSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.Department, '
        else GroupList := GroupList + 'e.Department DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_RecordTypeGroup.Text, 0) = I Then
        If frm_SearcheRecords.cb_RecordTypeSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.RecordType, '
        else GroupList := GroupList + 'e.RecordType DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_RecordCatGroup.Text, 0) = I Then
        If frm_SearcheRecords.cb_RecordCatSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.RecordCat, '
        else GroupList := GroupList + 'e.RecordCat DESC, ';
    //---
      For J := 1 to 15 Do
        begin
          If StrtoIntDef(TEdit(frm_SearcheRecords.FindComponent('edt_ColGroup'+InttoStr(J))).Text, 0) = I Then
            If TComboBox(frm_SearcheRecords.FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex = 0 Then
              begin
                A := TComboBox(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(J))).Tag;
                If (A >= 1)AND(A <= 10) Then
                  GroupList := GroupList + 'e.Text'+InttoStr(A)+', '
                else If (A >= 11)AND(A <= 13) Then
                  GroupList := GroupList + 'e.Date'+InttoStr(A-10)+', '
                else If (A >= 14)AND(A <= 15) Then
                  GroupList := GroupList + 'e.Number'+InttoStr(A-13)+', '
              end
            else
              begin
                A := TComboBox(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(J))).Tag;
                If (A >= 1)AND(A <= 10) Then
                  GroupList := GroupList + 'e.Text'+InttoStr(A)+' DESC, '
                else If (A >= 11)AND(A <= 13) Then
                  GroupList := GroupList + 'e.Date'+InttoStr(A-10)+' DESC, '
                else If (A >= 14)AND(A <= 15) Then
                  GroupList := GroupList + 'e.Number'+InttoStr(A-13)+' DESC, '
              end;
        end;
    end;
//===========Generate the Sort by List-------------------------
  SortList := '';
  For I := 1 to 19 Do
    begin
      If StrtoIntDef(frm_SearcheRecords.edt_BranchSort.Text, 0) = I Then
        If frm_SearcheRecords.cb_BranchSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.Branch, '
        else SortList := SortList + 'e.Branch DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_DeptSort.Text, 0) = I Then
        If frm_SearcheRecords.cb_DeptSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.Department, '
        else SortList := SortList + 'e.Department DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_RecordTypeSort.Text, 0) = I Then
        If frm_SearcheRecords.cb_RecordTypeSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.RecordType, '
        else SortList := SortList + 'e.RecordType DESC, ';
      If StrtoIntDef(frm_SearcheRecords.edt_RecordCatSort.Text, 0) = I Then
        If frm_SearcheRecords.cb_RecordCatSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.RecordCat, '
        else SortList := SortList + 'e.RecordCat DESC, ';
    //---
      For J := 1 to 15 Do
        begin
          If StrtoIntDef(TEdit(frm_SearcheRecords.FindComponent('edt_ColSort'+InttoStr(J))).Text, 0) = I Then
            If TComboBox(frm_SearcheRecords.FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex = 0 Then
              begin
                A := TComboBox(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(J))).Tag;
                If (A >= 1)AND(A <= 10) Then
                  SortList := SortList + 'e.Text'+InttoStr(A)+', '
                else If (A >= 11)AND(A <= 13) Then
                  SortList := SortList + 'e.Date'+InttoStr(A-10)+', '
                else If (A >= 14)AND(A <= 15) Then
                  SortList := SortList + 'e.Number'+InttoStr(A-13)+', '
              end
            else
              begin
                A := TComboBox(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(J))).Tag;
                If (A >= 1)AND(A <= 10) Then
                  SortList := SortList + 'e.Text'+InttoStr(A)+' DESC, '
                else If (A >= 11)AND(A <= 13) Then
                  SortList := SortList + 'e.Date'+InttoStr(A-10)+' DESC, '
                else If (A >= 14)AND(A <= 15) Then
                  SortList := SortList + 'e.Number'+InttoStr(A-13)+' DESC, '
              end;
        end;
    end;
  SortList := SortList + 'i.TrxNo';
//------------
  qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
  qry_Tree.SQL.Add('SET @UserId = :UserID');
  qry_Tree.Parameters.ParamValues['UserId'] := User;

  qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'e.eRecNo, i.TrxNo AS "ImageNo", i.ImgComment, i.DocName');
  qry_Tree.SQL.Add('FROM');
  qry_Tree.SQL.Add('  eRecords e');
  qry_Tree.SQL.Add('  INNER JOIN Branches b ON e.Branch = b.Branch');
  qry_Tree.SQL.Add('  INNER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_Tree.SQL.Add('  LEFT OUTER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
  qry_Tree.SQL.Add('WHERE');
  qry_Tree.SQL.Add('  b.Status <> 1 AND d.Status <> 1');
//------Branch
  If frm_SearcheRecords.edt_Branch.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.Branch = :Branch');
      qry_Tree.Parameters.ParamValues['Branch'] := frm_SearcheRecords.edt_Branch.Text;
    end;
//------Department
  If frm_SearcheRecords.edt_Dept.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.Department = :Department');
      qry_Tree.Parameters.ParamValues['Department'] := frm_SearcheRecords.edt_Dept.Text;
    end;
//------RecordType
  If frm_SearcheRecords.edt_RecordType.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.RecordType = :RecordType');
      qry_Tree.Parameters.ParamValues['RecordType'] := frm_SearcheRecords.edt_RecordType.Text;
    end
  else
    begin
      qry_Tree.SQL.Add('AND EXISTS(');

      if frm_Console.AccessSysAdmin then
        begin
          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	*');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	IndexDefinitions i');
          qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ia.Branch = e.Branch AND');
          qry_Tree.SQL.Add('	ia.Department = e.Department AND');
          qry_Tree.SQL.Add('	ia.Description = e.RecordType AND');
          qry_Tree.SQL.Add('	i.UseeRecords = 1');
        end
      else
        begin
          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	  *');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	  IndexDefinitions x');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	EXISTS (');
          qry_Tree.SQL.Add('				SELECT');
          qry_Tree.SQL.Add('					*');
          qry_Tree.SQL.Add('				FROM');
          qry_Tree.SQL.Add('					IndexDefinitions i');
          qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
          qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
          qry_Tree.SQL.Add('				WHERE');
          qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
          qry_Tree.SQL.Add('				 a.Department = e.Department AND');
          qry_Tree.SQL.Add('				 a.Description = x.Description AND');
          qry_Tree.SQL.Add('				 u.UserID = @UserId AND');
          qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
          qry_Tree.SQL.Add('			)');
          qry_Tree.SQL.Add('	OR EXISTS (');
          qry_Tree.SQL.Add('				SELECT');
          qry_Tree.SQL.Add('					*');
          qry_Tree.SQL.Add('				FROM');
          qry_Tree.SQL.Add('					IndexDefinitions i');
          qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
          qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
          qry_Tree.SQL.Add('					INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
          qry_Tree.SQL.Add('				WHERE');
          qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
          qry_Tree.SQL.Add('				 a.Department = e.Department AND');
          qry_Tree.SQL.Add('				 a.Description = x.Description AND');
          qry_Tree.SQL.Add('				 r.UserID = @UserId AND');
          qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
          qry_Tree.SQL.Add('			)');
        end;
      qry_Tree.SQL.Add(')');
    end;
//------RecordCat
  If frm_SearcheRecords.cb_RecordCat.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.RecordCat = :RecordCat');
      qry_Tree.Parameters.ParamValues['RecordCat'] := frm_SearcheRecords.cb_RecordCat.Text;
    end
  else
    begin
      qry_Tree.SQL.Add('AND (');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 0)');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 1)');
      qry_Tree.SQL.Add('			)');
      qry_Tree.SQL.Add('			AND');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				 EXISTS(SELECT *');
      qry_Tree.SQL.Add('						FROM RecordCat c INNER JOIN RCRTRts r ON c.RecCatType = r.RecordCat');
      qry_Tree.SQL.Add('						WHERE r.RecordType = e.RecordType AND c.RecCatType = e.RecordCat)');
      qry_Tree.SQL.Add('			)');
      if not frm_Console.AccessSysAdmin then
        begin
          qry_Tree.SQL.Add('			AND');
          qry_Tree.SQL.Add('			(');
          qry_Tree.SQL.Add('				(');
          qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a WHERE a.RecordCat = e.RecordCat AND a.UserId = @UserId)');
          qry_Tree.SQL.Add('				)');
          qry_Tree.SQL.Add('				OR');
          qry_Tree.SQL.Add('				(');
          qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.RecordCat = e.RecordCat AND r.UserId = @UserId)');
          qry_Tree.SQL.Add('				)');
          qry_Tree.SQL.Add('			)');
        end;
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			e.RecordCat IS NULL');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			e.RecordCat = ''''');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('	)');
    end;
//----------------Filters------------
  For J := 1 to 15 Do
    begin
      A := TComboBox(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(J))).Tag;
      If (A >= 1)AND(A <= 10) Then      //Text
        begin
          TempStr := TComboBox(frm_SearcheRecords.FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            begin
              If (frm_SearcheRecords.chk_Partial.Checked) Then
                begin
                  qry_Tree.SQL.Add('AND e.Text'+InttoStr(A)+' LIKE :Text'+InttoStr(A));
                  qry_Tree.Parameters.ParamValues['Text'+InttoStr(A)] := '%'+TempStr+'%';
                end
              else
                begin
                  qry_Tree.SQL.Add('AND e.Text'+InttoStr(A)+' = :Text'+InttoStr(A));
                  qry_Tree.Parameters.ParamValues['Text'+InttoStr(A)] := TempStr;
                end;
            end;
        end
      else If (A >= 10)AND(A <= 13) Then   //Date
        begin
          TempStr  := TEdit(frm_SearcheRecords.FindComponent('edt_FrDate'+InttoStr(J-10))).Text;
          TempStr2 := TEdit(frm_SearcheRecords.FindComponent('edt_ToDate'+InttoStr(J-10))).Text;
          If (TempStr <> '')AND(TempStr2 = '') Then
            begin
              qry_Tree.SQL.Add('AND e.Date'+InttoStr(A-10)+' = :mDate'+InttoStr(A-10));
              qry_Tree.Parameters.ParamByName('mDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
            end
          else If (TempStr <> '')AND(TempStr2 <> '') Then
            begin
              qry_Tree.SQL.Add('AND e.Date'+InttoStr(A-10)+' >= :mFrDate'+InttoStr(A-10));
              qry_Tree.Parameters.ParamByName('mFrDate'+InttoStr(A-10)).Value := StrtoDate(TempStr);
              qry_Tree.SQL.Add('AND e.Date'+InttoStr(A-10)+' <= :mToDate'+InttoStr(A-10));
              qry_Tree.Parameters.ParamByName('mToDate'+InttoStr(A-10)).Value := StartoftheDay(StrtoDate(TempStr2)+1);
            end;
        end
      else If (A >= 14)AND(A <= 15) Then   //Number
        begin
          TempStr := TComboBox(frm_SearcheRecords.FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            begin
              qry_Tree.SQL.Add('AND e.Number'+InttoStr(A-13)+' = :Number'+InttoStr(A-13));
              qry_Tree.Parameters.ParamByName('Number'+InttoStr(A-13)).Value := TempStr;
            end;
        end;
    end;

//----------Full Text Filters---------------------------
  If (frm_Console.FullTextSearch = 1) Then
    begin
      For J := 0 to frm_eRecordFullTextFilter.mem_Filters.Lines.Count-1 Do
        begin
          sFilter := trim(frm_eRecordFullTextFilter.mem_Filters.Lines.Strings[J]);
          If sFilter <> '' Then
            begin
              sFilter := '"' + sFilter;
              If frm_SearcheRecordsCross.chk_Partial.Checked Then sFilter := sFilter + '*';
              sFilter := sFilter + '"';

              qry_Tree.SQL.Add('AND( (CONTAINS((e.Text1, e.Text2, e.Text3, e.Text4, e.Text5, e.Text6, e.Text7, e.Text8, e.Text9, e.Text10), :Filter'+InttoStr(J+1)+'))OR');
              qry_Tree.SQL.Add('     (CONTAINS(i.ScannedDoc, :iFilter'+InttoStr(J+1)+')) )');
              qry_Tree.Parameters.ParamValues['Filter'+InttoStr(J+1)] := sFilter;
              qry_Tree.Parameters.ParamValues['iFilter'+InttoStr(J+1)] := sFilter;
            end;
        end;
    end;

//------------

  OriginalSQLText := qry_Tree.SQL.Text;

  OrderbyClause := 'ORDER BY '+GroupList+SortList;
  qry_Tree.SQL.Add('ORDER BY '+GroupList+SortList);

  For J := 0 to 100 Do
    LastField[J] := 'ZZZZZFFF';
//--------------
  tree_AllFold.Items.Clear;
  TopTreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TopTreeNode.ImageIndex := 0;
  TopTreeNode.SelectedIndex := 0;

  Screen.Cursor := crHourglass;
  tree_AllFold.Items.BeginUpdate;
  try
    qry_Tree.Open;
    qry_Tree.First;
    While not qry_Tree.EOF Do
      begin
        ExpandedFlag := True;
        ChangeFlag := False;
        I := -1;
        For J := 1 to 19 Do
          begin
//===================Add Branch Node if Necessary===============================
            If StrtoIntDef(frm_SearcheRecords.edt_BranchGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'Branch';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Branch').AsString);

                    TempStr := trim(qry_Tree.FieldbyName('BranchName').AsString);
                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecords.chk_BranchCollapse.Checked);
              end;
//===================Add Dept Node if Necessary=================================
            If StrtoIntDef(frm_SearcheRecords.edt_DeptGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'Department';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Department').AsString);

                    TempStr := trim(qry_Tree.FieldbyName('DeptName').AsString);
                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecords.chk_DeptCollapse.Checked);
              end;
//===================Add RecordType Node if Necessary===========================
            If StrtoIntDef(frm_SearcheRecords.edt_RecordTypeGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'RecordType';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := '';

                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecords.chk_RecordTypeCollapse.Checked);
              end;
//===================Add RecordType Node if Necessary===========================
            If StrtoIntDef(frm_SearcheRecords.edt_RecordCatGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('RecordCat').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'RecordCat';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := '';

                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecords.chk_RecordCatCollapse.Checked);
              end;
//===================Add Text, Date, Number Node if Necessary===================
            For A := 1 to 15 Do
              begin
                If StrtoIntDef(TEdit(frm_SearcheRecords.FindComponent('edt_ColGroup'+InttoStr(A))).Text, 0) = J Then
                  begin
                    Inc(I);

                    T := TLabel(frm_SearcheRecords.FindComponent('lbl_Col'+InttoStr(A))).Tag;
                    If (T >= 1)AND(T <= 10) Then
                      begin
                        TempStr := trim(qry_Tree.FieldbyName('Text'+InttoStr(T)).AsString);
                        If (LastField[I] <> TempStr)or(ChangeFlag) Then
                          begin
                            ChangeFlag := True;
                            LastField[I] := TempStr;
                            New(FieldRecPtr);
                            FieldRecPtr^.FieldName := 'Text'+InttoStr(T);
                            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                            FieldRecPtr^.ImgNo := 0;
                            FieldRecPtr^.eRecNo := 0;
                            FieldRecPtr^.PKey := '';

                            If I = 0 Then
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end
                            else
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end;
                          end;
                      end; //Text fields
                    If (T >= 11)AND(T <= 13) Then
                      begin
                        TempStr := trim(qry_Tree.FieldbyName('Date'+InttoStr(T-10)).AsString);
                        If (LastField[I] <> TempStr)or(ChangeFlag) Then
                          begin
                            ChangeFlag := True;
                            LastField[I] := TempStr;
                            New(FieldRecPtr);
                            FieldRecPtr^.FieldName := 'Date'+InttoStr(T-10);
                            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                            FieldRecPtr^.ImgNo := 0;
                            FieldRecPtr^.eRecNo := 0;
                            FieldRecPtr^.PKey := '';

                            If I = 0 Then
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end
                            else
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end;
                          end;
                      end; //Number fields
                    If (T >= 14)AND(T <= 15) Then
                      begin
                        TempStr := trim(qry_Tree.FieldbyName('Number'+InttoStr(T-13)).AsString);
                        If (LastField[I] <> TempStr)or(ChangeFlag) Then
                          begin
                            ChangeFlag := True;
                            LastField[I] := TempStr;
                            New(FieldRecPtr);
                            FieldRecPtr^.FieldName := 'Number'+InttoStr(T-10);
                            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                            FieldRecPtr^.ImgNo := 0;
                            FieldRecPtr^.eRecNo := 0;
                            FieldRecPtr^.PKey := '';

                            If I = 0 Then
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end
                            else
                              begin
                                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                                LastTreeNode[I].ImageIndex := 1;
                                LastTreeNode[I].SelectedIndex := 2;
                              end;
                          end;
                      end; //Date fields
                    LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                    ExpandedFlag := not(TCheckBox(frm_SearcheRecords.FindComponent('chk_ColCollapse'+InttoStr(A))).Checked);
                  end;
              end; //Text, Date, Num Node
          end;
//========================Now Add Images========================================
        Inc(I);
        TempStr := trim(qry_Tree.FieldbyName('ImageNo').AsString);
        FileN := trim(qry_Tree.FieldbyName('DocName').AsString);
        DocType := trim(UpperCase((ExtractFileExt(FileN))));
//---------------
        If (qry_Tree.FieldbyName('ImageNo').AsInteger = 0) Then
          ImageIndex := 10
        else If DocType = '.TXT' Then
          ImageIndex := 11
        else If DocType = '.CSV' Then
          ImageIndex := 11
        else If DocType = '.RTF' Then
          ImageIndex := 11
        else If DocType = '.PDF' Then
          ImageIndex := 6
        else If DocType = '.DOC' Then
          ImageIndex := 7
        else If DocType = '.DOCX' Then
          ImageIndex := 7
        else If DocType = '.XLS' Then
          ImageIndex := 5
        else If DocType = '.XLSX' Then
          ImageIndex := 5
        else If DocType = '.HTML' Then
          ImageIndex := 4
        else If DocType = '.HTM' Then
          ImageIndex := 4
        else If DocType = '.MSG' Then
          ImageIndex := 4
        else If DocType = '.EML' Then
          ImageIndex := 4
        else If Copy(DocType, 1, 4) = '.TIF' Then
          ImageIndex := 9
        else ImageIndex := 3;
//---------------
        LastField[I] := TempStr;
        New(FieldRecPtr);
        FieldRecPtr^.FieldName := 'ImageNo';
        FieldRecPtr^.NodeType := 'D'; //eRecord Document
        FieldRecPtr^.ImgNo := qry_Tree.FieldbyName('ImageNo').asInteger;
        FieldRecPtr^.eRecNo := qry_Tree.FieldbyName('eRecNo').asInteger;
        FieldRecPtr^.PKey := '';
        //-------Build Descr-----
        TempStr := '';
        For J := 1 to 15 Do
          begin
            If (J >= 1)AND(J <= 10) Then
              begin
                If trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString) <> '' Then
                  begin
                    If pos('TEXT'+InttoStr(J), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString)+', ';
                  end;
              end;
            If (J >= 11)AND(J <= 13) Then
              begin
                If trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString) <> '' Then
                  begin
                    If pos('DATE'+InttoStr(J-10), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString)+', ';
                  end;
              end;
            If (J >= 14)AND(J <= 15) Then
              begin
                If trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) <> '' Then
                  begin
                    If pos('NUMBER'+InttoStr(J-13), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString)+', ';
                  end;
              end;
          end;
        Delete(TempStr, length(TempStr)-1, 2);

        If I = 0 Then
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
            LastTreeNode[I].Parent.Expanded := ExpandedFlag;
          end
        else
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
            LastTreeNode[I].Parent.Expanded := ExpandedFlag;
          end;


        qry_Tree.Next;
      end;

    For J := 0 to tree_AllFold.Items.Count-1 Do
      begin
        TmpTreeNode := tree_AllFold.Items.Item[J];
        If TmpTreeNode.HasChildren Then
          TmpTreeNode.Text := TmpTreeNode.Text+' ('+InttoStr(GetChildCount(TmpTreeNode))+')';
      end;
  finally
    qry_Tree.Close;
    tree_AllFold.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
  TopTreeNode.Selected := True;
  btn_Next.Enabled := True;
  btn_Prior.Enabled := False;
  DrawThumbnails := False;
  tree_AllFoldChange(tree_AllFold, TopTreeNode);
  SearchType := 0;
end;

procedure Tfrm_eRecords.btn_SpecSrchClick(Sender: TObject);
begin
  If frm_SearcheRecords.Execute = mrOK Then
    begin
      frm_eRecordFullTextFilter.mem_Filters.Lines.Clear;
      DoSpecificSearch();
    end;
end;

function Tfrm_eRecords.GetChildCount(TreeNode :TTreeNode):Integer;
Var
  ChldNode  :TTreeNode;
  Count     :Integer;
begin
  Result := 0;
  If TreeNode = nil Then
    exit;

  Count := 0;
  If TreeNode.HasChildren Then
    begin
      ChldNode := TreeNode.getFirstChild;
      While ChldNode <> Nil Do
        begin
          If ChldNode.HasChildren Then
            Count := Count + GetChildCount(ChldNode)
          else Count := Count + 1;

          ChldNode := ChldNode.getNextSibling;
        end;
    end;
  Result := Count;  
end;

procedure Tfrm_eRecords.tree_AllFoldChange(Sender: TObject;
  Node: TTreeNode);
Var
  J          :Integer;
  FieldName  :String;
  FieldValue :String;
  NodeType    :String[1];
  ImgNo       :Integer;
  eRecNo      :Integer;
  ListTrxNos  :String;
  TreeNode    :TTreenode;
  QueryResult :TADOQuery;
  SQLText     :String;
begin
  If pg_Search.ActivePageIndex = 0 Then
    begin
      QueryResult := qry_TreeInbox;
      SQLText := OriginalSQLTextInbox;
    end
  else
    begin
      QueryResult := qry_Tree;
      SQLText := OriginalSQLText;
    end;
//------------------Draw the meta data captured of current selected-------------
If TTreeView(Sender).SelectionCount = 1 Then
begin
  If Node.Level = 0 Then
    begin
      qry_Search.Close;
      qry_SearchAfterClose(qry_Search);
    end
  else
    begin
      FieldName := PFieldRec(Node.Data)^.FieldName;
      FieldValue := Node.Text;
      NodeType := PFieldRec(Node.Data)^.NodeType;
      ImgNo := PFieldRec(Node.Data)^.ImgNo;
      eRecNo := PFieldRec(Node.Data)^.eRecNo;

      If NodeType = 'D' Then
        begin
          qry_Search.Close;
          qry_Search.SQL.Clear;
          qry_Search.SQL.Add(SQLText);
          For J := 0 to QueryResult.Parameters.Count-1 Do
            qry_Search.Parameters.ParamValues[QueryResult.Parameters.Items[J].Name] := QueryResult.Parameters.Items[J].Value;

          qry_Search.SQL.Add('AND e.eRecNo = :SeleRecNo');
          qry_Search.Parameters.ParamValues['SeleRecNo'] := eRecNo;
          If ImgNo <> 0 Then
            begin
              qry_Search.SQL.Add('AND i.TrxNo = :SelTrxNo');
              qry_Search.Parameters.ParamValues['SelTrxNo'] := ImgNo;
            end;
          Screen.Cursor := crHourglass;
          try
            qry_Search.Open;
          finally
            Screen.Cursor := crDefault;
          end;
        end
      else
        begin
          qry_Search.Close;
        end;
    end;
end
else If TTreeView(Sender).SelectionCount > 1 Then
  begin
    qry_Search.Close;
    ListTrxNos := '';
    For J := 0 to TTreeView(Sender).SelectionCount-1 Do
      begin
        TreeNode := TTreeView(Sender).Selections[J];

        FieldName := PFieldRec(TreeNode.Data)^.FieldName;
        FieldValue := TreeNode.Text;
        NodeType := PFieldRec(TreeNode.Data)^.NodeType;
        ImgNo := PFieldRec(TreeNode.Data)^.ImgNo;

        If NodeType = 'D' Then
          begin
            If ImgNo <> 0 Then
              ListTrxNos := ListTrxNos + InttoStr(ImgNo)+',';
          end;
      end;
    If ListTrxNos <> '' Then
      begin
        pnl_LeftMain.Align := alLeft;
        pnl_LeftMain.Width := 229;
        splitter.visible := true;
        Scroll_ImageViewer.visible := true;

        LastDocumentDisplayed := 0;
        Delete(ListTrxNos, length(ListTrxNos), 1);

        If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) = Nil Then
          begin

            Tfram_Thumbnails.Create(Scroll_ImageViewer).Name := 'fram_Thumbnails1';
            Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Parent := Scroll_ImageViewer;
            Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Align := alClient;
            Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).aParentForm := frm_Console.feRecords;
          end;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Visible := True;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetDocuments('eRecords', ListTrxNos);
        CurrFileName := '';
      end;
  end;
end;

procedure Tfrm_eRecords.tree_AllFoldDblClick(Sender: TObject);
begin
  if frm_Console.AccessRight(8) then
    btn_ShellExecClick(btn_ShellExec);
end;

procedure Tfrm_eRecords.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_eRecords.btn_PrintClick(Sender: TObject);
begin
  If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
    Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Print
  else If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Print
end;

procedure Tfrm_eRecords.btn_PriorClick(Sender: TObject);
Var
  TreeNode  :TTreeNode;
begin
  If pg_Search.ActivePageIndex = 0 Then
    begin
      TreeNode := tv_Inbox.Selected.GetPrev;
    end
  else
    begin
      TreeNode := tree_AllFold.Selected.GetPrev;
    end;
  If TreeNode <> Nil Then
    TreeNode.Selected := True;
  btn_Prior.Enabled := TreeNode <> Nil;
  btn_Next.Enabled := True;
end;

procedure Tfrm_eRecords.btn_NextClick(Sender: TObject);
Var
  TreeNode  :TTreeNode;
begin
  If pg_Search.ActivePageIndex = 0 Then
    begin
      TreeNode := tv_Inbox.Selected.GetNext;
    end
  else
    begin
      TreeNode := tree_AllFold.Selected.GetNext;
    end;
  If TreeNode <> Nil Then
    TreeNode.Selected := True;
  btn_Next.Enabled := TreeNode <> Nil;
  btn_Prior.Enabled := True;
end;

procedure Tfrm_eRecords.qry_SearchAfterScroll(DataSet: TDataSet);
Var
   RecordType :String;
   ColNames   :Array[1..15] of String;
   J, I       :Integer;
   MaxLblLen  :Integer;
   MaxEdtLen  :Integer;
   ComponentTot :Integer;
   Filename, DocType     :String;
begin
  If BusyFlag Then
    exit;
  BusyFlag := True;
  try
  
  RecordType := trim(qry_Search.FieldbyName('RecordType').AsString);
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :DS');
  qry_SQL.Parameters.ParamByName('DS').Value := RecordType;
  qry_SQL.Open;
  For J := 1 to 15 Do
    ColNames[J] := trim(qry_SQL.FieldbyName('Col'+InttoStr(J)).AsString);
  qry_SQL.Close;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM eRecords WHERE eRecNo = :eRecNo');
  qry_SQL.Parameters.ParamByName('eRecNo').Value := qry_Search.FieldbyName('eRecNo').asInteger;
  qry_SQL.Open;

  MaxLblLen := 0;
  MaxEdtLen := 0;
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

              If MaxEdtLen < Canvas.TextWidth(qry_SQL.FieldbyName('TEXT'+InttoStr(J)).AsString) Then
                MaxEdtLen := Canvas.TextWidth(qry_SQL.FieldbyName('TEXT'+InttoStr(J)).AsString);

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := qry_SQL.FieldbyName('TEXT'+InttoStr(J)).AsString;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              If MaxEdtLen < Canvas.TextWidth(qry_SQL.FieldbyName('DATE'+InttoStr(J-10)).AsString) Then
                MaxEdtLen := Canvas.TextWidth(qry_SQL.FieldbyName('DATE'+InttoStr(J-10)).AsString);

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := qry_SQL.FieldbyName('DATE'+InttoStr(J-10)).AsString;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              If MaxEdtLen < Canvas.TextWidth(qry_SQL.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) Then
                MaxEdtLen := Canvas.TextWidth(qry_SQL.FieldbyName('NUMBER'+InttoStr(J-13)).AsString);

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := qry_SQL.FieldbyName('NUMBER'+InttoStr(J-13)).AsString;
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
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Width := MaxEdtLen+15;
    end;
//==============================================================================
  qry_Comments.Close;
  qry_Comments.SQL.Clear;
  qry_Comments.SQL.Add('SELECT');
  qry_Comments.SQL.Add('    ID,');
  qry_Comments.SQL.Add('    CommentDate,');
  qry_Comments.SQL.Add('    UserName,');
  qry_Comments.SQL.Add('    Comment');
  qry_Comments.SQL.Add('FROM');
  qry_Comments.SQL.Add('    eRecordsComments');
  qry_Comments.SQL.Add('WHERE');
  qry_Comments.SQL.Add('    eRecNo = :eRecNo');
  qry_Comments.SQL.Add('ORDER BY');
  qry_Comments.SQL.Add('    ID Desc');
  qry_Comments.Parameters.ParamByName('eRecNo').Value := qry_Search.FieldbyName('eRecNo').asInteger;
  qry_Comments.Open;
//==============================================================================
  If (LastDocumentDisplayed = Dataset.FieldByName('IMAGENO').asInteger)AND
     (LastDocumentDisplayed <> 0) Then
    exit;
  LastDocumentDisplayed := Dataset.FieldByName('IMAGENO').asInteger;
//==============================================================================
 ComponentTot := Scroll_ImageViewer.ComponentCount;
 For J := ComponentTot-1 downto 0 Do
  begin
   If (Scroll_ImageViewer.Components[J] is TFrame) Then
     begin
       If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
         Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
       Scroll_ImageViewer.Components[J].Free;
     end;
  end;
 btn_Print.Visible := False;

  If LastDocumentDisplayed = 0 Then
    begin
      exit;
    end;

  Filename := ExtractFileName(trim(qry_Search.FieldbyName('DocName').AsString));
  DocType := UpperCase(trim(ExtractFileExt(Filename)));
//==============================================================================
  If (DocType = '.TIF')OR
     (DocType = '.TIFF')OR
     (DocType = '.JPG')OR
     (DocType = '.JPEG')OR
     (DocType = '.PNG')OR
     (DocType = '.PSD')OR
     (DocType = '.PDF')OR
     (DocType = '.BMP')Then
    begin
      pnl_LeftMain.Align := alLeft;
      pnl_LeftMain.Width := 229;
      splitter.visible := true;
      Scroll_ImageViewer.visible := true;

      Tfram_ImageViewer.Create(Scroll_ImageViewer).Name := 'fram_ImageViewer1';
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Parent := Scroll_ImageViewer;
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Align := alClient;
      If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetDocuments('eRecords', qry_Search.FieldbyName('IMAGENO').AsInteger) Then
        begin
          Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Visible := True;
          CurrFileName := Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FileName;
        end;
      btn_Print.Visible := frm_Console.AccessRight(8);
    end
  else If (DocType = '.HTM')OR
          (DocType = '.HTML')OR
          (DocType = '.EML')Then
    begin
      pnl_LeftMain.Align := alLeft;
      pnl_LeftMain.Width := 229;
      splitter.visible := true;
      Scroll_ImageViewer.visible := true;

      Tfram_HTMLViewer.Create(Scroll_ImageViewer).Name := 'fram_HTMLViewer1';
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Parent := Scroll_ImageViewer;
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Align := alClient;
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := False;
      If Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).GetDocuments('eRecords', qry_Search.FieldbyName('IMAGENO').AsInteger) Then
        begin
          Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := True;
          CurrFileName := Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).FileName;
        end;
    end
  else If (DocType = '.TXT')OR
          (DocType = '.RTF')OR
          (DocType = '.CSV')Then
    begin
      pnl_LeftMain.Align := alLeft;
      pnl_LeftMain.Width := 229;
      splitter.visible := true;
      Scroll_ImageViewer.visible := true;

      Tfram_RTFViewer.Create(Scroll_ImageViewer).Name := 'fram_RTFViewer1';
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Parent := Scroll_ImageViewer;
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Align := alClient;
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := False;
      If Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).GetDocuments('eRecords', qry_Search.FieldbyName('IMAGENO').AsInteger) Then
        begin
          Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := True;
          CurrFileName := Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).FileName;
        end;
    end
{  else If (DocType = '.XLS')Then
    begin
      pnl_LeftMain.Align := alLeft;
      pnl_LeftMain.Width := 229;
      splitter.visible := true;
      Scroll_ImageViewer.visible := true;

      Tfram_SpreadSheetViewer.Create(Scroll_ImageViewer).Name := 'fram_SpreadSheetViewer1';
      Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Parent := Scroll_ImageViewer;
      Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Align := alClient;
      Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Visible := False;
      If Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).GetDocuments(qry_Search.FieldbyName('IMAGENO').AsInteger) Then
        begin
          Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Visible := True;
          CurrFileName := Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).FileName;
        end;
    end}
  else
    begin
      CurrFileName := dm_Metrofiler.ReadERecFromRepositry('eRecords', qry_Search.FieldbyName('IMAGENO').AsInteger);
    end;
  finally
    BusyFlag := False;
  end;
end;

procedure Tfrm_eRecords.RemovefromInbox1Click(Sender: TObject);
Var
  J, I   :Integer;
  Treenode   :TTreeNode;
begin
  If tv_Inbox.SelectionCount > 0 Then
    begin
      If Messagedlg('Are you sure you want to remove the selected images from your inbox?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;
      For J := tv_Inbox.SelectionCount-1 downto 0 Do
        begin
          TreeNode := tv_Inbox.Selections[J];
          IF PFieldRec(TreeNode.Data)^.NodeType <> 'D' Then
            begin
              Messagedlg('You can only remove documents!', mtWarning, [mbOK], 0);
              exit;
            end;
          I := PFieldRec(TreeNode.Data)^.eRecNo;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('IF EXISTS (SELECT * FROM dbo.eRecordsInbox WHERE eRecNo = :eRecNo AND Completed = 0 and ToUserId = :User)');
          qry_SQL.SQL.Add('UPDATE dbo.eRecordsInbox SET Completed = 1');
          qry_SQL.SQL.Add('WHERE eRecNo = :eRecNo2 AND ToUserId = :User2');
          qry_SQL.Parameters.ParamByName('eRecNo').Value := I;
          qry_SQL.Parameters.ParamByName('eRecNo2').Value := I;
          qry_SQL.Parameters.ParamByName('User').Value := User;
          qry_SQL.Parameters.ParamByName('User2').Value := User;
          qry_SQL.ExecSQL;
        end;
      DisplayeRecordInbox;
    end;
end;

procedure Tfrm_eRecords.qry_SearchAfterOpen(DataSet: TDataSet);
Var
   J   :Integer;
begin
  qry_Comments.Close;

  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;
end;

procedure Tfrm_eRecords.btn_AddCommentClick(Sender: TObject);
begin
  If not qry_Search.IsEmpty Then
    begin
      If frm_eRecordsCommentAdd.Execute(qry_Search.FieldbyName('eRecNo').AsInteger) = mrOK Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('INSERT INTO eRecordsComments (UserID, UserName, eRecNo, Comment)');
          qry_SQL.SQL.Add('VALUES(:UserID, :UserName, :eRecNo, :Comment)');
          qry_SQL.Parameters.ParamByName('UserID').Value := User;
          qry_SQL.Parameters.ParamByName('UserName').Value := trim(FirstName + ' ' + Surname);
          qry_SQL.Parameters.ParamByName('eRecNo').Value := qry_Search.FieldbyName('eRecNo').AsInteger;
          qry_SQL.Parameters.ParamByName('Comment').Value := trim(frm_eRecordsCommentAdd.mem_Comment.Text);
          qry_SQL.ExecSQL;
          qry_Comments.Close;
          qry_Comments.Open;
        end;
    end;
end;

procedure Tfrm_eRecords.btn_ForwardClick(Sender: TObject);
Var
  FieldName  :String;
  FieldValue :String;
  NodeType   :String[1];
  ImgNo      :Integer;
  eRecNo, J  :Integer;
  Flag       :Boolean;
begin
  If pg_Search.ActivePageIndex = 1 Then
    begin
      If tree_AllFold.SelectionCount > 0 Then
        begin
           If tree_AllFold.Selected.Level <> 0 Then
            begin
              Flag := false;
              For J := 0 to tree_AllFold.SelectionCount-1 Do
                begin
                  FieldName := PFieldRec(tree_AllFold.Selections[j].Data)^.FieldName;
                  FieldValue := tree_AllFold.Selections[j].Text;
                  NodeType := PFieldRec(tree_AllFold.Selections[j].Data)^.NodeType;
                  ImgNo := PFieldRec(tree_AllFold.Selections[j].Data)^.ImgNo;
                  eRecNo := PFieldRec(tree_AllFold.Selections[j].Data)^.eRecNo;

                  If NodeType = 'D' Then
                    begin
                      Flag := true;
                      break;
                    end;
                end;
              If Flag Then
                begin
                  Application.CreateForm(Tfrm_eRecordsForward, frm_eRecordsForward);
                  try
                    If frm_eRecordsForward.Execute = mrOK Then
                      begin
                        For J := 0 to tree_AllFold.SelectionCount-1 Do
                          begin

                            FieldName := PFieldRec(tree_AllFold.Selections[j].Data)^.FieldName;
                            FieldValue := tree_AllFold.Selections[j].Text;
                            NodeType := PFieldRec(tree_AllFold.Selections[j].Data)^.NodeType;
                            ImgNo := PFieldRec(tree_AllFold.Selections[j].Data)^.ImgNo;
                            eRecNo := PFieldRec(tree_AllFold.Selections[j].Data)^.eRecNo;

                            If NodeType = 'D' Then
                              begin
                                qry_SQL.Close;
                                qry_SQL.SQL.Clear;
                                qry_SQL.SQL.Add('IF NOT EXISTS (SELECT * FROM dbo.eRecordsInbox WHERE eRecNo = :eRecNo AND Completed = 0 AND ToUserId = :ToUserId2)');
                                qry_SQL.SQL.Add('INSERT INTO dbo.eRecordsInbox(eRecNo, FromUserId, FromUserName, ToUserId, ToUserName)');
                                qry_SQL.SQL.Add('VALUES(:eRecNo2, :FromUserId, :FromUserName, :ToUserId, :ToUserName)');
                                qry_SQL.Parameters.ParamByName('eRecNo').Value := eRecNo;
                                qry_SQL.Parameters.ParamByName('eRecNo2').Value := eRecNo;
                                qry_SQL.Parameters.ParamByName('FromUserId').Value := User;
                                qry_SQL.Parameters.ParamByName('FromUserName').Value := FirstName + ' ' + Surname;
                                qry_SQL.Parameters.ParamByName('ToUserId').Value := frm_eRecordsForward.ToUser;
                                qry_SQL.Parameters.ParamByName('ToUserId2').Value := frm_eRecordsForward.ToUser;
                                qry_SQL.Parameters.ParamByName('ToUserName').Value := frm_eRecordsForward.ToName;
                                qry_SQL.ExecSQL;
                              end;
                          end;
                        Messagedlg('eRecords have been forwarded successfully.', mtInformation, [mbOK], 0);
                      end;
                  finally
                    frm_eRecordsForward.Free;
                  end;
                end;
            end;
        end;
    end
  else
    begin
      If tv_Inbox.SelectionCount > 0 Then
        begin
           If tv_Inbox.Selected.Level <> 0 Then
            begin
              Flag := false;
              For J := 0 to tv_Inbox.SelectionCount-1 Do
                begin
                  FieldName := PFieldRec(tv_Inbox.Selections[j].Data)^.FieldName;
                  FieldValue := tv_Inbox.Selections[j].Text;
                  NodeType := PFieldRec(tv_Inbox.Selections[j].Data)^.NodeType;
                  ImgNo := PFieldRec(tv_Inbox.Selections[j].Data)^.ImgNo;
                  eRecNo := PFieldRec(tv_Inbox.Selections[j].Data)^.eRecNo;

                  If NodeType = 'D' Then
                    begin
                      Flag := true;
                      break;
                    end;
                end;
              If Flag Then
                begin
                  Application.CreateForm(Tfrm_eRecordsForward, frm_eRecordsForward);
                  try
                    If frm_eRecordsForward.Execute = mrOK Then
                      begin
                        For J := 0 to tv_Inbox.SelectionCount-1 Do
                          begin

                            FieldName := PFieldRec(tv_Inbox.Selections[j].Data)^.FieldName;
                            FieldValue := tv_Inbox.Selections[j].Text;
                            NodeType := PFieldRec(tv_Inbox.Selections[j].Data)^.NodeType;
                            ImgNo := PFieldRec(tv_Inbox.Selections[j].Data)^.ImgNo;
                            eRecNo := PFieldRec(tv_Inbox.Selections[j].Data)^.eRecNo;

                            If NodeType = 'D' Then
                              begin
                                qry_SQL.Close;
                                qry_SQL.SQL.Clear;
                                qry_SQL.SQL.Add('IF NOT EXISTS (SELECT * FROM dbo.eRecordsInbox WHERE eRecNo = :eRecNo AND Completed = 0 AND ToUserId = :ToUserId2)');
                                qry_SQL.SQL.Add('INSERT INTO dbo.eRecordsInbox(eRecNo, FromUserId, FromUserName, ToUserId, ToUserName)');
                                qry_SQL.SQL.Add('VALUES(:eRecNo2, :FromUserId, :FromUserName, :ToUserId, :ToUserName)');
                                qry_SQL.Parameters.ParamByName('eRecNo').Value := eRecNo;
                                qry_SQL.Parameters.ParamByName('eRecNo2').Value := eRecNo;
                                qry_SQL.Parameters.ParamByName('FromUserId').Value := User;
                                qry_SQL.Parameters.ParamByName('FromUserName').Value := FirstName + ' ' + Surname;
                                qry_SQL.Parameters.ParamByName('ToUserId').Value := frm_eRecordsForward.ToUser;
                                qry_SQL.Parameters.ParamByName('ToUserId2').Value := frm_eRecordsForward.ToUser;
                                qry_SQL.Parameters.ParamByName('ToUserName').Value := frm_eRecordsForward.ToName;
                                qry_SQL.ExecSQL;
                              end;
                          end;
                        Messagedlg('eRecords have been forwarded successfully.', mtInformation, [mbOK], 0);
                      end;
                  finally
                    frm_eRecordsForward.Free;
                  end;
                end;
            end;
        end;

    end;
end;

Procedure Tfrm_eRecords.DoCrossQuerySearch();
Var
  J, I, A  :Integer;
  TempStr  :String;
  FieldList:String;
  GroupList:String;
  SortList :String;
  LastField:Array[0..100] of String[100];
  LastTreeNode:Array[0..100] of TTreeNode;
  TopTreeNode  :TTreeNode;
  TmpTreeNode :TTreeNode;
  FieldRecPtr: PFieldRec;
  ChangeFlag :Boolean;
  DateValue  :TDateTime;
  NumValue   :Integer;
  ImageIndex :Integer;
  FileN      :String;
  ExpandedFlag  :Boolean;
  DocType, sFilter     :String;
begin
  qry_Tree.Close;
  qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  FieldList := FieldList + 'e.Branch, b.Name AS "BranchName", ';
  FieldList := FieldList + 'e.Department, d.Name AS "DeptName", ';
  FieldList := FieldList + 'e.RecordType, e.RecordCat, ';
//---
  For A := 1 to 15 Do
    begin
      If (A >= 1)AND(A <= 10) Then
        FieldList := FieldList + 'e.Text'+InttoStr(A)+', '
      else If (A >= 11)AND(A <= 13) Then
        FieldList := FieldList + 'e.Date'+InttoStr(A-10)+', '
      else If (A >= 14)AND(A <= 15) Then
        FieldList := FieldList + 'e.Number'+InttoStr(A-13)+', '
    end;
//===========Generate the Group by List-------------------------
  GroupList := '';
  For I := 1 to 4 Do
    begin
      If StrtoIntDef(frm_SearcheRecordsCross.edt_BranchGroup.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_BranchSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.Branch, '
        else GroupList := GroupList + 'e.Branch DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_DeptGroup.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_DeptSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.Department, '
        else GroupList := GroupList + 'e.Department DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordTypeGroup.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_RecordTypeSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.RecordType, '
        else GroupList := GroupList + 'e.RecordType DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordCatGroup.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_RecordCatSortOpt.ItemIndex = 0 Then
          GroupList := GroupList + 'e.RecordCat, '
        else GroupList := GroupList + 'e.RecordCat DESC, ';
    end;
//===========Generate the Sort by List-------------------------
  SortList := '';
  For I := 1 to 19 Do
    begin
      If StrtoIntDef(frm_SearcheRecordsCross.edt_BranchSort.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_BranchSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.Branch, '
        else SortList := SortList + 'e.Branch DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_DeptSort.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_DeptSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.Department, '
        else SortList := SortList + 'e.Department DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordTypeSort.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_RecordTypeSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.RecordType, '
        else SortList := SortList + 'e.RecordType DESC, ';
      If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordCatSort.Text, 0) = I Then
        If frm_SearcheRecordsCross.cb_RecordCatSortOpt.ItemIndex = 0 Then
          SortList := SortList + 'e.RecordCat, '
        else SortList := SortList + 'e.RecordCat DESC, ';
    end;
  SortList := SortList + 'i.TrxNo';
//------------
  qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
  qry_Tree.SQL.Add('SET @UserId = :UserID');
  qry_Tree.Parameters.ParamValues['UserId'] := User;

  qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'e.eRecNo, i.TrxNo AS "ImageNo", i.ImgComment, i.DocName');
  qry_Tree.SQL.Add('FROM');
  qry_Tree.SQL.Add('  eRecords e');
  qry_Tree.SQL.Add('  INNER JOIN Branches b ON e.Branch = b.Branch');
  qry_Tree.SQL.Add('  INNER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_Tree.SQL.Add('  LEFT OUTER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
  qry_Tree.SQL.Add('WHERE');
  qry_Tree.SQL.Add('  b.Status <> 1 AND d.Status <> 1');
//------Branch
  If frm_SearcheRecordsCross.edt_Branch.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.Branch = :Branch');
      qry_Tree.Parameters.ParamValues['Branch'] := frm_SearcheRecordsCross.edt_Branch.Text;
    end;
//------Department
  If frm_SearcheRecordsCross.edt_Dept.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.Department = :Department');
      qry_Tree.Parameters.ParamValues['Department'] := frm_SearcheRecordsCross.edt_Dept.Text;
    end;
//------RecordType
  If frm_SearcheRecordsCross.edt_RecordType.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.RecordType = :RecordType');
      qry_Tree.Parameters.ParamValues['RecordType'] := frm_SearcheRecordsCross.edt_RecordType.Text;
    end
  else
    begin
      qry_Tree.SQL.Add('AND EXISTS(');

      if frm_Console.AccessSysAdmin then
        begin
          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	*');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	IndexDefinitions i');
          qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ia.Branch = e.Branch AND');
          qry_Tree.SQL.Add('	ia.Department = e.Department AND');
          qry_Tree.SQL.Add('	ia.Description = e.RecordType AND');
          qry_Tree.SQL.Add('	i.UseeRecords = 1');
        end
      else
        begin
          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	  *');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	  IndexDefinitions x');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	EXISTS (');
          qry_Tree.SQL.Add('				SELECT');
          qry_Tree.SQL.Add('					*');
          qry_Tree.SQL.Add('				FROM');
          qry_Tree.SQL.Add('					IndexDefinitions i');
          qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
          qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
          qry_Tree.SQL.Add('				WHERE');
          qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
          qry_Tree.SQL.Add('				 a.Department = e.Department AND');
          qry_Tree.SQL.Add('				 a.Description = x.Description AND');
          qry_Tree.SQL.Add('				 u.UserID = @UserId AND');
          qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
          qry_Tree.SQL.Add('			)');
          qry_Tree.SQL.Add('	OR EXISTS (');
          qry_Tree.SQL.Add('				SELECT');
          qry_Tree.SQL.Add('					*');
          qry_Tree.SQL.Add('				FROM');
          qry_Tree.SQL.Add('					IndexDefinitions i');
          qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
          qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
          qry_Tree.SQL.Add('					INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
          qry_Tree.SQL.Add('				WHERE');
          qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
          qry_Tree.SQL.Add('				 a.Department = e.Department AND');
          qry_Tree.SQL.Add('				 a.Description = x.Description AND');
          qry_Tree.SQL.Add('				 r.UserID = @UserId AND');
          qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
          qry_Tree.SQL.Add('			)');
        end;
      qry_Tree.SQL.Add(')');
    end;
//------RecordCat
  If frm_SearcheRecordsCross.cb_RecordCat.Text <> '' Then
    begin
      qry_Tree.SQL.Add('AND e.RecordCat = :RecordCat');
      qry_Tree.Parameters.ParamValues['RecordCat'] := frm_SearcheRecordsCross.cb_RecordCat.Text;
    end
  else
    begin
      qry_Tree.SQL.Add('AND (');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 0)');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 1)');
      qry_Tree.SQL.Add('			)');
      qry_Tree.SQL.Add('			AND');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				 EXISTS(SELECT *');
      qry_Tree.SQL.Add('						FROM RecordCat c INNER JOIN RCRTRts r ON c.RecCatType = r.RecordCat');
      qry_Tree.SQL.Add('						WHERE r.RecordType = e.RecordType AND c.RecCatType = e.RecordCat)');
      qry_Tree.SQL.Add('			)');
      if not frm_Console.AccessSysAdmin then
        begin
          qry_Tree.SQL.Add('			AND');
          qry_Tree.SQL.Add('			(');
          qry_Tree.SQL.Add('				(');
          qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a WHERE a.RecordCat = e.RecordCat AND a.UserId = @UserId)');
          qry_Tree.SQL.Add('				)');
          qry_Tree.SQL.Add('				OR');
          qry_Tree.SQL.Add('				(');
          qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.RecordCat = e.RecordCat AND r.UserId = @UserId)');
          qry_Tree.SQL.Add('				)');
          qry_Tree.SQL.Add('			)');
        end;
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			e.RecordCat IS NULL');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('		OR');
      qry_Tree.SQL.Add('		(');
      qry_Tree.SQL.Add('			e.RecordCat = ''''');
      qry_Tree.SQL.Add('		)');
      qry_Tree.SQL.Add('	)');
    end;
//-----------Filters
  TempStr := frm_SearcheRecordsCross.edt_QueryStr.Text;
  qry_Tree.SQL.Add('AND(');

  If (frm_Console.FullTextSearch = 1) Then
    begin
      TempStr := '"' + TempStr;
      If frm_SearcheRecordsCross.chk_Partial.Checked Then TempStr := TempStr + '*';
      TempStr := TempStr + '"';

      qry_Tree.SQL.Add('(CONTAINS((e.Text1, e.Text2, e.Text3, e.Text4, e.Text5, e.Text6, e.Text7, e.Text8, e.Text9, e.Text10), :QueryText))OR');
      qry_Tree.SQL.Add('(CONTAINS(i.ScannedDoc, :ImageText))OR');
      qry_Tree.Parameters.ParamValues['QueryText'] := TempStr;
      qry_Tree.Parameters.ParamValues['ImageText'] := TempStr;

      For J := 1 to 5 Do
        begin
          If TempStr = '' Then
             Continue;
          If (J >= 1)AND(J <= 3) Then
            begin
              If not TryStrToDateTime(TempStr, DateValue) Then
                Continue;
              qry_Tree.SQL.Add('(e.Date'+InttoStr(J)+' = :mDate'+InttoStr(J)+')OR');
              qry_Tree.Parameters.ParamByName('mDate'+InttoStr(J)).Value := DateValue;
            end
          else If (J >= 4)AND(J <= 5) Then
            begin
              If not TryStrToInt(TempStr, NumValue) Then
                Continue;
              qry_Tree.SQL.Add('(e.Number'+InttoStr(J-3)+' = :mNumber'+InttoStr(J-3)+')OR');
              qry_Tree.Parameters.ParamByName('mNumber'+InttoStr(J-3)).Value := NumValue;
            end;
        end;
    end
  else
    begin
      For J := 1 to 15 Do
        begin
          If TempStr = '' Then
             Continue;
          If (J >= 1)AND(J <= 10) Then
            begin
              If (frm_SearcheRecordsCross.chk_Partial.Checked) Then
                begin
                  qry_Tree.SQL.Add('(e.Text'+InttoStr(J)+' LIKE :mText'+InttoStr(J)+')OR');
                  qry_Tree.Parameters.ParamByName('mText'+InttoStr(J)).Value := '%'+TempStr+'%';
                end
              else
                begin
                  qry_Tree.SQL.Add('(e.Text'+InttoStr(J)+' = :mText'+InttoStr(J)+')OR');
                  qry_Tree.Parameters.ParamByName('mText'+InttoStr(J)).Value := TempStr;
                end;
            end
          else If (J >= 11)AND(J <= 13) Then
            begin
              If not TryStrToDateTime(TempStr, DateValue) Then
                Continue;
              qry_Tree.SQL.Add('(e.Date'+InttoStr(J-10)+' = :mDate'+InttoStr(J-10)+')OR');
              qry_Tree.Parameters.ParamByName('mDate'+InttoStr(J-10)).Value := DateValue;
            end
          else If (J >= 14)AND(J <= 15) Then
            begin
              If not TryStrToInt(TempStr, NumValue) Then
                Continue;
              qry_Tree.SQL.Add('(e.Number'+InttoStr(J-13)+' = :mNumber'+InttoStr(J-13)+')OR');
              qry_Tree.Parameters.ParamByName('mNumber'+InttoStr(J-13)).Value := NumValue;
            end;
        end;
    end;
  TempStr := qry_Tree.SQL.Text;
  Delete(TempStr, Length(TempStr)-3, 4);
  qry_Tree.SQL.Text := TempStr;
  qry_Tree.SQL.Add(')');

//----------Full Text Filters---------------------------
  If (frm_Console.FullTextSearch = 1) Then
    begin
      For J := 0 to frm_eRecordFullTextFilter.mem_Filters.Lines.Count-1 Do
        begin
          sFilter := trim(frm_eRecordFullTextFilter.mem_Filters.Lines.Strings[J]);
          If sFilter <> '' Then
            begin
              sFilter := '"' + sFilter;
              If frm_SearcheRecordsCross.chk_Partial.Checked Then sFilter := sFilter + '*';
              sFilter := sFilter + '"';

              qry_Tree.SQL.Add('AND( (CONTAINS((e.Text1, e.Text2, e.Text3, e.Text4, e.Text5, e.Text6, e.Text7, e.Text8, e.Text9, e.Text10), :Filter'+InttoStr(J+1)+'))OR');
              qry_Tree.SQL.Add('     (CONTAINS(i.ScannedDoc, :iFilter'+InttoStr(J+1)+')) )');
              qry_Tree.Parameters.ParamValues['Filter'+InttoStr(J+1)] := sFilter;
              qry_Tree.Parameters.ParamValues['iFilter'+InttoStr(J+1)] := sFilter;
            end;
        end;
    end;

  OriginalSQLText := qry_Tree.SQL.Text;

  OrderbyClause := 'ORDER BY '+GroupList+SortList;
  qry_Tree.SQL.Add('ORDER BY '+GroupList+SortList);

  For J := 0 to 100 Do
    LastField[J] := 'ZZZZZFFF';
//--------------
  tree_AllFold.Items.Clear;
  TopTreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TopTreeNode.ImageIndex := 0;
  TopTreeNode.SelectedIndex := 0;

  Screen.Cursor := crHourglass;
  tree_AllFold.Items.BeginUpdate;
  try
    qry_Tree.Open;
    qry_Tree.First;
    While not qry_Tree.EOF Do
      begin
        ExpandedFlag := True;
        ChangeFlag := False;
        I := -1;
        For J := 1 to 4 Do
          begin
//===================Add Branch Node if Necessary===============================
            If StrtoIntDef(frm_SearcheRecordsCross.edt_BranchGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'Branch';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Branch').AsString);

                    TempStr := trim(qry_Tree.FieldbyName('BranchName').AsString);
                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecordsCross.chk_BranchCollapse.Checked);
              end;
//===================Add Dept Node if Necessary=================================
            If StrtoIntDef(frm_SearcheRecordsCross.edt_DeptGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'Department';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Department').AsString);

                    TempStr := trim(qry_Tree.FieldbyName('DeptName').AsString);
                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecordsCross.chk_DeptCollapse.Checked);
              end;
//===================Add RecordType Node if Necessary===========================
            If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordTypeGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'RecordType';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := '';

                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecordsCross.chk_RecordTypeCollapse.Checked);
              end;
//===================Add RecordType Node if Necessary===========================
            If StrtoIntDef(frm_SearcheRecordsCross.edt_RecordCatGroup.Text, 0) = J Then
              begin
                Inc(I);

                TempStr := trim(qry_Tree.FieldbyName('RecordCat').AsString);
                If (LastField[I] <> TempStr)or(ChangeFlag) Then
                  begin
                    ChangeFlag := True;
                    LastField[I] := TempStr;
                    New(FieldRecPtr);
                    FieldRecPtr^.FieldName := 'RecordCat';
                    FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
                    FieldRecPtr^.ImgNo := 0;
                    FieldRecPtr^.eRecNo := 0;
                    FieldRecPtr^.PKey := '';

                    If I = 0 Then
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end
                    else
                      begin
                        LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                        LastTreeNode[I].ImageIndex := 1;
                        LastTreeNode[I].SelectedIndex := 2;
                      end;
                  end;
                LastTreeNode[I].Parent.Expanded := ExpandedFlag;
                ExpandedFlag := not(frm_SearcheRecordsCross.chk_RecordCatCollapse.Checked);
              end;
          end;
//========================Now Add Images========================================
        Inc(I);
        FileN := trim(qry_Tree.FieldbyName('DocName').AsString);
        DocType := trim(UpperCase(ExtractFileExt(FileN)));
//---------------
        If (qry_Tree.FieldbyName('ImageNo').AsInteger = 0) Then
          ImageIndex := 10
        else If DocType = '.TXT' Then
          ImageIndex := 11
        else If DocType = '.CSV' Then
          ImageIndex := 11
        else If DocType = '.RTF' Then
          ImageIndex := 11
        else If DocType = '.PDF' Then
          ImageIndex := 6
        else If DocType = '.DOC' Then
          ImageIndex := 7
        else If DocType = '.DOCX' Then
          ImageIndex := 7
        else If DocType = '.XLS' Then
          ImageIndex := 5
        else If DocType = '.XLSX' Then
          ImageIndex := 5
        else If DocType = '.HTML' Then
          ImageIndex := 4
        else If DocType = '.HTM' Then
          ImageIndex := 4
        else If DocType = '.MSG' Then
          ImageIndex := 4
        else If DocType = '.EML' Then
          ImageIndex := 4
        else If Copy(DocType, 1, 4) = '.TIF' Then
          ImageIndex := 9
        else ImageIndex := 3;
//---------------
        LastField[I] := TempStr;
        New(FieldRecPtr);
        FieldRecPtr^.FieldName := 'ImageNo';
        FieldRecPtr^.NodeType := 'D'; //eRecord Document
        FieldRecPtr^.ImgNo := qry_Tree.FieldbyName('ImageNo').asInteger;
        FieldRecPtr^.eRecNo := qry_Tree.FieldbyName('eRecNo').asInteger;
        FieldRecPtr^.PKey := '';
        //-------Build Descr-----
        TempStr := '';
        For J := 1 to 15 Do
          begin
            If (J >= 1)AND(J <= 10) Then
              begin
                If trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString) <> '' Then
                  begin
                    If pos('TEXT'+InttoStr(J), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString)+', ';
                  end;
              end;
            If (J >= 11)AND(J <= 13) Then
              begin
                If trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString) <> '' Then
                  begin
                    If pos('DATE'+InttoStr(J-10), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString)+', ';
                  end;
              end;
            If (J >= 14)AND(J <= 15) Then
              begin
                If trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) <> '' Then
                  begin
                    If pos('NUMBER'+InttoStr(J-13), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString)+', ';
                  end;
              end;
          end;
        Delete(TempStr, length(TempStr)-1, 2);

        If I = 0 Then
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
            LastTreeNode[I].Parent.Expanded := ExpandedFlag;
          end
        else
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
            LastTreeNode[I].Parent.Expanded := ExpandedFlag;
          end;

        qry_Tree.Next;
      end;

    For J := 0 to tree_AllFold.Items.Count-1 Do
      begin
        TmpTreeNode := tree_AllFold.Items.Item[J];
        If TmpTreeNode.HasChildren Then
          TmpTreeNode.Text := TmpTreeNode.Text+' ('+InttoStr(GetChildCount(TmpTreeNode))+')';
      end;

  finally
    qry_Tree.Close;
    tree_AllFold.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
  TopTreeNode.Selected := True;
  btn_Next.Enabled := True;
  btn_Prior.Enabled := False;
  DrawThumbnails := False;
  tree_AllFoldChange(tree_AllFold, TopTreeNode);
  SearchType := 1;
end;

procedure Tfrm_eRecords.btn_CrossQSrchClick(Sender: TObject);
begin
  If frm_SearcheRecordsCross.Execute = mrOK Then
    begin
      frm_eRecordFullTextFilter.mem_Filters.Lines.Clear;
      DoCrossQuerySearch();
    end;
end;

function Tfrm_eRecords.ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir, zOper : array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, StrPCopy(zOper, 'open'),
                         StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
                         StrPCopy(zDir, DefaultDir), ShowCmd);
end;

procedure Tfrm_eRecords.btn_ShellExecClick(Sender: TObject);
Var
  CurrFilenames   :TStringList;
begin
  If pg_Search.ActivePageIndex = 0 Then
    begin
      If (tv_Inbox.Items.Count = 1) or (tv_Inbox.SelectionCount = 0) Then
        exit;
    end
  else
    begin
      If (tree_AllFold.Items.Count = 1) or (tree_AllFold.SelectionCount = 0) Then
        exit;
    end;

  If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetFilenames(CurrFilenames);
        CurrFilenames.Strings[0];
        Messagedlg('You have multiple eRecords selected. Only the First eRecord will be Launched.', mtWarning, [mbOK], 0);
        ExecuteFile(CurrFilenames.Strings[0], '', 'c:\', SW_MAXIMIZE);
      finally
        CurrFilenames.Free;
      end;
    end
  else
    begin
      ExecuteFile(CurrFileName, '', 'c:\', SW_MAXIMIZE);

    end;
end;

procedure Tfrm_eRecords.btn_eMailClick(Sender: TObject);
Var
  CurrFilenames   :TStringList;
  J               :Integer;
  TStr            :String;
begin
  If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetFilenames(CurrFilenames);
        For J := 0 to CurrFilenames.Count-1 Do
          TStr := TStr + CurrFilenames.Strings[J]+';';
        SendFile(TStr);
      finally
        CurrFilenames.Free;
      end;
    end
  else SendFile(CurrFileName);
end;


procedure Tfrm_eRecords.btn_EMailPDFClick(Sender: TObject);
Var
  aPDFDoc     :TDebenuPDFLibrary;
  J, A           :Integer;
  ImageEnMViewComb   :TImageEnMView;
  OutputFilename, COFilename, ExtName    :String;
  TempFilename       :String;
  MemoryStream          :TMemoryStream;
  seldoc    :Integer;
  merdoc    :Integer;
  CurrFilenames     :TStringList;
begin
  If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    begin
      aPDFDoc := TDebenuPDFLibrary.Create;
      try
        aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
        aPDFDoc.NewDocument;
        seldoc := aPDFDoc.SelectedDocument;

        CurrFilenames   := TStringList.Create;
        try
          CurrFilenames.Clear;
          Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetFilenames(CurrFilenames);
          For J := 0 to CurrFilenames.Count-1 Do
            begin
              COFilename := CurrFilenames.Strings[J];
              ExtName := UpperCase(ExtractFileExt(COFilename));
              If ExtName = '.PDF' Then
                begin
                  aPDFDoc.LoadFromFile(COFilename, '');
                  merdoc := aPDFDoc.SelectedDocument;
                  aPDFDoc.SelectDocument(seldoc);
                  aPDFDoc.MergeDocument(merdoc);
                end
              else
                begin
                  ImageEnMViewComb   := TImageEnMView.Create(Self);
                  try
                    ImageEnMViewComb.MIO.LoadFromFile(COFilename);
                    For A := 0 to ImageEnMViewComb.MIO.ParamsCount-1 Do
                      begin
                        ImageEnMViewComb.MIO.Params[A].PDF_PaperWidth := ImageEnMViewComb.MIO.Params[A].Width;
                        ImageEnMViewComb.MIO.Params[A].PDF_PaperHeight := ImageEnMViewComb.MIO.Params[A].Height;
                      end;
                    TempFilename := dm_Metrofiler.GetTempDir + dm_Metrofiler.CreateGuid + ExtName;
                    ImageEnMViewComb.MIO.SaveToFilePDF(TempFilename);

                    aPDFDoc.LoadFromFile(TempFilename, '');
                    merdoc := aPDFDoc.SelectedDocument;
                    aPDFDoc.SelectDocument(seldoc);
                    aPDFDoc.MergeDocument(merdoc);
                  finally
                    ImageEnMViewComb.Free;
                    If FileExists(TempFilename) Then
                      DeleteFile(TempFilename);
                  end;
                end;
            end;
          aPDFDoc.DeletePages(1,1);
          OutputFilename := dm_Metrofiler.GetTempDir + 'MetrofilerOutput.pdf';
          aPDFDoc.SaveToFile(OutputFilename);
          SendFile(OutputFilename);
        finally
          CurrFilenames.Free;
        end;
      finally
        DeleteFile(OutputFilename);
        aPDFDoc.Free;
      end;
    end
  else
    begin
      aPDFDoc := TDebenuPDFLibrary.Create;
      try
        aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
        aPDFDoc.NewDocument;
        seldoc := aPDFDoc.SelectedDocument;

        ExtName := UpperCase(ExtractFileExt(CurrFilename));
        If ExtName = '.PDF' Then
          begin
            aPDFDoc.LoadFromFile(CurrFilename, '');
            merdoc := aPDFDoc.SelectedDocument;
            aPDFDoc.SelectDocument(seldoc);
            aPDFDoc.MergeDocument(merdoc);
          end
        else
          begin
            ImageEnMViewComb   := TImageEnMView.Create(Self);
            try
              ImageEnMViewComb.MIO.LoadFromFile(CurrFilename);
              For A := 0 to ImageEnMViewComb.MIO.ParamsCount-1 Do
                begin
                  ImageEnMViewComb.MIO.Params[A].PDF_PaperWidth := ImageEnMViewComb.MIO.Params[A].Width;
                  ImageEnMViewComb.MIO.Params[A].PDF_PaperHeight := ImageEnMViewComb.MIO.Params[A].Height;
                end;
              TempFilename := dm_Metrofiler.GetTempDir + dm_Metrofiler.CreateGuid + ExtName;
              ImageEnMViewComb.MIO.SaveToFilePDF(TempFilename);

              aPDFDoc.LoadFromFile(TempFilename, '');
              merdoc := aPDFDoc.SelectedDocument;
              aPDFDoc.SelectDocument(seldoc);
              aPDFDoc.MergeDocument(merdoc);
            finally
              ImageEnMViewComb.Free;
              If FileExists(TempFilename) Then
                DeleteFile(TempFilename);
            end;
          end;

        aPDFDoc.DeletePages(1,1);
        OutputFilename := dm_Metrofiler.GetTempDir + 'MetrofilerOutput.pdf';
        aPDFDoc.SaveToFile(OutputFilename);
        SendFile(OutputFilename);
      finally
        DeleteFile(OutputFilename);
        aPDFDoc.Free;
      end;
    end;
end;

procedure Tfrm_eRecords.SendFile(attached: String);
var sSep, sFiles, sDesc: Pchar;
    iWinHandle, iFlg: Cardinal;
begin
  iWinHandle:= Application.Handle;
  sSep:= ';';
  sFiles:= pchar(attached);
  sDesc:='';
  iFlg:= 0;
  MAPISendDocuments(iWinHandle, sSep, sFiles, sDesc, iFlg);
End;

procedure Tfrm_eRecords.btn_InboxClick(Sender: TObject);
begin
  frm_Console.eRecNo := 0;
  frm_Console.eRecImgNo := 0;
  If not qry_Search.IsEmpty Then
    begin
      frm_Console.eRecImgNo := qry_Search.FieldbyName('ImageNo').AsInteger;
      frm_Console.eRecNo := qry_Search.FieldbyName('eRecNo').AsInteger;
    end;

  If frm_Console.fePending <> Nil Then
    frm_Console.fePending.Free;

  frm_Console.fePending := Tfrm_ePending.Create(Self);
  frm_Console.fePending.LaunchedFrom := 'eRecords';
end;

procedure Tfrm_eRecords.qry_SearchAfterClose(DataSet: TDataSet);
Var
  J, ComponentTot  :Integer;
begin
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;

  qry_Comments.Close;

 splitter.visible := false;
 Scroll_ImageViewer.visible := false;
 pnl_LeftMain.Align := alClient;

 LastDocumentDisplayed := 0;
 ComponentTot := Scroll_ImageViewer.ComponentCount;
 For J := ComponentTot-1 downto 0 Do
  begin
   If (Scroll_ImageViewer.Components[J] is TFrame) Then
     begin
       If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
         Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
       Scroll_ImageViewer.Components[J].Free;
     end;
  end;
end;

procedure Tfrm_eRecords.DisplayeRecord(Itemnumber, Filenumber  :String);
Var
  J, I, A  :Integer;
  TempStr  :String;
  FieldList:String;
  GroupList:String;
  LastField:Array[0..100] of String[100];
  LastTreeNode:Array[0..100] of TTreeNode;
  TopTreeNode  :TTreeNode;
  TmpTreeNode  :TTreeNode;
  FieldRecPtr: PFieldRec;
  ChangeFlag :Boolean;
  ImageIndex :Integer;
  FileN, DocType   :String;
begin
  qry_Tree.Close;
  qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  FieldList := FieldList + 'e.Branch, b.Name AS "BranchName", ';
  FieldList := FieldList + 'e.Department, d.Name AS "DeptName", ';
  FieldList := FieldList + 'e.RecordType, e.RecordCat, ';
//---
  For A := 1 to 15 Do
    begin
      If (A >= 1)AND(A <= 10) Then
        FieldList := FieldList + 'e.Text'+InttoStr(A)+', '
      else If (A >= 11)AND(A <= 13) Then
        FieldList := FieldList + 'e.Date'+InttoStr(A-10)+', '
      else If (A >= 14)AND(A <= 15) Then
        FieldList := FieldList + 'e.Number'+InttoStr(A-13)+', '
    end;
//===========Generate the Group by List-------------------------
  GroupList := '';
  GroupList := GroupList + 'e.Branch, e.Department, e.RecordType, i.TrxNo';
//------------
  qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
  qry_Tree.SQL.Add('SET @UserId = :UserID');
  qry_Tree.Parameters.ParamValues['UserId'] := User;

  qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'e.eRecNo, i.TrxNo AS "ImageNo", i.ImgComment, i.DocName');
  qry_Tree.SQL.Add('FROM');
  qry_Tree.SQL.Add('  eRecords e');
  qry_Tree.SQL.Add('  INNER JOIN Branches b ON e.Branch = b.Branch');
  qry_Tree.SQL.Add('  INNER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_Tree.SQL.Add('  LEFT OUTER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
  qry_Tree.SQL.Add('WHERE');
  qry_Tree.SQL.Add('  b.Status <> 1 AND d.Status <> 1');
//------Branch
//------Department
//------RecordType
  qry_Tree.SQL.Add('AND EXISTS(');

  if frm_Console.AccessSysAdmin then
    begin
      qry_Tree.SQL.Add('SELECT');
      qry_Tree.SQL.Add('	*');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('	IndexDefinitions i');
      qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
      qry_Tree.SQL.Add('WHERE');
      qry_Tree.SQL.Add('	ia.Branch = e.Branch AND');
      qry_Tree.SQL.Add('	ia.Department = e.Department AND');
      qry_Tree.SQL.Add('	ia.Description = e.RecordType AND');
      qry_Tree.SQL.Add('	i.UseeRecords = 1');
    end
  else
    begin
      qry_Tree.SQL.Add('SELECT');
      qry_Tree.SQL.Add('	  *');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('	  IndexDefinitions x');
      qry_Tree.SQL.Add('WHERE');
      qry_Tree.SQL.Add('	EXISTS (');
      qry_Tree.SQL.Add('				SELECT');
      qry_Tree.SQL.Add('					*');
      qry_Tree.SQL.Add('				FROM');
      qry_Tree.SQL.Add('					IndexDefinitions i');
      qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
      qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
      qry_Tree.SQL.Add('				WHERE');
      qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
      qry_Tree.SQL.Add('				 a.Department = e.Department AND');
      qry_Tree.SQL.Add('				 a.Description = x.Description AND');
      qry_Tree.SQL.Add('				 u.UserID = @UserId AND');
      qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
      qry_Tree.SQL.Add('			)');
      qry_Tree.SQL.Add('	OR EXISTS (');
      qry_Tree.SQL.Add('				SELECT');
      qry_Tree.SQL.Add('					*');
      qry_Tree.SQL.Add('				FROM');
      qry_Tree.SQL.Add('					IndexDefinitions i');
      qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
      qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
      qry_Tree.SQL.Add('					INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
      qry_Tree.SQL.Add('				WHERE');
      qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
      qry_Tree.SQL.Add('				 a.Department = e.Department AND');
      qry_Tree.SQL.Add('				 a.Description = x.Description AND');
      qry_Tree.SQL.Add('				 r.UserID = @UserId AND');
      qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
      qry_Tree.SQL.Add('			)');
    end;
  qry_Tree.SQL.Add(')');
//------RecordCat
  qry_Tree.SQL.Add('AND (');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 0)');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			(');
  qry_Tree.SQL.Add('				EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 1)');
  qry_Tree.SQL.Add('			)');
  qry_Tree.SQL.Add('			AND');
  qry_Tree.SQL.Add('			(');
  qry_Tree.SQL.Add('				 EXISTS(SELECT *');
  qry_Tree.SQL.Add('						FROM RecordCat c INNER JOIN RCRTRts r ON c.RecCatType = r.RecordCat');
  qry_Tree.SQL.Add('						WHERE r.RecordType = e.RecordType AND c.RecCatType = e.RecordCat)');
  qry_Tree.SQL.Add('			)');
  if not frm_Console.AccessSysAdmin then
    begin
      qry_Tree.SQL.Add('			AND');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				(');
      qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a WHERE a.RecordCat = e.RecordCat AND a.UserId = @UserId)');
      qry_Tree.SQL.Add('				)');
      qry_Tree.SQL.Add('				OR');
      qry_Tree.SQL.Add('				(');
      qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.RecordCat = e.RecordCat AND r.UserId = @UserId)');
      qry_Tree.SQL.Add('				)');
      qry_Tree.SQL.Add('			)');
    end;
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			e.RecordCat IS NULL');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			e.RecordCat = ''''');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('	)');
//-----------
  If Itemnumber <> '' Then
    begin
      qry_Tree.SQL.Add('AND (e.Itemnumber = '+QuotedStr(Itemnumber)+' OR ');
      qry_Tree.SQL.Add('     e.Filenumber = '+QuotedStr(Filenumber)+')');
    end
  else qry_Tree.SQL.Add('AND e.Filenumber = '+QuotedStr(Filenumber));

  OriginalSQLText := qry_Tree.SQL.Text;

  OrderbyClause := 'ORDER BY '+GroupList;
  qry_Tree.SQL.Add('ORDER BY '+GroupList);

  For J := 0 to 100 Do
    LastField[J] := 'ZZZZZFFF';
//--------------
  tree_AllFold.Items.Clear;
  TopTreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TopTreeNode.ImageIndex := 0;
  TopTreeNode.SelectedIndex := 0;

  Screen.Cursor := crHourglass;
  tree_AllFold.Items.BeginUpdate;
  try
    qry_Tree.Open;
    qry_Tree.First;
    While not qry_Tree.EOF Do
      begin
        ChangeFlag := False;
        I := -1;
//===================Add Branch Node if Necessary===============================
        Inc(I);

        TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Branch';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Branch').AsString);

            TempStr := trim(qry_Tree.FieldbyName('BranchName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add Dept Node if Necessary=================================
        Inc(I);

        TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Department';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Department').AsString);

            TempStr := trim(qry_Tree.FieldbyName('DeptName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add RecordType Node if Necessary===========================
        Inc(I);
        TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'RecordType';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := '';

            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//========================Now Add Images========================================
        Inc(I);
        FileN := trim(qry_Tree.FieldbyName('DocName').AsString);
        DocType := trim(UpperCase(ExtractFileExt(FileN)));
//---------------
        If (qry_Tree.FieldbyName('ImageNo').AsInteger = 0) Then
          ImageIndex := 10
        else If DocType = '.TXT' Then
          ImageIndex := 11
        else If DocType = '.CSV' Then
          ImageIndex := 11
        else If DocType = '.RTF' Then
          ImageIndex := 11
        else If DocType = '.PDF' Then
          ImageIndex := 6
        else If DocType = '.DOC' Then
          ImageIndex := 7
        else If DocType = '.DOCX' Then
          ImageIndex := 7
        else If DocType = '.XLS' Then
          ImageIndex := 5
        else If DocType = '.XLSX' Then
          ImageIndex := 5
        else If DocType = '.HTML' Then
          ImageIndex := 4
        else If DocType = '.HTM' Then
          ImageIndex := 4
        else If DocType = '.MSG' Then
          ImageIndex := 4
        else If DocType = '.EML' Then
          ImageIndex := 4
        else If Copy(DocType, 1, 4) = '.TIF' Then
          ImageIndex := 9
        else ImageIndex := 3;
//---------------
        LastField[I] := TempStr;
        New(FieldRecPtr);
        FieldRecPtr^.FieldName := 'ImageNo';
        FieldRecPtr^.NodeType := 'D'; //eRecord Document
        FieldRecPtr^.ImgNo := qry_Tree.FieldbyName('ImageNo').asInteger;
        FieldRecPtr^.eRecNo := qry_Tree.FieldbyName('eRecNo').asInteger;
        FieldRecPtr^.PKey := '';
        //-------Build Descr-----
        TempStr := '';
        For J := 1 to 15 Do
          begin
            If (J >= 1)AND(J <= 10) Then
              begin
                If trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString) <> '' Then
                  begin
                    If pos('TEXT'+InttoStr(J), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString)+', ';
                  end;
              end;
            If (J >= 11)AND(J <= 13) Then
              begin
                If trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString) <> '' Then
                  begin
                    If pos('DATE'+InttoStr(J-10), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString)+', ';
                  end;
              end;
            If (J >= 14)AND(J <= 15) Then
              begin
                If trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) <> '' Then
                  begin
                    If pos('NUMBER'+InttoStr(J-13), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString)+', ';
                  end;
              end;
          end;
        Delete(TempStr, length(TempStr)-1, 2);

        If I = 0 Then
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end
        else
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end;

        qry_Tree.Next;
      end;

    For J := 0 to tree_AllFold.Items.Count-1 Do
      begin
        TmpTreeNode := tree_AllFold.Items.Item[J];
        If TmpTreeNode.HasChildren Then
          TmpTreeNode.Text := TmpTreeNode.Text+' ('+InttoStr(GetChildCount(TmpTreeNode))+')';
      end;

  finally
    qry_Tree.Close;
    tree_AllFold.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
  TopTreeNode.Selected := True;
  btn_Next.Enabled := True;
  btn_Prior.Enabled := False;
  DrawThumbnails := False;
  tree_AllFoldChange(tree_AllFold, TopTreeNode);
end;


procedure Tfrm_eRecords.DisplayeRecordTrxNo(TrxNo  :Integer);
Var
  J, I, A  :Integer;
  TempStr  :String;
  FieldList:String;
  GroupList:String;
  LastField:Array[0..100] of String[100];
  LastTreeNode:Array[0..100] of TTreeNode;
  TopTreeNode  :TTreeNode;
  TmpTreeNode  :TTreeNode;
  FieldRecPtr: PFieldRec;
  ChangeFlag :Boolean;
  ImageIndex :Integer;
  FileN, DocType   :String;
  TotalPages  :Integer;
begin
  qry_Tree.Close;
  qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  FieldList := FieldList + 'e.Branch, b.Name AS "BranchName", ';
  FieldList := FieldList + 'e.Department, d.Name AS "DeptName", ';
  FieldList := FieldList + 'e.RecordType, e.RecordCat, ';
//---
  For A := 1 to 15 Do
    begin
      If (A >= 1)AND(A <= 10) Then
        FieldList := FieldList + 'e.Text'+InttoStr(A)+', '
      else If (A >= 11)AND(A <= 13) Then
        FieldList := FieldList + 'e.Date'+InttoStr(A-10)+', '
      else If (A >= 14)AND(A <= 15) Then
        FieldList := FieldList + 'e.Number'+InttoStr(A-13)+', '
    end;
//===========Generate the Group by List-------------------------
  GroupList := '';
  GroupList := GroupList + 'e.Branch, e.Department, e.RecordType, i.TrxNo';
//------------
  qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
  qry_Tree.SQL.Add('SET @UserId = :UserID');
  qry_Tree.Parameters.ParamValues['UserId'] := User;

  qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'e.eRecNo, i.TrxNo AS "ImageNo", i.ImgComment, i.DocName');
  qry_Tree.SQL.Add('FROM');
  qry_Tree.SQL.Add('  eRecords e');
  qry_Tree.SQL.Add('  INNER JOIN Branches b ON e.Branch = b.Branch');
  qry_Tree.SQL.Add('  INNER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_Tree.SQL.Add('  LEFT OUTER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
  qry_Tree.SQL.Add('WHERE');
  qry_Tree.SQL.Add('  b.Status <> 1 AND d.Status <> 1');
//------Branch
//------Department
//------RecordType
  qry_Tree.SQL.Add('AND EXISTS(');

  if frm_Console.AccessSysAdmin then
    begin
      qry_Tree.SQL.Add('SELECT');
      qry_Tree.SQL.Add('	*');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('	IndexDefinitions i');
      qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
      qry_Tree.SQL.Add('WHERE');
      qry_Tree.SQL.Add('	ia.Branch = e.Branch AND');
      qry_Tree.SQL.Add('	ia.Department = e.Department AND');
      qry_Tree.SQL.Add('	ia.Description = e.RecordType AND');
      qry_Tree.SQL.Add('	i.UseeRecords = 1');
    end
  else
    begin
      qry_Tree.SQL.Add('SELECT');
      qry_Tree.SQL.Add('	  *');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('	  IndexDefinitions x');
      qry_Tree.SQL.Add('WHERE');
      qry_Tree.SQL.Add('	EXISTS (');
      qry_Tree.SQL.Add('				SELECT');
      qry_Tree.SQL.Add('					*');
      qry_Tree.SQL.Add('				FROM');
      qry_Tree.SQL.Add('					IndexDefinitions i');
      qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
      qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
      qry_Tree.SQL.Add('				WHERE');
      qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
      qry_Tree.SQL.Add('				 a.Department = e.Department AND');
      qry_Tree.SQL.Add('				 a.Description = x.Description AND');
      qry_Tree.SQL.Add('				 u.UserID = @UserId AND');
      qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
      qry_Tree.SQL.Add('			)');
      qry_Tree.SQL.Add('	OR EXISTS (');
      qry_Tree.SQL.Add('				SELECT');
      qry_Tree.SQL.Add('					*');
      qry_Tree.SQL.Add('				FROM');
      qry_Tree.SQL.Add('					IndexDefinitions i');
      qry_Tree.SQL.Add('					INNER JOIN IndexAuthRts a ON i.Description = a.Description');
      qry_Tree.SQL.Add('					INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
      qry_Tree.SQL.Add('					INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
      qry_Tree.SQL.Add('				WHERE');
      qry_Tree.SQL.Add('				 a.Branch = e.Branch AND');
      qry_Tree.SQL.Add('				 a.Department = e.Department AND');
      qry_Tree.SQL.Add('				 a.Description = x.Description AND');
      qry_Tree.SQL.Add('				 r.UserID = @UserId AND');
      qry_Tree.SQL.Add('				 i.UseeRecords = 1 AND u.eRecords = 1');
      qry_Tree.SQL.Add('			)');
    end;
  qry_Tree.SQL.Add(')');
//------RecordCat
  qry_Tree.SQL.Add('AND (');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 0)');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			(');
  qry_Tree.SQL.Add('				EXISTS(SELECT * FROM IndexDefinitions i WHERE i.Description = e.RecordType AND i.UseERecords = 1 AND i.UseRecordCat = 1)');
  qry_Tree.SQL.Add('			)');
  qry_Tree.SQL.Add('			AND');
  qry_Tree.SQL.Add('			(');
  qry_Tree.SQL.Add('				 EXISTS(SELECT *');
  qry_Tree.SQL.Add('						FROM RecordCat c INNER JOIN RCRTRts r ON c.RecCatType = r.RecordCat');
  qry_Tree.SQL.Add('						WHERE r.RecordType = e.RecordType AND c.RecCatType = e.RecordCat)');
  qry_Tree.SQL.Add('			)');
  if not frm_Console.AccessSysAdmin then
    begin
      qry_Tree.SQL.Add('			AND');
      qry_Tree.SQL.Add('			(');
      qry_Tree.SQL.Add('				(');
      qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a WHERE a.RecordCat = e.RecordCat AND a.UserId = @UserId)');
      qry_Tree.SQL.Add('				)');
      qry_Tree.SQL.Add('				OR');
      qry_Tree.SQL.Add('				(');
      qry_Tree.SQL.Add('					EXISTS(SELECT * FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.RecordCat = e.RecordCat AND r.UserId = @UserId)');
      qry_Tree.SQL.Add('				)');
      qry_Tree.SQL.Add('			)');
    end;
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			e.RecordCat IS NULL');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('		OR');
  qry_Tree.SQL.Add('		(');
  qry_Tree.SQL.Add('			e.RecordCat = ''''');
  qry_Tree.SQL.Add('		)');
  qry_Tree.SQL.Add('	)');
//-----------
  qry_Tree.SQL.Add('AND i.TrxNo = :TrxNo');
  qry_Tree.Parameters.ParamByName('TrxNo').Value := TrxNo;

  OriginalSQLText := qry_Tree.SQL.Text;

  OrderbyClause := 'ORDER BY '+GroupList;
  qry_Tree.SQL.Add('ORDER BY '+GroupList);

  For J := 0 to 100 Do
    LastField[J] := 'ZZZZZFFF';
//--------------
  tree_AllFold.Items.Clear;
  TopTreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TopTreeNode.ImageIndex := 0;
  TopTreeNode.SelectedIndex := 0;

  Screen.Cursor := crHourglass;
  tree_AllFold.Items.BeginUpdate;
  try
    qry_Tree.Open;
    qry_Tree.First;
    While not qry_Tree.EOF Do
      begin
        ChangeFlag := False;
        I := -1;
//===================Add Branch Node if Necessary===============================
        Inc(I);

        TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Branch';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Branch').AsString);

            TempStr := trim(qry_Tree.FieldbyName('BranchName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add Dept Node if Necessary=================================
        Inc(I);

        TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Department';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('Department').AsString);

            TempStr := trim(qry_Tree.FieldbyName('DeptName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add RecordType Node if Necessary===========================
        Inc(I);
        TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'RecordType';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := '';

            If I = 0 Then
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//========================Now Add Images========================================
        Inc(I);
        FileN := trim(qry_Tree.FieldbyName('DocName').AsString);
        DocType := trim(UpperCase(ExtractFileExt(FileN)));
//---------------
        If (qry_Tree.FieldbyName('ImageNo').AsInteger = 0) Then
          ImageIndex := 10
        else If DocType = '.TXT' Then
          ImageIndex := 11
        else If DocType = '.CSV' Then
          ImageIndex := 11
        else If DocType = '.RTF' Then
          ImageIndex := 11
        else If DocType = '.PDF' Then
          ImageIndex := 6
        else If DocType = '.DOC' Then
          ImageIndex := 7
        else If DocType = '.DOCX' Then
          ImageIndex := 7
        else If DocType = '.XLS' Then
          ImageIndex := 5
        else If DocType = '.XLSX' Then
          ImageIndex := 5
        else If DocType = '.HTML' Then
          ImageIndex := 4
        else If DocType = '.HTM' Then
          ImageIndex := 4
        else If DocType = '.MSG' Then
          ImageIndex := 4
        else If DocType = '.EML' Then
          ImageIndex := 4
        else If Copy(DocType, 1, 4) = '.TIF' Then
          ImageIndex := 9
        else ImageIndex := 3;
//---------------
        LastField[I] := TempStr;
        New(FieldRecPtr);
        FieldRecPtr^.FieldName := 'ImageNo';
        FieldRecPtr^.NodeType := 'D'; //eRecord Document
        FieldRecPtr^.ImgNo := qry_Tree.FieldbyName('ImageNo').asInteger;
        FieldRecPtr^.eRecNo := qry_Tree.FieldbyName('eRecNo').asInteger;
        FieldRecPtr^.PKey := '';
        //-------Build Descr-----
        TempStr := '';
        For J := 1 to 15 Do
          begin
            If (J >= 1)AND(J <= 10) Then
              begin
                If trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString) <> '' Then
                  begin
                    If pos('TEXT'+InttoStr(J), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('TEXT'+InttoStr(J)).AsString)+', ';
                  end;
              end;
            If (J >= 11)AND(J <= 13) Then
              begin
                If trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString) <> '' Then
                  begin
                    If pos('DATE'+InttoStr(J-10), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('DATE'+InttoStr(J-10)).AsString)+', ';
                  end;
              end;
            If (J >= 14)AND(J <= 15) Then
              begin
                If trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) <> '' Then
                  begin
                    If pos('NUMBER'+InttoStr(J-13), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_Tree.FieldbyName('NUMBER'+InttoStr(J-13)).AsString)+', ';
                  end;
              end;
          end;
        Delete(TempStr, length(TempStr)-1, 2);

        If I = 0 Then
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end
        else
          begin
            LastTreeNode[I] := tree_AllFold.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end;

        qry_Tree.Next;
      end;

    For J := 0 to tree_AllFold.Items.Count-1 Do
      begin
        TmpTreeNode := tree_AllFold.Items.Item[J];
        If TmpTreeNode.HasChildren Then
          TmpTreeNode.Text := TmpTreeNode.Text+' ('+InttoStr(GetChildCount(TmpTreeNode))+')';
      end;

  finally
    qry_Tree.Close;
    tree_AllFold.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
  TopTreeNode.Selected := True;
  btn_Next.Enabled := True;
  btn_Prior.Enabled := False;
  DrawThumbnails := False;
  tree_AllFoldChange(tree_AllFold, TopTreeNode);
end;


procedure Tfrm_eRecords.DisplayeRecordInbox;
Var
  J, I, A  :Integer;
  TempStr  :String;
  FieldList:String;
  GroupList:String;
  LastField:Array[0..100] of String[100];
  LastTreeNode:Array[0..100] of TTreeNode;
  TopTreeNode  :TTreeNode;
  TmpTreeNode  :TTreeNode;
  FieldRecPtr: PFieldRec;
  ChangeFlag :Boolean;
  ImageIndex :Integer;
  FileN, DocType   :String;
  TotalPages  :Integer;
begin
  qry_TreeInbox.Close;
  qry_TreeInbox.SQL.Clear;
//===========Generate the select List-------------------------
  FieldList := '';
  FieldList := FieldList + 'e.Branch, b.Name AS "BranchName", ';
  FieldList := FieldList + 'e.Department, d.Name AS "DeptName", ';
  FieldList := FieldList + 'e.RecordType, e.RecordCat, ';
//---
  For A := 1 to 15 Do
    begin
      If (A >= 1)AND(A <= 10) Then
        FieldList := FieldList + 'e.Text'+InttoStr(A)+', '
      else If (A >= 11)AND(A <= 13) Then
        FieldList := FieldList + 'e.Date'+InttoStr(A-10)+', '
      else If (A >= 14)AND(A <= 15) Then
        FieldList := FieldList + 'e.Number'+InttoStr(A-13)+', '
    end;
//===========Generate the Group by List-------------------------
  GroupList := '';
  GroupList := GroupList + 'e.Branch, e.Department, e.RecordType, i.TrxNo';
//------------
  qry_TreeInbox.SQL.Add('DECLARE @UserId varchar(255)');
  qry_TreeInbox.SQL.Add('SET @UserId = :UserID');
  qry_TreeInbox.Parameters.ParamValues['UserId'] := User;

  qry_TreeInbox.SQL.Add('SELECT TOP 10000 '+FieldList+'e.eRecNo, i.TrxNo AS "ImageNo", i.ImgComment, i.DocName');
  qry_TreeInbox.SQL.Add('FROM');
  qry_TreeInbox.SQL.Add('  eRecords e');
  qry_TreeInbox.SQL.Add('  INNER JOIN Branches b ON e.Branch = b.Branch');
  qry_TreeInbox.SQL.Add('  INNER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_TreeInbox.SQL.Add('  INNER JOIN eRecordsInbox ei ON e.eRecNo = ei.eRecNo');
  qry_TreeInbox.SQL.Add('  LEFT OUTER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
//------Branch
  qry_TreeInbox.SQL.Add('WHERE	e.Branch IN (');

  qry_TreeInbox.SQL.Add('SELECT');
  qry_TreeInbox.SQL.Add('	b.Branch');
  qry_TreeInbox.SQL.Add('FROM');
  qry_TreeInbox.SQL.Add('	Branches b');
  qry_TreeInbox.SQL.Add('WHERE');
  qry_TreeInbox.SQL.Add('	ISNULL(b.Status, 0) <> 1');
  qry_TreeInbox.SQL.Add('	)');
//------Department
  qry_TreeInbox.SQL.Add('AND e.Department IN (');

  qry_TreeInbox.SQL.Add('SELECT');
  qry_TreeInbox.SQL.Add('	d.Department');
  qry_TreeInbox.SQL.Add('FROM');
  qry_TreeInbox.SQL.Add('	Departments d');
  qry_TreeInbox.SQL.Add('	INNER JOIN Branches b ON d.Branch = b.Branch');
  qry_TreeInbox.SQL.Add('WHERE');
  qry_TreeInbox.SQL.Add('	ISNULL(b.Status, 0) <> 1 AND');
  qry_TreeInbox.SQL.Add('	ISNULL(d.Status, 0) <> 1 AND');
  qry_TreeInbox.SQL.Add('	b.Branch = e.Branch');
  qry_TreeInbox.SQL.Add('	)');
//------RecordType
  qry_TreeInbox.SQL.Add('AND e.RecordType IN (');

  qry_TreeInbox.SQL.Add('SELECT');
  qry_TreeInbox.SQL.Add('	i.Description');
  qry_TreeInbox.SQL.Add('FROM');
  qry_TreeInbox.SQL.Add('	IndexDefinitions i');
  qry_TreeInbox.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
  qry_TreeInbox.SQL.Add('WHERE');
  qry_TreeInbox.SQL.Add('	ia.Branch = e.Branch AND');
  qry_TreeInbox.SQL.Add('	ia.Department = e.Department AND');
  qry_TreeInbox.SQL.Add('	i.UseeRecords = 1');

  qry_TreeInbox.SQL.Add(')');
//------RecordCat
  qry_TreeInbox.SQL.Add('AND (');

  qry_TreeInbox.SQL.Add('(e.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseERecords = 1 AND UseRecordCat = 0))');
  qry_TreeInbox.SQL.Add('OR');
  qry_TreeInbox.SQL.Add('(');

  qry_TreeInbox.SQL.Add('(e.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseERecords = 1 AND UseRecordCat = 1))');
  qry_TreeInbox.SQL.Add('AND');
  qry_TreeInbox.SQL.Add('(e.RecordCat IN (');
  qry_TreeInbox.SQL.Add('      SELECT c.RecCatType');
  qry_TreeInbox.SQL.Add('      FROM RecordCat c INNER JOIN RCRTRts r ON c.RecCatType = r.RecordCat');
  qry_TreeInbox.SQL.Add('      WHERE r.RecordType = e.RecordType))');

  qry_TreeInbox.SQL.Add(')');
  qry_TreeInbox.SQL.Add('OR');
  qry_TreeInbox.SQL.Add('(e.RecordCat IS NULL)');
  qry_TreeInbox.SQL.Add('OR');
  qry_TreeInbox.SQL.Add('(e.RecordCat = '''')');

  qry_TreeInbox.SQL.Add(')');
//-----------
  qry_TreeInbox.SQL.Add('AND ei.ToUserId = :ToUserId AND ei.Completed = 0');
  qry_TreeInbox.Parameters.ParamByName('ToUserId').Value := User;

  OriginalSQLTextInbox := qry_TreeInbox.SQL.Text;

  OrderbyClause := 'ORDER BY '+GroupList;
  qry_TreeInbox.SQL.Add('ORDER BY '+GroupList);

  For J := 0 to 100 Do
    LastField[J] := 'ZZZZZFFF';
//--------------
  tv_Inbox.Items.Clear;
  TopTreeNode := tv_Inbox.Items.AddFirst(Nil, 'My Inbox');
  TopTreeNode.ImageIndex := 0;
  TopTreeNode.SelectedIndex := 0;

  Screen.Cursor := crHourglass;
  tv_Inbox.Items.BeginUpdate;
  try
    qry_TreeInbox.Open;
    qry_TreeInbox.First;
    While not qry_TreeInbox.EOF Do
      begin
        ChangeFlag := False;
        I := -1;
//===================Add Branch Node if Necessary===============================
        Inc(I);

        TempStr := trim(qry_TreeInbox.FieldbyName('Branch').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Branch';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_TreeInbox.FieldbyName('Branch').AsString);

            TempStr := trim(qry_TreeInbox.FieldbyName('BranchName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add Dept Node if Necessary=================================
        Inc(I);

        TempStr := trim(qry_TreeInbox.FieldbyName('Department').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            ChangeFlag := True;
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'Department';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := trim(qry_TreeInbox.FieldbyName('Department').AsString);

            TempStr := trim(qry_TreeInbox.FieldbyName('DeptName').AsString);
            If I = 0 Then
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//===================Add RecordType Node if Necessary===========================
        Inc(I);
        TempStr := trim(qry_TreeInbox.FieldbyName('RecordType').AsString);
        If (LastField[I] <> TempStr)or(ChangeFlag) Then
          begin
            LastField[I] := TempStr;
            New(FieldRecPtr);
            FieldRecPtr^.FieldName := 'RecordType';
            FieldRecPtr^.NodeType := 'E'; //eRecord Meta Data
            FieldRecPtr^.ImgNo := 0;
            FieldRecPtr^.eRecNo := 0;
            FieldRecPtr^.PKey := '';

            If I = 0 Then
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end
            else
              begin
                LastTreeNode[I] := tv_Inbox.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
                LastTreeNode[I].ImageIndex := 1;
                LastTreeNode[I].SelectedIndex := 2;
              end;
            LastTreeNode[I].Parent.Expanded := True;
          end;
//========================Now Add Images========================================
        Inc(I);
        FileN := trim(qry_TreeInbox.FieldbyName('DocName').AsString);
        DocType := trim(UpperCase(ExtractFileExt(FileN)));
//---------------
        If (qry_TreeInbox.FieldbyName('ImageNo').AsInteger = 0) Then
          ImageIndex := 10
        else If DocType = '.TXT' Then
          ImageIndex := 11
        else If DocType = '.CSV' Then
          ImageIndex := 11
        else If DocType = '.RTF' Then
          ImageIndex := 11
        else If DocType = '.PDF' Then
          ImageIndex := 6
        else If DocType = '.DOC' Then
          ImageIndex := 7
        else If DocType = '.DOCX' Then
          ImageIndex := 7
        else If DocType = '.XLS' Then
          ImageIndex := 5
        else If DocType = '.XLSX' Then
          ImageIndex := 5
        else If DocType = '.HTML' Then
          ImageIndex := 4
        else If DocType = '.HTM' Then
          ImageIndex := 4
        else If DocType = '.MSG' Then
          ImageIndex := 4
        else If DocType = '.EML' Then
          ImageIndex := 4
        else If Copy(DocType, 1, 4) = '.TIF' Then
          ImageIndex := 9
        else ImageIndex := 3;
//---------------
        LastField[I] := TempStr;
        New(FieldRecPtr);
        FieldRecPtr^.FieldName := 'ImageNo';
        FieldRecPtr^.NodeType := 'D'; //eRecord Document
        FieldRecPtr^.ImgNo := qry_TreeInbox.FieldbyName('ImageNo').asInteger;
        FieldRecPtr^.eRecNo := qry_TreeInbox.FieldbyName('eRecNo').asInteger;
        FieldRecPtr^.PKey := '';
        //-------Build Descr-----
        TempStr := '';
        For J := 1 to 15 Do
          begin
            If (J >= 1)AND(J <= 10) Then
              begin
                If trim(qry_TreeInbox.FieldbyName('TEXT'+InttoStr(J)).AsString) <> '' Then
                  begin
                    If pos('TEXT'+InttoStr(J), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_TreeInbox.FieldbyName('TEXT'+InttoStr(J)).AsString)+', ';
                  end;
              end;
            If (J >= 11)AND(J <= 13) Then
              begin
                If trim(qry_TreeInbox.FieldbyName('DATE'+InttoStr(J-10)).AsString) <> '' Then
                  begin
                    If pos('DATE'+InttoStr(J-10), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_TreeInbox.FieldbyName('DATE'+InttoStr(J-10)).AsString)+', ';
                  end;
              end;
            If (J >= 14)AND(J <= 15) Then
              begin
                If trim(qry_TreeInbox.FieldbyName('NUMBER'+InttoStr(J-13)).AsString) <> '' Then
                  begin
                    If pos('NUMBER'+InttoStr(J-13), UpperCase(GroupList)) = 0 Then
                      TempStr := TempStr +  trim(qry_TreeInbox.FieldbyName('NUMBER'+InttoStr(J-13)).AsString)+', ';
                  end;
              end;
          end;
        Delete(TempStr, length(TempStr)-1, 2);

        If I = 0 Then
          begin
            LastTreeNode[I] := tv_Inbox.Items.AddChildObject(TopTreeNode, TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end
        else
          begin
            LastTreeNode[I] := tv_Inbox.Items.AddChildObject(LastTreeNode[I-1], TempStr, FieldRecPtr);
            LastTreeNode[I].ImageIndex := ImageIndex;
            LastTreeNode[I].SelectedIndex := ImageIndex;
          end;

        qry_TreeInbox.Next;
      end;

    For J := 0 to tv_Inbox.Items.Count-1 Do
      begin
        TmpTreeNode := tv_Inbox.Items.Item[J];
        If TmpTreeNode.HasChildren Then
          TmpTreeNode.Text := TmpTreeNode.Text+' ('+InttoStr(GetChildCount(TmpTreeNode))+')';
      end;

  finally
    qry_TreeInbox.Close;
    tv_Inbox.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
  TopTreeNode.Selected := True;
  btn_Next.Enabled := True;
  btn_Prior.Enabled := False;
  DrawThumbnails := False;
  tree_AllFoldChange(tv_Inbox, TopTreeNode);
end;


procedure Tfrm_eRecords.DeleteImage1Click(Sender: TObject);
Var
  J, I   :Integer;
  Treenode   :TTreeNode;
begin
  If tree_AllFold.SelectionCount > 0 Then
    begin
      If Messagedlg('Are you sure you want to delete the selected images?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;
      For J := tree_AllFold.SelectionCount-1 downto 0 Do
        begin
          TreeNode := tree_AllFold.Selections[J];
          IF PFieldRec(TreeNode.Data)^.NodeType <> 'D' Then
            begin
              Messagedlg('You can only delete documents!', mtWarning, [mbOK], 0);
              exit;
            end;
          I := PFieldRec(TreeNode.Data)^.ImgNo;
          dm_Metrofiler.DeleteERecFromRepositry(I, True);
          Treenode.Delete;
        end;
    end;
end;

procedure Tfrm_eRecords.DeleteImage2Click(Sender: TObject);
Var
  J, I   :Integer;
  Treenode   :TTreeNode;
begin
  If tv_Inbox.SelectionCount > 0 Then
    begin
      If Messagedlg('Are you sure you want to delete the selected images?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;
      For J := tv_Inbox.SelectionCount-1 downto 0 Do
        begin
          TreeNode := tv_Inbox.Selections[J];
          IF PFieldRec(TreeNode.Data)^.NodeType <> 'D' Then
            begin
              Messagedlg('You can only delete documents!', mtWarning, [mbOK], 0);
              exit;
            end;
          I := PFieldRec(TreeNode.Data)^.ImgNo;
          dm_Metrofiler.DeleteERecFromRepositry(I, True);
          Treenode.Delete;
        end;
    end;
end;

procedure Tfrm_eRecords.tree_AllFoldMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If Shift = [ssLeft] Then
    IF TTreeView(Sender).GetNodeAt(X, Y) <> Nil Then
      begin
        TTreeView(Sender).ClearSelection(False);
        TTreeView(Sender).GetNodeAt(X, Y).Selected := True;
      end;
end;

function Tfrm_eRecords.SaveView(Zoom :Single; X, Y  :Integer):Boolean;
begin
  SavedX := X;
  SavedY := Y;
  SavedZoom := Zoom;
  Result := True;
end;

procedure Tfrm_eRecords.LauncheRecord1Click(Sender: TObject);
Var
  CurrFilenames   :TStringList;
begin
  If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetFilenames(CurrFilenames);
        CurrFilenames.Strings[0];
        Messagedlg('You have multiple eRecords selected. Only the First eRecord will be Launched.', mtWarning, [mbOK], 0);
        ExecuteFile(CurrFilenames.Strings[0], '', 'c:\', SW_MAXIMIZE);
      finally
        CurrFilenames.Free;
      end;
    end
  else ExecuteFile(CurrFileName, '', 'c:\', SW_MAXIMIZE);
end;

function Tfrm_eRecords.LoadView(VAR Zoom :Single; VAR X, Y  :Integer):Boolean;
begin
  X := SavedX;
  Y := SavedY;
  Zoom := SavedZoom;
  Result := True;
end;

procedure Tfrm_eRecords.pg_SearchChange(Sender: TObject);
begin
  If pg_Search.ActivePageIndex = 0 Then
    begin
      DisplayeRecordInbox;
    end;
end;

procedure Tfrm_eRecords.DisplayThumbnail(tImageNo  :Integer);
Var
  J  :Integer;
  TreeNode   :TTreeNode;
begin
  For J := 1 to tree_AllFold.Items.Count-1 Do
    begin
      TreeNode := tree_AllFold.Items.Item[J];
      If PFieldRec(TreeNode.Data)^.NodeType = 'D' Then
        If PFieldRec(TreeNode.Data)^.ImgNo = tImageNo Then
          begin
            tree_AllFolD.ClearSelection(False);
            tree_AllFolD.Selected := TreeNode;
            break;
          end;
    end;
end;

procedure Tfrm_eRecords.eMailImage1Click(Sender: TObject);
Var
  CurrFilenames   :TStringList;
  J               :Integer;
  TStr            :String;
begin
  If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetFilenames(CurrFilenames);
        For J := 0 to CurrFilenames.Count-1 Do
          TStr := TStr + CurrFilenames.Strings[J]+';';
        SendFile(TStr);
      finally
        CurrFilenames.Free;
      end;
    end
  else SendFile(CurrFileName);
end;

procedure Tfrm_eRecords.TimerRefreshTimer(Sender: TObject);
begin
  TimerRefresh.Enabled := False;
  Messagedlg('If you have modified any data'+#13+'please re-run your search criteria'+#13+'in order for the updates to be reflected.', mtWarning, [mbOK], 0);
end;

procedure Tfrm_eRecords.btn_eRecordDataManagerClick(Sender: TObject);
begin
  btn_eRecordDataManager.Enabled := False;
  Application.CreateForm(Tfrm_eRecDataMan, frm_eRecDataMan);
end;

procedure Tfrm_eRecords.tree_AllFoldExpanded(Sender: TObject;
  Node: TTreeNode);
Var
  TreeNode   :TTreeNode;
begin
  TreeNode := Node.getFirstChild;
  TreeNode.Selected := True;
end;

end.


