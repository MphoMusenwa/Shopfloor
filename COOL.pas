unit COOL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,ExtCtrls,
  Grids, StdCtrls, Buttons, ComCtrls, ImgList, StdActns, BandActn, DB, ADODB,
  Mask, DBCtrls, framCOOLImageViewer, ShellAPI, Mapi, OleCtrls,DebenuPDFLibrary,
  framCOOLThumbnails, Menus, DateUtils, ImageEnIO, ieview, iemview;

type
  PFieldRec = ^TFieldRec;
  TFieldRec = record
    RecordType  :String;
    FieldName   :String;
    PKey        :String;
    NodeType    :String[1];
    ID          :Integer;
  end;
  Tfrm_COOL = class(TForm)
    pnl_LeftMain: TPanel;
    pnl_Info: TPanel;
    pg_Search: TPageControl;
    tb_AllFold: TTabSheet;
    scrl_IndexInfoBox: TScrollBox;
    Panel4: TPanel;
    Label1: TLabel;
    ScrollBox3: TScrollBox;
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
    DTS_Details: TDataSource;
    qry_RecordType: TADOQuery;
    qry_Tree: TADOQuery;
    OpenDialog1: TOpenDialog;
    qry_CheckIfMultiPageTiff: TADOQuery;
    Splitter1: TSplitter;
    pm_Tree: TPopupMenu;
    qry_eRecordImages: TADOQuery;
    eMailImage1: TMenuItem;
    LauncheRecord1: TMenuItem;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    btn_Prior: TSpeedButton;
    btn_Next: TSpeedButton;
    btn_ShellExec: TSpeedButton;
    btn_eMail: TSpeedButton;
    btn_Print: TSpeedButton;
    Panel2: TPanel;
    Scroll_ImageViewer: TPanel;
    tree_AllFold: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Act_CloseExecute(Sender: TObject);
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
    procedure qry_SearchAfterClose(DataSet: TDataSet);
    procedure tree_AllFoldMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tree_AllFoldExpanded(Sender: TObject; Node: TTreeNode);
    procedure btn_PrintClick(Sender: TObject);
    procedure eMailImage1Click(Sender: TObject);
    procedure LauncheRecord1Click(Sender: TObject);
    procedure tree_AllFoldDblClick(Sender: TObject);
  private
    { Private declarations }
    OriginalSQLText  :String;
    OrderbyClause :String;
    CurrFileName    :String;
    BusyFlag     :Boolean;
    DrawThumbnails  :Boolean;
    LastDocumentDisplayed   :Integer;
    SavedZoom               :Single;
    SavedX, SavedY          :Integer;
    function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
    procedure SendFile(attached: String);
    function GetChildCount(TreeNode :TTreeNode):Integer;
 public
    { Public declarations }
    procedure DisplayThumbnail(tImageNo  :Integer);
    function SaveView(Zoom :Single; X, Y  :Integer):Boolean;
    function LoadView(VAR Zoom :Single; VAR X, Y  :Integer):Boolean;
  end;

var
  frm_COOL: Tfrm_COOL;

implementation

uses main, eRecSrchSpec, MetrofilerDataModule, eRecSrchQry, framRichEditViewer,
  COOLSrchSpec, COOLSrchQry;

{$R *.dfm}

procedure Tfrm_COOL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_COOL.Enabled := True;
  frm_Console.fCOOL := Nil;
  Action := caFree;
end;

procedure Tfrm_COOL.Act_CloseExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_COOL.img_Top_UpClick(Sender: TObject);
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

procedure Tfrm_COOL.img_Top_DownClick(Sender: TObject);
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

procedure Tfrm_COOL.img_Bottom_UpClick(Sender: TObject);
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

procedure Tfrm_COOL.img_Bottom_DownClick(Sender: TObject);
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

procedure Tfrm_COOL.FormCreate(Sender: TObject);
Var
  TreeNode  :TTreeNode;
begin
  LastDocumentDisplayed := 0;
  BusyFlag := False;
  pnl_Search.Height := 30;
  pnl_Info.Height := 30;
  TreeNode := tree_AllFold.Items.AddFirst(Nil, 'Search Results');
  TreeNode.ImageIndex := 0;
  TreeNode.SelectedIndex := 0;
  frm_SearcheRecords.Initialize(True);
  frm_SearcheRecordsCross.Initialize(True);

  btn_ShellExec.Visible := frm_Console.AccessRight(8);
  btn_eMail.Visible := frm_Console.AccessRight(8);
//---
  SavedZoom := -1;
  SavedY := -1;
  SavedX := -1;
end;

procedure Tfrm_COOL.btn_SpecSrchClick(Sender: TObject);
Var
  J, I, A  :Integer;
  TempStr  :String;
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
  ExpandedFlag  :Boolean;
  FieldTot     :Integer;
  FieldName    :String;
  COOLTblName  :String;
begin
  If frm_COOLSearchSpecific.Execute = mrOK Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
      qry_SQL.Parameters.ParamByName('DS').Value := frm_COOLSearchSpecific.edt_RecordType.Text;
      qry_SQL.Open;
      COOLTblName := '[dbo].[COOL_' + qry_SQL.FieldbyName('COOLID').AsString + ']';
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
      qry_SQL.Parameters.ParamByName('DS').Value := frm_COOLSearchSpecific.edt_RecordType.Text;
      qry_SQL.Open;
      FieldTot := qry_SQL.RecordCount;
//--------
      qry_Tree.Close;
      qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
      FieldList := '';
      FieldList := FieldList + 'c.Branch, b.Name AS "BranchName", ';
      FieldList := FieldList + 'c.Department, d.Name AS "DeptName", ';
      FieldList := FieldList + 'c.RecordType, c.RecordCat, ';
    //------
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          FieldList := FieldList + 'c.[' + qry_SQL.FieldByName('FieldName').asString + '], ';
          qry_SQL.Next;
        end;
//===========Generate the Group by List-------------------------
      GroupList := '';
      For I := 1 to FieldTot + 4 Do
        begin
          If StrtoIntDef(frm_COOLSearchSpecific.edt_BranchGroup.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_BranchSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.Branch, '
            else GroupList := GroupList + 'c.Branch DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_DeptGroup.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_DeptSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.Department, '
            else GroupList := GroupList + 'c.Department DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordTypeGroup.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_RecordTypeSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.RecordType, '
            else GroupList := GroupList + 'c.RecordType DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordCatGroup.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_RecordCatSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.RecordCat, '
            else GroupList := GroupList + 'ce.RecordCat DESC, ';
        //---
          For J := 1 to FieldTot Do
            begin
              FieldName := TLabel(frm_COOLSearchSpecific.sb_Details.FindComponent('lbl_Col'+InttoStr(J))).Caption;
              If StrtoIntDef(TEdit(frm_COOLSearchSpecific.sb_Details.FindComponent('edt_ColGroup'+InttoStr(J))).Text, 0) = I Then
                If TComboBox(frm_COOLSearchSpecific.sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex = 0 Then
                  begin
                    GroupList := GroupList + 'c.[' + FieldName + '], ';
                  end
                else
                  begin
                    GroupList := GroupList + 'c.[' + FieldName + '] DESC, ';
                  end;
            end;
        end;
//===========Generate the Sort by List-------------------------
      SortList := '';
      For I := 1 to FieldTot + 4 Do
        begin
          If StrtoIntDef(frm_COOLSearchSpecific.edt_BranchSort.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_BranchSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.Branch, '
            else SortList := SortList + 'c.Branch DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_DeptSort.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_DeptSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.Department, '
            else SortList := SortList + 'c.Department DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordTypeSort.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_RecordTypeSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.RecordType, '
            else SortList := SortList + 'c.RecordType DESC, ';
          If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordCatSort.Text, 0) = I Then
            If frm_COOLSearchSpecific.cb_RecordCatSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.RecordCat, '
            else SortList := SortList + 'c.RecordCat DESC, ';
        //---
          For J := 1 to FieldTot Do
            begin
              FieldName := TLabel(frm_COOLSearchSpecific.sb_Details.FindComponent('lbl_Col'+InttoStr(J))).Caption;
              If StrtoIntDef(TEdit(frm_COOLSearchSpecific.sb_Details.FindComponent('edt_ColSort'+InttoStr(J))).Text, 0) = I Then
                If TComboBox(frm_COOLSearchSpecific.sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex = 0 Then
                  begin
                    SortList := SortList + 'c.[' + FieldName + '], ';
                  end
                else
                  begin
                    SortList := SortList + 'c.[' + FieldName + '] DESC, ';
                  end;
            end;
        end;
      SortList := SortList + 'c.Id';
//------------
      qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
      qry_Tree.SQL.Add('SET @UserId = :UserID');
      qry_Tree.Parameters.ParamValues['UserId'] := User;

      qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'c.Id');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('  '+COOLTblName+' c');
      qry_Tree.SQL.Add('  INNER JOIN Branches b ON c.Branch = b.Branch');
      qry_Tree.SQL.Add('  INNER JOIN Departments d ON c.Branch = d.Branch AND c.Department = d.Department');
//------Branch
      If frm_COOLSearchSpecific.edt_Branch.Text <> '' Then
        begin
          qry_Tree.SQL.Add('WHERE c.Branch = :Branch');
          qry_Tree.Parameters.ParamValues['Branch'] := frm_COOLSearchSpecific.edt_Branch.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('WHERE	c.Branch IN (');

          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	b.Branch');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	Branches b');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ISNULL(b.Status, 0) <> 1');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('	AND (');
              qry_Tree.SQL.Add('');
              qry_Tree.SQL.Add('(b.Branch IN (SELECT a.Branch FROM IndexUAuthRts a WHERE a.UserId = @UserId))');
              qry_Tree.SQL.Add('OR');
              qry_Tree.SQL.Add('(b.Branch IN (SELECT a.Branch FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = @UserId))');
              qry_Tree.SQL.Add(')');
            end;

          qry_Tree.SQL.Add('	)');
        end;
//------Department
      If frm_COOLSearchSpecific.edt_Dept.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.Department = :Department');
          qry_Tree.Parameters.ParamValues['Department'] := frm_COOLSearchSpecific.edt_Dept.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND c.Department IN (');

          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	d.Department');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	Departments d');
          qry_Tree.SQL.Add('	INNER JOIN Branches b ON d.Branch = b.Branch');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ISNULL(b.Status, 0) <> 1 AND');
          qry_Tree.SQL.Add('	ISNULL(d.Status, 0) <> 1 AND');
          qry_Tree.SQL.Add('	b.Branch = e.Branch');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('	AND (');
              qry_Tree.SQL.Add('');
              qry_Tree.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a WHERE a.Branch = b.Branch AND a.UserId = @UserId))');
              qry_Tree.SQL.Add('OR');
              qry_Tree.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.Branch = b.Branch AND r.UserId = @UserId))');
              qry_Tree.SQL.Add(')');
            end;

          qry_Tree.SQL.Add('	)');
        end;
//------RecordType
      If frm_COOLSearchSpecific.edt_RecordType.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.RecordType = :RecordType');
          qry_Tree.Parameters.ParamValues['RecordType'] := frm_COOLSearchSpecific.edt_RecordType.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND c.RecordType IN (');

          if frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add('	ia.Branch = c.Branch AND');
              qry_Tree.SQL.Add('	ia.Department = c.Department AND');
              qry_Tree.SQL.Add('	i.UseCOOL = 1');
            end
          else
            begin
              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	  x.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	  IndexDefinitions x');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add('   x.Description IN (');

              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts a ON i.Description = a.Description');
              qry_Tree.SQL.Add('	INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add(' a.Branch = c.Branch AND');
              qry_Tree.SQL.Add(' a.Department = c.Department AND');
              qry_Tree.SQL.Add(' u.UserID = @UserId AND');
              qry_Tree.SQL.Add(' i.UseCOOL = 1 AND u.COOL = 1');
              qry_Tree.SQL.Add(')');
              qry_Tree.SQL.Add('   OR x.Description IN (');

              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts a ON i.Description = a.Description');
              qry_Tree.SQL.Add('	INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
              qry_Tree.SQL.Add('	INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add(' a.Branch = c.Branch AND');
              qry_Tree.SQL.Add(' a.Department = c.Department AND');
              qry_Tree.SQL.Add(' r.UserID = @UserId AND');
              qry_Tree.SQL.Add(' i.UseCOOL = 1 AND u.COOL = 1');
              qry_Tree.SQL.Add(')');
            end;
          qry_Tree.SQL.Add(')');
        end;
//------RecordCat
      If frm_COOLSearchSpecific.cb_RecordCat.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.RecordCat = :RecordCat');
          qry_Tree.Parameters.ParamValues['RecordCat'] := frm_COOLSearchSpecific.cb_RecordCat.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND (');

          qry_Tree.SQL.Add('(c.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseCOOL = 1 AND UseRecordCat = 0))');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(');

          qry_Tree.SQL.Add('(c.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseCOOL = 1 AND UseRecordCat = 1))');
          qry_Tree.SQL.Add('AND');
          qry_Tree.SQL.Add('(c.RecordCat IN (');
          qry_Tree.SQL.Add('      SELECT x.RecCatType');
          qry_Tree.SQL.Add('      FROM RecordCat x INNER JOIN RCRTRts r ON x.RecCatType = r.RecordCat');
          qry_Tree.SQL.Add('      WHERE r.RecordType = c.RecordType))');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('AND');
              qry_Tree.SQL.Add('(c.RecordCat IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = @UserId)');
              qry_Tree.SQL.Add(' OR');
              qry_Tree.SQL.Add(' c.RecordCat IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = @UserId))');
            end;

          qry_Tree.SQL.Add(')');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(c.RecordCat IS NULL)');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(c.RecordCat = '''')');

          qry_Tree.SQL.Add(')');
        end;
//----------------Filters------------
      For J := 1 to FieldTot Do
        begin
          FieldName := TLabel(frm_COOLSearchSpecific.sb_Details.FindComponent('lbl_Col'+InttoStr(J))).Caption;
          TempStr := TComboBox(frm_COOLSearchSpecific.sb_Details.FindComponent('cb_Col'+InttoStr(J))).Text;
          If TempStr <> '' Then
            begin
              If (frm_COOLSearchSpecific.chk_Partial.Checked) Then
                begin
                  qry_Tree.SQL.Add('AND c.[' + FieldName + '] LIKE :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := '%'+TempStr+'%';
                end
              else
                begin
                  qry_Tree.SQL.Add('AND c.[' + FieldName + '] = :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := TempStr;
                end;
            end;
        end;
//------------
      OriginalSQLText := qry_Tree.SQL.Text;

      OrderbyClause := 'ORDER BY ' + GroupList + SortList;
      qry_Tree.SQL.Add('ORDER BY ' + GroupList + SortList);

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
            For J := 1 to FieldTot + 4 Do
              begin
//===================Add Branch Node if Necessary===============================
                If StrtoIntDef(frm_COOLSearchSpecific.edt_BranchGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'Branch';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
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
                    ExpandedFlag := not(frm_COOLSearchSpecific.chk_BranchCollapse.Checked);
                  end;
//===================Add Dept Node if Necessary=================================
                If StrtoIntDef(frm_COOLSearchSpecific.edt_DeptGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'Department';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
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
                    ExpandedFlag := not(frm_COOLSearchSpecific.chk_DeptCollapse.Checked);
                  end;
//===================Add RecordType Node if Necessary===========================
                If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordTypeGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'RecordType';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
                        FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('RecordType').AsString);;

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
                    ExpandedFlag := not(frm_COOLSearchSpecific.chk_RecordTypeCollapse.Checked);
                  end;
//===================Add RecordCat Node if Necessary===========================
                If StrtoIntDef(frm_COOLSearchSpecific.edt_RecordCatGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('RecordCat').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'RecordCat';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
                        FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('RecordCat').AsString);

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
                    ExpandedFlag := not(frm_COOLSearchSpecific.chk_RecordCatCollapse.Checked);
                  end;
//===================Add Text, Date, Number Node if Necessary===================
                For A := 1 to FieldTot Do
                  begin
                    If StrtoIntDef(TEdit(frm_COOLSearchSpecific.FindComponent('edt_ColGroup'+InttoStr(A))).Text, 0) = J Then
                      begin
                        Inc(I);

                        FieldName := TLabel(frm_COOLSearchSpecific.sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Caption;
                        TempStr := TComboBox(frm_COOLSearchSpecific.sb_Details.FindComponent('cb_Col'+InttoStr(A))).Text;

                        If (LastField[I] <> TempStr)or(ChangeFlag) Then
                          begin
                            ChangeFlag := True;
                            LastField[I] := TempStr;
                            New(FieldRecPtr);
                            FieldRecPtr^.RecordType := '';
                            FieldRecPtr^.FieldName := FieldName;
                            FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                            FieldRecPtr^.ID := 0;
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
                        ExpandedFlag := not(TCheckBox(frm_COOLSearchSpecific.FindComponent('chk_ColCollapse'+InttoStr(A))).Checked);
                      end;
                  end; //Text, Date, Num Node
              end;
//========================Now Add Images========================================
            Inc(I);
            TempStr := trim(qry_Tree.FieldbyName('ID').AsString);
//---------------
            ImageIndex := 9;
//---------------
            LastField[I] := trim(qry_Tree.FieldbyName('ID').AsString);
            New(FieldRecPtr);
            FieldRecPtr^.RecordType := qry_Tree.FieldbyName('RECORDTYPE').AsString;
            FieldRecPtr^.FieldName := 'ID';
            FieldRecPtr^.NodeType := 'D'; //COOL Document
            FieldRecPtr^.ID := qry_Tree.FieldbyName('ID').asInteger;
            FieldRecPtr^.PKey := '';
            //-------Build Descr-----
            TempStr := '';
            For J := 1 to FieldTot Do
              begin
                FieldName := UpperCase(TLabel(frm_COOLSearchSpecific.sb_Details.FindComponent('lbl_Col'+InttoStr(J))).Caption);

                If pos(FieldName, UpperCase(GroupList)) = 0 Then
                  If trim(qry_Tree.FieldbyName(FieldName).AsString) <> '' Then
                    TempStr := TempStr +  trim(qry_Tree.FieldbyName(FieldName).AsString)+', ';
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
    end;
end;

function Tfrm_COOL.GetChildCount(TreeNode :TTreeNode):Integer;
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

procedure Tfrm_COOL.tree_AllFoldChange(Sender: TObject;
  Node: TTreeNode);
Var
  J          :Integer;
  RecordType :String;
  FieldName  :String;
  FieldValue :String;
  NodeType   :String[1];
  ID         :Integer;
  ListTrxNos :String;
  TreeNode   :TTreenode;
begin
//------------------Draw the meta data captured of current selected-------------
If tree_AllFold.SelectionCount = 1 Then
begin
  If Node.Level = 0 Then
    begin
      qry_Search.Close;
      qry_SearchAfterClose(qry_Search);
    end
  else
    begin
      RecordType := PFieldRec(Node.Data)^.RecordType;
      FieldName := PFieldRec(Node.Data)^.FieldName;
      FieldValue := Node.Text;
      NodeType := PFieldRec(Node.Data)^.NodeType;
      ID := PFieldRec(Node.Data)^.ID;

      If NodeType = 'D' Then
        begin
          qry_Search.Close;
          qry_Search.SQL.Clear;
          qry_Search.SQL.Add(OriginalSQLText);
          qry_Search.SQL.Add('AND c.ID = :ID');
          qry_Search.Parameters.ParamByName('ID').Value := ID;
          For J := 0 to qry_Tree.Parameters.Count-1 Do
            qry_Search.Parameters.ParamValues[qry_Tree.Parameters.Items[J].Name] :=qry_Tree.Parameters.Items[J].Value;
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
else If tree_AllFold.SelectionCount > 1 Then
  begin
    qry_Search.Close;
    ListTrxNos := '';
    For J := 0 to tree_AllFold.SelectionCount-1 Do
      begin
        TreeNode := tree_AllFold.Selections[J];

        RecordType := PFieldRec(Node.Data)^.RecordType;
        FieldName := PFieldRec(TreeNode.Data)^.FieldName;
        FieldValue := TreeNode.Text;
        NodeType := PFieldRec(TreeNode.Data)^.NodeType;
        ID := PFieldRec(TreeNode.Data)^.ID;

        If NodeType = 'D' Then
          begin
            If ID <> 0 Then
              ListTrxNos := ListTrxNos + InttoStr(ID)+',';
          end;
      end;
    If ListTrxNos <> '' Then
      begin
        LastDocumentDisplayed := 0;
        Delete(ListTrxNos, length(ListTrxNos), 1);

        If Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')) = Nil Then
          begin
            Tfram_COOLThumbnails.Create(Scroll_ImageViewer).Name := 'fram_COOLThumbnails1';
            Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).Parent := Scroll_ImageViewer;
            Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).Align := alClient;
            Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).aParentForm := frm_Console.fCOOL;
          end;
        Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).Visible := True;
        Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).GetDocuments(RecordType, ListTrxNos);
      end;
  end;
end;

procedure Tfrm_COOL.tree_AllFoldDblClick(Sender: TObject);
begin
  btn_ShellExecClick(btn_ShellExec);
end;

procedure Tfrm_COOL.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_COOL.btn_PrintClick(Sender: TObject);
begin
  If Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')) <> Nil Then
    Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).Print
  else if Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')) <> Nil Then
    Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')).Print;
end;

procedure Tfrm_COOL.btn_PriorClick(Sender: TObject);
Var
  TreeNode  :TTreeNode;
begin
  TreeNode := tree_AllFold.Selected.GetPrev;
  If TreeNode <> Nil Then
    TreeNode.Selected := True;
  btn_Prior.Enabled := TreeNode <> Nil;
  btn_Next.Enabled := True;
end;

procedure Tfrm_COOL.btn_NextClick(Sender: TObject);
Var
  TreeNode  :TTreeNode;
begin
  TreeNode := tree_AllFold.Selected.GetNext;
  If TreeNode <> Nil Then
    TreeNode.Selected := True;
  btn_Next.Enabled := TreeNode <> Nil;
  btn_Prior.Enabled := True;
end;

procedure Tfrm_COOL.qry_SearchAfterScroll(DataSet: TDataSet);
Var
   RecordType :String;
   FieldName  :String;
   FieldValue :String;
   J, I, T    :Integer;
   MaxLblLen  :Integer;
   MaxEdtLen  :Integer;
   ComponentTot :Integer;
begin
  If BusyFlag Then
    exit;
  BusyFlag := True;
  try
    RecordType := trim(qry_Search.FieldbyName('RecordType').AsString);
    qry_RecordType.Close;
    qry_RecordType.SQL.Clear;
    qry_RecordType.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
    qry_RecordType.Parameters.ParamByName('DS').Value := RecordType;
    qry_RecordType.Open;
//----
    MaxLblLen := 0;
    MaxEdtLen := 0;
    I := 0;
    T := 5 - 24;

    qry_RecordType.First;
    While not qry_RecordType.EOF Do
      begin
        FieldName := qry_RecordType.FieldbyName('FieldName').AsString;
        FieldValue := qry_Search.FieldByName(FieldName).AsString;
        If FieldName <> '' Then
          begin
            Inc(I);
            Inc(T, 24);
            //--------Create Label-------
            TLabel.Create(scrl_IndexInfoBox).Name := 'lbl_Col'+InttoStr(I);
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Parent := scrl_IndexInfoBox;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).AutoSize := false;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Top := T;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Left := 4;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Width := 150;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Alignment := taRightJustify;
            TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(I))).Caption := FieldName+' :';
            //--------Create Edit-------
            TEdit.Create(scrl_IndexInfoBox).Name := 'edt_Col'+InttoStr(I);
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Parent := scrl_IndexInfoBox;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Top := T-4;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Left := 359;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Width := 321;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).ReadOnly := True;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Color := clScrollbar;
            TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(I))).Text := FieldValue;

            If MaxLblLen < Canvas.TextWidth(FieldName+' :') Then
              MaxLblLen := Canvas.TextWidth(FieldName+' :');

            If MaxEdtLen < Canvas.TextWidth(FieldValue) Then
              MaxEdtLen := Canvas.TextWidth(FieldValue);
          end;
        qry_RecordType.Next;
      end;
  qry_RecordType.Close;

  For J := 1 to I Do
    begin
//-------Set Lbl Size Properties
      TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(scrl_IndexInfoBox.FindComponent('lbl_Col'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(J))).Left := MaxLblLen+8;
      TEdit(scrl_IndexInfoBox.FindComponent('edt_Col'+InttoStr(J))).Width := MaxEdtLen+15;
    end;
//==============================================================================
  If (LastDocumentDisplayed = Dataset.FieldByName('ID').asInteger)AND
     (LastDocumentDisplayed <> 0) Then
    exit;
  LastDocumentDisplayed := Dataset.FieldByName('ID').asInteger;
//==============================================================================
  ComponentTot := Scroll_ImageViewer.ComponentCount;
  For J := ComponentTot-1 downto 0 Do
    begin
      If (Scroll_ImageViewer.Components[J] is TFrame) Then
        Scroll_ImageViewer.Components[J].Free;
    end;

  btn_Print.Visible := False;

  If LastDocumentDisplayed = 0 Then
    begin
      exit;
    end;

  Tfram_COOLImageViewer.Create(Scroll_ImageViewer).Name := 'fram_COOLImageViewer1';
  Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')).Parent := Scroll_ImageViewer;
  Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')).Align := alClient;
  If Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')).GetDocuments(qry_Search.FieldbyName('RecordType').AsString, qry_Search.FieldbyName('ID').AsInteger) Then
    begin
      Tfram_COOLImageViewer(Scroll_ImageViewer.FindComponent('fram_COOLImageViewer1')).Visible := True;
    end;
  btn_Print.Visible := frm_Console.AccessRight(8);
  finally
    BusyFlag := False;
  end;
end;

procedure Tfrm_COOL.qry_SearchAfterOpen(DataSet: TDataSet);
Var
  J, ComponentTot  :Integer;
begin
  ComponentTot := scrl_IndexInfoBox.ComponentCount;
  For J := ComponentTot - 1 downto 0 Do
    scrl_IndexInfoBox.Components[J].Free;
end;

procedure Tfrm_COOL.btn_CrossQSrchClick(Sender: TObject);
Var
  J, I  :Integer;
  TempStr  :String;
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
  ExpandedFlag  :Boolean;
  FieldTot     :Integer;
  FieldName    :String;
  COOLTblName  :String;
  ORFlag       :Boolean;
begin
  If frm_COOLSearchCross.Execute = mrOK Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
      qry_SQL.Parameters.ParamByName('DS').Value := frm_COOLSearchCross.edt_RecordType.Text;
      qry_SQL.Open;
      COOLTblName := '[dbo].[COOL_' + qry_SQL.FieldbyName('COOLID').AsString + ']';
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
      qry_SQL.Parameters.ParamByName('DS').Value := frm_COOLSearchCross.edt_RecordType.Text;
      qry_SQL.Open;
      FieldTot := qry_SQL.RecordCount;
//--------
      qry_Tree.Close;
      qry_Tree.SQL.Clear;
//===========Generate the select List-------------------------
      FieldList := '';
      FieldList := FieldList + 'c.Branch, b.Name AS "BranchName", ';
      FieldList := FieldList + 'c.Department, d.Name AS "DeptName", ';
      FieldList := FieldList + 'c.RecordType, c.RecordCat, ';
    //---
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          FieldList := FieldList + 'c.[' + qry_SQL.FieldByName('FieldName').asString + '], ';
          qry_SQL.Next;
        end;
//===========Generate the Group by List-------------------------
      GroupList := '';
      For I := 1 to FieldTot + 4 Do
        begin
          If StrtoIntDef(frm_COOLSearchCross.edt_BranchGroup.Text, 0) = I Then
            If frm_COOLSearchCross.cb_BranchSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.Branch, '
            else GroupList := GroupList + 'c.Branch DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_DeptGroup.Text, 0) = I Then
            If frm_COOLSearchCross.cb_DeptSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.Department, '
            else GroupList := GroupList + 'c.Department DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_RecordTypeGroup.Text, 0) = I Then
            If frm_COOLSearchCross.cb_RecordTypeSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.RecordType, '
            else GroupList := GroupList + 'c.RecordType DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_RecordCatGroup.Text, 0) = I Then
            If frm_COOLSearchCross.cb_RecordCatSortOpt.ItemIndex = 0 Then
              GroupList := GroupList + 'c.RecordCat, '
            else GroupList := GroupList + 'ce.RecordCat DESC, ';
        end;
//===========Generate the Sort by List-------------------------
      SortList := '';
      For I := 1 to FieldTot + 4 Do
        begin
          If StrtoIntDef(frm_COOLSearchCross.edt_BranchSort.Text, 0) = I Then
            If frm_COOLSearchCross.cb_BranchSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.Branch, '
            else SortList := SortList + 'c.Branch DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_DeptSort.Text, 0) = I Then
            If frm_COOLSearchCross.cb_DeptSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.Department, '
            else SortList := SortList + 'c.Department DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_RecordTypeSort.Text, 0) = I Then
            If frm_COOLSearchCross.cb_RecordTypeSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.RecordType, '
            else SortList := SortList + 'c.RecordType DESC, ';
          If StrtoIntDef(frm_COOLSearchCross.edt_RecordCatSort.Text, 0) = I Then
            If frm_COOLSearchCross.cb_RecordCatSortOpt.ItemIndex = 0 Then
              SortList := SortList + 'c.RecordCat, '
            else SortList := SortList + 'c.RecordCat DESC, ';
        end;
      SortList := SortList + 'c.Id';
//------------
      qry_Tree.SQL.Add('DECLARE @UserId varchar(255)');
      qry_Tree.SQL.Add('SET @UserId = :UserID');
      qry_Tree.Parameters.ParamValues['UserId'] := User;

      qry_Tree.SQL.Add('SELECT TOP 10000 '+FieldList+'c.Id');
      qry_Tree.SQL.Add('FROM');
      qry_Tree.SQL.Add('  '+COOLTblName+' c');
      qry_Tree.SQL.Add('  INNER JOIN Branches b ON c.Branch = b.Branch');
      qry_Tree.SQL.Add('  INNER JOIN Departments d ON c.Branch = d.Branch AND c.Department = d.Department');
//------Branch
      If frm_COOLSearchCross.edt_Branch.Text <> '' Then
        begin
          qry_Tree.SQL.Add('WHERE c.Branch = :Branch');
          qry_Tree.Parameters.ParamValues['Branch'] := frm_COOLSearchCross.edt_Branch.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('WHERE	c.Branch IN (');

          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	b.Branch');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	Branches b');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ISNULL(b.Status, 0) <> 1');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('	AND (');
              qry_Tree.SQL.Add('');
              qry_Tree.SQL.Add('(b.Branch IN (SELECT a.Branch FROM IndexUAuthRts a WHERE a.UserId = @UserId))');
              qry_Tree.SQL.Add('OR');
              qry_Tree.SQL.Add('(b.Branch IN (SELECT a.Branch FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = @UserId))');
              qry_Tree.SQL.Add(')');
            end;

          qry_Tree.SQL.Add('	)');
        end;
//------Department
      If frm_COOLSearchCross.edt_Dept.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.Department = :Department');
          qry_Tree.Parameters.ParamValues['Department'] := frm_COOLSearchCross.edt_Dept.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND c.Department IN (');

          qry_Tree.SQL.Add('SELECT');
          qry_Tree.SQL.Add('	d.Department');
          qry_Tree.SQL.Add('FROM');
          qry_Tree.SQL.Add('	Departments d');
          qry_Tree.SQL.Add('	INNER JOIN Branches b ON d.Branch = b.Branch');
          qry_Tree.SQL.Add('WHERE');
          qry_Tree.SQL.Add('	ISNULL(b.Status, 0) <> 1 AND');
          qry_Tree.SQL.Add('	ISNULL(d.Status, 0) <> 1 AND');
          qry_Tree.SQL.Add('	b.Branch = e.Branch');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('	AND (');
              qry_Tree.SQL.Add('');
              qry_Tree.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a WHERE a.Branch = b.Branch AND a.UserId = @UserId))');
              qry_Tree.SQL.Add('OR');
              qry_Tree.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.Branch = b.Branch AND r.UserId = @UserId))');
              qry_Tree.SQL.Add(')');
            end;

          qry_Tree.SQL.Add('	)');
        end;
//------RecordType
      If frm_COOLSearchCross.edt_RecordType.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.RecordType = :RecordType');
          qry_Tree.Parameters.ParamValues['RecordType'] := frm_COOLSearchCross.edt_RecordType.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND c.RecordType IN (');

          if frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts ia ON i.Description = ia.Description');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add('	ia.Branch = c.Branch AND');
              qry_Tree.SQL.Add('	ia.Department = c.Department AND');
              qry_Tree.SQL.Add('	i.UseCOOL = 1');
            end
          else
            begin
              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	  x.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	  IndexDefinitions x');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add('   x.Description IN (');

              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts a ON i.Description = a.Description');
              qry_Tree.SQL.Add('	INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add(' a.Branch = c.Branch AND');
              qry_Tree.SQL.Add(' a.Department = c.Department AND');
              qry_Tree.SQL.Add(' u.UserID = @UserId AND');
              qry_Tree.SQL.Add(' i.UseCOOL = 1 AND u.COOL = 1');
              qry_Tree.SQL.Add(')');
              qry_Tree.SQL.Add('   OR x.Description IN (');

              qry_Tree.SQL.Add('SELECT');
              qry_Tree.SQL.Add('	i.Description');
              qry_Tree.SQL.Add('FROM');
              qry_Tree.SQL.Add('	IndexDefinitions i');
              qry_Tree.SQL.Add('	INNER JOIN IndexAuthRts a ON i.Description = a.Description');
              qry_Tree.SQL.Add('	INNER JOIN IndexUAuthRts u ON a.Description = u.Description AND a.Branch = u.Branch AND a.Department = u.Department');
              qry_Tree.SQL.Add('	INNER JOIN RolesRts r ON u.RoleId = u.RoleId');
              qry_Tree.SQL.Add('WHERE');
              qry_Tree.SQL.Add(' a.Branch = c.Branch AND');
              qry_Tree.SQL.Add(' a.Department = c.Department AND');
              qry_Tree.SQL.Add(' r.UserID = @UserId AND');
              qry_Tree.SQL.Add(' i.UseCOOL = 1 AND u.COOL = 1');
              qry_Tree.SQL.Add(')');
            end;
          qry_Tree.SQL.Add(')');
        end;
//------RecordCat
      If frm_COOLSearchCross.cb_RecordCat.Text <> '' Then
        begin
          qry_Tree.SQL.Add('AND c.RecordCat = :RecordCat');
          qry_Tree.Parameters.ParamValues['RecordCat'] := frm_COOLSearchCross.cb_RecordCat.Text;
        end
      else
        begin
          qry_Tree.SQL.Add('AND (');

          qry_Tree.SQL.Add('(c.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseCOOL = 1 AND UseRecordCat = 0))');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(');

          qry_Tree.SQL.Add('(c.RecordType IN (SELECT Description FROM IndexDefinitions WHERE UseCOOL = 1 AND UseRecordCat = 1))');
          qry_Tree.SQL.Add('AND');
          qry_Tree.SQL.Add('(c.RecordCat IN (');
          qry_Tree.SQL.Add('      SELECT x.RecCatType');
          qry_Tree.SQL.Add('      FROM RecordCat x INNER JOIN RCRTRts r ON x.RecCatType = r.RecordCat');
          qry_Tree.SQL.Add('      WHERE r.RecordType = c.RecordType))');
          if not frm_Console.AccessSysAdmin then
            begin
              qry_Tree.SQL.Add('AND');
              qry_Tree.SQL.Add('(c.RecordCat IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = @UserId)');
              qry_Tree.SQL.Add(' OR');
              qry_Tree.SQL.Add(' c.RecordCat IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = @UserId))');
            end;

          qry_Tree.SQL.Add(')');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(c.RecordCat IS NULL)');
          qry_Tree.SQL.Add('OR');
          qry_Tree.SQL.Add('(c.RecordCat = '''')');

          qry_Tree.SQL.Add(')');
        end;
//----------------Filters------------
      qry_Tree.SQL.Add('AND(');
      ORFlag := false;
      J := 0;
      TempStr := frm_COOLSearchCross.edt_QueryStr.Text;
    //---
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          Inc(J);
          FieldName := qry_SQL.FieldbyName('FieldName').asString;
          If ORFlag Then
            begin
              If (frm_COOLSearchCross.chk_Partial.Checked) Then
                begin
                  qry_Tree.SQL.Add('OR c.[' + FieldName + '] LIKE :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := '%'+TempStr+'%';
                end
              else
                begin
                  qry_Tree.SQL.Add('OR c.[' + FieldName + '] = :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := TempStr;
                end;
            end
          else
            begin
              If (frm_COOLSearchCross.chk_Partial.Checked) Then
                begin
                  qry_Tree.SQL.Add('c.[' + FieldName + '] LIKE :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := '%'+TempStr+'%';
                end
              else
                begin
                  qry_Tree.SQL.Add('c.[' + FieldName + '] = :'+InttoStr(J));
                  qry_Tree.Parameters.ParamValues[InttoStr(J)] := TempStr;
                end;
              ORFlag := True;
            end;
          qry_SQL.Next;
        end;
      qry_Tree.SQL.Add(')');
//------------
      OriginalSQLText := qry_Tree.SQL.Text;

      OrderbyClause := 'ORDER BY ' + GroupList + SortList;
      qry_Tree.SQL.Add('ORDER BY ' + GroupList + SortList);

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
            For J := 1 to FieldTot + 4 Do
              begin
//===================Add Branch Node if Necessary===============================
                If StrtoIntDef(frm_COOLSearchCross.edt_BranchGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('Branch').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'Branch';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
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
                    ExpandedFlag := not(frm_COOLSearchCross.chk_BranchCollapse.Checked);
                  end;
//===================Add Dept Node if Necessary=================================
                If StrtoIntDef(frm_COOLSearchCross.edt_DeptGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('Department').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'Department';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
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
                    ExpandedFlag := not(frm_COOLSearchCross.chk_DeptCollapse.Checked);
                  end;
//===================Add RecordType Node if Necessary===========================
                If StrtoIntDef(frm_COOLSearchCross.edt_RecordTypeGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('RecordType').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'RecordType';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
                        FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('RecordType').AsString);;

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
                    ExpandedFlag := not(frm_COOLSearchCross.chk_RecordTypeCollapse.Checked);
                  end;
//===================Add RecordCat Node if Necessary===========================
                If StrtoIntDef(frm_COOLSearchCross.edt_RecordCatGroup.Text, 0) = J Then
                  begin
                    Inc(I);

                    TempStr := trim(qry_Tree.FieldbyName('RecordCat').AsString);
                    If (LastField[I] <> TempStr)or(ChangeFlag) Then
                      begin
                        ChangeFlag := True;
                        LastField[I] := TempStr;
                        New(FieldRecPtr);
                        FieldRecPtr^.RecordType := '';
                        FieldRecPtr^.FieldName := 'RecordCat';
                        FieldRecPtr^.NodeType := 'C'; //COOL Meta Data
                        FieldRecPtr^.ID := 0;
                        FieldRecPtr^.PKey := trim(qry_Tree.FieldbyName('RecordCat').AsString);

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
                    ExpandedFlag := not(frm_COOLSearchCross.chk_RecordCatCollapse.Checked);
                  end;
              end;
//========================Now Add Images========================================
            Inc(I);
            TempStr := trim(qry_Tree.FieldbyName('ID').AsString);
//---------------
            ImageIndex := 9;
//---------------
            LastField[I] := trim(qry_Tree.FieldbyName('ID').AsString);
            New(FieldRecPtr);
            FieldRecPtr^.RecordType := qry_Tree.FieldbyName('RecordType').AsString;
            FieldRecPtr^.FieldName := 'ID';
            FieldRecPtr^.NodeType := 'D'; //COOL Document
            FieldRecPtr^.ID := qry_Tree.FieldbyName('ID').asInteger;
            FieldRecPtr^.PKey := '';
            //-------Build Descr-----
            TempStr := '';
            qry_SQL.First;
            While not qry_SQL.EOF Do
              begin
                FieldName := qry_SQL.FieldByName('FieldName').AsString;

                If pos(FieldName, UpperCase(GroupList)) = 0 Then
                  If trim(qry_Tree.FieldbyName(FieldName).AsString) <> '' Then
                    TempStr := TempStr +  trim(qry_Tree.FieldbyName(FieldName).AsString)+', ';

                qry_SQL.Next;
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
    end;
end;

function Tfrm_COOL.ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir, zOper : array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, StrPCopy(zOper, 'open'),
                         StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
                         StrPCopy(zDir, DefaultDir), ShowCmd);
end;

procedure Tfrm_COOL.btn_ShellExecClick(Sender: TObject);
Var
  RecordType      :String;
  ID              :Integer;
  TempFilename    :String;
  tmp_fram_COOLImageViewer    :Tfram_COOLImageViewer;
begin
  If (tree_AllFold.Items.Count = 1) or (tree_AllFold.SelectionCount = 0) Then
    exit;

  If tree_AllFold.SelectionCount > 1 Then
    Messagedlg('You have multiple eRecords selected. Only the First eRecord will be Launched.', mtWarning, [mbOK], 0);

  RecordType := PFieldRec(tree_AllFold.Selected.Data)^.RecordType;
  ID := PFieldRec(tree_AllFold.Selected.Data)^.ID;

  If ID <= 0 Then
    exit;

  tmp_fram_COOLImageViewer    := Tfram_COOLImageViewer.Create(Nil);
  try
    tmp_fram_COOLImageViewer.GetDocuments(RecordType, ID);
    TempFilename := dm_Metrofiler.GetUniqueTempFile('COOL.tif');
    tmp_fram_COOLImageViewer.ImageViewer.IO.SaveToFile(TempFilename);
    dm_Metrofiler.TempDocuments.Add(TempFilename);
    ExecuteFile(TempFilename, '', 'c:\', SW_MAXIMIZE);
  finally
    tmp_fram_COOLImageViewer.Free;
  end;
end;

procedure Tfrm_COOL.btn_eMailClick(Sender: TObject);
Var
  RecordType      :String;
  ID, J           :Integer;
  TempFilename    :String;
  Node            :TTreeNode;
  tmp_fram_COOLImageViewer    :Tfram_COOLImageViewer;
  TStr            :String;
begin
  If (tree_AllFold.Items.Count = 1) or (tree_AllFold.SelectionCount = 0) Then
    exit;

  TStr := '';
  For J := 0 to tree_AllFold.SelectionCount-1 Do
    begin
      Node := tree_AllFold.Selections[J];

      RecordType := PFieldRec(Node.Data)^.RecordType;
      ID := PFieldRec(Node.Data)^.ID;

      If ID > 0 Then
        begin
          tmp_fram_COOLImageViewer    := Tfram_COOLImageViewer.Create(Nil);
          try
            tmp_fram_COOLImageViewer.GetDocuments(RecordType, ID);
            TempFilename := dm_Metrofiler.GetUniqueTempFile('COOL.tif');
            tmp_fram_COOLImageViewer.ImageViewer.IO.SaveToFile(TempFilename);
            TStr := TStr + TempFilename+';';
            dm_Metrofiler.TempDocuments.Add(TempFilename);
          finally
            tmp_fram_COOLImageViewer.Free;
          end;
        end;
    end;
  SendFile(TStr);
end;

procedure Tfrm_COOL.SendFile(attached: String);
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

procedure Tfrm_COOL.qry_SearchAfterClose(DataSet: TDataSet);
Var
  J, ComponentTot  :Integer;
begin
  ComponentTot := scrl_IndexInfoBox.ComponentCount;
  For J := ComponentTot - 1 downto 0 Do
    scrl_IndexInfoBox.Components[J].Free;

 LastDocumentDisplayed := 0;
end;

procedure Tfrm_COOL.tree_AllFoldMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If Shift = [ssLeft] Then
    IF tree_AllFold.GetNodeAt(X, Y) <> Nil Then
      begin
        tree_AllFold.ClearSelection(False);
        tree_AllFold.GetNodeAt(X, Y).Selected := True;
      end;
end;

function Tfrm_COOL.SaveView(Zoom :Single; X, Y  :Integer):Boolean;
begin
  SavedX := X;
  SavedY := Y;
  SavedZoom := Zoom;
  Result := True;
end;

procedure Tfrm_COOL.LauncheRecord1Click(Sender: TObject);
Var
  CurrFilenames   :TStringList;
begin
  If Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).GetFilenames(CurrFilenames);
        CurrFilenames.Strings[0];
        Messagedlg('You have multiple eRecords selected. Only the First eRecord will be Launched.', mtWarning, [mbOK], 0);
        ExecuteFile(CurrFilenames.Strings[0], '', 'c:\', SW_MAXIMIZE);
      finally
        CurrFilenames.Free;
      end;
    end
  else ExecuteFile(CurrFileName, '', 'c:\', SW_MAXIMIZE);
end;

function Tfrm_COOL.LoadView(VAR Zoom :Single; VAR X, Y  :Integer):Boolean;
begin
  X := SavedX;
  Y := SavedY;
  Zoom := SavedZoom;
  Result := True;
end;

procedure Tfrm_COOL.DisplayThumbnail(tImageNo  :Integer);
Var
  J  :Integer;
  TreeNode   :TTreeNode;
begin
  For J := 1 to tree_AllFold.Items.Count-1 Do
    begin
      TreeNode := tree_AllFold.Items.Item[J];
      If PFieldRec(TreeNode.Data)^.NodeType = 'D' Then
        If PFieldRec(TreeNode.Data)^.ID = tImageNo Then
          begin
            tree_AllFolD.ClearSelection(False);
            tree_AllFolD.Selected := TreeNode;
            break;
          end;
    end;
end;

procedure Tfrm_COOL.eMailImage1Click(Sender: TObject);
Var
  CurrFilenames   :TStringList;
  J               :Integer;
  TStr            :String;
begin
  If Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')) <> Nil Then
    begin
      CurrFilenames   := TStringList.Create;
      try
        CurrFilenames.Clear;
        Tfram_COOLThumbnails(Scroll_ImageViewer.FindComponent('fram_COOLThumbnails1')).GetFilenames(CurrFilenames);
        For J := 0 to CurrFilenames.Count-1 Do
          TStr := TStr + CurrFilenames.Strings[J]+';';
        SendFile(TStr);
      finally
        CurrFilenames.Free;
      end;
    end
  else SendFile(CurrFileName);
end;

procedure Tfrm_COOL.tree_AllFoldExpanded(Sender: TObject;
  Node: TTreeNode);
Var
  TreeNode   :TTreeNode;
begin
  TreeNode := Node.getFirstChild;
  TreeNode.Selected := True;
end;

end.


