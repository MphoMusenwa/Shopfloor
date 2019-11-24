//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit OffSiteExporttoFile;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls,
  Grids,DBGrids, Mask, Qrctrls, quickrpt, FileCtrl, ImgList, ADODB, DirDlg,
  Variants;

type
  Tfrm_OffsiteExporttoFile = class(TForm)
    Panel1: TPanel;
    qry_Record: TADOQuery;
    qry_RecordType: TADOQuery;
    qry_FilesSearch: TADOQuery;
    dts_FilesSearch: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    editPickingSend: TBitBtn;
    edtPickCancel: TBitBtn;
    btn_Print: TBitBtn;
    TabSheet3: TTabSheet;
    rep_Result: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    ql_Text1: TQRLabel;
    ql_Text2: TQRLabel;
    ql_Text3: TQRLabel;
    ql_Text4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    qrlbl4: TQRDBText;
    qrlbl3: TQRDBText;
    qrlbl2: TQRDBText;
    qrlbl1: TQRDBText;
    tv_PickingSlip: TTreeView;
    ImageList1: TImageList;
    qry_CheckRecord: TADOQuery;
    qry_GetRecord: TADOQuery;
    qry_GetRecordType: TADOQuery;
    qry_TreeRecords: TADOQuery;
    qry_CheckContainer: TADOQuery;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    grd_ResultRecords: TDBGrid;
    DBNavigator1: TDBNavigator;
    btn_SelectAll: TBitBtn;
    Label10: TLabel;
    qry_Export: TADOQuery;
    qry_UpdContainer: TADOQuery;
    qry_GenIns: TADOQuery;
    Bevel1: TBevel;
    Label4: TLabel;
    Label6: TLabel;
    edt_ReContainer: TEdit;
    btn_ReExport: TBitBtn;
    btn_Close: TSpeedButton;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    btn_Search: TBitBtn;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_LocNo: TEdit;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPickCancelClick(Sender: TObject);
    procedure btn_SelectAllClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure tv_PickingSlipDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tv_PickingSlipDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure rgrp_SearchTypeClick(Sender: TObject);
    procedure rep_ResultBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure editPickingSendClick(Sender: TObject);
    procedure btn_ReExportClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExportDatasetContainer(TheTable :TADOQuery; Filename, BriefDescription  :String; NoFiles :Integer);
    procedure ExportDatasetFiles(TheTable :TADOQuery; Filename  :String);
    procedure ExportDatasetItems(TheTable :TADOQuery; Filename  :String);
  public
    { Public declarations }
  end;

var
  frm_OffsiteExporttoFile  :Tfrm_OffsiteExporttoFile;

implementation

uses main, SelBranch, SelDept, SelRType, SelWHouse,
  SelContainer, SelOffSiteBoxDetails, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_OffsiteExporttoFile.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := Tabsheet1;
  Tabsheet3.TabVisible := False;
end;

procedure Tfrm_OffsiteExporttoFile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_ExportFile.Enabled := true;
  Action := caFree;
end;


procedure Tfrm_OffsiteExporttoFile.edtPickCancelClick(Sender: TObject);
begin
  tv_PickingSlip.Items.Clear;
end;

procedure Tfrm_OffsiteExporttoFile.btn_SearchClick(Sender: TObject);
var
  mViewStr       :String;
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
  if (length(edt_WHouse.Text) = 0) then
    begin
      MessageDlg('Please select the Filing Area!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_LocNo.Text) = 0) then
    begin
      MessageDlg('Please enter a Location!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;

  mViewStr := 'SELECT ';
  mViewStr := mViewStr + 'Filenumber, IssueStatus, IssuedTo, IssuedOn, FileType AS "RecordType", Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ContainerNo AS "Container" '+#13;
  mViewStr := mViewStr + 'FROM Files'+#13;
  mViewStr := mViewStr + 'WHERE Code = '+QuotedStr(CompsCode)+#13;
  mViewStr := mViewStr + 'AND Branch = '+QuotedStr(edt_Branch.Text)+#13;
  mViewStr := mViewStr + 'AND Department = '+QuotedStr(edt_Dept.Text)+#13;
  mViewStr := mViewStr + 'AND Warehouse = '+QuotedStr(edt_WHouse.Text)+#13;
  mViewStr := mViewStr + 'AND LocNo = '+QuotedStr(edt_LocNo.Text)+#13;
  mViewStr := mViewStr + 'AND IssueStatus = ''IN'''+#13;
  mViewStr := mViewStr + 'ORDER BY Filenumber';
//==============================================================================
//==============================Build the Query=================================
//==============================================================================
  qry_FilesSearch.Close;
  qry_FilesSearch.SQL.Clear;
  qry_FilesSearch.SQL.Add(mViewStr);
//--------
  Screen.Cursor := CrHourglass;
  try
    qry_FilesSearch.Open;
  finally
    Screen.Cursor := CrDefault;
  end;

  if qry_FilesSearch.isEmpty then
    Begin
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end
  else
    begin
      frm_Console.AutoSizeNewColumns(grd_ResultRecords);
      PageControl1.ActivePage := Tabsheet2;
    end;
end;

procedure Tfrm_OffsiteExporttoFile.btn_SelBranchClick(Sender: TObject);
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

procedure Tfrm_OffsiteExporttoFile.btn_SelDeptClick(Sender: TObject);
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

procedure Tfrm_OffsiteExporttoFile.btn_SelectAllClick(Sender: TObject);
Var
  RTemp                   :TTreeNode;
  J                       :Integer;
begin
  Screen.Cursor := crHourglass;
  qry_FilesSearch.First;
  qry_FilesSearch.DisableControls;
  While not qry_FilesSearch.EOF Do
    begin
      Application.ProcessMessages;
      RTemp := tv_PickingSlip.Items.Add(nil, qry_FilesSearch.FieldbyName('FILENUMBER').asString);
      RTemp.ImageIndex := 1;
      RTemp.SelectedIndex := 1;
      RTemp.DeleteChildren;
//==============================================================================
//==============================================================================
//==============================================================================
      qry_FilesSearch.Next;
    end;
  qry_FilesSearch.First;
  qry_FilesSearch.EnableControls;
  Screen.Cursor := crDefault;
  For J := 0 to tv_PickingSlip.Items.Count-1 Do
    If tv_PickingSlip.Items.Item[J].Level = 0 Then
      tv_PickingSlip.Items.Item[J].Expand(True);
end;

procedure Tfrm_OffsiteExporttoFile.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_OffsiteExporttoFile.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_OffsiteExporttoFile.btn_PrintClick(Sender: TObject);
begin
  rep_Result.Print;
end;

procedure Tfrm_OffsiteExporttoFile.tv_PickingSlipDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  If (Source = grd_ResultRecords)Then
    Accept := True
  else Accept := False;
end;

procedure Tfrm_OffsiteExporttoFile.tv_PickingSlipDragDrop(Sender, Source: TObject;
  X, Y: Integer);
Var
  RTemp                   :TTreeNode;
  J                       :Integer;
  Flag                    :Boolean;
begin
  If Source = grd_ResultRecords Then
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
//==============================================================================
    end;
  For J := 0 to tv_PickingSlip.Items.Count-1 Do
    If tv_PickingSlip.Items.Item[J].Level = 0 Then
      tv_PickingSlip.Items.Item[J].Expand(True);
end;

procedure Tfrm_OffsiteExporttoFile.rgrp_SearchTypeClick(Sender: TObject);
begin
  edt_WHouse.Text := '';
  lbl_WHouse.Caption := '---';
end;

procedure Tfrm_OffsiteExporttoFile.rep_ResultBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  If qry_FilesSearch.FieldCount > 4 Then
    qrlbl1.DataField := qry_FilesSearch.Fields[3].Fieldname
  else qrlbl1.DataField := '';
  If qry_FilesSearch.FieldCount > 5 Then
    qrlbl2.DataField := qry_FilesSearch.Fields[4].Fieldname
  else qrlbl2.DataField := '';
  If qry_FilesSearch.FieldCount > 6 Then
    qrlbl3.DataField := qry_FilesSearch.Fields[5].Fieldname
  else qrlbl3.DataField := '';
  If qry_FilesSearch.FieldCount > 7 Then
    qrlbl4.DataField := qry_FilesSearch.Fields[6].Fieldname
  else qrlbl4.DataField := '';
end;

procedure Tfrm_OffsiteExporttoFile.editPickingSendClick(Sender: TObject);
Var
  OffSiteContainer :String;
  OffSiteBoxnumber :String;
  J                :Integer;
  Exportpath       :String;
  BriefDescription :String;
  NoFiles          :Integer;
  IssuedTo         :String;
begin
  If tv_PickingSlip.Items.Count <= 0 Then
    begin
      Messagedlg('Please select the Records first!', mtInformation, [mbOK], 0);
      exit;
    end;
  If Messagedlg('Do you want to flag the record(s) as Off-Site?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  If not (SelectDirectory('Select location for Export.',Exportpath,'',Exportpath)) Then
    exit;
  If copy(ExportPath, length(Exportpath), 1) <> '\' Then
    Exportpath := Exportpath + '\';

  frm_SelOffSiteBoxDetails.Branch := edt_Branch.Text;
  frm_SelOffSiteBoxDetails.Department := edt_Dept.Text;
  IF not(frm_SelOffSiteBoxDetails.ShowModal = mrOK) Then
    exit;

  IssuedTo := trim(FirstName+' '+Surname);
//==========================UPDATE Container====================================
  OffSiteContainer := frm_SelOffSiteBoxDetails.edt_Container.Text;
  OffSiteBoxnumber := frm_SelOffSiteBoxDetails.edt_Boxnumber.Text;
  qry_UpdContainer.Close;
  qry_UpdContainer.SQL.Clear;
  qry_UpdContainer.SQL.Add('SELECT Container FROM Containers Where Container = :CN');
  qry_UpdContainer.Parameters.ParamByName('CN').Value := OffSiteContainer;
  qry_UpdContainer.Open;
  If qry_UpdContainer.IsEmpty Then
    begin
      qry_GenIns.Close;
      qry_GenIns.SQL.Clear;
      qry_GenIns.SQL.Add('INSERT INTO Containers (Container, Boxnumber, IssueStatus, FileType, ContType, Code, Branch, Department, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2,');
      qry_GenIns.SQL.Add('                        IssuedTo, IssuedOn, IssuedUserID, ReturnedOn, ItTxNo, Warehouse, LocNo, UpdatedBy, UpdatedOn)');
      qry_GenIns.SQL.Add('VALUES(:Container, :Boxnumber, :IssueStatus, :FileType, :ContType, :Code, :Branch, :Department, :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2,');
      qry_GenIns.SQL.Add('       :IssuedTo, GetDate(), :IssuedUserID, NULL, NULL, NULL, NULL, '+QuotedStr(User)+', GETDATE())');
      qry_GenIns.Parameters.ParamByName('Container').Value := OffSiteContainer;
      qry_GenIns.Parameters.ParamByName('Boxnumber').Value := frm_SelOffSiteBoxDetails.edt_Boxnumber.Text;
      qry_GenIns.Parameters.ParamByName('IssueStatus').Value := 'MET';
      qry_GenIns.Parameters.ParamByName('FileType').Value := frm_SelOffSiteBoxDetails.edt_RecordType.Text;
      qry_GenIns.Parameters.ParamByName('ContTYpe').Value := frm_SelOffSiteBoxDetails.cb_ContType.Text;
      qry_GenIns.Parameters.ParamByName('Code').Value := CompsCode;
      qry_GenIns.Parameters.ParamByName('Branch').Value := frm_SelOffSiteBoxDetails.Branch;
      qry_GenIns.Parameters.ParamByName('Department').Value := frm_SelOffSiteBoxDetails.Department;
      For J := 1 to 10 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text)
          else
            begin
              qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).DataType := ftString;
              qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := Null;
            end;
        end;

      For J := 1 to 3 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := StrtoDate(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text))
          else
            begin
              qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).DataType := ftDateTime;
              qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := Null;
            end;
        end;
      For J := 1 to 2 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := StrtoInt(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text))
          else
            begin
              qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).DataType := ftInteger;
              qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := Null;
            end;

        end;
      qry_GenIns.Parameters.ParamByName('IssuedUserID').Value := User;
      qry_GenIns.Parameters.ParamByName('IssuedTo').Value := IssuedTo;

      qry_GenIns.ExecSQL;
    end
  else
    begin
      qry_GenIns.Close;
      qry_GenIns.SQL.Clear;
      qry_GenIns.SQL.Add('UPDATE Containers SET');
      qry_GenIns.SQL.Add('  Boxnumber = :Boxnumber,');
      qry_GenIns.SQL.Add('  FileType = :FileType,');
      qry_GenIns.SQL.Add('  ContType = :ContType,');
      qry_GenIns.SQL.Add('  IssueStatus = :IssueStatus,');
      qry_GenIns.SQL.Add('  Text1 = :Text1,');
      qry_GenIns.SQL.Add('  Text2 = :Text2,');
      qry_GenIns.SQL.Add('  Text3 = :Text3,');
      qry_GenIns.SQL.Add('  Text4 = :Text4,');
      qry_GenIns.SQL.Add('  Text5 = :Text5,');
      qry_GenIns.SQL.Add('  Text6 = :Text6,');
      qry_GenIns.SQL.Add('  Text7 = :Text7,');
      qry_GenIns.SQL.Add('  Text8 = :Text8,');
      qry_GenIns.SQL.Add('  Text9 = :Text9,');
      qry_GenIns.SQL.Add('  Text10 = :Text10,');
      qry_GenIns.SQL.Add('  Date1 = :Date1,');
      qry_GenIns.SQL.Add('  Date2 = :Date2,');
      qry_GenIns.SQL.Add('  Date3 = :Date3,');
      qry_GenIns.SQL.Add('  Number1 = :Number1,');
      qry_GenIns.SQL.Add('  Number2 = :Number2,');
      qry_GenIns.SQL.Add('  IssuedTo = :IssuedTo,');
      qry_GenIns.SQL.Add('  IssuedOn = GetDate(),');
      qry_GenIns.SQL.Add('  IssuedUserID = :IssuedUserID,');
      qry_GenIns.SQL.Add('  ReturnedOn = NULL,');
      qry_GenIns.SQL.Add('  ItTxNo = NULL,');
      qry_GenIns.SQL.Add('  Warehouse = NULL,');
      qry_GenIns.SQL.Add('  LocNo = NULL, UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
      qry_GenIns.SQL.Add('WHERE Container = :Container');

      qry_GenIns.Parameters.ParamByName('Container').Value := frm_SelOffSiteBoxDetails.edt_Container.Text;
      qry_GenIns.Parameters.ParamByName('Boxnumber').Value := frm_SelOffSiteBoxDetails.edt_Boxnumber.Text;
      qry_GenIns.Parameters.ParamByName('IssueStatus').Value := 'MET';
      qry_GenIns.Parameters.ParamByName('FileType').Value := frm_SelOffSiteBoxDetails.edt_RecordType.Text;
      qry_GenIns.Parameters.ParamByName('ContType').Value := frm_SelOffSiteBoxDetails.cb_ContType.Text;
      For J := 1 to 10 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text)
          else
            begin
              qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).DataType := ftString;
              qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := Null;
            end;
        end;

      For J := 1 to 3 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := StrtoDate(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text))
          else
            begin
              qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).DataType := ftDateTime;
              qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := Null;
            end;
        end;
      For J := 1 to 2 Do
        begin
          If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text) <> '' Then
            qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := StrtoInt(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text))
          else
            begin
              qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).DataType := ftInteger;
              qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := Null;
            end;

        end;
      qry_GenIns.Parameters.ParamByName('IssuedUserID').Value := User;
      qry_GenIns.Parameters.ParamByName('IssuedTo').Value := IssuedTo;

      qry_GenIns.ExecSQL;
    end;
//==========================UPDATE Files & Items================================
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('CREATE TABLE #ExportList (Filenumber varchar(20) Primary Key)');
  qry_Export.ExecSQL;
  try
    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Add('DELETE FROM #ExportList');
    qry_Export.ExecSQL;

    Screen.Cursor := crHourglass;
    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Add('INSERT INTO #ExportList(Filenumber) VALUES(:mFile)');
    For J := 0 to tv_PickingSlip.Items.Count-1 Do
      begin
        qry_Export.Parameters.ParamValues['mFile'] := trim(tv_PickingSlip.Items.Item[J].Text);
        qry_Export.ExecSQL;
      end;
    Screen.Cursor := crDefault;
    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Add('UPDATE Files SET IssueStatus = ''MET'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, IssuedUserID = '+QuotedStr(User)+', IssuedTo = '+QuotedStr(trim(FirstName+' '+Surname))+',');
    qry_Export.SQL.Add('ContainerNo = '+QuotedStr(OffSiteContainer)+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
    qry_Export.SQL.Add('WHERE Filenumber IN (SELECT Filenumber FROM #ExportList)');
    Screen.Cursor := crHourglass;
    qry_Export.ExecSQL;
    Screen.Cursor := crDefault;

    qry_Export.Close;
    qry_Export.SQL.Clear;
    qry_Export.SQL.Add('UPDATE Items SET Status = ''MET'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, IssuedUserID = '+QuotedStr(User)+', IssuedTo = '+QuotedStr(trim(FirstName+' '+Surname))+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
    qry_Export.SQL.Add('WHERE Filenumber IN (SELECT Filenumber FROM #ExportList)');
    Screen.Cursor := crHourglass;
    qry_Export.ExecSQL;
    Screen.Cursor := crDefault;
  finally
    try
      qry_Export.Close;
      qry_Export.SQL.Clear;
      qry_Export.SQL.Add('DROP TABLE #ExportList');
      qry_Export.ExecSQL;
    except
    end;
  end;
//=============================Export===========================================
//--------Export Container
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT TOP 1 FileType FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := frm_SelOffSiteBoxDetails.edt_Container.Text;
  qry_Export.Open;
  BriefDescription := trim(qry_Export.FieldbyName('FileType').asString);
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT Count(*) FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := frm_SelOffSiteBoxDetails.edt_Container.Text;
  qry_Export.Open;
  NoFiles := qry_Export.Fields[0].asInteger;
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Container, Boxnumber, '+QuotedStr(CompsCode)+'+Branch AS "Code", Department, FileType AS "BoxDescription", ContType AS "BoxType", ');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Containers');
  qry_Export.SQL.Add('WHERE Container = :Container');
  qry_Export.Parameters.ParamValues['Container'] := frm_SelOffSiteBoxDetails.edt_Container.Text;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetContainer(qry_Export, ExportPath+frm_SelOffSiteBoxDetails.edt_Container.Text+'_Box.CSV', BriefDescription, NoFiles);
//--------Export Files
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Filenumber, ContainerNo AS "Container", '+QuotedStr(OffSiteBoxnumber)+' AS "Boxnumber",');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Files');
  qry_Export.SQL.Add('WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := frm_SelOffSiteBoxDetails.edt_Container.Text;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetFiles(qry_Export, ExportPath+frm_SelOffSiteBoxDetails.edt_Container.Text+'_Files.CSV');
//--------Export Items
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Itemnumber AS "ItemBarcode", Filenumber, '+QuotedStr(OffSiteContainer)+' AS "Container", '+QuotedStr(OffSiteBoxnumber)+' AS "Boxnumber",');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Items');
  qry_Export.SQL.Add('WHERE Filenumber IN (SELECT Filenumber FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET'')');
  qry_Export.Parameters.ParamValues['Container'] := frm_SelOffSiteBoxDetails.edt_Container.Text;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetItems(qry_Export, ExportPath+frm_SelOffSiteBoxDetails.edt_Container.Text+'_Items.CSV');
  qry_Export.Close;
  Messagedlg('Export successful.', mtInformation, [mbOK], 0);
  tv_PickingSlip.Items.clear;
  qry_FilesSearch.Close;
end;

procedure Tfrm_OffsiteExporttoFile.ExportDatasetContainer(TheTable: TADOQuery; Filename, BriefDescription  :String; NoFiles:Integer);
var
  CSVFile     :TextFile;
begin
  If FileExists(FileName) Then
    DeleteFile(FileName);
//==================================Create Table================================
  try
    AssignFile(CSVFile,  FileName);
    ReWrite(CSVFile);
    Write(CSVFile,'"BoxNumber",');
    Write(CSVFile,'"Code",');
    Write(CSVFile,'"Department",');
    Write(CSVFile,'"BoxType",');
    Write(CSVFile,'"NoFiles",');
    Write(CSVFile,'"BriefDescription",');
    Write(CSVFile,'"BoxDescription",');
    Write(CSVFile,'"Text1",');
    Write(CSVFile,'"Text2",');
    Write(CSVFile,'"Text3",');
    Write(CSVFile,'"Text4",');
    Write(CSVFile,'"Text5",');
    Write(CSVFile,'"Text6",');
    Write(CSVFile,'"Text7",');
    Write(CSVFile,'"Text8",');
    Write(CSVFile,'"Text9",');
    Write(CSVFile,'"Text10",');
    Write(CSVFile,'"Date1",');
    Write(CSVFile,'"Date2",');
    Write(CSVFile,'"Date3",');
    Write(CSVFile,'"Number1",');
    Write(CSVFile,'"Number2"');
    Writeln(CSVFile);

    TheTable.First;
    While not TheTable.EOF do
      begin
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Boxnumber').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Code').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Department').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('BoxType').asString)+'",');
        Write(CSVFile,InttoStr(NoFiles)+',');
        Write(CSVFile,'"'+BriefDescription+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('BoxDescription').asString)+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text1').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text2').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text3').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text4').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text5').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text6').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text7').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text8').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text9').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text10').asString+'",');
        Write(CSVFile,TheTable.FieldbyName('Date1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date2').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date3').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number2').asString);
        Writeln(CSVFile);

        TheTable.Next;
      end;
  finally
    TheTable.First;
    CloseFile(CSVFile);
  end;
end;

procedure Tfrm_OffsiteExporttoFile.ExportDatasetFiles(TheTable: TADOQuery; Filename  :String);
var
  CSVFile     :TextFile;
begin
  If FileExists(FileName) Then
    DeleteFile(FileName);
//==================================Create Table================================
  try
    AssignFile(CSVFile,  FileName);
    ReWrite(CSVFile);
    Write(CSVFile,'"FileNumber",');
    Write(CSVFile,'"BoxNumber",');
    Write(CSVFile,'"Text1",');
    Write(CSVFile,'"Text2",');
    Write(CSVFile,'"Text3",');
    Write(CSVFile,'"Text4",');
    Write(CSVFile,'"Text5",');
    Write(CSVFile,'"Text6",');
    Write(CSVFile,'"Text7",');
    Write(CSVFile,'"Text8",');
    Write(CSVFile,'"Text9",');
    Write(CSVFile,'"Text10",');
    Write(CSVFile,'"Date1",');
    Write(CSVFile,'"Date2",');
    Write(CSVFile,'"Date3",');
    Write(CSVFile,'"Number1",');
    Write(CSVFile,'"Number2"');
    Writeln(CSVFile);

    TheTable.First;
    While not TheTable.EOF do
      begin
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Filenumber').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Boxnumber').asString)+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text1').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text2').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text3').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text4').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text5').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text6').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text7').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text8').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text9').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text10').asString+'",');
        Write(CSVFile,TheTable.FieldbyName('Date1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date2').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date3').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number2').asString);
        Writeln(CSVFile);

        TheTable.Next;
      end;
  finally
    TheTable.First;
    CloseFile(CSVFile);
  end;
end;


procedure Tfrm_OffsiteExporttoFile.btn_ReExportClick(Sender: TObject);
Var
  OffSiteContainer :String;
  OffSiteBoxnumber :String;
  Exportpath       :String;
  BriefDescription :String;
  NoFiles          :Integer;
begin
  If trim(edt_ReContainer.Text) = '' Then
    begin
      Messagedlg('Please enter a container number!', mtInformation, [mbOK], 0);
      exit;
    end;
//==============================================================================
  OffSiteContainer := trim(edt_ReContainer.Text);
//===============================Mark Container as Off-Site if not==============
  qry_UpdContainer.Close;
  qry_UpdContainer.SQL.Clear;
  qry_UpdContainer.SQL.Add('SELECT Container, IssueStatus, Boxnumber FROM Containers Where Container = :CN');
  qry_UpdContainer.Parameters.ParamByName('CN').Value := OffSiteContainer;
  qry_UpdContainer.Open;
  If qry_UpdContainer.IsEmpty Then
    begin
      Messagedlg('Container number not found!', mtInformation, [mbOK], 0);
      exit;
    end;
  OffSiteBoxnumber := trim(qry_UpdContainer.FieldbyName('BOXNUMBER').AsString);
  If OffSiteBoxnumber = '' Then
    OffSiteBoxnumber := trim(qry_UpdContainer.FieldbyName('CONTAINER').AsString);

  qry_UpdContainer.Close;

  If not (SelectDirectory('Select location for Export.',Exportpath,'',Exportpath)) Then
    exit;
  If copy(ExportPath, length(Exportpath), 1) <> '\' Then
    Exportpath := Exportpath + '\';

//--------Export Container
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT TOP 1 FileType FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := OffSiteContainer;
  qry_Export.Open;
  BriefDescription := trim(qry_Export.FieldbyName('FileType').asString);
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT Count(*) FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := OffSiteContainer;
  qry_Export.Open;
  NoFiles := qry_Export.Fields[0].asInteger;
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Container, '+QuotedStr(OffSiteBoxnumber)+' AS "Boxnumber", '+QuotedStr(CompsCode)+'+Branch AS "Code", Department, FileType AS "BoxDescription", ContType AS "BoxType", ');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Containers');
  qry_Export.SQL.Add('WHERE Container = :Container');
  qry_Export.Parameters.ParamValues['Container'] := OffSiteContainer;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetContainer(qry_Export, ExportPath+OffSiteContainer+'_Box.CSV', BriefDescription, NoFiles);
//--------Export Files
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Filenumber, ContainerNo AS "Container", '+QuotedStr(OffSiteBoxnumber)+' AS "Boxnumber",');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Files');
  qry_Export.SQL.Add('WHERE ContainerNo = :Container AND IssueStatus = ''MET''');
  qry_Export.Parameters.ParamValues['Container'] := OffSiteContainer;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetFiles(qry_Export, ExportPath+OffSiteContainer+'_Files.CSV');
//--------Export Items
  qry_Export.Close;
  qry_Export.SQL.Clear;
  qry_Export.SQL.Add('SELECT  Itemnumber AS "ItemBarcode", Filenumber, '+QuotedStr(OffSiteContainer)+' AS "Container", '+QuotedStr(OffSiteBoxnumber)+' AS "Boxnumber",');
  qry_Export.SQL.Add('        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Items');
  qry_Export.SQL.Add('WHERE Filenumber IN (SELECT Filenumber FROM Files WHERE ContainerNo = :Container AND IssueStatus = ''MET'')');
  qry_Export.Parameters.ParamValues['Container'] := OffSiteContainer;
  Screen.Cursor := crHourglass;
  qry_Export.Open;
  Screen.Cursor := crDefault;
  If not qry_Export.IsEmpty Then
    ExportDatasetItems(qry_Export, ExportPath+OffSiteContainer+'_Items.CSV');
  qry_Export.Close;
  Messagedlg('Export successful.', mtInformation, [mbOK], 0);
end;

procedure Tfrm_OffsiteExporttoFile.ExportDatasetItems(TheTable :TADOQuery; Filename  :String);
var
  CSVFile     :TextFile;
  i           :Integer;
begin
  If FileExists(FileName) Then
    DeleteFile(FileName);
//==================================Create Table================================
  try
    AssignFile(CSVFile,  FileName);
    ReWrite(CSVFile);
    Write(CSVFile,'"ItemNumber",');
    Write(CSVFile,'"ItemBarcode",');
    Write(CSVFile,'"FileNumber",');
    Write(CSVFile,'"BoxNumber",');
    Write(CSVFile,'"Text1",');
    Write(CSVFile,'"Text2",');
    Write(CSVFile,'"Text3",');
    Write(CSVFile,'"Text4",');
    Write(CSVFile,'"Text5",');
    Write(CSVFile,'"Text6",');
    Write(CSVFile,'"Text7",');
    Write(CSVFile,'"Text8",');
    Write(CSVFile,'"Text9",');
    Write(CSVFile,'"Text10",');
    Write(CSVFile,'"Date1",');
    Write(CSVFile,'"Date2",');
    Write(CSVFile,'"Date3",');
    Write(CSVFile,'"Number1",');
    Write(CSVFile,'"Number2"');
    Writeln(CSVFile);

    TheTable.First;
    i := 0;
    While not TheTable.EOF do
      begin
        Inc(I);
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Filenumber').asString)+InttoStr(i)+'I",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('ItemBarcode').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('Filenumber').asString)+'",');
        Write(CSVFile,'"'+UpperCase(TheTable.FieldbyName('BoxNumber').asString)+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text1').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text2').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text3').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text4').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text5').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text6').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text7').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text8').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text9').asString+'",');
        Write(CSVFile,'"'+TheTable.FieldbyName('Text10').asString+'",');
        Write(CSVFile,TheTable.FieldbyName('Date1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date2').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Date3').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number1').asString+',');
        Write(CSVFile,TheTable.FieldbyName('Number2').asString);
        Writeln(CSVFile);

        TheTable.Next;
      end;
  finally
    TheTable.First;
    CloseFile(CSVFile);
  end;
end;

end.

