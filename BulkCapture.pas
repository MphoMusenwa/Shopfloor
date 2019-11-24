unit BulkCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Mask, DB, ADODB,
  FramImageViewer, framHTMLViewer, framRichEditViewer,
  OleCtnrs, Grids, DBGrids;

type
  PositionRecord = Record
    FieldName :String;
    ScrollXPos :Integer;
    ScrollYPos :Integer;
    ZoomRatio  :Single;
  end;
  FilesLookupRecord = Record
    ColumnHeading   :String[50];
    Item            :String[50];
  end;
  Tfrm_BulkCapture = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    FileNavigator: TDBNavigator;
    PageControl1: TPageControl;
    tb_Select: TTabSheet;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    edt_BulkImportNo: TEdit;
    btn_Next1: TBitBtn;
    pnl_Capture: TPanel;
    Label5: TLabel;
    lbl_RecordCat: TLabel;
    Label7: TLabel;
    nav_eRecEdit: TDBNavigator;
    edt_RecordCat: TDBEdit;
    btn_RecordCat: TButton;
    scbar_metadata: TScrollBox;
    pnl_Text1: TPanel;
    txt_Text1: TDBText;
    SpeedButton1: TSpeedButton;
    edt_Text1: TDBEdit;
    pnl_Text2: TPanel;
    txt_Text2: TDBText;
    SpeedButton2: TSpeedButton;
    edt_Text2: TDBEdit;
    pnl_Text3: TPanel;
    txt_Text3: TDBText;
    SpeedButton3: TSpeedButton;
    edt_Text3: TDBEdit;
    pnl_Text4: TPanel;
    txt_Text4: TDBText;
    SpeedButton4: TSpeedButton;
    edt_Text4: TDBEdit;
    pnl_Text5: TPanel;
    txt_Text5: TDBText;
    SpeedButton5: TSpeedButton;
    edt_Text5: TDBEdit;
    pnl_Text6: TPanel;
    txt_Text6: TDBText;
    SpeedButton6: TSpeedButton;
    edt_Text6: TDBEdit;
    pnl_Text7: TPanel;
    txt_Text7: TDBText;
    SpeedButton7: TSpeedButton;
    edt_Text7: TDBEdit;
    pnl_Text8: TPanel;
    txt_Text8: TDBText;
    SpeedButton8: TSpeedButton;
    edt_Text8: TDBEdit;
    pnl_Text9: TPanel;
    txt_Text9: TDBText;
    SpeedButton9: TSpeedButton;
    edt_Text9: TDBEdit;
    pnl_Text10: TPanel;
    txt_Text10: TDBText;
    SpeedButton10: TSpeedButton;
    edt_Text10: TDBEdit;
    pnl_Date1: TPanel;
    txt_Date1: TDBText;
    lbl_DateFormat1: TLabel;
    SpeedButton11: TSpeedButton;
    edt_Date1: TDBEdit;
    pnl_Date2: TPanel;
    txt_Date2: TDBText;
    lbl_DateFormat2: TLabel;
    SpeedButton12: TSpeedButton;
    edt_Date2: TDBEdit;
    pnl_Date3: TPanel;
    txt_Date3: TDBText;
    lbl_DateFormat3: TLabel;
    SpeedButton13: TSpeedButton;
    edt_Date3: TDBEdit;
    pnl_Num1: TPanel;
    txt_Num1: TDBText;
    SpeedButton14: TSpeedButton;
    edt_Num1: TDBEdit;
    pnl_Num2: TPanel;
    txt_Num2: TDBText;
    SpeedButton15: TSpeedButton;
    edt_Num2: TDBEdit;
    edt_eRecNo: TDBEdit;
    edt_CaptureDate: TDBEdit;
    Splitter1: TSplitter;
    qry_eRecords: TADOQuery;
    dts_eRecords: TDataSource;
    Label2: TLabel;
    edt_RecordType: TDBEdit;
    qry_eRecImages: TADOQuery;
    Scroll_ImageViewer: TScrollBox;
    qry_SQL: TADOQuery;
    chk_Text1: TCheckBox;
    chk_Text2: TCheckBox;
    chk_Text3: TCheckBox;
    chk_Text4: TCheckBox;
    chk_Text5: TCheckBox;
    chk_Text6: TCheckBox;
    chk_Text7: TCheckBox;
    chk_Text8: TCheckBox;
    chk_Text9: TCheckBox;
    chk_Text10: TCheckBox;
    chk_Date1: TCheckBox;
    chk_Date2: TCheckBox;
    chk_Date3: TCheckBox;
    chk_Num1: TCheckBox;
    chk_Num2: TCheckBox;
    btn_Attach: TSpeedButton;
    Timer1: TTimer;
    lbl_Progress: TLabel;
    btnMatch: TSpeedButton;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    qry_ReviewList: TADOQuery;
    dts_ReviewList: TDataSource;
    btn_RRTypeCap: TButton;
    Label29: TLabel;
    Label16: TLabel;
    lbl_RBranchSrc: TLabel;
    lbl_RDeptSrc: TLabel;
    edt_RBranchCap: TDBEdit;
    btn_RBranchCap: TButton;
    edt_RDeptCap: TDBEdit;
    btn_RDeptCap: TButton;
    btn_ReClassify: TSpeedButton;
    procedure btn_Next1Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_RecordTypeChange(Sender: TObject);
    procedure btn_RecordCatClick(Sender: TObject);
    procedure qry_eRecordsAfterScroll(DataSet: TDataSet);
    procedure qry_eRecImagesAfterOpen(DataSet: TDataSet);
    procedure qry_eRecImagesAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edt_Text1Enter(Sender: TObject);
    procedure edt_Text1Exit(Sender: TObject);
    procedure edt_Text1KeyPress(Sender: TObject; var Key: Char);
    procedure edt_Text1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qry_eRecordsBeforePost(DataSet: TDataSet);
    procedure qry_eRecordsAfterEdit(DataSet: TDataSet);
    procedure dts_eRecordsDataChange(Sender: TObject; Field: TField);
    procedure chk_Text1Click(Sender: TObject);
    procedure btn_AttachClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qry_eRecordsAfterOpen(DataSet: TDataSet);
    procedure btnMatchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btn_RRTypeCapClick(Sender: TObject);
    procedure btn_RBranchCapClick(Sender: TObject);
    procedure btn_RDeptCapClick(Sender: TObject);
    procedure qry_eRecordsAfterPost(DataSet: TDataSet);
    procedure btn_ReClassifyClick(Sender: TObject);
  private
    { Private declarations }
    NoVerifyFlag          :Boolean;
    LastDBEdit                   :String;
    FirstDBEdit                  :String;
    PrevDBEdit                   :String;
    NowDBEdit                    :String;
    FileLookups                  :Array of FilesLookupRecord;
    ImagePositions               :Array of PositionRecord;
    CurrFileName                 :String;
    pRecordCat                   :String;
    CopyFlag                     :Boolean;
    TotalRecords                 :Integer;
    procedure HideFields;
    procedure RefreshFields(Dataset: TDataset);
    procedure PopulateeRecordImageList(eRecordNo :Integer);
    function GetOLEDocuments(ImageNo :Integer):Boolean;
    procedure UpdateImgPos(FieldName :String);
    procedure SaveImgPos(FieldName :String);
    procedure DisplayReviewList;
  public
    { Public declarations }
  end;

var
  frm_BulkCapture: Tfrm_BulkCapture;

implementation

USES MetrofilerDataModule, DataModCap, main, SelRCat, RecordLookup, DataVer,
  MetroImp, SelRType, SelBranch, SelDept, BulkCaptureReCapture;

{$R *.dfm}

procedure Tfrm_BulkCapture.RefreshFields(Dataset  :TDataset);
Var
  J, A   :Integer;
  T      :Integer;
begin
  T  := 3;
  A  := 0;
  For J := 1 to 15 Do
    begin
      If trim(Dataset.FieldByName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          If (J >= 1)and(J <= 10) Then
            begin
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Top := T;
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Visible := True;

              If FirstDBEdit = '' Then
                FirstDBEdit := TDBEdit(FindComponent('edt_Text'+InttoStr(J))).Name;

              A := J;
            end
          else If (J >= 11)and(J <= 13) Then
            begin
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Top := T;
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Visible := True;

              If FirstDBEdit = '' Then
                FirstDBEdit := TDBEdit(FindComponent('edt_Date'+InttoStr(J-10))).Name;

              A := J;
            end
          else If (J >= 14)and(J <= 15) Then
            begin
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Top := T;
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Visible := True;

              If FirstDBEdit = '' Then
                FirstDBEdit := TDBEdit(FindComponent('edt_Num'+InttoStr(J-13))).Name;

              A := J;
            end;
          Inc(T, 35);
        end;
    end;
  If (A >= 1)and(A <= 10) Then
    LastDBEdit := TDBEdit(FindComponent('edt_Text'+InttoStr(A))).Name;
  If (A >= 11)and(A <= 13) Then
    LastDBEdit := TDBEdit(FindComponent('edt_Date'+InttoStr(A-10))).Name;
  If (A >= 14)and(A <= 15) Then
    LastDBEdit := TDBEdit(FindComponent('edt_Num'+InttoStr(A-13))).Name;

  PrevDBEdit := FirstDBEdit;
end;

procedure Tfrm_BulkCapture.SpeedButton1Click(Sender: TObject);
Var
  TagNo       :Integer;
begin
  TagNo := TSpeedbutton(Sender).Tag;

  If (TagNo >= 1)and(TagNo <= 10) Then
    begin
      If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
      If TDBEdit(FindComponent('edt_Text'+InttoStr(TagNo))) <> Nil Then
        SaveImgPos(TDBEdit(FindComponent('edt_Text'+InttoStr(TagNo))).DataField);
    end;
//------
  If (TagNo >= 11)and(TagNo <= 13) Then
    begin
      If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
      If TDBEdit(FindComponent('edt_Date'+InttoStr(TagNo-10))) <> Nil Then
        SaveImgPos(TDBEdit(FindComponent('edt_Date'+InttoStr(TagNo-10))).DataField);
    end;
//------
  If (TagNo >= 14)and(TagNo <= 15) Then
    begin
      If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
      If TDBEdit(FindComponent('edt_Num'+InttoStr(TagNo-13))) <> Nil Then
        SaveImgPos(TDBEdit(FindComponent('edt_Num'+InttoStr(TagNo-13))).DataField);
    end;
end;

procedure Tfrm_BulkCapture.btnMatchClick(Sender: TObject);
begin
  If edt_RecordType.Text = '' Then
    exit;

  frm_DataImpMatch.Execute(edt_RecordType.Text);
  if not(qry_eRecords.State in dsEditModes) then
    qry_eRecords.edit;

  NoVerifyFlag := True;
  try
    qry_eRecords['Text1'] := frm_DataImpMatch.Text1;
    qry_eRecords['Text2'] := frm_DataImpMatch.Text2;
    qry_eRecords['Text3'] := frm_DataImpMatch.Text3;
    qry_eRecords['Text4'] := frm_DataImpMatch.Text4;
    qry_eRecords['Text5'] := frm_DataImpMatch.Text5;
    qry_eRecords['Text6'] := frm_DataImpMatch.Text6;
    qry_eRecords['Text7'] := frm_DataImpMatch.Text7;
    qry_eRecords['Text8'] := frm_DataImpMatch.Text8;
    qry_eRecords['Text9'] := frm_DataImpMatch.Text9;
    qry_eRecords['Text10'] := frm_DataImpMatch.Text10;

    qry_eRecords['Date1'] := frm_DataImpMatch.Date1;
    qry_eRecords['Date2'] := frm_DataImpMatch.Date2;
    qry_eRecords['Date3'] := frm_DataImpMatch.Date3;

    qry_eRecords['Number1'] := frm_DataImpMatch.Number1;
    qry_eRecords['Number2'] := frm_DataImpMatch.Number2;
  finally
    NoVerifyFlag := False;
  end;
end;

procedure Tfrm_BulkCapture.btn_AttachClick(Sender: TObject);
Var
  J    :Integer;
  CHKControlName  :String;
  PrevValues   :Array[1..100] of String[255];
  FieldName    :String;
begin
  CopyFlag := True;
  try
//-----------
    If qry_eRecords.State IN dsEditModes Then
      qry_eRecords.Post;
//-----------
    For J := 0 to qry_eRecords.Fields.Count-1 Do
      begin
        FieldName := UPPERCASE(TRIM(qry_eRecords.Fields[J].FieldName));
//----------
        If FieldName = 'TEXT1' Then
          FieldName := 'Col1'
        else if FieldName = 'TEXT2' Then
          FieldName := 'Col2'
        else if FieldName = 'TEXT3' Then
          FieldName := 'Col3'
        else if FieldName = 'TEXT4' Then
          FieldName := 'Col4'
        else if FieldName = 'TEXT5' Then
          FieldName := 'Col5'
        else if FieldName = 'TEXT6' Then
          FieldName := 'Col6'
        else if FieldName = 'TEXT7' Then
          FieldName := 'Col7'
        else if FieldName = 'TEXT8' Then
          FieldName := 'Col8'
        else if FieldName = 'TEXT9' Then
          FieldName := 'Col9'
        else if FieldName = 'TEXT10' Then
          FieldName := 'Col10'
        else if FieldName = 'DATE1' Then
          FieldName := 'Col11'
        else if FieldName = 'DATE2' Then
          FieldName := 'Col12'
        else if FieldName = 'DATE3' Then
          FieldName := 'Col13'
        else if FieldName = 'NUMBER1' Then
          FieldName := 'Col14'
        else if FieldName = 'NUMBER2' Then
          FieldName := 'Col15'
        else FieldName := '';
      end;
//-----------
    For J := 0 to qry_eRecords.Fields.Count-1 Do
      begin
        FieldName := UPPERCASE(TRIM(qry_eRecords.Fields[J].FieldName));
//----------
        If (FieldName = 'TEXT1')OR
           (FieldName = 'TEXT2')OR
           (FieldName = 'TEXT3')OR
           (FieldName = 'TEXT4')OR
           (FieldName = 'TEXT5')OR
           (FieldName = 'TEXT6')OR
           (FieldName = 'TEXT7')OR
           (FieldName = 'TEXT8')OR
           (FieldName = 'TEXT9')OR
           (FieldName = 'TEXT10')OR
           (FieldName = 'DATE1')OR
           (FieldName = 'DATE2')OR
           (FieldName = 'DATE3')OR
           (FieldName = 'NUMBER1')OR
           (FieldName = 'NUMBER2')Then
           begin
             PrevValues[J] := qry_eRecords.Fields[J].AsString;
           end;
      end;
//-----------
    If not qry_eRecords.EOF Then
      begin
        qry_eRecords.next;
        qry_eRecords.edit;
//---------
        For J := 0 to qry_eRecords.Fields.Count-1 Do
          begin
            FieldName := UPPERCASE(TRIM(qry_eRecords.Fields[J].FieldName));
            //----------
            If (FieldName = 'TEXT1')OR
               (FieldName = 'TEXT2')OR
               (FieldName = 'TEXT3')OR
               (FieldName = 'TEXT4')OR
               (FieldName = 'TEXT5')OR
               (FieldName = 'TEXT6')OR
               (FieldName = 'TEXT7')OR
               (FieldName = 'TEXT8')OR
               (FieldName = 'TEXT9')OR
               (FieldName = 'TEXT10')OR
               (FieldName = 'DATE1')OR
               (FieldName = 'DATE2')OR
               (FieldName = 'DATE3')OR
               (FieldName = 'NUMBER1')OR
               (FieldName = 'NUMBER2')Then
              begin
                If PrevValues[J] <> '' Then
                   qry_eRecords.Fields[J].Value := PrevValues[J];
              end;
          end;
//------------
        if (NowDBEdit <> '') then
          begin
            TDBEdit(FindComponent(NowDBEdit)).SetFocus;
            TDBEdit(FindComponent(NowDBEdit)).SelectAll;
          end;
//--------------                    
        If qry_eRecords.EOF Then
          ShowMessage('Last Image Captured!!');
      end;
  finally
    CopyFlag := False;
  end;
end;

procedure Tfrm_BulkCapture.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BulkCapture.btn_Next1Click(Sender: TObject);
var
  NeRec   :Integer;
begin
  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
  qry_eRecords.SQL.Add('SELECT * FROM eRecords WHERE ImportBatchNo = '+edt_BulkImportNo.Text+' ORDER BY eRecNo');
  qry_eRecords.Open;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT eRecNo FROM eRecords WHERE ImportBatchNo = '+edt_BulkImportNo.Text);
  qry_SQL.SQL.Add('AND CapBy IS NULL');
  qry_SQL.SQL.Add('ORDER BY eRecNo');
  qry_SQL.Open;
  If not qry_SQL.isEmpty Then
    begin
      NeRec := qry_SQL.Fields[0].asInteger;
      qry_eRecords.Locate('eRecNo', NeRec, []);
    end;
  qry_SQL.Close;

  PageControl1.ActivePage := Tabsheet2;
  PageControl1cHANGE(Self);
end;

procedure Tfrm_BulkCapture.btn_RBranchCapClick(Sender: TObject);
begin
  If not(qry_eRecords.State in [dsInsert,dsEdit]) Then
    begin
      Messagedlg('Please Insert/Edit a record before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      qry_eRecords['Branch'] := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      qry_eRecords['Department'] := '';
      qry_eRecords['RecordType'] := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_BulkCapture.btn_RDeptCapClick(Sender: TObject);
begin
  If not(qry_eRecords.State in [dsInsert,dsEdit])Then
    begin
      Messagedlg('Please Insert/Edit this record before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(qry_eRecords.FieldbyName('BRANCH').asString) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(qry_eRecords.FieldbyName('BRANCH').asString, User) = mrOK Then
    begin
      qry_eRecords['Department'] := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      qry_eRecords['RecordType'] := '';
      lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_BulkCapture.btn_ReClassifyClick(Sender: TObject);
begin
  If not(qry_eRecords.State in [dsInsert,dsEdit]) Then
    begin
      Messagedlg('Please Insert/Edit a record first.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_BulkCaptureReclassify.Execute(User,
                                       qry_eRecords.FieldbyName('Branch').asString,
                                       qry_eRecords.FieldbyName('Department').asString,
                                       qry_eRecords.FieldbyName('RecordType').asString,
                                       qry_eRecords.FieldbyName('RecordCat').asString) = mrOK Then
    begin
      qry_eRecords['Branch'] := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('Branch').asString;
      lbl_RBranchSrc.Caption := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('BranchName').asString;
      qry_eRecords['Department'] := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('Department').asString;
      lbl_RDeptSrc.Caption := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('DeptName').asString;
      qry_eRecords['RecordType'] := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('RecordType').asString;
      qry_eRecords['RecordCat'] := frm_BulkCaptureReclassify.qry_Classify.FieldbyName('RecordCat').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_BulkCapture.btn_RecordCatClick(Sender: TObject);
begin
  If not(qry_eRecords.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this record before selecting a Record category!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  frm_SelRCat.ShowGen := False;
  frm_SelRCat.qry_RCat.Close;
  frm_SelRCat.qry_RCat.Parameters.ParamByName('mRecType').Value := trim(edt_RecordType.Text);
  frm_SelRCat.qry_RCat.Open;
  If frm_SelRCat.ShowModal = mrOK Then
      qry_eRecords['RecordCat'] := frm_SelRCat.qry_RCat.FieldbyName('RecordCat').asString;
  frm_SelRCat.qry_RCat.Close;
end;

procedure Tfrm_BulkCapture.btn_RRTypeCapClick(Sender: TObject);
begin
  If not(qry_eRecords.State in [dsInsert,dsEdit])Then
    begin
      Messagedlg('Please Insert/Edit this record before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(qry_eRecords.FieldbyName('DEPARTMENT').asString) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          qry_eRecords.FieldbyName('BRANCH').asString,
                          qry_eRecords.FieldbyName('DEPARTMENT').asString,
                          User,
                          False,
                          False,
                          False,
                          True,
                          False) = mrOK Then
    begin
      qry_eRecords['RecordType'] := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_BulkCapture.chk_Text1Click(Sender: TObject);
Var
  chk       :TCheckBox;
  chkName   :String;
begin
  exit;

  chk := TCheckBox(Sender);
  chkName := chk.Name;

  if chk.Checked then
    begin
      if chkName = 'chk_Text1' then chk.Hint := edt_Text1.Text;
      if chkName = 'chk_Text2' then chk.Hint := edt_Text2.Text;
      if chkName = 'chk_Text3' then chk.Hint := edt_Text3.Text;
      if chkName = 'chk_Text4' then chk.Hint := edt_Text4.Text;
      if chkName = 'chk_Text5' then chk.Hint := edt_Text5.Text;
      if chkName = 'chk_Text6' then chk.Hint := edt_Text6.Text;
      if chkName = 'chk_Text7' then chk.Hint := edt_Text7.Text;
      if chkName = 'chk_Text8' then chk.Hint := edt_Text8.Text;
      if chkName = 'chk_Text9' then chk.Hint := edt_Text9.Text;
      if chkName = 'chk_Text10' then chk.Hint := edt_Text10.Text;

      if chkName = 'chk_Date1' then chk.Hint := edt_Date1.Text;
      if chkName = 'chk_Date2' then chk.Hint := edt_Date2.Text;
      if chkName = 'chk_Date3' then chk.Hint := edt_Date3.Text;

      if chkName = 'chk_Num1' then chk.Hint := edt_Num1.Text;
      if chkName = 'chk_Num2' then chk.Hint := edt_Num2.Text;
    end
  else chk.Hint := '';  
end;

procedure Tfrm_BulkCapture.dts_eRecordsDataChange(Sender: TObject;
  Field: TField);
Var
  FieldName, MatchFieldName, CheckStr, TStr  :String;
  C, J :Integer;
  LocalP, ScreenP: TPoint;
  DBEdit            :TDBEdit;
begin
  If copyFlag Then
    exit;

  If qry_eRecords.State IN dsEditModes Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'TEXT1' Then
            FieldName := 'Col1'
          else if FieldName = 'TEXT2' Then
            FieldName := 'Col2'
          else if FieldName = 'TEXT3' Then
            FieldName := 'Col3'
          else if FieldName = 'TEXT4' Then
            FieldName := 'Col4'
          else if FieldName = 'TEXT5' Then
            FieldName := 'Col5'
          else if FieldName = 'TEXT6' Then
            FieldName := 'Col6'
          else if FieldName = 'TEXT7' Then
            FieldName := 'Col7'
          else if FieldName = 'TEXT8' Then
            FieldName := 'Col8'
          else if FieldName = 'TEXT9' Then
            FieldName := 'Col9'
          else if FieldName = 'TEXT10' Then
            FieldName := 'Col10'
          else if FieldName = 'DATE1' Then
            FieldName := 'Col11'
          else if FieldName = 'DATE2' Then
            FieldName := 'Col12'
          else if FieldName = 'DATE3' Then
            FieldName := 'Col13'
          else if FieldName = 'NUMBER1' Then
            FieldName := 'Col14'
          else if FieldName = 'NUMBER2' Then
            FieldName := 'Col15'
          else FieldName := '';
//---------------
          MatchFieldName := DatModCap.GetAlias(FieldName);
//---------------
          If FieldName = 'Col1' Then
            DBEdit := edt_Text1
          else if FieldName = 'Col2' Then
            DBEdit := edt_Text2
          else if FieldName = 'Col3' Then
            DBEdit := edt_Text3
          else if FieldName = 'Col4' Then
            DBEdit := edt_Text4
          else if FieldName = 'Col5' Then
            DBEdit := edt_Text5
          else if FieldName = 'Col6' Then
            DBEdit := edt_Text6
          else if FieldName = 'Col7' Then
            DBEdit := edt_Text7
          else if FieldName = 'Col8' Then
            DBEdit := edt_Text8
          else if FieldName = 'Col9' Then
            DBEdit := edt_Text9
          else if FieldName = 'Col10' Then
            DBEdit := edt_Text10
          else if FieldName = 'Col11' Then
            DBEdit := edt_Date1
          else if FieldName = 'Col12' Then
            DBEdit := edt_Date2
          else if FieldName = 'Col13' Then
            DBEdit := edt_Date3
          else if FieldName = 'Col14' Then
            DBEdit := edt_Num1
          else if FieldName = 'Col15' Then
            DBEdit := edt_Num2;
//---------------
          If FieldName <> '' Then
            begin
              If NOT(NoVerifyFlag) and DatmodCap.CheckIfVerified(FieldName) Then
                begin
                  If Field.AsString = '' Then
                    exit;

                  CheckStr := '';
                  LocalP.X := DBEdit.Left-2;
                  LocalP.Y := DBEdit.Top-13;
                  ScreenP := DBEdit.ClientToScreen(LocalP);
                  frm_DataVer.Top := Screenp.Y;
                  frm_DataVer.Left := ScreenP.X;
                  frm_DataVer.Width := DBEdit.Width;
                  frm_DataVer.Height := DBEdit.Height;
                  frm_DataVer.VerifyText :=  Field.AsString;
                  If frm_DataVer.Execute <> mrOK Then
                    begin
                      Abort;
                      exit;
                    end;
                end;
              If DatModCap.CheckIfMatch(MatchFieldName) Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM IndexDefsMatch WHERE Description = :DS AND ['+Field.FieldName+'] = :Match');
                  qry_SQL.Parameters.ParamValues['DS'] := qry_eRecords.FieldByName('RECORDTYPE').AsString;
                  qry_SQL.Parameters.ParamValues['Match'] := Field.Value;
                  qry_SQL.Open;
                  If not qry_SQL.IsEmpty Then
                    begin
                      For J := 1 to 10 Do
                        begin
                          If (('TEXT'+InttoStr(J)) <> UpperCase(Field.FieldName))and(TCheckBox(FindComponent('chk_Text'+InttoStr(J))).Checked = False) Then
                            qry_eRecords['TEXT'+InttoStr(J)] := qry_SQL.FieldByName('TEXT'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 3 Do
                        begin
                          If (('DATE'+InttoStr(J)) <> UpperCase(Field.FieldName))and(TCheckBox(FindComponent('chk_Date'+InttoStr(J))).Checked = False) Then
                            qry_eRecords['DATE'+InttoStr(J)] := qry_SQL.FieldByName('DATE'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 2 Do
                        begin
                          If (('NUMBER'+InttoStr(J)) <> UpperCase(Field.FieldName))and(TCheckBox(FindComponent('chk_Date'+InttoStr(J))).Checked = False) Then
                            qry_eRecords['NUMBER'+InttoStr(J)] := qry_SQL.FieldByName('NUMBER'+InttoStr(J)).Value;
                        end;
                   end;
                  qry_SQL.Close;
                end;
            end;
        end;
    end;
end;

procedure Tfrm_BulkCapture.edt_RecordTypeChange(Sender: TObject);
Var
  J :Integer;
  sType, sHead   :String;
begin
  HideFields;
  If length(qry_eRecords.FieldbyName('RecordType').asString) = 0 then
    begin
      exit;
    end;
  With DatmodCap do
    begin
      qry_FileType.Close;
      qry_FileType.SQL.Clear;
      qry_FileType.SQL.Add('select * from IndexDefinitions where Description = '+QuotedStr(qry_eRecords.FieldbyName('RecordType').asString));
      qry_FileType.Open;
//----------
      SetLength(FieldProperties, 0);
      For J := 1 to 15 Do
        begin
          If trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
            begin
              SetLength(FieldProperties, Length(FieldProperties)+1);
              FieldProperties[length(FieldProperties)-1].FieldName := 'Col'+InttoStr(J);
              FieldProperties[length(FieldProperties)-1].Alias := trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString);
              FieldProperties[length(FieldProperties)-1].UpperCase := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Upp').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Verify := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Ver').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Required := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Req').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Validate := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Val').asInteger = 1);
            end;
        end;
      IndexDefMatchCol := trim(qry_FileType.FieldByName('IndexMatchCol').asString);
//----------
      RefreshFields(qry_FileType);
//----------
      if qry_FileType.FieldByName('UseRecordCat').AsBoolean then
        begin
          lbl_RecordCat.Visible := True;
          edt_RecordCat.Visible := True;
          btn_RecordCat.Visible := True;
        end
      else
        begin
          lbl_RecordCat.Visible := False;
          edt_RecordCat.Visible := False;
          btn_RecordCat.Visible := False;
        end;
//----------
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT TOP 10000 ColumnHeading, Item FROM IndexDefsLookups');
      qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(qry_eRecords.FieldbyName('RecordType').asString));
      qry_SQL.SQL.Add('ORDER BY ColumnHeading, Item');
      qry_SQL.Open;
      qry_SQL.First;
      SetLength(FileLookups, 0);
      J := 0;
      While not qry_SQL.EOF Do
        begin
          Inc(J);
          SetLength(FileLookups, J);
          FileLookups[J-1].ColumnHeading := trim(qry_SQL.FieldbyName('ColumnHeading').asString);

          sType := UpperCase(trim(qry_SQL.FieldbyName('ColumnHeading').asString));

          If sType = 'TEXT1' Then sHead := 'Col1';
          If sType = 'TEXT2' Then sHead := 'Col2';
          If sType = 'TEXT3' Then sHead := 'Col3';
          If sType = 'TEXT4' Then sHead := 'Col4';
          If sType = 'TEXT5' Then sHead := 'Col5';
          If sType = 'TEXT6' Then sHead := 'Col6';
          If sType = 'TEXT7' Then sHead := 'Col7';
          If sType = 'TEXT8' Then sHead := 'Col8';
          If sType = 'TEXT9' Then sHead := 'Col9';
          If sType = 'TEXT10' Then sHead := 'Col10';
    //-------
          If sType = 'DATE1' Then sHead := 'Col11';
          If sType = 'DATE2' Then sHead := 'Col12';
          If sType = 'DATE3' Then sHead := 'Col13';
    //-------
          If sType = 'NUMBER1' Then sHead := 'Col14';
          If sType = 'NUMBER2' Then sHead := 'Col15';

          If CheckIfUpperCase(sHead) Then
            FileLookups[J-1].Item := UpperCase(trim(qry_SQL.FieldbyName('Item').asString))
          else FileLookups[J-1].Item := trim(qry_SQL.FieldbyName('Item').asString);
          qry_SQL.Next;
        end;
      qry_SQL.Close;
    end;
end;

procedure Tfrm_BulkCapture.edt_Text1Enter(Sender: TObject);
begin
  NowDBEdit := TDBEdit(Sender).Name;
  If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
    UpdateImgPos(TDBEdit(Sender).DataField);

  If NowDBEdit = FirstDBEdit Then
    scbar_metadata.ScrollInView(txt_Text1);
end;

procedure Tfrm_BulkCapture.edt_Text1Exit(Sender: TObject);
begin
  PrevDBEdit := TDBEdit(Sender).Name;
end;

procedure Tfrm_BulkCapture.edt_Text1KeyPress(Sender: TObject; var Key: Char);
Var
  S, FieldName :String;
begin
  If Key = #27 Then
    Abort;
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT1')Then
    FieldName := 'Col1';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT2')Then
    FieldName := 'Col2';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT3')Then
    FieldName := 'Col3';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT4')Then
    FieldName := 'Col4';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT5')Then
    FieldName := 'Col5';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT6')Then
    FieldName := 'Col6';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT7')Then
    FieldName := 'Col7';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT8')Then
    FieldName := 'Col8';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT9')Then
    FieldName := 'Col9';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT10')Then
    FieldName := 'Col10';
//-----
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE1')Then
    FieldName := 'Col11';
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE2')Then
    FieldName := 'Col12';
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE3')Then
    FieldName := 'Col13';
//-----
  If (UpperCase(TDBEdit(Sender).DataField) = 'NUMBER1')Then
    FieldName := 'Col14';
  If (UpperCase(TDBEdit(Sender).DataField) = 'NUMBER2')Then
    FieldName := 'Col15';
//==============
  If DatModCap.CheckIfUpperCase(trim(FieldName)) Then
    If (ord(Key) >= 97)and(ord(Key) <= 122) Then
      begin
        S := uppercase(Key);
        Key := S[1];
      end;
end;

procedure Tfrm_BulkCapture.edt_Text1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  spDBEdit          :TDBEdit;
  sHead, SType             :String;
  p, i              :Integer;
  theText           :String;
  FillInText        :String;
begin
  case key of
    8, 13, 46, 37..39: ;
    27 : Abort;
    9 : begin
          If (TDBEdit(Sender).Name = FirstDBEdit)AND
             (TDBEdit(Sender).Name = LastDBEdit)Then
            begin
              If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
                SaveImgPos(TDBEdit(Sender).DataField);

              If qry_eRecords.State in dsEditModes Then
                qry_eRecords.Post;

              qry_eRecords.Next;
              qry_eRecords.edit;
              TDBEdit(Sender).SetFocus;
              //-----------Display Image if necesary
              If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
                UpdateImgPos(TDBEdit(Sender).DataField);
            end
          else If TDBEdit(Sender).Name = FirstDBEdit Then
            begin
              If (PrevDBEdit = LastDbEdit)and(Shift = []) Then
                begin
                  If qry_eRecords.State in dsEditModes Then
                    qry_eRecords.Post;

                  If not qry_eRecords.EOF Then
                    begin
                      qry_eRecords.Next;
                      qry_eRecords.edit;
                      TDBEdit(Sender).SetFocus;
                    end;
                    //-----------Display Image if necesary
                  If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
                    UpdateImgPos(TDBEdit(Sender).DataField);
                end
            end;
        end;
    40: begin
          If (Shift = [ssAlt]) Then
            begin
              spDBEdit := Sender as TDBEdit;
              sType := UPPERCASE(spDBEdit.DataField);
              If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
              If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
              If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
              If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
              If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
              If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
              If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
              If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
              If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
              If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
        //-------
              If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
              If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
              If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
        //-------
              If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
              If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;
        //--------
              frm_RecordLookup.Editable := False;
              If frm_RecordLookup.Execute(sHead, sType,
                                          DatModCap.qry_FileType.FieldbyName('Description').AsString) = mrOk Then
                begin
                  If not(qry_eRecords.State in dsEditModes) Then
                    qry_eRecords.edit;
                  If sType = 'TEXT1' Then sHead := 'Col1';
                  If sType = 'TEXT2' Then sHead := 'Col2';
                  If sType = 'TEXT3' Then sHead := 'Col3';
                  If sType = 'TEXT4' Then sHead := 'Col4';
                  If sType = 'TEXT5' Then sHead := 'Col5';
                  If sType = 'TEXT6' Then sHead := 'Col6';
                  If sType = 'TEXT7' Then sHead := 'Col7';
                  If sType = 'TEXT8' Then sHead := 'Col8';
                  If sType = 'TEXT9' Then sHead := 'Col9';
                  If sType = 'TEXT10' Then sHead := 'Col10';
            //-------
                  If sType = 'DATE1' Then sHead := 'Col11';
                  If sType = 'DATE2' Then sHead := 'Col12';
                  If sType = 'DATE3' Then sHead := 'Col13';
            //-------
                  If sType = 'NUMBER1' Then sHead := 'Col14';
                  If sType = 'NUMBER2' Then sHead := 'Col15';
                  If DatModCap.CheckIfUpperCase(sHead) Then
                    spDBEdit.Field.Value := UPPERCASE(frm_RecordLookup.TextString)
                  else spDBEdit.Field.Value := frm_RecordLookup.TextString;
                end;
            end;
        end
    else
      begin
//-------Check the rest
        spDBEdit := Sender as TDBEdit;
        sType := UPPERCASE(spDBEdit.DataField);
        If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
        If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
        If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
        If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
        If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
        If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
        If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
        If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
        If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
        If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
  //-------
        If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
        If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
        If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
  //-------
        If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
        If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;

        p :=  TDBEdit(Sender).SelStart;
        theText := copy(TDBEdit(Sender).Text, 0, p);
        For i := Low(FileLookups) to High(FileLookups) Do
          begin

            if (pos(upperCase(theText), upperCase(FileLookups[I].Item))=1)and(FileLookups[I].ColumnHeading = sHead) then

              if compareText(theText, FileLookups[I].Item) < 0 then
                begin
                  If pos(upperCase(TDBEdit(Sender).text), upperCase(FileLookups[I].Item)) > 0 Then
                    begin
                      TDBEdit(Sender).text := FileLookups[I].Item;
                      TDBEdit(Sender).selStart := p;
                      TDBEdit(Sender).SelLength := length(TDBEdit(Sender).text) - TDBEdit(Sender).selStart;
                    end;
                  break;
                end;
          end;
      end;
  end;
end;

procedure Tfrm_BulkCapture.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_Console.act_eRecBulkCapture.Enabled := true;
  qry_eRecords.Close;
  action := caFree;
end;

procedure Tfrm_BulkCapture.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  NoVerifyFlag := False;
end;

procedure Tfrm_BulkCapture.HideFields;
begin
  pnl_Text1.Visible := False;
  pnl_Text2.Visible := False;
  pnl_Text3.Visible := False;
  pnl_Text4.Visible := False;
  pnl_Text5.Visible := False;
  pnl_Text6.Visible := False;
  pnl_Text7.Visible := False;
  pnl_Text8.Visible := False;
  pnl_Text9.Visible := False;
  pnl_Text10.Visible := False;
  pnl_Date1.Visible := False;
  pnl_Date2.Visible := False;
  pnl_Date3.Visible := False;
  pnl_Num1.Visible := False;
  pnl_Num2.Visible := False;
end;

procedure Tfrm_BulkCapture.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePageIndex = 0 Then
    begin
      lbl_Progress.Visible := false;
      qry_eRecImages.Close;
      qry_eRecords.Close;
      qry_ReviewList.Close;
    end
  else if PageControl1.ActivePageIndex = 1 Then
    begin
      lbl_Progress.Visible := false;
      qry_eRecImages.Close;
      qry_eRecords.Close;
      DisplayReviewList;
    end
  else
    begin
      lbl_Progress.Visible := true;
    end;
end;

procedure Tfrm_BulkCapture.DBGrid1DblClick(Sender: TObject);
var
  NeRec   :Integer;
begin
  If qry_ReviewList.IsEmpty Then
    exit;

  NeRec := qry_ReviewList.FieldByName('eRecNo').asInteger;

  qry_eRecords.Close;
  qry_eRecords.SQL.Clear;
  qry_eRecords.SQL.Add('SELECT');
  qry_eRecords.SQL.Add('	e.* ');
  qry_eRecords.SQL.Add('FROM ');
  qry_eRecords.SQL.Add('	eRecords e	');
  qry_eRecords.SQL.Add('	INNER JOIN (SELECT');
  qry_eRecords.SQL.Add('					eRecNo,');
  qry_eRecords.SQL.Add('					Min(TrxNo) AS TrxNo');
  qry_eRecords.SQL.Add('				FROM ');
  qry_eRecords.SQL.Add('					eRecordImages');
  qry_eRecords.SQL.Add('				WHERE');
  qry_eRecords.SQL.Add('					RecStatus > 1');
  qry_eRecords.SQL.Add('				GROUP BY');
  qry_eRecords.SQL.Add('					eRecNo) AS tmp ON tmp.eRecNo = e.eRecno');
  qry_eRecords.SQL.Add('	INNER JOIN eRecordImages i ON i.Trxno = tmp.TrxNo ');
  qry_eRecords.SQL.Add('WHERE');
  qry_eRecords.SQL.Add('	EXISTS(SELECT * FROM eRecordImages i WHERE e.eRecNo = i.eRecNo AND	ISNULL(i.RecStatus, 0) > 1 AND	i.UserId = '+QuotedStr(User)+')');
  qry_eRecords.SQL.Add('ORDER BY');
  qry_eRecords.SQL.Add('	e.Branch,');
  qry_eRecords.SQL.Add('	e.Department,');
  qry_eRecords.SQL.Add('	e.RecordType,');
  qry_eRecords.SQL.Add('	e.RecordCat,');
  qry_eRecords.SQL.Add('	i.DocName');

  qry_eRecords.Open;
  qry_eRecords.Locate('eRecNo', NeRec, []);

  PageControl1.ActivePage := Tabsheet2;
  PageControl1cHANGE(Self);
end;

procedure Tfrm_BulkCapture.DisplayReviewList;
begin
  qry_ReviewList.Close;
  qry_ReviewList.SQL.Clear;
  qry_ReviewList.SQL.Add('SELECT');
  qry_ReviewList.SQL.Add('	i.TrxNo,');
  qry_ReviewList.SQL.Add('	e.eRecNo,');
  qry_ReviewList.SQL.Add('	i.InsertDate,');
  qry_ReviewList.SQL.Add('	i.UserId,');
  qry_ReviewList.SQL.Add('	i.DocName,');
  qry_ReviewList.SQL.Add('	i.PageCount,');
  qry_ReviewList.SQL.Add('	e.Branch,');
  qry_ReviewList.SQL.Add('	b.Name AS BranchName,');
  qry_ReviewList.SQL.Add('	e.Department,');
  qry_ReviewList.SQL.Add('	d.Name AS  DeptName,');
  qry_ReviewList.SQL.Add('	e.RecordType,');
  qry_ReviewList.SQL.Add('	i.RecStatus');
  qry_ReviewList.SQL.Add('FROM');
  qry_ReviewList.SQL.Add('	eRecordImages i');
  qry_ReviewList.SQL.Add('	INNER JOIN eRecords e ON i.eRecNo = e.eRecNo');
  qry_ReviewList.SQL.Add('	LEFT OUTER JOIN branches b ON e.Branch = b.Branch');
  qry_ReviewList.SQL.Add('	LEFT OUTER JOIN Departments d ON e.Branch = d.Branch AND e.Department = d.Department');
  qry_ReviewList.SQL.Add('WHERE');
  qry_ReviewList.SQL.Add('	ISNULL(i.RecStatus, 0) > 1 AND');
  qry_ReviewList.SQL.Add('	i.UserId = '+QuotedStr(User));
  qry_ReviewList.SQL.Add('ORDER BY');
  qry_ReviewList.SQL.Add('  e.Branch,');
  qry_ReviewList.SQL.Add('  e.Department,');
  qry_ReviewList.SQL.Add('  e.RecordType,');
  qry_ReviewList.SQL.Add('  e.RecordCat,');
  qry_ReviewList.SQL.Add('  i.DocName');
  qry_ReviewList.Open;
  frm_Console.AutoSizeNewColumns(DBGrid1);
end;

procedure Tfrm_BulkCapture.PopulateeRecordImageList(eRecordNo :Integer);
begin
  If eRecordNo > 0 Then
    begin
      qry_eRecImages.Close;
      qry_eRecImages.Parameters.ParamByName('meRecNo').Value := eRecordNo;
      qry_eRecImages.open;
    end
  else
    begin
      qry_eRecImages.Close;
      qry_eRecImages.Parameters.ParamByName('meRecNo').Value := -1111111;
      qry_eRecImages.open;
    end;
end;

procedure Tfrm_BulkCapture.qry_eRecImagesAfterOpen(DataSet: TDataSet);
begin
  If Dataset.IsEmpty Then
    qry_eRecImagesAfterScroll(Dataset);
end;

procedure Tfrm_BulkCapture.qry_eRecImagesAfterScroll(DataSet: TDataSet);
Var
  DocType  :String;
  ImageNo,J :Integer;
  ComponentTot :Integer;
  Filename   :String;
begin
  ComponentTot := Scroll_ImageViewer.ComponentCount;
  For J := ComponentTot-1 downto 0 Do
    begin
     If (Scroll_ImageViewer.Components[J] is TFrame) Then
       begin
         If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
           Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
         Scroll_ImageViewer.Components[J].Free;
       end
     else If Scroll_ImageViewer.Components[J] is TOLEContainer Then
       begin
         TOLEContainer(Scroll_ImageViewer.Components[J]).DestroyObject;
         Scroll_ImageViewer.Components[J].Free;
       end;
    end;
//==============================================================================
  If Dataset.IsEmpty Then
    exit;

  ImageNo := Dataset.FieldbyName('TRXNO').AsInteger;
  Filename := trim(Dataset.FieldbyName('DocName').asString);
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
      Tfram_ImageViewer.Create(Scroll_ImageViewer).Name := 'fram_ImageViewer1';
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Parent := Scroll_ImageViewer;
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Align := alClient;
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).TabStop := false;
      If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetDocuments('BulkCapture', ImageNo) Then
        begin
          Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Visible := True;
          CurrFileName := Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FileName;
        end;
    end;
  If (DocType = '.HTM')OR
     (DocType = '.HTML')OR
     (DocType = '.EML')Then
    begin
      Tfram_HTMLViewer.Create(Scroll_ImageViewer).Name := 'fram_HTMLViewer1';
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Parent := Scroll_ImageViewer;
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Align := alClient;
      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := False;
      If Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).GetDocuments('BulkCapture', ImageNo) Then
        begin
          Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := True;
          CurrFileName := Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).FileName;
        end;
    end;
  If (DocType = '.DOC')OR
     (DocType = '.PPT')OR
     (DocType = '.PPS')OR
     (DocType = '.MSG')Then
    begin
      GetOLEDocuments(ImageNo);
    end;
  If (DocType = '.TXT')OR
     (DocType = '.RTF')OR
     (DocType = '.CSV')Then
    begin
      Tfram_RTFViewer.Create(Scroll_ImageViewer).Name := 'fram_RTFViewer1';
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Parent := Scroll_ImageViewer;
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Align := alClient;
      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := False;
      If Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).GetDocuments('BulkCapture', ImageNo) Then
        begin
          Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := True;
          CurrFileName := Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).FileName;
        end;
    end;
end;

procedure Tfrm_BulkCapture.qry_eRecordsAfterEdit(DataSet: TDataSet);
Var
  TempDate    :TDatetime;
  TempInt     :Integer;
begin
  If (trim(Dataset.FieldbyName('RecordCat').AsString) = '')and(pRecordCat <> '') Then
    Dataset['RecordCat'] := pRecordCat;
//----------
  If not CopyFlag Then
    begin
      if (chk_Text1.Checked) and (chk_Text1.Hint <> '') then Dataset[edt_Text1.DataField] := chk_Text1.Hint;
      if (chk_Text2.Checked) and (chk_Text2.Hint <> '') then Dataset[edt_Text2.DataField] := chk_Text2.Hint;
      if (chk_Text3.Checked) and (chk_Text3.Hint <> '') then Dataset[edt_Text3.DataField] := chk_Text3.Hint;
      if (chk_Text4.Checked) and (chk_Text4.Hint <> '') then Dataset[edt_Text4.DataField] := chk_Text4.Hint;
      if (chk_Text5.Checked) and (chk_Text5.Hint <> '') then Dataset[edt_Text5.DataField] := chk_Text5.Hint;
      if (chk_Text6.Checked) and (chk_Text6.Hint <> '') then Dataset[edt_Text6.DataField] := chk_Text6.Hint;
      if (chk_Text7.Checked) and (chk_Text7.Hint <> '') then Dataset[edt_Text7.DataField] := chk_Text7.Hint;
      if (chk_Text8.Checked) and (chk_Text8.Hint <> '') then Dataset[edt_Text8.DataField] := chk_Text8.Hint;
      if (chk_Text9.Checked) and (chk_Text9.Hint <> '') then Dataset[edt_Text9.DataField] := chk_Text9.Hint;
      if (chk_Text10.Checked) and (chk_Text10.Hint <> '') then Dataset[edt_Text10.DataField] := chk_Text10.Hint;

      if (chk_Date1.Checked) and (chk_Date1.Hint <> '') then
        begin
          If TryStrtoDate(chk_Date1.Hint, TempDate) Then
            Dataset[edt_Date1.DataField] := TempDate;
        end;
      if (chk_Date2.Checked) and (chk_Date2.Hint <> '') then
        begin
          If TryStrtoDate(chk_Date2.Hint, TempDate) Then
            Dataset[edt_Date2.DataField] := TempDate;
        end;
      if (chk_Date3.Checked) and (chk_Date3.Hint <> '') then
        begin
          If TryStrtoDate(chk_Date3.Hint, TempDate) Then
            Dataset[edt_Date3.DataField] := TempDate;
        end;

      if (chk_Num1.Checked) and (chk_Num1.Hint <> '') then
        begin
          If TryStrtoInt(chk_Num1.Hint, TempInt) Then
            Dataset[edt_Num1.DataField] := TempInt;
        end;
      if (chk_Num2.Checked) and (chk_Num2.Hint <> '') then
        begin
          If TryStrtoInt(chk_Num2.Hint, TempInt) Then
            Dataset[edt_Num2.DataField] := TempInt;
        end;
    end;
end;

procedure Tfrm_BulkCapture.qry_eRecordsAfterOpen(DataSet: TDataSet);
begin
  TotalRecords := Dataset.RecordCount;
end;

procedure Tfrm_BulkCapture.qry_eRecordsAfterPost(DataSet: TDataSet);
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE eRecordImages SET RecStatus = 1 WHERE eRecNo = ' + InttoStr(Dataset.FieldByName('eRecNo').AsInteger));
  qry_SQL.ExecSQL;
end;

procedure Tfrm_BulkCapture.qry_eRecordsAfterScroll(DataSet: TDataSet);
Var
  qry_GetNames   :TADOQuery;
begin
  PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
  lbl_Progress.Caption := 'Capturing Record '+InttoStr(Dataset.RecNo)+' of '+InttoStr(TotalRecords)+'.';

  qry_GetNames := TADOQuery.Create(Self);
  try
    qry_GetNames.Connection  := dm_Metrofiler.ADOConnect_mFiler;
    If trim(Dataset.FieldbyName('Branch').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Branches WHERE Branch = ' + QuotedStr(Dataset.FieldbyName('Branch').asString));
        qry_GetNames.Open;
        lbl_RBranchSrc.Caption := qry_GetNames.FieldbyName('Name').asString;
      end;
  //-------------Get Department Name----------------------------------------------
    If trim(Dataset.FieldbyName('Department').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Departments WHERE Branch = ' + QuotedStr(Dataset.FieldbyName('Branch').asString) + ' AND Department = ' + QuotedStr(Dataset.FieldbyName('Department').asString));
        qry_GetNames.Open;
        lbl_RDeptSrc.Caption := qry_GetNames.FieldbyName('Name').asString;
      end;
  finally
    qry_GetNames.Close;
    qry_GetNames.Free;
  end;
end;

procedure Tfrm_BulkCapture.qry_eRecordsBeforePost(DataSet: TDataSet);
var
  J,i       :Integer;
  FieldNAme :String;
  ValFlag   :Boolean;
begin
//======================Validate Required Fields================================
  For J := 0 to Dataset.FieldCount-1 Do
    begin
      If UpperCase(DataSet.Fields[J].FieldName) = 'TEXT1' Then
        FieldName := 'Col1'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT2' Then
        FieldName := 'Col2'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT3' Then
        FieldName := 'Col3'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT4' Then
        FieldName := 'Col4'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT5' Then
        FieldName := 'Col5'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT6' Then
        FieldName := 'Col6'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT7' Then
        FieldName := 'Col7'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT8' Then
        FieldName := 'Col8'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT9' Then
        FieldName := 'Col9'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT10' Then
        FieldName := 'Col10'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE1' Then
        FieldName := 'Col11'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE2' Then
        FieldName := 'Col12'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE3' Then
        FieldName := 'Col13'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER1' Then
        FieldName := 'Col14'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER2' Then
        FieldName := 'Col15'
      else FieldName := '';
//-----
      If FieldName <> '' Then
        If DatModCap.CheckIfRequired(FieldName) Then
          If Dataset.Fields[J].asString = '' Then
          begin
            Messagedlg('Field "'+DatModCap.GetAlias(FieldName)+'" requires a value.' , mtWarning, [mbOK], 0);
            Abort;
          end;
//------
      If FieldName <> '' Then
        begin
          If DatModCap.CheckIfValidate(FieldName) Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('SELECT COUNT(*) FROM IndexDefsLookups WHERE Description = :DS AND ColumnHeading = :CH AND Item = :IT');
              qry_SQL.Parameters.ParamByName('DS').Value := qry_eRecords.FieldbyName('RecordType').AsString;
              qry_SQL.Parameters.ParamByName('CH').Value := DatModCap.GetAlias(FieldName);
              qry_SQL.Parameters.ParamByName('IT').Value := Dataset.Fields[J].asString;
              qry_SQL.Open;
              If qry_SQL.Fields[0].AsInteger = 0 Then
                begin
                  qry_SQL.Close;
                  Messagedlg('Value for Field "'+DatModCap.GetAlias(FieldName)+'" is invalid. Please enter a correct value.' , mtWarning, [mbOK], 0);
                  Abort;
                end;
              qry_SQL.Close;
            end;
        end;
    end;
//-----
  If trim(Dataset.FieldByName('Branch').AsString) = '' Then
    begin
      Messagedlg('Please select a Branch.' , mtWarning, [mbOK], 0);
      Abort;
    end;
  If trim(Dataset.FieldByName('Department').AsString) = '' Then
    begin
      Messagedlg('Please select a Department.' , mtWarning, [mbOK], 0);
      Abort;
    end;
  If trim(Dataset.FieldByName('RecordType').AsString) = '' Then
    begin
      Messagedlg('Please select a Record Type.' , mtWarning, [mbOK], 0);
      Abort;
    end;
  If edt_RecordCat.Visible Then
    begin
      If trim(Dataset.FieldByName('RecordCat').AsString) = '' Then
        begin
          Messagedlg('Please select a Record Catagory.' , mtWarning, [mbOK], 0);
          Abort;
        end;
      pRecordCat := trim(edt_RecordCat.Text);
    end;

  Dataset['CapBy'] := User;
  Dataset['CapDate'] := dm_Metrofiler.GetServTimeNow;
//--------------
  If chk_Text1.Checked Then chk_Text1.Hint := edt_Text1.Text else chk_Text1.Hint := '';
  If chk_Text2.Checked Then chk_Text2.Hint := edt_Text2.Text else chk_Text2.Hint := '';
  If chk_Text3.Checked Then chk_Text3.Hint := edt_Text3.Text else chk_Text3.Hint := '';
  If chk_Text4.Checked Then chk_Text4.Hint := edt_Text4.Text else chk_Text4.Hint := '';
  If chk_Text5.Checked Then chk_Text5.Hint := edt_Text5.Text else chk_Text5.Hint := '';
  If chk_Text6.Checked Then chk_Text6.Hint := edt_Text6.Text else chk_Text6.Hint := '';
  If chk_Text7.Checked Then chk_Text7.Hint := edt_Text7.Text else chk_Text7.Hint := '';
  If chk_Text8.Checked Then chk_Text8.Hint := edt_Text8.Text else chk_Text8.Hint := '';
  If chk_Text9.Checked Then chk_Text9.Hint := edt_Text9.Text else chk_Text9.Hint := '';
  If chk_Text10.Checked Then chk_Text10.Hint := edt_Text10.Text else chk_Text10.Hint := '';

  If chk_Date1.Checked Then chk_Date1.Hint := edt_Date1.Text else chk_Date1.Hint := '';
  If chk_Date2.Checked Then chk_Date2.Hint := edt_Date2.Text else chk_Date2.Hint := '';
  If chk_Date3.Checked Then chk_Date3.Hint := edt_Date3.Text else chk_Date3.Hint := '';

  If chk_Num1.Checked Then chk_Num1.Hint := edt_Num1.Text else chk_Num1.Hint := '';
  If chk_Num2.Checked Then chk_Num2.Hint := edt_Num2.Text else chk_Num2.Hint := '';
end;

function Tfrm_BulkCapture.GetOLEDocuments(ImageNo :Integer):Boolean;
procedure RefreshOle(Ole: TOleContainer);
var S: TMemoryStream;
begin
  S:= TMemoryStream.create;
  try
    Ole.SaveToStream(S);
    S.Position:= 0;
    Ole.LoadFromStream(S);
  finally
    S.free;
  end;
end;

Var
  DocType    :String;
  Flags: OLEVariant;
begin
  Result := False;
  Flags := 0;
  If ImageNo = 0 Then
    begin
      exit;
    end;
//---------
  CurrFileName := dm_Metrofiler.ReadERecFromRepositry('BulkCapture', ImageNo);
  DocType := ExtractFileExt(CurrFileName);
//==============================================================================
  DocType := UPPERCASE(DocType);
  If (DocType <> '.DOC')AND
     (DocType <> '.PPT')AND
     (DocType <> '.MSG')Then
    begin
      Messagedlg('Document format <'+DocType+'> not supported by this viewer!', mtWarning, [mbOK], 0);
      exit;
    end;
//==============================================================================
  TOLEContainer.Create(Scroll_ImageViewer).Name := 'OLEContainer1';
  TOLEContainer(Scroll_ImageViewer.FindComponent('OLEContainer1')).Parent := Scroll_ImageViewer;
  TOLEContainer(Scroll_ImageViewer.FindComponent('OLEContainer1')).Align := alClient;
  TOLEContainer(Scroll_ImageViewer.FindComponent('OLEContainer1')).Visible := True;
  TOLEContainer(Scroll_ImageViewer.FindComponent('OLEContainer1')).CreateLinkToFile(CurrFileName, False);

  RefreshOle(TOLEContainer(Scroll_ImageViewer.FindComponent('OLEContainer1')));

  Result := True;
end;

procedure Tfrm_BulkCapture.UpdateImgPos(FieldName :String);
Var
  J, AtPos   :Integer;
begin
  AtPos := -1;
  For J := Low(ImagePositions) to High(ImagePositions) Do
    begin
      If ImagePositions[J].FieldName = FieldName Then
        begin
          AtPos := J;
          break;
        end;
    end;
  If AtPos <> -1 Then
    Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).SetPosition(
                                  ImagePositions[AtPos].ScrollXPos,
                                  ImagePositions[AtPos].ScrollYPos,
                                  ImagePositions[AtPos].ZoomRatio);
end;

procedure Tfrm_BulkCapture.SaveImgPos(FieldName :String);
Var
  J, AtPos   :Integer;
begin
  AtPos := -1;
  For J := Low(ImagePositions) to High(ImagePositions) Do
    begin
      If ImagePositions[J].FieldName = FieldName Then
        begin
          AtPos := J;
          break;
        end;
    end;
  If AtPos = -1 Then //Add New Entry
    begin
      J := Length(ImagePositions)+1;
      Setlength(ImagePositions, J);
      ImagePositions[J-1].FieldName := FieldName;
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetPosition(
                                    ImagePositions[J-1].ScrollXPos,
                                    ImagePositions[J-1].ScrollYPos,
                                    ImagePositions[J-1].ZoomRatio);
    end
  else //Update Existing one
    begin
      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetPosition(
                                    ImagePositions[AtPos].ScrollXPos,
                                    ImagePositions[AtPos].ScrollYPos,
                                    ImagePositions[AtPos].ZoomRatio);
    end;
end;

end.
