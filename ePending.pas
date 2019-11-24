unit ePending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ExtActns, StdActns, ActnList,
  ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls, DB, ADODB, DBCtrls, Grids,
  DBGrids, ImgList, ExtDlgs, Mask, Buttons,framImageViewer, framHTMLViewer, OleCtnrs,
  INIFiles, OleCtrls, imageenio, Menus, iemio, iemview, ieview, imageenview, iexBitmaps;

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
  Tfrm_ePending = class(TForm)
    scrllbx_left: TScrollBox;
    Scroll_ImageViewer: TScrollBox;
    Splitter1: TSplitter;
    dts_InBox: TDataSource;
    qry_InBox: TADOQuery;
    ScrollCapture: TScrollBox;
    dts_eRecords: TDataSource;
    ImageList: TImageList;
    odlg_Pic: TOpenPictureDialog;
    qry_InsertImage: TADOQuery;
    Splitter2: TSplitter;
    qry_UpdImage: TADOQuery;
    Splitter_Assign: TSplitter;
    dts_eRecImages: TDataSource;
    qry_eRecImages: TADOQuery;
    ADOQuery1: TADOQuery;
    pnl_Capture: TPanel;
    Label29: TLabel;
    Label16: TLabel;
    Label32: TLabel;
    Label5: TLabel;
    btn_AssignImage: TSpeedButton;
    btn_UnAssign: TSpeedButton;
    lbl_RBranchSrc: TLabel;
    lbl_RDeptSrc: TLabel;
    edt_RBranchCap: TDBEdit;
    btn_RBranchCap: TButton;
    edt_RDeptCap: TDBEdit;
    btn_RDeptCap: TButton;
    edt_RRTypeCap: TDBEdit;
    btn_RRTypeCap: TButton;
    nav_eRecEdit: TDBNavigator;
    lbl_RecordCat: TLabel;
    edt_RecordCat: TDBEdit;
    btn_RecordCat: TButton;
    scbar_metadata: TScrollBox;
    pnl_Text1: TPanel;
    txt_Text1: TDBText;
    edt_Text1: TDBEdit;
    pnl_Text2: TPanel;
    txt_Text2: TDBText;
    edt_Text2: TDBEdit;
    pnl_Text3: TPanel;
    txt_Text3: TDBText;
    edt_Text3: TDBEdit;
    pnl_Text4: TPanel;
    txt_Text4: TDBText;
    edt_Text4: TDBEdit;
    pnl_Text5: TPanel;
    txt_Text5: TDBText;
    edt_Text5: TDBEdit;
    pnl_Text6: TPanel;
    txt_Text6: TDBText;
    edt_Text6: TDBEdit;
    pnl_Text7: TPanel;
    txt_Text7: TDBText;
    edt_Text7: TDBEdit;
    pnl_Text8: TPanel;
    txt_Text8: TDBText;
    edt_Text8: TDBEdit;
    pnl_Text9: TPanel;
    txt_Text9: TDBText;
    edt_Text9: TDBEdit;
    pnl_Text10: TPanel;
    txt_Text10: TDBText;
    edt_Text10: TDBEdit;
    pnl_Date1: TPanel;
    txt_Date1: TDBText;
    lbl_DateFormat1: TLabel;
    edt_Date1: TDBEdit;
    pnl_Date2: TPanel;
    txt_Date2: TDBText;
    lbl_DateFormat2: TLabel;
    edt_Date2: TDBEdit;
    pnl_Date3: TPanel;
    txt_Date3: TDBText;
    lbl_DateFormat3: TLabel;
    edt_Date3: TDBEdit;
    pnl_Num1: TPanel;
    txt_Num1: TDBText;
    edt_Num1: TDBEdit;
    pnl_Num2: TPanel;
    txt_Num2: TDBText;
    edt_Num2: TDBEdit;
    edt_eRecNo: TDBEdit;
    Label2: TLabel;
    edt_PurgeDate: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    btn_CalcPurgeDate: TButton;
    qry_SQL: TADOQuery;
    Label6: TLabel;
    edt_CaptureDate: TDBEdit;
    Label7: TLabel;
    qry_eRecordImages: TADOQuery;
    qry_eRecords: TADOQuery;
    pnl_LinkedFile: TPanel;
    Label3: TLabel;
    edt_FileBarcode: TDBEdit;
    btn_GetFileBarcode: TButton;
    btn_ViewFileBarcode: TSpeedButton;
    pnl_UnAssign: TPanel;
    grd_InBox: TDBGrid;
    eImageComment: TDBMemo;
    pnl_Comments: TPanel;
    Panel1: TPanel;
    btn_ReAssign: TSpeedButton;
    pnl_Assign: TPanel;
    grd_Assigned: TDBGrid;
    nav_InBox: TDBNavigator;
    btn_BatchCapture: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    ImageEnIO1: TImageEnIO;
    Panel2: TPanel;
    btn_eRecordDataManager: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_SelFolder: TSpeedButton;
    btn_SelFiles: TSpeedButton;
    btn_Scan: TSpeedButton;
    pm_Tree: TPopupMenu;
    DeleteImage1: TMenuItem;
    pnl_LinkedItem: TPanel;
    Label4: TLabel;
    edt_ItemBarcode: TDBEdit;
    btn_GetItemBarcode: TButton;
    btn_ViewItemBarcode: TSpeedButton;
    ImageEnMIO1: TImageEnMIO;
    ImageEnView1: TImageEnView;
    ImageEnMView1: TImageEnMView;
    btnMatch: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure HideFields;
    procedure btn_RBranchCapClick(Sender: TObject);
    procedure btn_RDeptCapClick(Sender: TObject);
    procedure btn_RRTypeCapClick(Sender: TObject);
    procedure RefreshFields(Dataset: TDataset);
    procedure DBEditKeyPress(Sender: TObject; var Key: Char);
    procedure edt_Text1KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure edt_RRTypeCapChange(Sender: TObject);
    procedure qry_eRecordsAfterInsert(DataSet: TDataSet);
    procedure qry_eRecordsAfterPost(DataSet: TDataSet);
    procedure btn_AssignImageClick(Sender: TObject);
    procedure qry_eRecordsAfterScroll(DataSet: TDataSet);
    procedure btn_GetFileBarcodeClick(Sender: TObject);
    procedure btn_ReAssignClick(Sender: TObject);
    procedure btn_UnAssignClick(Sender: TObject);
    procedure btn_RecordCatClick(Sender: TObject);
    procedure qry_InBoxAfterScroll(DataSet: TDataSet);
    procedure btn_CloseClick(Sender: TObject);
    procedure edt_Text1Exit(Sender: TObject);
    procedure edt_Text1Enter(Sender: TObject);
    procedure grd_InBoxEnter(Sender: TObject);
    procedure grd_AssignedEnter(Sender: TObject);
    procedure qry_eRecImagesAfterScroll(DataSet: TDataSet);
    procedure qry_InBoxAfterOpen(DataSet: TDataSet);
    procedure qry_eRecImagesAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qry_eRecordsBeforeDelete(DataSet: TDataSet);
    procedure dts_eRecordsDataChange(Sender: TObject; Field: TField);
    procedure qry_eRecordsBeforePost(DataSet: TDataSet);
    procedure btn_ViewFileBarcodeClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure btn_CalcPurgeDateClick(Sender: TObject);
    procedure btn_eRecordDataManagerClick(Sender: TObject);
    procedure btn_ScanClick(Sender: TObject);
    procedure btn_BatchCaptureClick(Sender: TObject);
    procedure nav_eRecEditBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qry_eRecordsAfterEdit(DataSet: TDataSet);
    procedure btn_SelFolderClick(Sender: TObject);
    procedure btn_SelFilesClick(Sender: TObject);
    procedure DeleteImage1Click(Sender: TObject);
    procedure btn_ViewItemBarcodeClick(Sender: TObject);
    procedure btn_GetItemBarcodeClick(Sender: TObject);
    procedure btnMatchClick(Sender: TObject);
    procedure qry_InBoxAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    LastDBEdit                   :String;
    FirstDBEdit                  :String;
    PrevDBEdit                   :String;
    NowDBEdit                    :String;
    ImagePositions                       :Array of PositionRecord;
    ViewSelection    :String[10];
    CurrFileName     :String;
    eRecNo           :Integer;
    BusyAssignFlag   :Boolean;
    BatchCaptureMode  :Boolean;
    pBranch, pBranchName   :String;
    pDept, pDeptName       :String;
    pRecordType            :String;
    pRecordCat             :String;
    mRecordType            :String;
    FileLookups                          :Array of FilesLookupRecord;
    NoVerifyFlag          :Boolean;
    procedure UpdateImgPos(FieldName :String);
    procedure SaveImgPos(FieldName :String);
    procedure CalculatePurgeDate;
    function GetOLEDocuments(ImageNo :Integer):Boolean;
    function SetBatchCaptureMode(Mode :Boolean):Boolean;
    procedure PopulateeRecordImageList(eRecordNo :Integer);
  public
    { Public declarations }
    LaunchedFrom  :String[10];
    procedure DisplayThumbnail(tImageNo  :Integer);
  end;

var
  frm_ePending: Tfrm_ePending;

implementation

uses MetrofilerDataModule, main, eRecords, DataModCap, SelBranch, SelDept,
  SelRType, RecordLookup, SelBarcode, SelRCat, DataVer, ePendingLinkFile,
  eRecDataMan, framRichEditViewer, AddImages, Progress, ePendingLinkItem,
  ScannerConfig, MetroImp;

{$R *.dfm}


procedure Tfrm_ePending.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_InBox.Close;

  If frm_Console.feRecords <> Nil Then
    begin
      If LaunchedFrom = 'eRecords' Then
        frm_Console.feRecords.TimerRefresh.Enabled := True;
    end;

  If frm_Console.fImageCentre <> Nil Then
    begin
      If LaunchedFrom = 'ImgCentre' Then
        frm_Console.fImageCentre.BuildView;
    end;
  frm_Console.fePending := Nil;

  Action := caFree;
end;

procedure Tfrm_ePending.FormShow(Sender: TObject);
begin
  if frm_Console.eRecNo <> 0 then    //ie Nothing Passed
  begin
    grd_Assigned.SetFocus;
  end;
end;

procedure Tfrm_ePending.HideFields;
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

procedure Tfrm_ePending.btn_RBranchCapClick(Sender: TObject);
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

procedure Tfrm_ePending.btn_RDeptCapClick(Sender: TObject);
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

procedure Tfrm_ePending.btn_RRTypeCapClick(Sender: TObject);
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
      CalculatePurgeDate;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_ePending.RefreshFields(Dataset  :TDataset);
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


procedure Tfrm_ePending.DBEditKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_ePending.DeleteImage1Click(Sender: TObject);
Var
  I           :Integer;
begin

  If grd_InBox.SelectedRows.Count > 0 Then
    begin
      qry_InBox.DisableControls;
      try
        If Messagedlg('Are you sure you want to delete the selected images?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
          exit;

        With grd_InBox.DataSource.DataSet Do
          begin
            For i := 0 to grd_InBox.SelectedRows.Count-1 Do
              begin
                GotoBookmark(pointer(grd_InBox.SelectedRows.Items[i]));
                dm_Metrofiler.DeleteERecFromRepositry(FieldbyName('TrxNo').asInteger, True);
              end;
          end;
      finally
        qry_InBox.EnableControls;
        qry_InBox.Close;
        qry_InBox.Open;
      end;
    end;
end;

procedure Tfrm_ePending.edt_Text1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  spDBEdit          :TDBEdit;
  sHead, SType             :String;
  p, i              :Integer;
  theText           :String;
begin
  case key of
    8, 13, 46, 37..39: ;
    27 : Abort;
    9 : begin
          If BatchCaptureMode Then
            begin
            If (TDBEdit(Sender).Name = FirstDBEdit)AND
               (TDBEdit(Sender).Name = LastDBEdit)Then
              begin
                If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
                  SaveImgPos(TDBEdit(Sender).DataField);

                If qry_eRecords.State in dsEditModes Then
                  qry_eRecords.Post;

                If qry_InBox.State in dsEditModes Then
                  begin
                    qry_Inbox['eRecNo'] := qry_eRecords.FieldbyName('eRecNo').AsInteger;
                    qry_Inbox.Post;
                  end;
                If not qry_InBox.EOF Then
                  begin
                    qry_InBox.Next;
                    qry_InBox.edit;
                    qry_eRecords.edit;
                    TDBEdit(Sender).SetFocus;
                  end;
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

                    If qry_InBox.State in dsEditModes Then
                      begin
                        qry_Inbox['eRecNo'] := qry_eRecords.FieldbyName('eRecNo').AsInteger;
                        qry_Inbox.Post;
                      end;
                    If not qry_InBox.EOF Then
                      begin
                        qry_InBox.Next;
                        qry_InBox.edit;
                        qry_eRecords.edit;
                        TDBEdit(Sender).SetFocus;
                      end;
                      //-----------Display Image if necesary
                    If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
                      UpdateImgPos(TDBEdit(Sender).DataField);
                  end
              end;
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



procedure Tfrm_ePending.edt_RRTypeCapChange(Sender: TObject);
Var
  J :Integer;
  sType, sHead   :String;
begin
  HideFields;
  If length(qry_eRecords.FieldbyName('RecordType').asString) = 0 then
    begin
      lbl_RecordCat.Visible := False;
      edt_RecordCat.Visible := False;
      btn_RecordCat.Visible := False;
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
            end;
        end;
//----------
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

procedure Tfrm_ePending.qry_eRecordsAfterEdit(DataSet: TDataSet);
begin
  mRecordType := Dataset.FieldbyName('RecordType').asString;
end;

procedure Tfrm_ePending.qry_eRecordsAfterInsert(DataSet: TDataSet);
begin
  mRecordType := '';
  Dataset['NilPurge'] := 0;
  Dataset['Code'] := CompsCode;
  Dataset['CaptureDate'] :=  dm_Metrofiler.GetServTimeNow;
//-----Save Branch, Department, RecordType
  If BatchCaptureMode Then
    begin
      Dataset['Branch'] := pBranch; lbl_RBranchSrc.Caption := pBranchName;
      Dataset['Department'] := pDept; lbl_RDeptSrc.Caption := pDeptName;
      Dataset['RecordType'] := pRecordType;
      If pRecordType <> '' Then
        begin
          CalculatePurgeDate;
          edt_RRTypeCapChange(edt_RRTypeCap);;
        end;
      If (trim(Dataset.FieldbyName('RecordCat').AsString) = '')and(pRecordCat <> '') Then
        Dataset['RecordCat'] := pRecordCat;
    end
  else
    begin
      lbl_RBranchSrc.Caption := '...';
      lbl_RDeptSrc.Caption := '...';
    end;
end;

procedure Tfrm_ePending.qry_eRecordsAfterPost(DataSet: TDataSet);
Var
  NewFlag   :Boolean;
begin
  NewFlag := False;
  If eRecNo = 0 Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT @@Identity');
      qry_SQL.Open;
      eRecNo := qry_SQL.Fields[0].AsInteger;
      NewFlag := True;
    end;
  qry_eRecords.Close;
  qry_eRecords.SQL.Text := 'SELECT * FROM eRecords WHERE eRecNo = '+InttoStr(eRecNo)+' ORDER BY eRecNo';
  qry_eRecords.Open;

  If (mRecordType <> '')Then
  If (mRecordType <> trim(Dataset.FieldByName('RecordType').AsString)) Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT');
      qry_SQL.SQL.Add('  i.TrxNo,');
      qry_SQL.SQL.Add('  e.eRecNo,');
      qry_SQL.SQL.Add('  e.RecordType,');
      qry_SQL.SQL.Add('  i.DocName');
      qry_SQL.SQL.Add('FROM');
      qry_SQL.SQL.Add('  eRecords e');
      qry_SQL.SQL.Add('  INNER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
      qry_SQL.SQL.Add('WHERE');
      qry_SQL.SQL.Add('  e.eRecNo = '+InttoStr(eRecNo));
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          Screen.Cursor := crHourglass;
          try
            qry_SQL.First;
            While not qry_SQL.EOF Do
              begin
                Application.ProcessMessages;
                try
                  dm_Metrofiler.UpdateERecRepositry(qry_SQL.FieldByName('TrxNo').AsInteger);
                except
                end;
              //----
                qry_SQL.Next;
              end;
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      qry_SQL.Close;
    end;

  If (not BatchCaptureMode)AND(NewFlag) Then
    begin
      BusyAssignFlag := True;
      qry_InBox.DisableControls;
      try
        If grd_InBox.SelectedRows.Count > 0 Then
          begin
            qry_InBox.First;
            While not qry_InBox.EOF do
              begin
                if grd_InBox.SelectedRows.CurrentRowSelected Then
                  begin
                    qry_UpdImage.Close;
                    qry_UpdImage.SQL.Clear;
                    qry_UpdImage.SQL.Add('UPDATE eRecordImages SET');
                    qry_UpdImage.SQL.Add('  eRecNo = '+InttoStr(qry_eRecords.FieldByName('eRecNo').AsInteger)+',');
                    qry_UpdImage.SQL.Add('  UserID = '+QuotedStr(User));
                    qry_UpdImage.SQL.Add('WHERE Trxno = '+InttoStr(qry_InBox.FieldByName('TrxNo').AsInteger));
                    qry_UpdImage.ExecSQL;
                    dm_Metrofiler.UpdateERecRepositry(qry_InBox.FieldByName('TrxNo').AsInteger);
                  end;
                qry_InBox.Next;
              end; //enddo, loop through selection
          end
        else
          begin
            If not qry_Inbox.IsEmpty Then
              begin
                qry_UpdImage.Close;
                qry_UpdImage.SQL.Clear;
                qry_UpdImage.SQL.Add('UPDATE eRecordImages SET');
                qry_UpdImage.SQL.Add('  eRecNo = '+InttoStr(qry_eRecords.FieldByName('eRecNo').AsInteger)+',');
                qry_UpdImage.SQL.Add('  UserID = '+QuotedStr(User));
                qry_UpdImage.SQL.Add('WHERE Trxno = '+InttoStr(qry_InBox.FieldByName('TrxNo').AsInteger));
                qry_UpdImage.ExecSQL;
                dm_Metrofiler.UpdateERecRepositry(qry_InBox.FieldByName('TrxNo').AsInteger);
              end;
          end;
      finally
        BusyAssignFlag := False;
        qry_InBox.EnableControls;
        qry_InBox.Close;
        qry_InBox.Open;
        PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
      end;
    end;
end;

procedure Tfrm_ePending.btnMatchClick(Sender: TObject);
begin
  If edt_RRTypeCap.Text = '' Then
    exit;

  frm_DataImpMatch.Execute(edt_RRTypeCap.Text);
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

procedure Tfrm_ePending.btn_AssignImageClick(Sender: TObject);
begin
  if qry_eRecords.State = dsInsert then
    begin
      MessageDLG('Record in edit mode, please post, then Assign image(s)',mtInformation,[mbOK],0);
      exit;
    end;
  if qry_eRecords.RecordCount = 0 then
    begin
      MessageDLG('Please Select an eRecord, then Assign image(s)',mtInformation,[mbOK],0);
      exit;
    end;
  IF grd_InBox.SelectedRows.Count = 0 Then
    begin
      MessageDLG('No Images Selected',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  BusyAssignFlag := True;
  qry_InBox.DisableControls;
  try
    qry_InBox.First;
    While not qry_InBox.EOF do
      begin
        if grd_InBox.SelectedRows.CurrentRowSelected Then
          begin
            qry_UpdImage.Close;
            qry_UpdImage.SQL.Clear;
            qry_UpdImage.SQL.Add('UPDATE eRecordImages SET');
            qry_UpdImage.SQL.Add('  eRecNo = '+InttoStr(qry_eRecords.FieldByName('eRecNo').AsInteger)+',');
            qry_UpdImage.SQL.Add('  UserID = '+QuotedStr(User));
            qry_UpdImage.SQL.Add('WHERE Trxno = '+InttoStr(qry_InBox.FieldByName('TrxNo').AsInteger));
            qry_UpdImage.ExecSQL;
            dm_Metrofiler.UpdateERecRepositry(qry_InBox.FieldByName('TrxNo').AsInteger);
          end;
        qry_InBox.Next;
      end; //enddo, loop through selection
    MessageDLG('Selected Images Assigned',mtInformation,[mbOK],0);
  finally
    BusyAssignFlag := False;
    qry_InBox.EnableControls;
    qry_InBox.Close;
    qry_InBox.Open;
    PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
  end;
end;

procedure Tfrm_ePending.qry_eRecordsAfterScroll(DataSet: TDataSet);
begin
  If BatchCaptureMode = False Then
    begin
      If qry_eRecords.State = dsInsert Then
        begin
          PopulateeRecordImageList(0);
      end
      else
        begin
          PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
      end;
    end;
end;

procedure Tfrm_ePending.btn_GetFileBarcodeClick(Sender: TObject);
begin
  If not(qry_eRecords.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this record before linking a File!!', mtWarning ,[mbOK], 0);
      exit;
    end;

  Application.CreateForm(Tfrm_ePendingLinkFile, frm_ePendingLinkFile);
  try
    frm_ePendingLinkFile.edt_RBranchCap.Text := edt_RBranchCap.Text;
    frm_ePendingLinkFile.edt_RDeptCap.Text := edt_RDeptCap.Text;
    frm_ePendingLinkFile.lbl_RBranchSrc.Caption := lbl_RBranchSrc.Caption;
    frm_ePendingLinkFile.lbl_RDeptSrc.Caption := lbl_RDeptSrc.Caption;
    If frm_ePendingLinkFile.Execute = mrOK Then
      begin
        qry_eRecords['Filenumber'] := frm_ePendingLinkFile.qry_Det.FieldByName('Filenumber').AsString;
        If Messagedlg('Do you want to update the metadata of the eRecord with the metadata of the File?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
          begin
            qry_eRecords['Text1'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text1').AsString;
            qry_eRecords['Text2'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text2').AsString;
            qry_eRecords['Text3'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text3').AsString;
            qry_eRecords['Text4'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text4').AsString;
            qry_eRecords['Text5'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text5').AsString;
            qry_eRecords['Text6'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text6').AsString;
            qry_eRecords['Text7'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text7').AsString;
            qry_eRecords['Text8'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text8').AsString;
            qry_eRecords['Text9'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text9').AsString;
            qry_eRecords['Text10'] := frm_ePendingLinkFile.qry_Det.FieldByName('Text10').AsString;
            qry_eRecords['Date1'] := frm_ePendingLinkFile.qry_Det.FieldByName('Date1').AsDateTime;
            qry_eRecords['Date2'] := frm_ePendingLinkFile.qry_Det.FieldByName('Date2').AsDateTime;
            qry_eRecords['Date3'] := frm_ePendingLinkFile.qry_Det.FieldByName('Date3').AsDateTime;
            qry_eRecords['Number1'] := frm_ePendingLinkFile.qry_Det.FieldByName('Number1').AsInteger;
            qry_eRecords['Number2'] := frm_ePendingLinkFile.qry_Det.FieldByName('Number2').AsInteger;
          end;
      end;
  finally
    frm_ePendingLinkFile.Free;
  end;
end;

procedure Tfrm_ePending.btn_GetItemBarcodeClick(Sender: TObject);
begin
  If not(qry_eRecords.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this record before linking an Item!!', mtWarning ,[mbOK], 0);
      exit;
    end;

  Application.CreateForm(Tfrm_ePendingLinkItem, frm_ePendingLinkItem);
  try
    frm_ePendingLinkItem.edt_RBranchCap.Text := edt_RBranchCap.Text;
    frm_ePendingLinkItem.edt_RDeptCap.Text := edt_RDeptCap.Text;
    frm_ePendingLinkItem.lbl_RBranchSrc.Caption := lbl_RBranchSrc.Caption;
    frm_ePendingLinkItem.lbl_RDeptSrc.Caption := lbl_RDeptSrc.Caption;
    If frm_ePendingLinkItem.Execute = mrOK Then
      begin
        qry_eRecords['Itemnumber'] := frm_ePendingLinkItem.qry_Det.FieldByName('Itemnumber').AsString;
        If Messagedlg('Do you want to update the metadata of the eRecord with the metadata of the Item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
          begin
            qry_eRecords['Text1'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text1').AsString;
            qry_eRecords['Text2'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text2').AsString;
            qry_eRecords['Text3'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text3').AsString;
            qry_eRecords['Text4'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text4').AsString;
            qry_eRecords['Text5'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text5').AsString;
            qry_eRecords['Text6'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text6').AsString;
            qry_eRecords['Text7'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text7').AsString;
            qry_eRecords['Text8'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text8').AsString;
            qry_eRecords['Text9'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text9').AsString;
            qry_eRecords['Text10'] := frm_ePendingLinkItem.qry_Det.FieldByName('Text10').AsString;
            qry_eRecords['Date1'] := frm_ePendingLinkItem.qry_Det.FieldByName('Date1').AsDateTime;
            qry_eRecords['Date2'] := frm_ePendingLinkItem.qry_Det.FieldByName('Date2').AsDateTime;
            qry_eRecords['Date3'] := frm_ePendingLinkItem.qry_Det.FieldByName('Date3').AsDateTime;
            qry_eRecords['Number1'] := frm_ePendingLinkItem.qry_Det.FieldByName('Number1').AsInteger;
            qry_eRecords['Number2'] := frm_ePendingLinkItem.qry_Det.FieldByName('Number2').AsInteger;
          end;
      end;
  finally
    frm_ePendingLinkItem.Free;
  end;
end;

procedure Tfrm_ePending.btn_ReAssignClick(Sender: TObject);
Var
  ImageAdmin    :String;
begin
  Screen.Cursor := crHourglass;
  qry_InBox.DisableControls;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT TOP 1');
    qry_SQL.SQL.Add('	*');
    qry_SQL.SQL.Add('FROM');
    qry_SQL.SQL.Add('	AuthCodes a');
    qry_SQL.SQL.Add('WHERE');
    qry_SQL.SQL.Add('	a.ImageCentreAdmin = 1 AND');
    qry_SQL.SQL.Add('	EXISTS (SELECT');
    qry_SQL.SQL.Add('				b.UserId');
    qry_SQL.SQL.Add('			FROM');
    qry_SQL.SQL.Add('				ImageCentreRts i');
    qry_SQL.SQL.Add('				INNER JOIN AuthCodes b ON i.UserId = b.UserId');
    qry_SQL.SQL.Add('			WHERE');
    qry_SQL.SQL.Add('				a.UserId = b.UserId AND');
    qry_SQL.SQL.Add('				EXISTS (SELECT');
    qry_SQL.SQL.Add('							c.GroupId');
    qry_SQL.SQL.Add('						FROM');
    qry_SQL.SQL.Add('							ImageCentreRts c');
    qry_SQL.SQL.Add('							INNER JOIN ImageCentreGroups g ON c.GroupId = g.GroupId');
    qry_SQL.SQL.Add('						WHERE');
    qry_SQL.SQL.Add('							c.GroupId = i.GroupId AND');
    qry_SQL.SQL.Add('							C.UserID = :UserId');
    qry_SQL.SQL.Add('						)');
    qry_SQL.SQL.Add('			)');
    qry_SQL.Parameters.ParamValues['UserId'] := User;
    qry_SQL.Open;
    If qry_SQL.IsEmpty Then
      begin
        qry_SQL.Close;
        exit;
      end;
    ImageAdmin := qry_SQL.FieldByName('UserId').AsString;

    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE eRecordImages SET');
    qry_SQL.SQL.Add('  eRecNo = 0,');
    qry_SQL.SQL.Add('  UserId = :UserId');
    qry_SQL.SQL.Add('WHERE TrxNo = :TrxNo');

    If grd_InBox.SelectedRows.Count > 0 Then
      begin
        qry_InBox.First;
        While not qry_InBox.EOF do
          begin
            if grd_InBox.SelectedRows.CurrentRowSelected Then
              begin
                qry_SQL.Close;
                qry_SQL.Parameters.ParamValues['UserId'] := ImageAdmin;
                qry_SQL.Parameters.ParamValues['TrxNo'] := qry_InBox.FieldByName('TrxNo').asInteger;
                qry_SQL.ExecSQL;
                dm_Metrofiler.UpdateERecRepositry(qry_Inbox.FieldByName('TrxNo').AsInteger);
              end;
            qry_InBox.Next;
          end;
        MessageDLG('Selected Images returned to Image Centre',mtInformation,[mbOK],0);
      end
    else
      MessageDLG('No Images Selected',mtError,[mbOK],0);
  finally
    qry_InBox.EnableControls;
    qry_InBox.Close;
    qry_InBox.Open;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ePending.btn_UnAssignClick(Sender: TObject);
begin
  if qry_eRecords.State = dsInsert then
    begin
      MessageDLG('Record in edit mode, please post, then Assign image(s)',mtError,[mbOK],0);
      exit;
    end;
  IF grd_Assigned.SelectedRows.Count = 0 Then
    begin
      MessageDLG('No Images Selected',mtError,[mbOK],0);
      exit;
    end;
//-------
  BusyAssignFlag := True;
  qry_eRecImages.DisableControls;
  try
    qry_eRecImages.First;
    While not qry_eRecImages.EOF do
      begin
        if grd_Assigned.SelectedRows.CurrentRowSelected Then
          begin
            qry_UpdImage.Close;
            qry_UpdImage.SQL.Clear;
            qry_UpdImage.SQL.Add('UPDATE eRecordImages SET eRecNo = null, UserID = '+QuotedStr(User));
            qry_UpdImage.SQL.Add('WHERE Trxno = '+qry_eRecImages.FieldByName('TrxNo').AsString);
            qry_UpdImage.ExecSQL;
            dm_Metrofiler.UpdateERecRepositry(qry_eRecImages.FieldByName('TrxNo').AsInteger);
          end;
        qry_eRecImages.Next;
      end; //enddo, loop through selection
    MessageDLG('Selected Images Un Assigned',mtInformation,[mbOK],0);
  finally
    BusyAssignFlag := False;
    qry_eRecImages.EnableControls;
    qry_InBox.Close;
    qry_InBox.Open;
    PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
  end;
end;

procedure Tfrm_ePending.btn_RecordCatClick(Sender: TObject);
begin
  If not(qry_eRecords.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this record before selecting a Record category!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  frm_SelRCat.ShowGen := False;
  frm_SelRCat.qry_RCat.Close;
  frm_SelRCat.qry_RCat.Parameters.ParamByName('mRecType').Value := trim(edt_RRTypeCap.Text);
  frm_SelRCat.qry_RCat.Open;
  If frm_SelRCat.ShowModal = mrOK Then
      qry_eRecords['RecordCat'] := frm_SelRCat.qry_RCat.FieldbyName('RecordCat').asString;
  frm_SelRCat.qry_RCat.Close;
end;

procedure Tfrm_ePending.qry_InBoxAfterScroll(DataSet: TDataSet);
Var
  DocType  :String;
  ImageNo,J :Integer;
  ComponentTot :Integer;
  Filename    :sTRING;
begin
  If BusyAssignFlag Then
    exit;

  If BatchCaptureMode Then
    begin
      qry_eRecords.Close;
      qry_eRecords.SQL.Text := 'SELECT * FROM eRecords WHERE ISNULL(eRecNo, 0) = '+InttoStr(Dataset.FieldByName('eRecNo').AsInteger)+' ORDER BY eRecNo';
      qry_eRecords.Open;
    end;

  If ViewSelection = 'UNASSIGN' Then
    begin
      If not Dataset.IsEmpty Then
        btn_AssignImage.Enabled := True
      else btn_AssignImage.Enabled := False;
      btn_UnAssign.Enabled := False;

//-----------
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
          If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetDocuments('ePending', ImageNo) Then
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
          If Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).GetDocuments('ePending', ImageNo) Then
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
          If Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).GetDocuments('ePending', ImageNo) Then
            begin
              Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := True;
              CurrFileName := Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).FileName;
            end;
        end;
    end;
end;

procedure Tfrm_ePending.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ePending.SaveImgPos(FieldName :String);
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

procedure Tfrm_ePending.UpdateImgPos(FieldName :String);
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

procedure Tfrm_ePending.edt_Text1Exit(Sender: TObject);
begin
  PrevDBEdit := TDBEdit(Sender).Name;
end;

procedure Tfrm_ePending.edt_Text1Enter(Sender: TObject);
begin
  NowDBEdit := TDBEdit(Sender).Name;
  If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')) <> Nil Then
    UpdateImgPos(TDBEdit(Sender).DataField);
end;

procedure Tfrm_ePending.grd_InBoxEnter(Sender: TObject);
begin
  grd_Assigned.SelectedRows.Clear;
  ViewSelection := 'UNASSIGN';
  qry_InBoxAfterScroll(qry_InBox);
end;

procedure Tfrm_ePending.grd_AssignedEnter(Sender: TObject);
begin
  grd_InBox.SelectedRows.Clear;
  ViewSelection := 'ASSIGN';
  qry_eRecImagesAfterScroll(qry_eRecImages);
end;

procedure Tfrm_ePending.qry_eRecImagesAfterScroll(DataSet: TDataSet);
Var
  DocType  :String;
  ImageNo,J :Integer;
  ComponentTot :Integer;
  Filename   :String;
begin
  If BusyAssignFlag Then
    exit;

  If (ViewSelection = 'ASSIGN') Then
    begin
      btn_AssignImage.Enabled := False;
      If not Dataset.IsEmpty Then
        btn_UnAssign.Enabled := True
      else btn_UnAssign.Enabled := False;
//-----------
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
          If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetDocuments('ePending', ImageNo) Then
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
          If Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).GetDocuments('ePending', ImageNo) Then
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
          If Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).GetDocuments('ePending', ImageNo) Then
            begin
              Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := True;
              CurrFileName := Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).FileName;
            end;
        end;
    end;
end;

procedure Tfrm_ePending.qry_InBoxAfterOpen(DataSet: TDataSet);
begin
  If Dataset.IsEmpty Then
    qry_InBoxAfterScroll(Dataset);
end;

procedure Tfrm_ePending.qry_InBoxAfterPost(DataSet: TDataSet);
begin
  dm_Metrofiler.UpdateERecRepositry(Dataset.FieldByName('TrxNo').AsInteger);
end;

procedure Tfrm_ePending.qry_eRecImagesAfterOpen(DataSet: TDataSet);
begin
  If Dataset.IsEmpty Then
    qry_eRecImagesAfterScroll(Dataset);
end;

procedure Tfrm_ePending.FormCreate(Sender: TObject);
begin
  NoVerifyFlag := false;

  Width := Screen.DesktopWidth;
  Height := Screen.DesktopHeight;
  SetBatchCaptureMode(False);

  If (frm_Console.fDocMan = 1)or(frm_Console.fWareMan = 1)or(frm_Console.fEntMan = 1) Then
    pnl_LinkedFile.Visible := True
  else pnl_LinkedFile.Visible := False;

  btn_eRecordDataManager.Visible := frm_Console.AccessRight(10);
  DeleteImage1.Visible := frm_Console.AccessRight(9);

  BusyAssignFlag := False;

  if frm_Console.eRecNo = 0 then    //ie Nothing Passed
    begin
      ViewSelection := 'UNASSIGN';
      HideFields;
  //----
      qry_eRecords.Close;
      qry_eRecords.SQL.Text := 'SELECT * FROM eRecords WHERE eRecNo = 0 ORDER BY eRecNo';
      qry_eRecords.Open;
    end
  else
    begin
      qry_eRecords.Close;
      qry_eRecords.SQL.Text := 'SELECT * FROM eRecords WHERE eRecNo = '+InttoStr(frm_Console.eRecNo)+' ORDER BY eRecNo';
      qry_eRecords.Open;
      edt_RRTypeCapChange(edt_RRTypeCap);
      If frm_Console.eRecImgNo <> 0 Then
        qry_eRecImages.Locate('TrxNo', frm_Console.eRecImgNo, []);
      If not qry_eRecImages.IsEmpty Then
        begin
          ViewSelection := 'ASSIGN';
          grd_AssignedEnter(grd_Assigned);
        end
      else
        begin
          ViewSelection := 'UNASSIGN';
          grd_InBoxEnter(grd_InBox);
        end;
//---------Fill In Branch Name
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Name FROM Branches WHERE Code = '+QuotedStr(CompsCode)+' AND Branch = '+QuotedStr(qry_eRecords.FieldByName('BRANCH').AsString));
      qry_SQL.Open;
      lbl_RBranchSrc.Caption := qry_SQL.FieldbyName('NAME').AsString;
      qry_SQL.Close;
//---------Fill In Dept Name
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Name FROM Departments WHERE Code = '+QuotedStr(CompsCode)+' AND Branch = '+QuotedStr(qry_eRecords.FieldByName('BRANCH').AsString)+' AND Department = '+QuotedStr(qry_eRecords.FieldByName('DEPARTMENT').AsString));
      qry_SQL.Open;
      lbl_RDeptSrc.Caption := qry_SQL.FieldbyName('NAME').AsString;
      qry_SQL.Close;
    end;
end;

procedure Tfrm_ePending.qry_eRecordsBeforeDelete(DataSet: TDataSet);
begin
if not(qry_eRecImages.IsEmpty) then
  begin
    MessageDLG('Please unassign all images before deleting the eRecord',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure Tfrm_ePending.dts_eRecordsDataChange(Sender: TObject;
  Field: TField);
Var
  FieldName, MatchFieldName, CheckStr  :String;
  J :Integer;
  LocalP, ScreenP: TPoint;
  DBEdit            :TDBEdit;
begin
  if qry_eRecords.IsEmpty then
    begin
      btn_AssignImage.Enabled := false;
      btn_UnAssign.Enabled := false;
    end
  else
    begin
      If NOT(qry_eRecords.State IN dsEditModes) Then
        begin
          If ViewSelection = 'UNASSIGN' Then
            begin
              btn_AssignImage.Enabled := True;
              btn_UnAssign.Enabled := False;
            end
          else If ViewSelection = 'ASSIGN' Then
            begin
              btn_AssignImage.Enabled := false;
              btn_UnAssign.Enabled := true;
            end;
        end
      else
        begin
          btn_AssignImage.Enabled := false;
          btn_UnAssign.Enabled := false;
        end;
    end;
//==========
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
          else
            DBEdit := edt_Num2;
//---------------
          If FieldName <> '' Then
            begin

              If not(NoVerifyFlag) and DatmodCap.CheckIfVerified(FieldName) Then
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
                          If ('TEXT'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_eRecords['TEXT'+InttoStr(J)] := qry_SQL.FieldByName('TEXT'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 3 Do
                        begin
                          If ('DATE'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_eRecords['DATE'+InttoStr(J)] := qry_SQL.FieldByName('DATE'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 2 Do
                        begin
                          If ('NUMBER'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_eRecords['NUMBER'+InttoStr(J)] := qry_SQL.FieldByName('NUMBER'+InttoStr(J)).Value;
                        end;
                   end;
                  qry_SQL.Close;
                end;
            end;
        end;
    end;
end;

procedure Tfrm_ePending.qry_eRecordsBeforePost(DataSet: TDataSet);
var
  J          :Integer;
  FieldNAme :String;
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

  eRecNo := Dataset.FieldbyName('eRecNo').AsInteger;
//-----Save Branch, Department, RecordType
  If BatchCaptureMode Then
    begin
      pBranch := trim(edt_RBranchCap.Text);
      pBranchName := trim(lbl_RBranchSrc.Caption);
      pDept := trim(edt_RDeptCap.Text);
      pDeptName := trim(lbl_RDeptSrc.Caption);
      pRecordType := trim(edt_RRTypeCap.Text);
      If edt_RecordCat.Visible Then
        pRecordCat := trim(edt_RecordCat.Text);
    end;
end;

procedure Tfrm_ePending.btn_ViewFileBarcodeClick(Sender: TObject);
begin
  If trim(edt_FileBarcode.Text) = '' Then
    begin
      MessageDLG('The eRecord does not have a linked File yet.',mtInformation,[mbOK],0);
      exit;
    end;
  frm_Console.act_CaptureExecute(Self);
//----
  frm_Console.fProcessing.DisplayRecord(edt_FileBarcode.Text);
end;


procedure Tfrm_ePending.btn_ViewItemBarcodeClick(Sender: TObject);
begin
  If trim(edt_ItemBarcode.Text) = '' Then
    begin
      MessageDLG('The eRecord does not have a linked Item yet.',mtInformation,[mbOK],0);
      exit;
    end;
  frm_Console.act_CaptureExecute(Self);
//----
  frm_Console.fProcessing.DisplayItem(edt_ItemBarcode.Text);
end;

procedure Tfrm_ePending.CalculatePurgeDate;
var
  RecordType  :String;
  mStartDate  :TDateTime;
  CalcDestructOnField :String;
  J, RetentonPeriod   :Integer;
begin
  If qry_eRecords.FieldByName('NilPurge').AsInteger = 1 Then
    begin
      qry_eRecords.edit;
      qry_eRecords['PurgeDate'] := Null;
      exit;
    end;
  RecordType := trim(qry_eRecords.FieldByName('RecordType').AsString);
//-------
  If RecordType = '' Then
    begin
      qry_SQL.Close;
      MessageDLG('The eRecord must have a Record Type before calculating the Purge date.',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(RecordType));
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      MessageDLG('The Record Type does not exists in the system',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  If qry_SQL.FieldByName('eDestroy').AsInteger = 1 Then
    begin
      qry_eRecords.edit;
      qry_eRecords['PurgeDate'] := Null;
      qry_eRecords['NilPurge'] := 1;
      exit;
    end;
  If (qry_SQL.FieldByName('eCalcDestructOnEntryDate').AsBoolean = False)and
     (trim(qry_SQL.FieldByName('eCalcDestructOnField').AsString) = '') Then
    begin
      qry_SQL.Close;
      MessageDLG('First complete the Record Type Definition. You need to specify on what to calculate the Purge.',mtInformation,[mbOK],0);
      exit;
    end;

  If (qry_SQL.FieldByName('eCalcDestructOnEntryDate').AsBoolean = False)Then
    begin
      CalcDestructOnField :=  trim(qry_SQL.FieldByName('eCalcDestructOnField').AsString);

      mStartDate := 0;
      For J := 11 to 13 Do
        begin
          If trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
            begin
              If J = 11 Then
                mStartDate := qry_eRecords.FieldbyName('Date1').asDateTime;
              If J = 12 Then
                mStartDate := qry_eRecords.FieldbyName('Date2').asDateTime;
              If J = 13 Then
                mStartDate := qry_eRecords.FieldbyName('Date3').asDateTime;
            end;
        end;
    end
  else If qry_SQL.FieldByName('eCalcDestructOnEntryDate').AsBoolean Then
    begin
      mStartDate := qry_eRecords.FieldbyName('CaptureDate').asDateTime;
    end;

  If qry_SQL.FieldbyName('eRetenTionPeriod').Value = Null Then
    begin
      qry_SQL.Close;
      MessageDLG('First complete the Record Type Definition. You need to specify the Retention Period.',mtInformation,[mbOK],0);
      exit;
    end;


   If mStartDate = 0 Then
     begin
       qry_eRecords.edit;
       qry_eRecords['PurgeDate'] := Null;
       exit;
     end;

   RetentonPeriod:= qry_SQL.FieldbyName('eRetenTionPeriod').asInteger;

   qry_eRecords.edit;
   qry_eRecords['PurgeDate'] := Trunc(IncMonth(mStartDate,RetentonPeriod));
end;

procedure Tfrm_ePending.DBCheckBox1Click(Sender: TObject);
begin
 If (qry_eRecords.State in dsEditModes)and(DBCheckBox1.Checked) Then
   qry_eRecords['PurgeDate'] := Null;
end;

procedure Tfrm_ePending.btn_CalcPurgeDateClick(Sender: TObject);
begin
  if not (qry_eRecords.State in dsEditModes) then
    begin
      MessageDLG('The record must be in edit mode before calculating the destruction date',mtInformation,[mbOK],0);
      exit;
    end;
  CalculatePurgeDate;
end;

procedure Tfrm_ePending.DisplayThumbnail(tImageNo  :Integer);
begin
end;

function Tfrm_ePending.GetOLEDocuments(ImageNo :Integer):Boolean;
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
  CurrFileName := dm_Metrofiler.ReadERecFromRepositry('ePending', ImageNo);
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

procedure Tfrm_ePending.btn_eRecordDataManagerClick(Sender: TObject);
begin
  btn_eRecordDataManager.Enabled := False;
  Application.CreateForm(Tfrm_eRecDataMan, frm_eRecDataMan);
end;

procedure Tfrm_ePending.btn_ScanClick(Sender: TObject);
function GetTempFilename:String;
var
  D,M,Y,H,MM,S,MS      :Word;
  sFile                :String;
begin
  DecodeDate(Now, Y,M,D);
  DecodeTime(Now, H, MM, S, MS);
  sFile := dm_Metrofiler.GetTempDir;
  sFile := sFile + InttoStr(Y);
  sFile := sFile + dm_Metrofiler.LeftPad(M, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(D, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(H, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(MM, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(S, 2, '0');
  Result := sFile;
end;


var
  ini                  :TINIFile;
  Filename             :String;
  MFileName            :String;
  CFileName            :String;
  j, i, Tot            :Integer;
  CompressionType      :Integer;
  ImportERecNo         :Integer;
begin
  ImportERecNo := 0;
//  If qry_eRecords.FieldByName('eRecNo').AsInteger > 0 Then
//    ImportERecNo := qry_eRecords.FieldByName('eRecNo').AsInteger;

  ImageEnMView1.Clear;
  If frm_ScannerConfig.Execute <> mrOK Then
    exit;

  If frm_ScannerConfig.rgrp_OutputMode.ItemIndex = 0 Then //Multi
    begin
      ImageEnMView1.MIO.TWainParams.VisibleDialog := True;
      If not ImageEnMView1.MIO.Acquire() Then
        exit;
//================================TIF===========================================
      If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 0 Then//tif
        begin
          For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
            begin
//---------------First set optimum Compression----------------------------------
              If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
                begin
                  ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_G4FAX;
                end
              else
                begin
                  ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_JPEG;
                  ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
                end;
            end;
          FileName := GetTempFilename;
          CFilename := Filename + '_' + dm_Metrofiler.LeftPad(1, 6, '0');
          CFileName := CFileName + '.TIF';
          try
            ImageEnMView1.MIO.SaveToFileTIFF(CFilename);
            dm_Metrofiler.SaveERecToRepositry(ImportERecNo, CFileName, user);
            qry_InBox.Close;
            qry_InBox.Open;
            PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
          finally
            If FileExists(CFileName) Then    //Remove Temp Image
              DeleteFile(CFileName);
          end;
        end
//================================PDF===========================================
      else If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 1 Then//PDF
        begin
          For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
            begin
//---------------First set optimum Compression----------------------------------
              If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
                begin
                  ImageEnMView1.MIO.Params[I].PDF_Compression := ioPDF_G4FAX;
                end
              else
                begin
                  ImageEnMView1.MIO.Params[I].PDF_Compression := ioPDF_JPEG;
                  ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
                end;
            end;
          FileName := GetTempFilename;
          CFilename := Filename + '_' + dm_Metrofiler.LeftPad(1, 6, '0');
          CFileName := CFileName + '.PDF';
          try
            ImageEnMView1.MIO.SaveToFilePDF(CFilename);
            dm_Metrofiler.SaveERecToRepositry(ImportERecNo, CFileName, USER);
            qry_InBox.Close;
            qry_InBox.Open;
            PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
          finally
            If FileExists(CFileName) Then    //Remove Temp Image
              DeleteFile(CFileName);
          end;
        end;
    end
  else If frm_ScannerConfig.rgrp_OutputMode.ItemIndex = 1 Then //Single
    begin
      ImageEnMView1.MIO.TWainParams.VisibleDialog := True;
      If not ImageEnMView1.MIO.Acquire() Then
        exit;
      For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
        begin
//---------------First set optimum Compression----------------------------------
          If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
            begin
              ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_G4FAX;
            end
          else
            begin
              ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_JPEG;
              ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
            end;
        end;
      FileName := GetTempFilename;
      MFileName := FileName + '_Temp';
      MFileName := MFileName + '.TIF';
      try
        Tot := ImageEnMView1.ImageCount;
        ImageEnMView1.MIO.SaveToFileTIFF(MFilename);
        ImageEnMView1.Clear;
//================================TIF===========================================
        If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 0 Then//tif
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.TIF';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFileTIFF(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(ImportERecNo, CFileName, user);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
//================================PDF===========================================
        else if frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 1 Then//pdf
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.PDF';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFilePDF(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(ImportERecNo, CFileName, user);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
//================================JPG===========================================
        else if frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 2 Then//JPG
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.JPG';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFileJPEG(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(ImportERecNo, CFileName, user);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
      finally
        ImageEnView1.Clear;
        If FileExists(MFileName) Then    //Remove Temp Image
          DeleteFile(MFileName);
      end;
      qry_InBox.Close;
      qry_InBox.Open;
      PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
    end;
end;

procedure Tfrm_ePending.btn_SelFilesClick(Sender: TObject);
Var
  J               :Integer;
  FileName        :String;
  ImportERecNo         :Integer;
begin
  ImportERecNo := 0;
//  If qry_eRecords.FieldByName('eRecNo').AsInteger > 0 Then
//    ImportERecNo := qry_eRecords.FieldByName('eRecNo').AsInteger;

  If not odlg_Pic.Execute Then
    exit;

  Screen.Cursor := crHourglass;
  frm_Progress.Show;
  try
    For J := 0 to odlg_Pic.Files.Count-1 Do
      begin
        frm_Progress.Prog(Round(((J+1)/odlg_Pic.Files.Count)*100));
        If frm_Progress.Cancelled Then
          break;
        Application.ProcessMessages;
        FileName := ExpandUNCFileName(odlg_Pic.Files.Strings[J]);
//--------------
        dm_Metrofiler.SaveERecToRepositry(ImportERecNo, FileName, user);
      end;
    Messagedlg('Imported '+InttoStr(odlg_Pic.Files.Count)+' eRecords.', mtInformation, [mbOK], 0);
  finally
    frm_Progress.Hide;
    qry_InBox.Close;
    qry_InBox.Open;
    PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ePending.btn_SelFolderClick(Sender: TObject);
Var
  ListFileNames   :TStringList;
  J               :Integer;
  FileName        :String;
  ImportERecNo         :Integer;
begin
  ImportERecNo := 0;
//  If qry_eRecords.FieldByName('eRecNo').AsInteger > 0 Then
//    ImportERecNo := qry_eRecords.FieldByName('eRecNo').AsInteger;

  frm_AddImages.Caption := 'Add eRecords from Files.';
  frm_AddImages.chk_InclSub.Checked := False;
  frm_AddImages.edt_Folder.Text := '';
  If frm_AddImages.ShowModal = mrOK Then
    begin
      Screen.Cursor := crHourglass;
      frm_Progress.Show;
      ListFileNames   := TStringList.Create;
      ListFileNames.Clear;
      try
        frm_AddImages.GetImageFileNames(PChar(frm_AddImages.edt_Folder.Text), ListFileNames);
        For J := 0 to ListFileNames.Count-1 Do
          begin
            frm_Progress.Prog(Round(((J+1)/ListFileNames.Count)*100));
            If frm_Progress.Cancelled Then
              break;
            Application.ProcessMessages;
            FileName := ExpandUNCFileName(ListFileNames.Strings[J]);
//--------------
            dm_Metrofiler.SaveERecToRepositry(ImportERecNo, FileName, User);
          end;
        Messagedlg('Imported '+InttoStr(ListFileNames.Count)+' eRecords.', mtInformation, [mbOK], 0);
      finally
        ListFileNames.Clear;
        ListFileNames.Free;
        frm_Progress.Hide;
        qry_InBox.Close;
        qry_InBox.Open;
        PopulateeRecordImageList(qry_eRecords.FieldByname('eRecNo').AsInteger);
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure Tfrm_ePending.btn_BatchCaptureClick(Sender: TObject);
begin
  If btn_BatchCapture.Caption = 'Batch Capture Records' Then
    begin
      btn_BatchCapture.Caption := 'Normal Capture Records';
      SetBatchCaptureMode(True);
    end
  else
    begin
      btn_BatchCapture.Caption := 'Batch Capture Records';
      SetBatchCaptureMode(False);
    end;
end;


procedure Tfrm_ePending.nav_eRecEditBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
Var
  MsResult   :Word;
begin
  If BatchCaptureMode Then
    begin
      If (button = nbPrior)or(button = nbNext) Then
        begin
          If qry_eRecords.State in dsEditModes Then
            begin
              MsResult := Messagedlg('Save Changes?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
              If msResult = mrCancel Then
                begin
                  Abort;
                  exit;
                end;
              If msResult = mrNo Then
                begin
                  qry_eRecords.Cancel;
                  qry_Inbox.Cancel;
                end;
              If msResult = mrYes Then
                begin
                  qry_eRecords.Post;
                  qry_Inbox['eRecNo'] := qry_eRecords.FieldbyName('eRecNo').AsInteger;
                  qry_Inbox.Post;
                end;
            end;
        end;
      If button = nbDelete Then
        begin
          MsResult := Messagedlg('Are you Sure you want delete this eRecord?', mtConfirmation, [mbYes, mbNo], 0);
          If msResult = mrNo Then
            begin
              Abort;
              exit;
            end;
          If msResult = mrYes Then
            begin
              If qry_eRecords.State in dsEditModes Then
                qry_eRecords.Cancel;
              If not qry_eRecords.IsEmpty Then
                qry_eRecords.Delete;
            end;
        end;
      If button = nbEdit Then
        begin
          If not (qry_eRecords.State in dsEditModes) Then
            qry_eRecords.edit;
        end;
      If button = nbCancel Then
        begin
          If qry_eRecords.State in dsEditModes Then
            qry_eRecords.Cancel;
        end;
      If button = nbPost Then
        begin
          qry_eRecords.Post;
          qry_Inbox['eRecNo'] := qry_eRecords.FieldbyName('eRecNo').AsInteger;
        end;
    end;
end;

function Tfrm_ePending.SetBatchCaptureMode(Mode :Boolean):Boolean;
Var
  eRecNos   :String;
begin
  If Mode Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT TrxNo FROM eRecordImages WHERE UserId = '+QuotedStr(User));
      qry_SQL.SQL.Add('AND ISNULL(eRecNo, 0) = 0');
      qry_SQL.Open;
      If qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          Messagedlg('There are no eRecords to Batch Capture.', mtInformation, [mbOK], 0);
          Result := False;
          exit;
        end;
      eRecNos := '(';
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          eRecNos := eRecNos + qry_SQL.FieldbyName('TrxNo').AsString+',';
          qry_SQL.Next;
        end;
      Delete(eRecNos, length(eRecNos), 1);
      eRecNos := eRecNos + ')';
      qry_SQL.Close;

      ViewSelection := 'UNASSIGN';
      BatchCaptureMode := True;
      pnl_Assign.Visible := False;
      Splitter_Assign.Visible := False;

      qry_InBox.Close;
      qry_InBox.SQL.Clear;
      qry_InBox.SQL.Add('SELECT TrxNo, DocName, ImgComment, UserId, eRecNo');
      qry_InBox.SQL.Add('FROM eRecordImages');
      qry_InBox.SQL.Add('WHERE UserId = '+QuotedStr(User));
      qry_InBox.SQL.Add('AND TrxNo IN '+eRecNos);
      qry_InBox.Open;
//---------
      btn_AssignImage.Visible := False;
      btn_UnAssign.Visible := False;
      nav_InBox.Visible := False;
      nav_eRecEdit.DataSource := dts_InBox;
      grd_Inbox.Columns.Items[0].Title.Caption := 'My ePending Box';
      nav_eRecEdit.VisibleButtons := [nbPrior, nbNext, nbEdit, nbDelete, nbCancel,nbPost];
      nav_eRecEdit.BtnClick(nbEdit);
    end
  else
    begin
      ViewSelection := 'UNASSIGN';

      BatchCaptureMode := False;
      pnl_Assign.Visible := True;
      Splitter_Assign.Visible := True;

      qry_InBox.Close;
      qry_InBox.SQL.Clear;
      qry_InBox.SQL.Add('SELECT TrxNo, DocName, ImgComment, UserId, eRecNo');
      qry_InBox.SQL.Add('FROM eRecordImages');
      qry_InBox.SQL.Add('WHERE UserId = '+QuotedStr(User));
      qry_InBox.SQL.Add('AND ISNULL(eRecNo, 0) = 0');
      qry_InBox.Open;
//---------
      btn_AssignImage.Visible := True;
      btn_UnAssign.Visible := True;
      nav_InBox.Visible := True;
      nav_eRecEdit.DataSource := dts_eRecords;
      grd_Inbox.Columns.Items[0].Title.Caption := 'My ePending Box';
      nav_eRecEdit.VisibleButtons := [nbPrior, nbNext, nbInsert, nbEdit, nbDelete, nbCancel,nbPost];
    end;
  Result := True;
end;

procedure Tfrm_ePending.SpeedButton1Click(Sender: TObject);
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

procedure Tfrm_ePending.PopulateeRecordImageList(eRecordNo :Integer);
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

end.
