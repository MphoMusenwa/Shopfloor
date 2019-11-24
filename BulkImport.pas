unit BulkImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, StdActns, ActnList,
  XPStyleActnCtrls, ImgList, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls,
  Mask, Buttons, ComCtrls, DB, ADODB, ExtDlgs;

type
  FieldPropertiesRecord = Record
    FieldName  :String;
    Alias      :String;
    UpperCase  :Boolean;
    Required   :Boolean;
  end;
  Tfrm_BulkImport = class(TForm)
    OpenDialog: TOpenDialog;
    qry_eRecordInsert: TADOQuery;
    qry_InsertImage: TADOQuery;
    qry_RecordType: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    edt_ImportFilename: TEdit;
    edt_1_RecordCount: TEdit;
    sgrd_Import: TStringGrid;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    btn_Next1: TBitBtn;
    Label11: TLabel;
    edt_MapIndexDef: TEdit;
    scrollbox_Mappings: TScrollBox;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btn_Next2: TBitBtn;
    btn_Back2: TBitBtn;
    btn_Next3: TBitBtn;
    btn_Back3: TBitBtn;
    TabSheet4: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel6: TBevel;
    Bevel3: TBevel;
    Bevel7: TBevel;
    mem_Sum: TMemo;
    Bevel8: TBevel;
    Label17: TLabel;
    btn_DoImport: TBitBtn;
    btn_Back4: TBitBtn;
    Bevel9: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    Label18: TLabel;
    Label19: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label20: TLabel;
    Label21: TLabel;
    Panel3: TPanel;
    Image3: TImage;
    Label22: TLabel;
    Label23: TLabel;
    Panel4: TPanel;
    Image4: TImage;
    Label24: TLabel;
    Label25: TLabel;
    TabSheet5: TTabSheet;
    Panel5: TPanel;
    Image5: TImage;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edt_Batch: TEdit;
    mem_Result: TMemo;
    pBar_Result: TProgressBar;
    Label30: TLabel;
    Label31: TLabel;
    Bevel10: TBevel;
    BitBtn3: TBitBtn;
    btn_Back5: TBitBtn;
    Bevel12: TBevel;
    mem_Mappings: TMemo;
    qry_Upd: TADOQuery;
    qry_SQL: TADOQuery;
    chk_AutoGenItems: TCheckBox;
    qry_AutoItem: TADOQuery;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    Label33: TLabel;
    chk_FirstRowIsHeaders: TCheckBox;
    chk_AutoGeneRecordIndexFile: TCheckBox;
    chk_AutoGeneRecordIndexItem: TCheckBox;
    qry_GetIndexData: TADOQuery;
    Label1: TLabel;
    cbOpenTemplate: TComboBox;
    Label2: TLabel;
    cbSaveBulkImportTemplate: TComboBox;
    btnSaveBulkImportTemplate: TButton;
    qry_Templ: TADOQuery;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbl_Branch: TLabel;
    lbl_Department: TLabel;
    Bevel5: TBevel;
    btn_SelBranch: TButton;
    btn_SelDepartment: TButton;
    Button3: TButton;
    edt_Branch: TEdit;
    edt_Department: TEdit;
    edt_IndexDef: TEdit;
    rgrp_ImportType: TRadioGroup;
    lblLeaveBlank: TLabel;
    Label5: TLabel;
    qry_GetAltBranches: TADOQuery;
    qry_GetAltDepartments: TADOQuery;
    qry_GetAltRecordTypes: TADOQuery;
    qry_COOLDefs: TADOQuery;
    cb_RecordCat: TComboBox;
    lbl_RecordCat: TLabel;
    qry_RecordCat: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDepartmentClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btn_Next1Click(Sender: TObject);
    procedure btn_Back2Click(Sender: TObject);
    procedure btn_Next2Click(Sender: TObject);
    procedure btn_Back3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_Next3Click(Sender: TObject);
    procedure btn_Back4Click(Sender: TObject);
    procedure btn_Back5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn_DoImportClick(Sender: TObject);
    procedure chk_FirstRowIsHeadersClick(Sender: TObject);
    procedure chk_AutoGeneRecordIndexFileClick(Sender: TObject);
    procedure chk_AutoGeneRecordIndexItemClick(Sender: TObject);
    procedure chk_AutoGenItemsClick(Sender: TObject);
    procedure cbOpenTemplateChange(Sender: TObject);
    procedure btnSaveBulkImportTemplateClick(Sender: TObject);
    procedure rgrp_ImportTypeClick(Sender: TObject);
    procedure edt_IndexDefChange(Sender: TObject);
  private
    { Private declarations }
    CoCount    :Integer;
    procedure PopulateGrid();
    function GetFields(mRecordType, mAliasName   :String):String;
    function Translate_Alternative_Branch_Code(BranchAlternativeCode :String):String;
    function Translate_Alternative_Department_Code(Branch, DepartmentAlternativeCode :String):String;
    function Translate_Alternative_RecordType(AlternativeRecordType :String):String;
  public
    { Public declarations }
  end;

var
  frm_BulkImport: Tfrm_BulkImport;
                                               //1-text/2-date/3-number
implementation

uses SelBranch, SelDept, SelRType, SelRCat, DataModCap, main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_BulkImport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BulkImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure Tfrm_BulkImport.PopulateGrid();
Var
   Filename, mTempStr   :String;
   T          :TextFile;
   Line       :String;
   R,a        :Integer;
begin
  For A := 0 to sgrd_Import.ColCount-1 Do
    For R := 0 to sgrd_Import.RowCount-1 Do
      sgrd_Import.Cells[A, R] := '';

  sgrd_Import.ColCount := 1;
  sgrd_Import.RowCount := 2;
  sgrd_Import.Cells[0, 0] := '';
  sgrd_Import.Cells[0, 1] := '';
  edt_1_RecordCount.Text := '0';
//-------------
  Filename := Opendialog.Filename;
  If Filename = '' Then
    exit;
  edt_ImportFilename.Text := Filename;
  AssignFile(T,Filename);
  try
    Reset(T);
    sgrd_Import.Visible := False;
//-----Process header------------------------------
    Readln(T,Line);
    Line := trim(Line);

    If Line <> '' Then
      begin
        a := -1;
        Repeat
          Inc(a);
          sgrd_Import.ColCount := a + 1;

          If pos(',',Line) > 0 Then
            begin
              mTempStr := copy(line, 1, pos(',',Line)-1);
              Line := copy(Line, pos(',',Line)+1, 500);
            end
          else
            begin
              mTempStr := copy(line, 1, 500);
              Line := '';
            end;
          If (copy(mTempStr, 1, 1) = '"')and(copy(mTempStr, length(mTempStr), 1) = '"') Then
            mTempStr := copy(mTempStr, 2, length(mTempStr)-2)
          else If (copy(mTempStr, 1, 1) = '''')and(copy(mTempStr, length(mTempStr), 1) = '''') Then
            mTempStr := copy(mTempStr, 2, length(mTempStr)-2);

          If chk_FirstRowIsHeaders.Checked Then
            sgrd_Import.Cells[a, 0] := mTempStr
          else sgrd_Import.Cells[a, 0] := 'Column'+InttoStr(a+1);
          If (sgrd_Import.Canvas.TextWidth(sgrd_Import.Cells[a, 0])+4) > sgrd_Import.ColWidths[a] Then
            sgrd_Import.ColWidths[a] := (sgrd_Import.Canvas.TextWidth(sgrd_Import.Cells[a, 0])+4);
        Until Line = '';
      end;
//-----Process Details------------------------------
    If not chk_FirstRowIsHeaders.Checked Then
      Reset(T);

    R := 0;
    While Not Eof(T) do            //Process Import File
      begin
        Application.ProcessMessages;
        Inc(R);
        edt_1_RecordCount.Text := IntToStr(R);
        Application.ProcessMessages;
     //----
        If R > 1 Then
          sgrd_Import.RowCount := sgrd_Import.RowCount+1;
     //----
        Readln(T,Line);
        Line := trim(Line);

        if Line <> '' then
          begin
            a := -1;
            Repeat
              Inc(a);
              If sgrd_Import.ColCount < (a + 1) Then
                begin
                  sgrd_Import.ColCount := a + 1;
                  If not chk_FirstRowIsHeaders.Checked Then
                    sgrd_Import.Cells[a, 0] := 'Column'+InttoStr(a+1);
                end;

              If pos(',',Line) > 0 Then
                begin
                  mTempStr := copy(line, 1, pos(',',Line)-1);
                  Line := copy(Line, pos(',',Line)+1, 500);
                end
              else
                begin
                  mTempStr := copy(line, 1, 500);
                  Line := '';
                end;

              If (copy(mTempStr, 1, 1) = '"')and(copy(mTempStr, length(mTempStr), 1) = '"') Then
                mTempStr := copy(mTempStr, 2, length(mTempStr)-2)
              else If (copy(mTempStr, 1, 1) = '''')and(copy(mTempStr, length(mTempStr), 1) = '''') Then
                mTempStr := copy(mTempStr, 2, length(mTempStr)-2);

              sgrd_Import.Cells[a, R] := Trim(mTempStr);
              If (sgrd_Import.Canvas.TextWidth(sgrd_Import.Cells[a, R])+4) > sgrd_Import.ColWidths[a] Then
                sgrd_Import.ColWidths[a] := (sgrd_Import.Canvas.TextWidth(sgrd_Import.Cells[a, R])+4);
            Until Line = '';
          end;
      end;      //do while not EOF (T)
  finally
    sgrd_Import.Visible := True;
    CloseFile(T);
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_BulkImport.rgrp_ImportTypeClick(Sender: TObject);
begin
  lblLeaveBlank.Visible := rgrp_ImportType.ItemIndex <> 6;
end;

procedure Tfrm_BulkImport.SpeedButton1Click(Sender: TObject);
begin
  If not Opendialog.Execute Then
    exit;
//-------------
  PopulateGrid();
end;

procedure Tfrm_BulkImport.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Department.Text := '';
      lbl_Department.Caption := '---';
      edt_IndexDef.Text := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_BulkImport.btn_SelDepartmentClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Department.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Department.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
      edt_IndexDef.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_BulkImport.Button3Click(Sender: TObject);
begin
  If length(edt_Department.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;

  If (rgrp_ImportType.ItemIndex = 4)OR(rgrp_ImportType.ItemIndex = 4) Then
    begin
      If frm_SelRType.Execute(False,
                              edt_Branch.Text,
                              edt_Department.Text,
                              User,
                              True,
                              True,
                              True,
                              True,
                              True) = mrOK Then
        begin
          edt_IndexDef.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
        end;
      frm_SelRType.qry_RType.Close;
    end
  else
    begin
      If frm_SelRType.Execute(False,
                              edt_Branch.Text,
                              edt_Department.Text,
                              User,
                              rgrp_ImportType.ItemIndex = 0,
                              rgrp_ImportType.ItemIndex = 1,
                              rgrp_ImportType.ItemIndex = 2,
                              rgrp_ImportType.ItemIndex = 3,
                              rgrp_ImportType.ItemIndex = 6) = mrOK Then
        begin
          edt_IndexDef.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
        end;
      frm_SelRType.qry_RType.Close;
    end
end;

procedure Tfrm_BulkImport.cbOpenTemplateChange(Sender: TObject);
begin
  qry_Templ.Close;
  qry_Templ.SQL.Clear;
  qry_Templ.SQL.Add('SELECT * FROM BulkImportTemplates WHERE Template = :Template');
  qry_Templ.Parameters.ParamValues['Template'] := cbOpenTemplate.Text;
  qry_Templ.Open;
  If not qry_Templ.IsEmpty Then
    begin
      //----Page 1
      chk_FirstRowIsHeaders.Checked := qry_Templ.FieldbyName('FirstRowHeaders').AsBoolean;
      OpenDialog.FileName := qry_Templ.FieldbyName('ImportFile').AsString;
      PopulateGrid();
      //----Page 2
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Branch, Name FROM Branches WHERE Branch = :Branch');
      qry_SQL.Parameters.ParamValues['Branch'] := qry_Templ.FieldbyName('Branch').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          edt_Branch.Text := qry_SQL.FieldbyName('Branch').AsString;
          lbl_Branch.Caption := qry_SQL.FieldbyName('Name').AsString;
        end;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Department, Name FROM Departments WHERE Branch = :Branch AND Department = :Department');
      qry_SQL.Parameters.ParamValues['Branch'] := qry_Templ.FieldbyName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := qry_Templ.FieldbyName('Department').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          edt_Department.Text := qry_SQL.FieldbyName('Department').AsString;
          lbl_Department.Caption := qry_SQL.FieldbyName('Name').AsString;
        end;

      rgrp_ImportType.ItemIndex := qry_Templ.FieldbyName('ImportType').AsInteger;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Description FROM IndexDefinitions WHERE Description = :Description');
      qry_SQL.Parameters.ParamValues['Description'] := qry_Templ.FieldbyName('RecordType').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          edt_IndexDef.Text := qry_SQL.FieldbyName('Description').AsString;
        end;
      qry_SQL.Close;
    end;
  qry_Templ.Close;
end;

procedure Tfrm_BulkImport.chk_AutoGeneRecordIndexFileClick(Sender: TObject);
begin
  If chk_AutoGeneRecordIndexFile.Checked Then chk_AutoGeneRecordIndexItem.Checked := False;
  If chk_AutoGeneRecordIndexFile.Checked Then chk_AutoGenItems.Checked := False;
end;

procedure Tfrm_BulkImport.chk_AutoGeneRecordIndexItemClick(Sender: TObject);
begin
  If chk_AutoGeneRecordIndexItem.Checked Then chk_AutoGeneRecordIndexFile.Checked := False;
  If chk_AutoGeneRecordIndexItem.Checked Then chk_AutoGenItems.Checked := False;
end;

procedure Tfrm_BulkImport.chk_AutoGenItemsClick(Sender: TObject);
begin
  If chk_AutoGenItems.Checked Then chk_AutoGeneRecordIndexFile.Checked := False;
  If chk_AutoGenItems.Checked Then chk_AutoGeneRecordIndexItem.Checked := False;
end;

procedure Tfrm_BulkImport.chk_FirstRowIsHeadersClick(Sender: TObject);
begin
 PopulateGrid();
end;

procedure Tfrm_BulkImport.edt_IndexDefChange(Sender: TObject);
begin
  cb_RecordCat.ItemIndex := -1;
  cb_RecordCat.Items.Clear;
  lbl_RecordCat.Visible := False;
  cb_RecordCat.Visible := False;

  If (rgrp_ImportType.ItemIndex = 1) or (rgrp_ImportType.ItemIndex = 3) Then
    begin
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, UseRecordCat');
      qry_RecordType.SQL.Add('FROM IndexDefinitions');
      qry_RecordType.SQL.Add('WHERE Description = :DS');
      qry_RecordType.Parameters.ParamByName('DS').Value := edt_IndexDef.Text;
      qry_RecordType.Open;

      if qry_RecordType.FieldByName('UseRecordCat').AsBoolean then
        begin
          lbl_RecordCat.Visible := True;
          cb_RecordCat.Visible := True;

          qry_RecordCat.Close;
          qry_RecordCat.SQL.Clear;
          qry_RecordCat.SQL.Add('SELECT DISTINCT');
          qry_RecordCat.SQL.Add('	rc.RecCatType');
          qry_RecordCat.SQL.Add('FROM ');
          qry_RecordCat.SQL.Add('	RecordCat rc');
          qry_RecordCat.SQL.Add('	INNER JOIN RCRTRts rt ON rc.RecCatType = rt.RecordCat');
          qry_RecordCat.SQL.Add('	INNER JOIN IndexDefinitions i ON rt.RecordType = i.Description');
          qry_RecordCat.SQL.Add('WHERE');
          qry_RecordCat.SQL.Add('	i.UseERecords = 1 AND');
          qry_RecordCat.SQL.Add('	rt.RecordType = :RecordType');
          qry_RecordCat.Parameters.ParamByName('RecordType').Value := edt_IndexDef.Text;
          If not frm_Console.AccessSysAdmin Then
            begin
              qry_RecordCat.SQL.Add('AND');
              qry_RecordCat.SQL.Add('	(rc.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = :ID1))');
              qry_RecordCat.SQL.Add('OR');
              qry_RecordCat.SQL.Add('	(rc.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts o ON a.RoleId = o.RoleId WHERE o.UserId = :ID2))');
              qry_RecordCat.Parameters.ParamByName('ID1').Value := User;
              qry_RecordCat.Parameters.ParamByName('ID2').Value := User;
            end;
          qry_RecordCat.SQL.Add('ORDER BY');
          qry_RecordCat.SQL.Add('	rc.RecCatType');
          qry_RecordCat.Open;


          cb_RecordCat.Items.Append('');
          cb_RecordCat.ItemIndex := 0;
          qry_RecordCat.First;
          While not qry_RecordCat.EOF Do
            begin
              cb_RecordCat.Items.Append(qry_RecordCat.FieldbyName('RecCatType').asString);
              qry_RecordCat.Next;
            end;
        end;
    end;
end;

procedure Tfrm_BulkImport.PageControl1Change(Sender: TObject);
Var
  ComponentTot, J, A, T, X, Tot   :Integer;
  SourceValue, DestValue          :String;
  TemplateId                      :Integer;
  cbSource, cbDest                :TComboBox;
  edtSubStringStart, edtSubStringCount :TEdit;
  Line                            :String;
  COOLID: string;
begin
  If PageControl1.ActivePageIndex = 0 Then
    begin
      qry_Templ.Close;
      qry_Templ.SQL.Clear;
      qry_Templ.SQL.Add('SELECT * FROM BulkImportTemplates ORDER BY Id');
      qry_Templ.Open;
      qry_Templ.First;
      cbOpenTemplate.Items.Clear;
      cbSaveBulkImportTemplate.Items.Clear;
      cbOpenTemplate.Items.Add('');
      cbSaveBulkImportTemplate.Items.Add('');
      While not qry_Templ.EOF Do
        begin
          cbOpenTemplate.Items.Add(qry_Templ.FieldbyName('Template').AsString);
          cbSaveBulkImportTemplate.Items.Add(qry_Templ.FieldbyName('Template').AsString);
          qry_Templ.Next;
        end;
      qry_Templ.Close;
    end
  else if PageControl1.ActivePageIndex = 1 Then
    begin
    end
  else if PageControl1.ActivePageIndex = 2 Then
    begin
      scrollbox_Mappings.Visible := False;
      try
        if edt_IndexDef.Text <> '' then
          edt_MapIndexDef.Text := edt_IndexDef.Text
        else edt_MapIndexDef.Text := 'Retrieve from Import File...';

        chk_AutoGenItems.Visible := (rgrp_ImportType.ItemIndex = 3);
        chk_AutoGeneRecordIndexFile.Visible := (rgrp_ImportType.ItemIndex = 3);
        chk_AutoGeneRecordIndexItem.Visible := (rgrp_ImportType.ItemIndex = 3);
        chk_AutoGenItems.Checked := false;
        chk_AutoGeneRecordIndexFile.Checked := false;
        chk_AutoGeneRecordIndexItem.Checked := false;
  //================First Free Previous Dynamic created componets=================
        ComponentTot := scrollbox_Mappings.ComponentCount;
        For J := ComponentTot-1 downto 0 Do
          begin
            scrollbox_Mappings.Components[J].Free;
          end;
  //================Create new View===============================================
        If edt_IndexDef.Text <> '' Then
          begin
            qry_RecordType.Close;
            qry_RecordType.SQL.Clear;
            qry_RecordType.SQL.Add('SELECT Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15 FROM IndexDefinitions WHERE Description = :RecordType');
            qry_RecordType.Parameters.ParamByName('RecordType').Value := edt_IndexDef.Text;
            qry_RecordType.Open;
          end
        else
          begin
            qry_RecordType.Close;
            qry_RecordType.SQL.Clear;
            qry_RecordType.SQL.Add('SELECT ''Text1'' AS Col1, ''Text2'' AS Col2, ''Text3'' AS Col3, ''Text4'' AS Col4, ''Text5'' AS Col5,');
            qry_RecordType.SQL.Add('       ''Text6'' AS Col6, ''Text7'' AS Col7, ''Text8'' AS Col8, ''Text9'' AS Col9, ''Text10'' AS Col10,');
            qry_RecordType.SQL.Add('       ''Date1'' AS Col11, ''Date2'' AS Col12, ''Date3'' AS Col13,');
            qry_RecordType.SQL.Add('       ''Number1'' AS Col14, ''Number2'' AS Col15');
            qry_RecordType.Open;
          end;
  //---------
        //Tot := sgrd_Import.ColCount;
        Tot := 30;
        CoCount := Tot;
  //----------Build the Sequence Label----------------------
        A := 0;
        T := -18;
        For J := 1 to Tot Do
          begin
            Inc(A);
            Inc(T,23);

            TLabel.Create(scrollbox_Mappings).Name := 'lbl_Seq'+InttoStr(A);
            TLabel(scrollbox_Mappings.FindComponent('lbl_Seq'+InttoStr(A))).Parent := scrollbox_Mappings;
            TLabel(scrollbox_Mappings.FindComponent('lbl_Seq'+InttoStr(A))).Caption := InttoStr(A);
            TLabel(scrollbox_Mappings.FindComponent('lbl_Seq'+InttoStr(A))).Top := T;
            TLabel(scrollbox_Mappings.FindComponent('lbl_Seq'+InttoStr(A))).Left := 7;
            TLabel(scrollbox_Mappings.FindComponent('lbl_Seq'+InttoStr(A))).Visible := True;
          end;
  //----------Build the Source CB Box----------------------
        A := 0;
        T := -18;
        For J := 0 to Tot-1 Do
          begin
            Inc(A);
            Inc(T,23);

            TComboBox.Create(scrollbox_Mappings).Name := 'cb_Source'+InttoStr(A);
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Parent := scrollbox_Mappings;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Top := T;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Left := 95;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Width := 180;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Visible := True;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Style := csDropDownList;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Items.Clear;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Items.Append('');

            For X := 0 to sgrd_Import.ColCount-1 Do
              TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Items.Append(sgrd_Import.Cells[X, 0]);

            TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).ItemIndex := A;
          end;
  //----------Build the Destination CB Box----------------------
        A := 0;
        T := -18;
        For J := 0 to Tot-1 Do
          begin
            Inc(A);
            Inc(T,23);

            TComboBox.Create(scrollbox_Mappings).Name := 'cb_Dest'+InttoStr(A);
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Parent := scrollbox_Mappings;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Top := T;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Left := 279;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Width := 180;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Visible := True;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Style := csDropDownList;
            TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Clear;

            If rgrp_ImportType.ItemIndex = 0 Then       //Containers
              begin
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Container');

                If edt_Branch.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Alternative Code');
                  end;

                If edt_Department.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Alternative Code');
                  end;

                If edt_IndexDef.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Record Type');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Alternative Record Type');
                  end;

                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('ContType');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Destroy');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('RetentionPeriod');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Destruct');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('IssueStatus');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('WIP');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('AONS');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('SAONS');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('INOS');

                For X := 1 to 15 Do
                  If qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString <> '' Then
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append(qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString);
              end;
            If rgrp_ImportType.ItemIndex = 1 Then         //Files
              begin
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Filenumber');

                If edt_Branch.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Alternative Code');
                  end;

                If edt_Department.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Alternative Code');
                  end;

                If edt_IndexDef.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Record Type');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Alternative Record Type');
                  end;
                              
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Destroy');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('RetentionPeriod');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Destruct');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('IssueStatus');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('WIP');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('AONS');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('SAONS');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('INOS');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('ContainerNo');

                For X := 1 to 15 Do
                  If qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString <> '' Then
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append(qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString);
              end;
            If rgrp_ImportType.ItemIndex = 2 Then      //Items
              begin
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Itemnumber');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Filenumber');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('IssueStatus');
              end;
            If rgrp_ImportType.ItemIndex = 3 Then      //eRecords

              begin
                If edt_Branch.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Branch Alternative Code');
                  end;

                If edt_Department.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Code');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Department Alternative Code');
                  end;

                If edt_IndexDef.Text = '' Then
                  begin
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Record Type');
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Alternative Record Type');
                  end;

                If cb_RecordCat.Visible Then
                  If cb_RecordCat.Text = '' Then
                    begin
                      TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('RecordCat');
                    end;


                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('NilDestroy');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('PurgeDate');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Filenumber');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('Itemnumber');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('eRecord Document Import');

                For X := 1 to 15 Do
                  If qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString <> '' Then
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append(qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString);
              end;
            If rgrp_ImportType.ItemIndex = 4 Then   //Index Definition Lookups
              begin
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('ColumnHeading');
                TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('ColumnValue');
              end;

            If rgrp_ImportType.ItemIndex = 5 Then   //Index Definition Match
              begin
                For X := 1 to 15 Do
                  If qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString <> '' Then
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append(qry_RecordType.FieldbyName('COL'+InttoStr(X)).AsString);
              end;

            If rgrp_ImportType.ItemIndex = 6 Then   //COOL
              begin
                If cb_RecordCat.Visible Then
                  If cb_RecordCat.Text = '' Then
                    begin
                      TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append('RecordCat');
                    end;

                qry_COOLDefs.Close;
                qry_COOLDefs.SQL.Clear;
                qry_COOLDefs.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
                qry_COOLDefs.Parameters.ParamValues['DS'] := edt_IndexDef.Text;
                qry_COOLDefs.Open;
                COOLID := qry_COOLDefs.Fields[0].asString;
                qry_COOLDefs.Close;
                qry_COOLDefs.SQL.Clear;
                qry_COOLDefs.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
                qry_COOLDefs.Parameters.ParamValues['DS'] := edt_IndexDef.Text;
                qry_COOLDefs.Open;
                qry_COOLDefs.First;
                While not qry_COOLDefs.EOF Do
                  begin
                    Application.ProcessMessages;
                    TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Append(qry_COOLDefs.FieldbyName('FieldName').AsString);
                    qry_COOLDefs.Next;
                  end;
              end;
          end;
  //----------Build the Substring Start----------------------
        A := 0;
        T := -18;
        For J := 0 to Tot-1 Do
          begin
            Inc(A);
            Inc(T,23);

            TEdit.Create(scrollbox_Mappings).Name := 'edt_SubstringStart'+InttoStr(A);
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Parent := scrollbox_Mappings;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Top := T;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Left := 463;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Width := 40;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Visible := True;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Text := '';
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).Hint := 'Substring Start';
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A))).ShowHint := True;
          end;
  //----------Build the Substring cOUNT----------------------
        A := 0;
        T := -18;
        For J := 0 to Tot-1 Do
          begin
            Inc(A);
            Inc(T,23);

            TEdit.Create(scrollbox_Mappings).Name := 'edt_SubstringCount'+InttoStr(A);
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Parent := scrollbox_Mappings;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Top := T;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Left := 508;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Width := 40;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Visible := True;
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Text := '';
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).Hint := 'Substring Count';
            TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A))).ShowHint := True;
          end;
  //--------------------Do Default Mappings---------------------------------------
        A := 0;
        For J := 0 to Tot-1 Do
          begin
            Inc(A);

            SourceValue := UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A))).Text));

            If SourceValue <> '' Then
              begin
                For X := 0 to TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Count-1 Do
                  begin
                    DestValue := UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).Items.Strings[X]));
                    If SourceValue = DestValue Then
                      begin
                        TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A))).ItemIndex := X;
                      end;
                  end;
              end;
          end;
  //--------------------Load from Template if selected----------------------------
        If trim(cbOpenTemplate.Text) <> '' Then
          begin
            qry_Templ.Close;
            qry_Templ.SQL.Clear;
            qry_Templ.SQL.Add('SELECT * FROM BulkImportTemplates WHERE Template = :Template');
            qry_Templ.Parameters.ParamValues['Template'] := cbOpenTemplate.Text;
            qry_Templ.Open;
            If not qry_Templ.IsEmpty Then
              begin
                //Options
                If chk_AutoGenItems.Checked <> qry_Templ.FieldbyName('AutoGenItems').AsBoolean Then
                  begin
                    chk_AutoGenItems.Checked := qry_Templ.FieldbyName('AutoGenItems').AsBoolean;
                    chk_AutoGenItemsClick(chk_AutoGenItems);
                  end;
                If chk_AutoGeneRecordIndexFile.Checked <> qry_Templ.FieldbyName('AutoGeneRecordFile').AsBoolean Then
                  begin
                    chk_AutoGeneRecordIndexFile.Checked := qry_Templ.FieldbyName('AutoGeneRecordFile').AsBoolean;
                    chk_AutoGeneRecordIndexFileClick(chk_AutoGeneRecordIndexFile);
                  end;
                If chk_AutoGeneRecordIndexItem.Checked <> qry_Templ.FieldbyName('AutoGeneRecordItem').AsBoolean Then
                  begin
                    chk_AutoGeneRecordIndexItem.Checked := qry_Templ.FieldbyName('AutoGeneRecordItem').AsBoolean;
                    chk_AutoGeneRecordIndexItemClick(chk_AutoGeneRecordIndexItem);
                  end;
                //Mappings
                TemplateId := qry_Templ.FieldbyName('Id').AsInteger;
                qry_Templ.Close;
                qry_Templ.SQL.Clear;
                qry_Templ.SQL.Add('SELECT * FROM BulkImportTemplateMappings WHERE TemplateId = :TemplateId ORDER BY Id');
                qry_Templ.Parameters.ParamValues['TemplateId'] := TemplateId;
                qry_Templ.Open;
                qry_Templ.First;
                A := 0;
                While not qry_Templ.EOf Do
                  begin
                    Inc(A);

                    cbSource :=  TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(A)));
                    cbDest :=  TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(A)));
                    edtSubStringStart := TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(A)));
                    edtSubStringCount := TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(A)));

                    If (cbSource <> Nil)AND(cbDest <> Nil) Then
                      begin
                        if cbSource.Items.IndexOf(qry_Templ.FieldByName('SourceColumn').AsString) <> -1 then
                          cbSource.ItemIndex := cbSource.Items.IndexOf(qry_Templ.FieldByName('SourceColumn').AsString);

                        if cbDest.Items.IndexOf(qry_Templ.FieldByName('DestinationColumn').AsString) <> -1 then
                          cbDest.ItemIndex := cbDest.Items.IndexOf(qry_Templ.FieldByName('DestinationColumn').AsString);

                        if qry_Templ.FieldByName('SubStringStart').Value <> Null then
                          edtSubStringStart.Text := qry_Templ.FieldByName('SubStringStart').asString;
                        if qry_Templ.FieldByName('SubStringCount').Value <> Null then
                          edtSubStringCount.Text := qry_Templ.FieldByName('SubStringCount').asString;
                      end;

                    qry_Templ.Next;
                  end;
                qry_Templ.Close;
              end;
            qry_Templ.Close;
          end;
      finally
        scrollbox_Mappings.Visible := True;
      end;
    end
  else if PageControl1.ActivePageIndex = 3 Then
    begin
      mem_Sum.Lines.Clear;
      mem_Sum.Lines.Append('Import File: '+edt_ImportFilename.Text+' ('+edt_1_RecordCount.Text+' Records)');
      mem_Sum.Lines.Append('Branch: '+edt_Branch.Text+' '+lbl_Branch.Caption);
      mem_Sum.Lines.Append('Department: '+edt_Department.Text+' '+lbl_Department.Caption);
      Case rgrp_ImportType.ItemIndex of
          0: mem_Sum.Lines.Append('Import Type: Containers');
          1: mem_Sum.Lines.Append('Import Type: Files');
          2: mem_Sum.Lines.Append('Import Type: Items');
          3: mem_Sum.Lines.Append('Import Type: eRecords');
          4: mem_Sum.Lines.Append('Import Type: Index Definition Lookups');
          5: mem_Sum.Lines.Append('Import Type: Index Definition Match Values');
      end;
      mem_Sum.Lines.Append('Index Definition: '+edt_IndexDef.Text);
    //-----
      mem_Mappings.Lines.Clear;

      For J := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J)) <> Nil)and
             (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J)) <> Nil)Then
            begin
              If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J))).Text <> '')and
                 (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J))).Text <> '')Then
                begin
                  Line := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J))).Text;
                  Line := Line + ' => ';
                  Line := Line + TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J))).Text;

                  If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(J))).Text, -1) > 0)and
                     (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(J))).Text, -1) > 0)Then
                    begin
                      Line := Line + ' - Substring(';
                      Line := Line + TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(J))).Text;
                      Line := Line + ', ';
                      Line := Line + TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(J))).Text;
                      Line := Line + ')';
                    end;
                  mem_Mappings.Lines.Add(Line);
                end;
            end;
        end;
     //------
      cbSaveBulkImportTemplate.Text := cbOpenTemplate.Text;
    end
end;

procedure Tfrm_BulkImport.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := False;
end;

procedure Tfrm_BulkImport.btn_Next1Click(Sender: TObject);
begin
  if edt_ImportFilename.Text = '' Then
    begin
      Messagedlg('Please select an Import File.', mtInformation, [mbOK], 0);
      exit;
    end;
  if edt_1_RecordCount.Text = '' Then
    begin
      Messagedlg('The Import File does not have any Records.', mtInformation, [mbOK], 0);
      exit;
    end;
  PageControl1.ActivePageIndex := 1;
  PageControl1Change(Self);
end;

procedure Tfrm_BulkImport.btnSaveBulkImportTemplateClick(Sender: TObject);
Var
  Template       :String;
  TemplateId, J  :Integer;
begin
  If trim(cbSaveBulkImportTemplate.Text) = '' Then
    exit;
  Template := cbSaveBulkImportTemplate.Text;
  qry_Templ.Close;
  qry_Templ.SQL.Clear;
  qry_Templ.SQL.Add('SELECT * FROM BulkImportTemplates WHERE Template = :Template');
  qry_Templ.Parameters.ParamValues['Template'] := Template;
  qry_Templ.Open;
  If not qry_Templ.IsEmpty Then
    begin
      TemplateId := qry_Templ.FieldbyName('Id').AsInteger;
      qry_Templ.Close;
      qry_Templ.SQL.Clear;
      qry_Templ.SQL.Add('DELETE FROM BulkImportTemplateMappings WHERE TemplateId = :TemplateId');
      qry_Templ.Parameters.ParamValues['TemplateId'] := TemplateId;
      qry_Templ.ExecSQL;
      qry_Templ.Close;
      qry_Templ.SQL.Clear;
      qry_Templ.SQL.Add('DELETE FROM BulkImportTemplates WHERE Id = :TemplateId');
      qry_Templ.Parameters.ParamValues['TemplateId'] := TemplateId;
      qry_Templ.ExecSQL;
    end;

  qry_Templ.Close;
  qry_Templ.SQL.Clear;
  qry_Templ.SQL.Add('SET NOCOUNT On');
  qry_Templ.SQL.Add('INSERT INTO BulkImportTemplates (Template, ImportFile, FirstRowHeaders, Branch, Department, ImportType, RecordType, AutoGenItems, AutoGeneRecordFile, AutoGeneRecordItem)');
  qry_Templ.SQL.Add('VALUES (:Template, :ImportFile, :FirstRowHeaders, :Branch, :Department, :ImportType, :RecordType, :AutoGenItems, :AutoGeneRecordFile, :AutoGeneRecordItem)');
  qry_Templ.SQL.Add('SET NOCOUNT Off');
  qry_Templ.SQL.Add('SELECT @@Identity');
  qry_Templ.Parameters.ParamValues['Template'] := Template;
  qry_Templ.Parameters.ParamValues['ImportFile'] := edt_ImportFilename.Text;
  qry_Templ.Parameters.ParamValues['FirstRowHeaders'] := chk_FirstRowIsHeaders.Checked;
  qry_Templ.Parameters.ParamValues['Branch'] := edt_Branch.Text;
  qry_Templ.Parameters.ParamValues['Department'] := edt_Department.Text;
  qry_Templ.Parameters.ParamValues['ImportType'] := rgrp_ImportType.ItemIndex;
  qry_Templ.Parameters.ParamValues['RecordType'] := edt_IndexDef.Text;
  qry_Templ.Parameters.ParamValues['AutoGenItems'] := chk_AutoGenItems.Checked;
  qry_Templ.Parameters.ParamValues['AutoGeneRecordFile'] := chk_AutoGeneRecordIndexFile.Checked;
  qry_Templ.Parameters.ParamValues['AutoGeneRecordItem'] := chk_AutoGeneRecordIndexItem.Checked;
  qry_Templ.Open;
  TemplateId := qry_Templ.Fields[0].AsInteger;
  qry_Templ.Close;

  For J := 1 to CoCount Do
    begin
      If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J)) <> Nil)and
         (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J)) <> Nil)Then
        begin
          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J))).Text <> '')and
             (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J))).Text <> '')Then
            begin
              qry_Templ.Close;
              qry_Templ.SQL.Clear;
              qry_Templ.SQL.Add('INSERT INTO BulkImportTemplateMappings (TemplateId, SourceColumn, DestinationColumn, SubstringStart, SubstringCount)');
              qry_Templ.SQL.Add('VALUES (:TemplateId, :SourceColumn, :DestinationColumn, :SubstringStart, :SubstringCount)');
              qry_Templ.Parameters.ParamValues['TemplateId'] := TemplateId;
              qry_Templ.Parameters.ParamValues['SourceColumn'] := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(J))).Text;
              qry_Templ.Parameters.ParamValues['DestinationColumn'] := TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(J))).Text;
              If StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(J))).Text, -1) > 0 Then
                qry_Templ.Parameters.ParamValues['SubstringStart'] := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(J))).Text);
              If StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(J))).Text, -1) > 0 Then
                qry_Templ.Parameters.ParamValues['SubstringCount'] := TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(J))).Text;
              qry_Templ.ExecSQL;
            end;
        end;
    end;
  qry_Templ.Close;
  Messagedlg('Bulk Import Template saved.', mtInformation, [mbOK], 0);
end;

procedure Tfrm_BulkImport.btn_Back2Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure Tfrm_BulkImport.btn_Next2Click(Sender: TObject);
begin
  if rgrp_ImportType.ItemIndex = -1 Then
    begin
      Messagedlg('Please select an Import Type.', mtInformation, [mbOK], 0);
      exit;
    end;
  if rgrp_ImportType.ItemIndex = 6 Then
    begin
      if edt_Branch.Text = '' Then
        begin
          Messagedlg('Please select a Branch.', mtInformation, [mbOK], 0);
          exit;
        end;
      if edt_Department.Text = '' Then
        begin
          Messagedlg('Please select a Department.', mtInformation, [mbOK], 0);
          exit;
        end;
      if edt_IndexDef.Text = '' Then
        begin
          Messagedlg('Please select a RecordType.', mtInformation, [mbOK], 0);
          exit;
        end;
    end;
  PageControl1.ActivePageIndex := 2;
  PageControl1Change(Self);
end;

procedure Tfrm_BulkImport.btn_Back3Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure Tfrm_BulkImport.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1Change(Self);
end;

procedure Tfrm_BulkImport.btn_Next3Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 3;
  PageControl1Change(Self);
end;

procedure Tfrm_BulkImport.btn_Back4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 2;
end;

procedure Tfrm_BulkImport.btn_Back5Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 3;
end;

procedure Tfrm_BulkImport.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

function Tfrm_BulkImport.GetFields(mRecordType, mAliasName   :String):String;
Var
  J   :Integer;
begin
  If mRecordType = '' Then
    begin
      Result := mAliasName;
      exit;
    end;
  If not qry_RecordType.Locate('Description', mRecordType, []) Then
    begin
      Result := mAliasName;
      exit;
    end;
  For J := 1 to 15 Do
    begin
      If UpperCase(trim(qry_RecordType.FieldbyName('Col' + InttoStr(J)).AsString)) = UpperCase(trim(mAliasName)) Then
        begin
          If (J >= 1) and (J <= 10) Then
            Result := 'TEXT'+InttoStr(J)
          else if (J >= 11) and (J <= 13) Then
            Result := 'DATE'+InttoStr(J-10)
          else if (J >= 14) and (J <= 15) Then
            Result := 'NUMBER'+InttoStr(J-13);
          exit;
        end;
    end;
  Result := mAliasName;
end;

function Tfrm_BulkImport.Translate_Alternative_Branch_Code(BranchAlternativeCode :String):String;
begin
  If BranchAlternativeCode = '' Then
    raise Exception.Create('Invalid Branch Alternative Code passed.');
  If not qry_GetAltBranches.Locate('AlternativeCode', BranchAlternativeCode, []) Then
    raise Exception.Create('Branch Alternative Code ' + BranchAlternativeCode + ' not found.');
  Result := qry_GetAltBranches.FieldbyName('BRANCH').AsString;
end;

function Tfrm_BulkImport.Translate_Alternative_Department_Code(Branch, DepartmentAlternativeCode :String):String;
begin
  If DepartmentAlternativeCode = '' Then
    raise Exception.Create('Invalid Branch Alternative Code passed.');
  If not qry_GetAltDepartments.Locate('Branch;AlternativeCode', VarArrayOf([Branch, DepartmentAlternativeCode]), []) Then
    raise Exception.Create('Department Alternative Code ' + DepartmentAlternativeCode + ' not found.');
  Result := qry_GetAltDepartments.FieldbyName('DEPARTMENT').AsString;
end;

function Tfrm_BulkImport.Translate_Alternative_RecordType(AlternativeRecordType :String):String;
begin
  If AlternativeRecordType = '' Then
    raise Exception.Create('Invalid Alternative RecordType passed.');
  If not qry_GetAltRecordTypes.Locate('AlternativeDescription', AlternativeRecordType, []) Then
    raise Exception.Create('Alternative RecordType ' + AlternativeRecordType + ' not found.');
  Result := qry_GetAltRecordTypes.FieldbyName('DESCRIPTION').AsString;
end;

procedure Tfrm_BulkImport.btn_DoImportClick(Sender: TObject);

function DoSubString(Start, Count : Integer; InString :String):String;
begin
  If (Start > 0) AND (Count > 0) Then
    Result := copy(InString, Start, Count)
  else Result := InString;
end;



Var
  FieldProperties :Array of FieldPropertiesRecord;
  Branch          :String;
  Department      :String;
  RecordType      :String;
  SourceFields    :Array[1..30] of Integer;
  DestFields      :Array[1..30] of String;
  SubStringStart  :Array[1..30] of Integer;
  SubStringCount  :Array[1..30] of Integer;
  A,X,Y,G,B       :Integer;
  SourceColumn    :String;
  DestColumn      :String;
  ColSubStringStart:Integer;
  ColSubStringCount:Integer;
  eRecNo, Tot      :Integer;
  Itemnumber      :String;
  eRecPath        :String;
  InseRec         :Boolean;
  sFileName       :String;
  sExtName        :String;
  sFilePath       :String;
  RecordTypeLoc   :Boolean;
  sDestroyDate    :TDateTime;
  sRetensionPeriod:Integer;
  sCalcDestructOnField :String;
  AbortFlag       :Boolean;
  TempStr         :String;
  COOLID          :String;
  COOLFieldList   :String;
  COOLParamList   :String;
  RecordCat       :String;
begin
  AbortFlag := False;
  PageControl1.ActivePageIndex := 4;
//==============================================================================
//===================Initialize=================================================
//==============================================================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Append('IF NOT EXISTS(SELECT * FROM MetroSystem WHERE Descr = ''BulkImp'')');
  qry_SQL.SQL.Append('  INSERT INTO MetroSystem (Descr, nCount, sValue) VALUES (''BulkImp'', 1, NULL)');
  qry_SQL.SQL.Append('ELSE UPDATE MetroSystem SET nCount = nCount + 1 WHERE Descr = ''BulkImp''');
  qry_SQL.SQL.Append('SELECT nCount FROM MetroSystem WHERE Descr = ''BulkImp''');
  qry_SQL.Open;
  edt_Batch.Text := InttoStr(qry_SQL.Fields[0].asInteger);
  qry_SQL.Close;

  For A := 1 to 30 Do
    begin
      SourceFields[A] := 0;
      DestFields[A] := '';
      SubStringStart[A] := 0;
      SubStringCount[A] := 0;
    end;

  pBar_Result.Position := 0;
  mem_Result.Lines.Clear;  

  Branch := edt_Branch.Text;
  Department := edt_Department.Text;
  RecordType := edt_IndexDef.Text;
  RecordCat := cb_RecordCat.Text;

  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions');
  qry_RecordType.Open;

  qry_GetAltBranches.Close;
  qry_GetAltBranches.SQL.Clear;
  qry_GetAltBranches.SQL.Add('SELECT AltMOPSCode AS [AlternativeCode], Branch FROM Branches ORDER BY AltMOPSCode');
  qry_GetAltBranches.Open;

  qry_GetAltDepartments.Close;
  qry_GetAltDepartments.SQL.Clear;
  qry_GetAltDepartments.SQL.Add('SELECT Branch, AltMOPSDept AS [AlternativeCode], Department FROM Departments ORDER BY Branch, AltMOPSDept');
  qry_GetAltDepartments.Open;

  qry_GetAltRecordTypes.Close;
  qry_GetAltRecordTypes.SQL.Clear;
  qry_GetAltRecordTypes.SQL.Add('SELECT AlternativeDescription, Description FROM IndexDefinitions ORDER BY AlternativeDescription');
  qry_GetAltRecordTypes.Open;
//==============================================================================
//===================Containers=================================================
//==============================================================================
  If rgrp_ImportType.ItemIndex = 0 Then
    begin
//----------------------------SQL-----------------------------------------------
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO Containers (Code, Container, Branch, Department, FileType, ContType, Destroy, RetentionPeriod, Destruct, IssueStatus, WIP, AONS, SAONS, INOS,');
      qry_Upd.SQL.Add('                        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ImportBatchNo, UpdatedBy, UpdatedOn)');
      qry_Upd.SQL.Add('VALUES (:Code, :Container, :Branch, :Department, :FileType, :ContType, :Destroy, :RetentionPeriod, :Destruct, :IssueStatus, :WIP, :AONS, :SAONS, :INOS,');
      qry_Upd.SQL.Add('        :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2, :ImportBatchNo, '+QuotedStr(User)+', GETDATE())');
//------------------Branch, Department and RecordType---------------------------
      qry_Upd.Parameters.ParamByName('Code').Value := CompsCode;
      If Branch <> '' Then
        qry_Upd.Parameters.ParamByName('Branch').Value := Branch;
      If Department <> '' Then
        qry_Upd.Parameters.ParamByName('Department').Value := Department;
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('FileType').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;

                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType,  UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'BRANCH CODE')AND
                                 (DestColumn <> 'BRANCH ALTERNATIVE CODE')AND
                                 (DestColumn <> 'DEPARTMENT CODE')AND
                                 (DestColumn <> 'DEPARTMENT ALTERNATIVE CODE')AND
                                 (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'CONTAINER')AND
                                 (DestColumn <> 'CONTTYPE')AND
                                 (DestColumn <> 'DESTROY')AND
                                 (DestColumn <> 'RETENTIONPERIOD')AND
                                 (DestColumn <> 'DESTRUCT')AND
                                 (DestColumn <> 'ISSUESTATUS')AND
                                 (DestColumn <> 'WIP')AND
                                 (DestColumn <> 'AONS')AND
                                 (DestColumn <> 'SAONS')AND
                                 (DestColumn <> 'INOS')AND
                                 (DestColumn <> 'TEXT1')AND
                                 (DestColumn <> 'TEXT2')AND
                                 (DestColumn <> 'TEXT3')AND
                                 (DestColumn <> 'TEXT4')AND
                                 (DestColumn <> 'TEXT5')AND
                                 (DestColumn <> 'TEXT6')AND
                                 (DestColumn <> 'TEXT7')AND
                                 (DestColumn <> 'TEXT8')AND
                                 (DestColumn <> 'TEXT9')AND
                                 (DestColumn <> 'TEXT10')AND
                                 (DestColumn <> 'DATE1')AND
                                 (DestColumn <> 'DATE2')AND
                                 (DestColumn <> 'DATE3')AND
                                 (DestColumn <> 'NUMBER1')AND
                                 (DestColumn <> 'NUMBER2')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing Containers.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('Container').DataType := ftString;
            qry_Upd.Parameters.ParamByName('ContType').DataType := ftString;
            qry_Upd.Parameters.ParamByName('RetentionPeriod').DataType := ftsmallint;
            qry_Upd.Parameters.ParamByName('Destruct').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('IssueStatus').DataType := ftString;
            qry_Upd.Parameters.ParamByName('WIP').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('AONS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('SAONS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('INOS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Text1').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text2').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text3').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text4').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text5').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text6').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text7').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text8').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text9').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text10').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Date1').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date2').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date3').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Number1').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Number2').DataType := ftInteger;

            qry_Upd.Parameters.ParamByName('Container').Value := Null;
            qry_Upd.Parameters.ParamByName('ContType').Value := Null;
            qry_Upd.Parameters.ParamByName('Destruct').Value := Null;
            qry_Upd.Parameters.ParamByName('IssueStatus').Value := Null;
            qry_Upd.Parameters.ParamByName('Text1').Value := Null;
            qry_Upd.Parameters.ParamByName('Text2').Value := Null;
            qry_Upd.Parameters.ParamByName('Text3').Value := Null;
            qry_Upd.Parameters.ParamByName('Text4').Value := Null;
            qry_Upd.Parameters.ParamByName('Text5').Value := Null;
            qry_Upd.Parameters.ParamByName('Text6').Value := Null;
            qry_Upd.Parameters.ParamByName('Text7').Value := Null;
            qry_Upd.Parameters.ParamByName('Text8').Value := Null;
            qry_Upd.Parameters.ParamByName('Text9').Value := Null;
            qry_Upd.Parameters.ParamByName('Text10').Value := Null;
            qry_Upd.Parameters.ParamByName('Date1').Value := Null;
            qry_Upd.Parameters.ParamByName('Date2').Value := Null;
            qry_Upd.Parameters.ParamByName('Date3').Value := Null;
            qry_Upd.Parameters.ParamByName('Number1').Value := Null;
            qry_Upd.Parameters.ParamByName('Number2').Value := Null;

            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'BRANCH CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := TempStr;
                      end
                    else if DestFields[Y] = 'BRANCH ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := Translate_Alternative_Branch_Code(TempStr);
                      end
                    else if DestFields[Y] = 'DEPARTMENT CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := TempStr;
                      end
                    else if DestFields[Y] = 'DEPARTMENT ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := Translate_Alternative_Department_Code(qry_Upd.Parameters.ParamByName('Branch').Value, TempStr);
                      end
                    else if DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.Parameters.ParamByName('Destroy').Value := qry_RecordType.FieldByName('cDestroy').AsInteger;
            qry_Upd.Parameters.ParamByName('RetentionPeriod').Value := qry_RecordType.FieldByName('cRetentionPeriod').AsInteger;
            qry_Upd.Parameters.ParamByName('WIP').Value := qry_RecordType.FieldByName('cWIP').AsInteger;
            qry_Upd.Parameters.ParamByName('AONS').Value := qry_RecordType.FieldByName('cAONS').AsInteger;
            qry_Upd.Parameters.ParamByName('SAONS').Value := qry_RecordType.FieldByName('cSAONS').AsInteger;
            qry_Upd.Parameters.ParamByName('INOS').Value := qry_RecordType.FieldByName('cINOS').AsInteger;
            qry_Upd.Parameters.ParamByName('ImportBatchNo').Value := edt_Batch.Text;

//-----------Check IssueStatus-----
            If (qry_Upd.Parameters.ParamByName('IssueStatus').Value <> Null) AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> '') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'MET') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'INUSE') Then
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': Invalid IssueStatus');
                Continue;
              end;
//-----------Calculate Destruction Date
            If qry_Upd.Parameters.ParamByName('Destruct').Value = Null Then
              begin
                If qry_Upd.Parameters.ParamByName('Destroy').Value = 0 Then
                  begin
                    If qry_RecordType.FieldByName('cCalcDestructOnEntryDate').AsBoolean Then
                      begin
                        sRetensionPeriod := qry_Upd.Parameters.ParamByName('RetentionPeriod').Value;
                        sDestroyDate := IncMonth(Now, sRetensionPeriod);
                      end
                    else
                      begin
                        sRetensionPeriod := qry_Upd.Parameters.ParamByName('RetentionPeriod').Value;
                        sCalcDestructOnField := trim(qry_RecordType.FieldByName('cCalcDestructOnField').AsString);
                        If sCalcDestructOnField <> '' Then
                          begin
                            sDestroyDate := 0;
                            For Y := 1 to 30 Do
                              begin
                                If sCalcDestructOnField = DestFields[Y] Then
                                  begin
                                    If TryStrtoDateTime(trim(sgrd_Import.Cells[SourceFields[Y], X]), sDestroyDate) Then
                                      begin
                                        sDestroyDate := IncMonth(sDestroyDate, sRetensionPeriod);
                                        break;
                                      end;
                                  end;
                              end;
                          end;
                      end;

                    If sDestroyDate <> 0 Then
                      qry_Upd.Parameters.ParamByName('Destruct').Value := sDestroyDate;
                  end
                else
                  begin
                      qry_Upd.Parameters.ParamByName('Destruct').Value := sDestroyDate;
                  end;
              end;
//-----------Calculate Destruction Date
            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;
        end;
    end
//==============================================================================
//===================Files======================================================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 1 Then
    begin
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO Files (Code, Filenumber, ContainerNo, Branch, Department, FileType, Destroy, RetentionPeriod, Destruct, IssueStatus, WIP, AONS, SAONS, INOS,');
      qry_Upd.SQL.Add('                        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ImportBatchNo, UpdatedBy, UpdatedOn)');
      qry_Upd.SQL.Add('VALUES (:Code, :Filenumber, :ContainerNo, :Branch, :Department, :FileType, :Destroy, :RetentionPeriod, :Destruct, :IssueStatus, :WIP, :AONS, :SAONS, :INOS,');
      qry_Upd.SQL.Add('        :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2, :ImportBatchNo, '+QuotedStr(User)+', GETDATE())');
//------------------Branch, Department and RecordType---------------------------
      qry_Upd.Parameters.ParamByName('Code').Value := CompsCode;
      If Branch <> '' Then
        qry_Upd.Parameters.ParamByName('Branch').Value := Branch;
      If Department <> '' Then
        qry_Upd.Parameters.ParamByName('Department').Value := Department;
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('FileType').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;

                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType, UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'BRANCH CODE')AND
                                 (DestColumn <> 'BRANCH ALTERNATIVE CODE')AND
                                 (DestColumn <> 'DEPARTMENT CODE')AND
                                 (DestColumn <> 'DEPARTMENT ALTERNATIVE CODE')AND
                                 (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'FILENUMBER')AND
                                 (DestColumn <> 'CONTAINERNO')AND
                                 (DestColumn <> 'DESTROY')AND
                                 (DestColumn <> 'RETENTIONPERIOD')AND
                                 (DestColumn <> 'DESTRUCT')AND
                                 (DestColumn <> 'ISSUESTATUS')AND
                                 (DestColumn <> 'WIP')AND
                                 (DestColumn <> 'AONS')AND
                                 (DestColumn <> 'SAONS')AND
                                 (DestColumn <> 'INOS')AND
                                 (DestColumn <> 'TEXT1')AND
                                 (DestColumn <> 'TEXT2')AND
                                 (DestColumn <> 'TEXT3')AND
                                 (DestColumn <> 'TEXT4')AND
                                 (DestColumn <> 'TEXT5')AND
                                 (DestColumn <> 'TEXT6')AND
                                 (DestColumn <> 'TEXT7')AND
                                 (DestColumn <> 'TEXT8')AND
                                 (DestColumn <> 'TEXT9')AND
                                 (DestColumn <> 'TEXT10')AND
                                 (DestColumn <> 'DATE1')AND
                                 (DestColumn <> 'DATE2')AND
                                 (DestColumn <> 'DATE3')AND
                                 (DestColumn <> 'NUMBER1')AND
                                 (DestColumn <> 'NUMBER2')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing Files.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('Filenumber').DataType := ftString;
            qry_Upd.Parameters.ParamByName('ContainerNo').DataType := ftString;
            qry_Upd.Parameters.ParamByName('RetentionPeriod').DataType := ftsmallint;
            qry_Upd.Parameters.ParamByName('Destruct').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('IssueStatus').DataType := ftString;
            qry_Upd.Parameters.ParamByName('WIP').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('AONS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('SAONS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('INOS').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Text1').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text2').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text3').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text4').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text5').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text6').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text7').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text8').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text9').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text10').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Date1').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date2').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date3').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Number1').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Number2').DataType := ftInteger;

            qry_Upd.Parameters.ParamByName('Filenumber').Value := Null;
            qry_Upd.Parameters.ParamByName('ContainerNo').Value := Null;
            qry_Upd.Parameters.ParamByName('Destruct').Value := Null;
            qry_Upd.Parameters.ParamByName('IssueStatus').Value := Null;
            qry_Upd.Parameters.ParamByName('Text1').Value := Null;
            qry_Upd.Parameters.ParamByName('Text2').Value := Null;
            qry_Upd.Parameters.ParamByName('Text3').Value := Null;
            qry_Upd.Parameters.ParamByName('Text4').Value := Null;
            qry_Upd.Parameters.ParamByName('Text5').Value := Null;
            qry_Upd.Parameters.ParamByName('Text6').Value := Null;
            qry_Upd.Parameters.ParamByName('Text7').Value := Null;
            qry_Upd.Parameters.ParamByName('Text8').Value := Null;
            qry_Upd.Parameters.ParamByName('Text9').Value := Null;
            qry_Upd.Parameters.ParamByName('Text10').Value := Null;
            qry_Upd.Parameters.ParamByName('Date1').Value := Null;
            qry_Upd.Parameters.ParamByName('Date2').Value := Null;
            qry_Upd.Parameters.ParamByName('Date3').Value := Null;
            qry_Upd.Parameters.ParamByName('Number1').Value := Null;
            qry_Upd.Parameters.ParamByName('Number2').Value := Null;

            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'BRANCH CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := TempStr;
                      end
                    else if DestFields[Y] = 'BRANCH ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := Translate_Alternative_Branch_Code(TempStr);
                      end
                    else if DestFields[Y] = 'DEPARTMENT CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := TempStr;
                      end
                    else if DestFields[Y] = 'DEPARTMENT ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := Translate_Alternative_Department_Code(qry_Upd.Parameters.ParamByName('Branch').Value, TempStr);
                      end
                    else if DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.Parameters.ParamByName('Destroy').Value := qry_RecordType.FieldByName('fDestroy').AsInteger;
            qry_Upd.Parameters.ParamByName('RetentionPeriod').Value := qry_RecordType.FieldByName('fRetentionPeriod').AsInteger;
            qry_Upd.Parameters.ParamByName('IssueStatus').Value := Null;
            qry_Upd.Parameters.ParamByName('WIP').Value := qry_RecordType.FieldByName('fWIP').AsInteger;
            qry_Upd.Parameters.ParamByName('AONS').Value := qry_RecordType.FieldByName('fAONS').AsInteger;
            qry_Upd.Parameters.ParamByName('SAONS').Value := qry_RecordType.FieldByName('fSAONS').AsInteger;
            qry_Upd.Parameters.ParamByName('INOS').Value := qry_RecordType.FieldByName('fINOS').AsInteger;
            qry_Upd.Parameters.ParamByName('ImportBatchNo').Value := edt_Batch.Text;
//-----------Check IssueStatus-----
            If (qry_Upd.Parameters.ParamByName('IssueStatus').Value <> Null) AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> '') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'MET') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'INUSE') Then
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': Invalid IssueStatus');
                Continue;
              end;
//-----------Calculate Destruction Date
            If qry_Upd.Parameters.ParamByName('Destruct').Value = Null Then
              begin
                If qry_Upd.Parameters.ParamByName('Destroy').Value = 0 Then
                  begin
                    If qry_RecordType.FieldByName('fCalcDestructOnEntryDate').AsBoolean Then
                      begin
                        sRetensionPeriod := qry_Upd.Parameters.ParamByName('RetentionPeriod').Value;
                        sDestroyDate := IncMonth(Now, sRetensionPeriod);
                      end
                    else
                      begin
                        sRetensionPeriod := qry_Upd.Parameters.ParamByName('RetentionPeriod').Value;
                        sCalcDestructOnField := trim(qry_RecordType.FieldByName('fCalcDestructOnField').AsString);
                        If sCalcDestructOnField <> '' Then
                          begin
                            sDestroyDate := 0;
                            For Y := 1 to 30 Do
                              begin
                                If sCalcDestructOnField = DestFields[Y] Then
                                  begin
                                    If TryStrtoDateTime(trim(sgrd_Import.Cells[SourceFields[Y], X]), sDestroyDate) Then
                                      begin
                                        sDestroyDate := IncMonth(sDestroyDate, sRetensionPeriod);
                                        break;
                                      end;
                                  end;
                              end;
                          end;
                      end;

                    If sDestroyDate <> 0 Then
                      qry_Upd.Parameters.ParamByName('Destruct').Value := sDestroyDate;
                  end
                else
                  begin
                      qry_Upd.Parameters.ParamByName('Destruct').Value := sDestroyDate;
                  end;
              end;
//-----------Calculate Destruction Date
            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;
        end;
    end
//==============================================================================
//===================Items======================================================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 2 Then
    begin
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO Items (Itemnumber, Filenumber, FileType, Status, ');
      qry_Upd.SQL.Add('                        Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ImportBatchNo, UpdatedBy, UpdatedOn)');
      qry_Upd.SQL.Add('VALUES (:Itemnumber, :Filenumber, :FileType, :IssueStatus, ');
      qry_Upd.SQL.Add('        :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2, :ImportBatchNo, '+QuotedStr(User)+', GETDATE())');
//------------------Branch, Department and RecordType---------------------------
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('FileType').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;
                                  
                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType, UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'ITEMNUMBER')AND
                                 (DestColumn <> 'FILENUMBER')AND
                                 (DestColumn <> 'ISSUESTATUS')AND
                                 (DestColumn <> 'TEXT1')AND
                                 (DestColumn <> 'TEXT2')AND
                                 (DestColumn <> 'TEXT3')AND
                                 (DestColumn <> 'TEXT4')AND
                                 (DestColumn <> 'TEXT5')AND
                                 (DestColumn <> 'TEXT6')AND
                                 (DestColumn <> 'TEXT7')AND
                                 (DestColumn <> 'TEXT8')AND
                                 (DestColumn <> 'TEXT9')AND
                                 (DestColumn <> 'TEXT10')AND
                                 (DestColumn <> 'DATE1')AND
                                 (DestColumn <> 'DATE2')AND
                                 (DestColumn <> 'DATE3')AND
                                 (DestColumn <> 'NUMBER1')AND
                                 (DestColumn <> 'NUMBER2')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing Items.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('Itemnumber').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Filenumber').DataType := ftString;
            qry_Upd.Parameters.ParamByName('IssueStatus').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text1').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text2').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text3').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text4').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text5').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text6').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text7').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text8').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text9').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text10').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Date1').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date2').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date3').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Number1').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Number2').DataType := ftInteger;

            qry_Upd.Parameters.ParamByName('Itemnumber').Value := Null;
            qry_Upd.Parameters.ParamByName('Filenumber').Value := Null;
            qry_Upd.Parameters.ParamByName('IssueStatus').Value := Null;
            qry_Upd.Parameters.ParamByName('Text1').Value := Null;
            qry_Upd.Parameters.ParamByName('Text2').Value := Null;
            qry_Upd.Parameters.ParamByName('Text3').Value := Null;
            qry_Upd.Parameters.ParamByName('Text4').Value := Null;
            qry_Upd.Parameters.ParamByName('Text5').Value := Null;
            qry_Upd.Parameters.ParamByName('Text6').Value := Null;
            qry_Upd.Parameters.ParamByName('Text7').Value := Null;
            qry_Upd.Parameters.ParamByName('Text8').Value := Null;
            qry_Upd.Parameters.ParamByName('Text9').Value := Null;
            qry_Upd.Parameters.ParamByName('Text10').Value := Null;
            qry_Upd.Parameters.ParamByName('Date1').Value := Null;
            qry_Upd.Parameters.ParamByName('Date2').Value := Null;
            qry_Upd.Parameters.ParamByName('Date3').Value := Null;
            qry_Upd.Parameters.ParamByName('Number1').Value := Null;
            qry_Upd.Parameters.ParamByName('Number2').Value := Null;

            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('FileType').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.Parameters.ParamByName('ImportBatchNo').Value := edt_Batch.Text;
//-----------Check IssueStatus-----
            If (qry_Upd.Parameters.ParamByName('IssueStatus').Value <> Null) AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'P') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'MET') AND
               (UpperCase(trim(qry_Upd.Parameters.ParamByName('IssueStatus').Value)) <> 'IU') Then
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': Invalid IssueStatus');
                Continue;
              end;

            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;
        end;
    end
//==============================================================================
//===================eRecords===================================================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 3 Then
    begin
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO eRecords (Code, Branch, Department, RecordType, RecordCat, NilPurge, PurgeDate, Filenumber, Itemnumber, ');
      qry_Upd.SQL.Add('                      Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ImportBatchNo, CapBy, CapDate)');
      qry_Upd.SQL.Add('VALUES (:Code, :Branch, :Department, :RecordType, :RecordCat, :NilPurge, :PurgeDate, :Filenumber, :Itemnumber, ');
      qry_Upd.SQL.Add('        :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2, :ImportBatchNo, :CapBy, GETDATE())');
      qry_Upd.SQL.Add('SELECT Scope_Identity() as eRecNo');
//------------------Branch, Department and RecordType---------------------------
      qry_Upd.Parameters.ParamByName('Code').Value := CompsCode;
      If Branch <> '' Then
        qry_Upd.Parameters.ParamByName('Branch').Value := Branch;
      If Department <> '' Then
        qry_Upd.Parameters.ParamByName('Department').Value := Department;
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('RecordType').Value := RecordType;
      If RecordCat <> '' Then
        qry_Upd.Parameters.ParamByName('RecordCat').Value := RecordCat;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;
                                  
                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType, UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'BRANCH CODE')AND
                                 (DestColumn <> 'BRANCH ALTERNATIVE CODE')AND
                                 (DestColumn <> 'DEPARTMENT CODE')AND
                                 (DestColumn <> 'DEPARTMENT ALTERNATIVE CODE')AND
                                 (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'RECORDCAT')AND
                                 (DestColumn <> 'NILPURGE')AND
                                 (DestColumn <> 'PURGEDATE')AND
                                 (DestColumn <> 'ITEMNUMBER')AND
                                 (DestColumn <> 'FILENUMBER')AND
                                 (DestColumn <> 'TEXT1')AND
                                 (DestColumn <> 'TEXT2')AND
                                 (DestColumn <> 'TEXT3')AND
                                 (DestColumn <> 'TEXT4')AND
                                 (DestColumn <> 'TEXT5')AND
                                 (DestColumn <> 'TEXT6')AND
                                 (DestColumn <> 'TEXT7')AND
                                 (DestColumn <> 'TEXT8')AND
                                 (DestColumn <> 'TEXT9')AND
                                 (DestColumn <> 'TEXT10')AND
                                 (DestColumn <> 'DATE1')AND
                                 (DestColumn <> 'DATE2')AND
                                 (DestColumn <> 'DATE3')AND
                                 (DestColumn <> 'NUMBER1')AND
                                 (DestColumn <> 'ERECORD DOCUMENT IMPORT')AND
                                 (DestColumn <> 'NUMBER2')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing eRecords.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('PurgeDate').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Filenumber').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Itemnumber').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text1').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text2').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text3').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text4').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text5').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text6').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text7').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text8').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text9').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text10').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Date1').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date2').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date3').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Number1').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Number2').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('CapBy').DataType := ftString;

            qry_Upd.Parameters.ParamByName('PurgeDate').Value := Null;
            qry_Upd.Parameters.ParamByName('Filenumber').Value := Null;
            qry_Upd.Parameters.ParamByName('Itemnumber').Value := Null;
            qry_Upd.Parameters.ParamByName('Text1').Value := Null;
            qry_Upd.Parameters.ParamByName('Text2').Value := Null;
            qry_Upd.Parameters.ParamByName('Text3').Value := Null;
            qry_Upd.Parameters.ParamByName('Text4').Value := Null;
            qry_Upd.Parameters.ParamByName('Text5').Value := Null;
            qry_Upd.Parameters.ParamByName('Text6').Value := Null;
            qry_Upd.Parameters.ParamByName('Text7').Value := Null;
            qry_Upd.Parameters.ParamByName('Text8').Value := Null;
            qry_Upd.Parameters.ParamByName('Text9').Value := Null;
            qry_Upd.Parameters.ParamByName('Text10').Value := Null;
            qry_Upd.Parameters.ParamByName('Date1').Value := Null;
            qry_Upd.Parameters.ParamByName('Date2').Value := Null;
            qry_Upd.Parameters.ParamByName('Date3').Value := Null;
            qry_Upd.Parameters.ParamByName('Number1').Value := Null;
            qry_Upd.Parameters.ParamByName('Number2').Value := Null;

            If RecordCat = '' Then
              begin
                qry_Upd.Parameters.ParamByName('RecordCat').DataType := ftString;
                qry_Upd.Parameters.ParamByName('RecordCat').Value := Null;
              end;

            InseRec := False;
            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'BRANCH CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := TempStr;
                      end
                    else if DestFields[Y] = 'BRANCH ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Branch').Value := Translate_Alternative_Branch_Code(TempStr);
                      end
                    else if DestFields[Y] = 'DEPARTMENT CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := TempStr;
                      end
                    else if DestFields[Y] = 'DEPARTMENT ALTERNATIVE CODE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Department').Value := Translate_Alternative_Department_Code(qry_Upd.Parameters.ParamByName('Branch').Value, TempStr);
                      end
                    else if DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('RecordType').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('RecordType').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else if (DestFields[Y] = 'ERECORD DOCUMENT IMPORT') Then
                      begin
                        eRecPath := TempStr;
                        InseRec := True;
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.Parameters.ParamByName('NilPurge').Value := qry_RecordType.FieldByName('eDestroy').asInteger;
            qry_Upd.Parameters.ParamByName('ImportBatchNo').Value := edt_Batch.Text;
//-----------------------------First Add Check if we can create Items-----------
            If chk_AutoGenItems.Checked Then
              begin
                If qry_Upd.Parameters.ParamByName('Filenumber').Value = Null Then
                  begin
                    Messagedlg('Cannot Auto Generate Item for eRecord '+InttoStr(X)+'. There is no File Barcode to Import.', mtError, [mbOK], 0);
                    mem_Result.Lines.Append('Cannot Auto Generate Item for eRecord '+InttoStr(X)+'. There is no File Barcode to Import.');
                    exit;
                  end;
              end;
//-----------------------------Check if we must auto index from File------------
            If chk_AutoGeneRecordIndexFile.Checked Then
              begin
                If qry_Upd.Parameters.ParamByName('Filenumber').Value = Null Then
                  begin
                    Messagedlg('Cannot Auto Generate eRecord '+InttoStr(X)+' Index. There is no File Barcode to Import.', mtError, [mbOK], 0);
                    mem_Result.Lines.Append('Cannot Auto eRecord '+InttoStr(X)+' Index. There is no File Barcode to Import.');
                    exit;
                  end;

                qry_GetIndexData.Close;
                qry_GetIndexData.SQL.Clear;
                qry_GetIndexData.SQL.Add('SELECT Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Files WHERE Filenumber = :File');
                qry_GetIndexData.Parameters.ParamValues['File'] := qry_Upd.Parameters.ParamByName('Filenumber').Value;
                qry_GetIndexData.Open;

                If not qry_GetIndexData.IsEmpty Then
                  begin
                    qry_Upd.Parameters.ParamByName('Text1').Value := qry_GetIndexData.FieldByName('Text1').Value;
                    qry_Upd.Parameters.ParamByName('Text2').Value := qry_GetIndexData.FieldByName('Text2').Value;
                    qry_Upd.Parameters.ParamByName('Text3').Value := qry_GetIndexData.FieldByName('Text3').Value;
                    qry_Upd.Parameters.ParamByName('Text4').Value := qry_GetIndexData.FieldByName('Text4').Value;
                    qry_Upd.Parameters.ParamByName('Text5').Value := qry_GetIndexData.FieldByName('Text5').Value;
                    qry_Upd.Parameters.ParamByName('Text6').Value := qry_GetIndexData.FieldByName('Text6').Value;
                    qry_Upd.Parameters.ParamByName('Text7').Value := qry_GetIndexData.FieldByName('Text7').Value;
                    qry_Upd.Parameters.ParamByName('Text8').Value := qry_GetIndexData.FieldByName('Text8').Value;
                    qry_Upd.Parameters.ParamByName('Text9').Value := qry_GetIndexData.FieldByName('Text9').Value;
                    qry_Upd.Parameters.ParamByName('Text10').Value := qry_GetIndexData.FieldByName('Text10').Value;
                    qry_Upd.Parameters.ParamByName('Date1').Value := qry_GetIndexData.FieldByName('Date1').Value;
                    qry_Upd.Parameters.ParamByName('Date2').Value := qry_GetIndexData.FieldByName('Date2').Value;
                    qry_Upd.Parameters.ParamByName('Date3').Value := qry_GetIndexData.FieldByName('Date3').Value;
                    qry_Upd.Parameters.ParamByName('Number1').Value := qry_GetIndexData.FieldByName('Number1').Value;
                    qry_Upd.Parameters.ParamByName('Number2').Value := qry_GetIndexData.FieldByName('Number2').Value;
                  end
                else mem_Result.Lines.Append('Cannot Auto Generate Index for eRecord '+InttoStr(X)+'. Filenumber '+qry_Upd.Parameters.ParamByName('Filenumber').Value+' does not exists in the system.');
                qry_GetIndexData.Close;
              end;
//-----------------------------Check if we must auto index from File------------
            If chk_AutoGeneRecordIndexItem.Checked Then
              begin
                If qry_Upd.Parameters.ParamByName('Itemnumber').Value = Null Then
                  begin
                    Messagedlg('Cannot Auto Generate eRecord '+InttoStr(X)+' Index. There is no Item Barcode to Import.', mtError, [mbOK], 0);
                    mem_Result.Lines.Append('Cannot Auto eRecord '+InttoStr(X)+' Index. There is no Item Barcode to Import.');
                    exit;
                  end;

                qry_GetIndexData.Close;
                qry_GetIndexData.SQL.Clear;
                qry_GetIndexData.SQL.Add('SELECT Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Items WHERE Itemnumber = :Item');
                qry_GetIndexData.Parameters.ParamValues['Item'] := qry_Upd.Parameters.ParamByName('Itemnumber').Value;
                qry_GetIndexData.Open;

                If not qry_GetIndexData.IsEmpty Then
                  begin
                    qry_Upd.Parameters.ParamByName('Text1').Value := qry_GetIndexData.FieldByName('Text1').Value;
                    qry_Upd.Parameters.ParamByName('Text2').Value := qry_GetIndexData.FieldByName('Text2').Value;
                    qry_Upd.Parameters.ParamByName('Text3').Value := qry_GetIndexData.FieldByName('Text3').Value;
                    qry_Upd.Parameters.ParamByName('Text4').Value := qry_GetIndexData.FieldByName('Text4').Value;
                    qry_Upd.Parameters.ParamByName('Text5').Value := qry_GetIndexData.FieldByName('Text5').Value;
                    qry_Upd.Parameters.ParamByName('Text6').Value := qry_GetIndexData.FieldByName('Text6').Value;
                    qry_Upd.Parameters.ParamByName('Text7').Value := qry_GetIndexData.FieldByName('Text7').Value;
                    qry_Upd.Parameters.ParamByName('Text8').Value := qry_GetIndexData.FieldByName('Text8').Value;
                    qry_Upd.Parameters.ParamByName('Text9').Value := qry_GetIndexData.FieldByName('Text9').Value;
                    qry_Upd.Parameters.ParamByName('Text10').Value := qry_GetIndexData.FieldByName('Text10').Value;
                    qry_Upd.Parameters.ParamByName('Date1').Value := qry_GetIndexData.FieldByName('Date1').Value;
                    qry_Upd.Parameters.ParamByName('Date2').Value := qry_GetIndexData.FieldByName('Date2').Value;
                    qry_Upd.Parameters.ParamByName('Date3').Value := qry_GetIndexData.FieldByName('Date3').Value;
                    qry_Upd.Parameters.ParamByName('Number1').Value := qry_GetIndexData.FieldByName('Number1').Value;
                    qry_Upd.Parameters.ParamByName('Number2').Value := qry_GetIndexData.FieldByName('Number2').Value;
                  end
                else mem_Result.Lines.Append('Cannot Auto Generate Index for eRecord '+InttoStr(X)+'. Itemnumber '+qry_Upd.Parameters.ParamByName('Itemnumber').Value+' does not exists in the system.');
                qry_GetIndexData.Close;
              end;
//-----------Calculate Destruction Date
            If qry_Upd.Parameters.ParamByName('PurgeDate').Value = Null Then
              begin
                If qry_Upd.Parameters.ParamByName('NilPurge').Value = 0 Then
                  begin
                    If qry_RecordType.FieldByName('eCalcDestructOnEntryDate').AsBoolean Then
                      begin
                        sRetensionPeriod := qry_RecordType.FieldByName('eRetentionPeriod').asInteger;
                        sDestroyDate := IncMonth(Now, sRetensionPeriod);
                      end
                    else
                      begin
                        sRetensionPeriod := qry_RecordType.FieldByName('eRetentionPeriod').asInteger;
                        sCalcDestructOnField := trim(qry_RecordType.FieldByName('eCalcDestructOnField').AsString);
                        If sCalcDestructOnField <> '' Then
                          begin
                            sDestroyDate := 0;
                            For Y := 1 to 30 Do
                              begin
                                If sCalcDestructOnField = DestFields[Y] Then
                                  begin
                                    If TryStrtoDateTime(trim(sgrd_Import.Cells[SourceFields[Y], X]), sDestroyDate) Then
                                      begin
                                        sDestroyDate := IncMonth(sDestroyDate, sRetensionPeriod);
                                        break;
                                      end;
                                  end;
                              end;
                          end;
                      end;

                    If sDestroyDate <> 0 Then
                      qry_Upd.Parameters.ParamByName('PurgeDate').Value := sDestroyDate;
                  end
                else
                  begin
                      qry_Upd.Parameters.ParamByName('PurgeDate').Value := sDestroyDate;
                  end;
              end;
//-----------Calculate Destruction Date
            qry_Upd.Parameters.ParamByName('CapBy').Value := User;

            qry_Upd.Open;
            eRecNo := qry_Upd.FieldbyName('eRecNo').asInteger;

            If InseRec Then
              begin
                sFilePath := ExtractFilePath(eRecPath);
                If sFilePath = '' Then
                  sFilePath := ExtractFilePath(edt_ImportFilename.Text);

                sFilename := ExtractFileName(eRecPath);

                eRecPath := sFilePath+sFilename;
                If not FileExists(eRecPath) Then
                  begin
                    If not AbortFlag Then
                      begin
                        AbortFlag := True;
                        If Messagedlg('Cannot import eRecord '+sFileName+': File does not exist : '+eRecPath+'. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                          exit;
                      end;
                    mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot import eRecord '+sFileName+': File does not exist : '+eRecPath);
                  end
                else
                  begin
                    try
                      dm_Metrofiler.SaveERecToRepositry(eRecNo, eRecPath, trim(user));
                    except
                      on E : Exception do
                        begin
                          mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot import eRecord '+sFileName+': '+e.Message);
                        end;
                    end;
                  end;
              end;

            If chk_AutoGenItems.Checked Then
              begin
                try
                  qry_AutoItem.Close;
                  qry_AutoItem.SQL.Clear;
                  qry_AutoItem.SQL.Add('INSERT INTO Items (Itemnumber, Filenumber, FileType, Status, ');
                  qry_AutoItem.SQL.Add('                   Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2, ImportBatchNo, UpdatedBy, UpdatedOn)');
                  qry_AutoItem.SQL.Add('VALUES (:Itemnumber, :Filenumber, :FileType, ''P'', ');
                  qry_AutoItem.SQL.Add('        :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2, :ImportBatchNo, '+QuotedStr(User)+', GETDATE())');

                  If (qry_Upd.Parameters.ParambyName('Itemnumber').Value = '')OR
                     (qry_Upd.Parameters.ParambyName('Itemnumber').Value = NULL)Then
                    begin
                      Itemnumber := qry_Upd.Parameters.ParambyName('Filenumber').Value;
                      Itemnumber := trim(Itemnumber) + InttoStr(eRecNo)+'AI';
                    end
                  else
                    begin
                      Itemnumber := qry_Upd.Parameters.ParambyName('Itemnumber').Value;
                    end;

                  qry_AutoItem.Parameters.ParamByName('Itemnumber').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Filenumber').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('FileType').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text1').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text2').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text3').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text4').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text5').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text6').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text7').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text8').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text9').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Text10').DataType := ftString;
                  qry_AutoItem.Parameters.ParamByName('Date1').DataType := ftDateTime;
                  qry_AutoItem.Parameters.ParamByName('Date2').DataType := ftDateTime;
                  qry_AutoItem.Parameters.ParamByName('Date3').DataType := ftDateTime;
                  qry_AutoItem.Parameters.ParamByName('Number1').DataType := ftInteger;
                  qry_AutoItem.Parameters.ParamByName('Number2').DataType := ftInteger;


                  qry_AutoItem.Parameters.ParamByName('Itemnumber').Value := Itemnumber;
                  qry_AutoItem.Parameters.ParamByName('Filenumber').Value := qry_Upd.Parameters.ParambyName('Filenumber').Value;
                  qry_AutoItem.Parameters.ParamByName('FileType').Value := qry_Upd.Parameters.ParambyName('RecordType').Value;
                  qry_AutoItem.Parameters.ParamByName('Text1').Value := qry_Upd.Parameters.ParambyName('Text1').Value;
                  qry_AutoItem.Parameters.ParamByName('Text2').Value := qry_Upd.Parameters.ParambyName('Text2').Value;
                  qry_AutoItem.Parameters.ParamByName('Text3').Value := qry_Upd.Parameters.ParambyName('Text3').Value;
                  qry_AutoItem.Parameters.ParamByName('Text4').Value := qry_Upd.Parameters.ParambyName('Text4').Value;
                  qry_AutoItem.Parameters.ParamByName('Text5').Value := qry_Upd.Parameters.ParambyName('Text5').Value;
                  qry_AutoItem.Parameters.ParamByName('Text6').Value := qry_Upd.Parameters.ParambyName('Text6').Value;
                  qry_AutoItem.Parameters.ParamByName('Text7').Value := qry_Upd.Parameters.ParambyName('Text7').Value;
                  qry_AutoItem.Parameters.ParamByName('Text8').Value := qry_Upd.Parameters.ParambyName('Text8').Value;
                  qry_AutoItem.Parameters.ParamByName('Text9').Value := qry_Upd.Parameters.ParambyName('Text9').Value;
                  qry_AutoItem.Parameters.ParamByName('Text10').Value := qry_Upd.Parameters.ParambyName('Text10').Value;
                  qry_AutoItem.Parameters.ParamByName('Date1').Value := qry_Upd.Parameters.ParambyName('Date1').Value;
                  qry_AutoItem.Parameters.ParamByName('Date2').Value := qry_Upd.Parameters.ParambyName('Date2').Value;
                  qry_AutoItem.Parameters.ParamByName('Date3').Value := qry_Upd.Parameters.ParambyName('Date3').Value;
                  qry_AutoItem.Parameters.ParamByName('Number1').Value := qry_Upd.Parameters.ParambyName('Number1').Value;
                  qry_AutoItem.Parameters.ParamByName('Number2').Value := qry_Upd.Parameters.ParambyName('Number2').Value;
                  qry_AutoItem.Parameters.ParamByName('ImportBatchNo').Value := edt_Batch.Text;

                  qry_AutoItem.ExecSQL;
                except
                  on E : Exception do
                    begin
                      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Auto Generate Item: '+e.Message);
                    end;
                end;
              end;

          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;

          qry_Upd.Close;
        end;
    end
//==============================================================================
//===================Index Definition Lookups===================================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 4 Then
    begin
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO IndexDefsLookups (Description, ColumnHeading, Item)');
      qry_Upd.SQL.Add('VALUES (:Description, :ColumnHeading, :ColumnValue)');
//------------------Branch, Department and RecordType---------------------------
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('Description').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;
                                  
                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType, UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'COLUMNHEADING')AND
                                 (DestColumn <> 'COLUMNVALUE')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing Index Definition Lookups.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('ColumnHeading').DataType := ftString;
            qry_Upd.Parameters.ParamByName('ColumnValue').DataType := ftString;

            qry_Upd.Parameters.ParamByName('ColumnHeading').Value := Null;
            qry_Upd.Parameters.ParamByName('ColumnValue').Value := Null;

            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Description').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Description').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;

          qry_Upd.Close;
        end;
    end
//==============================================================================
//===================Index Definition Match Values==============================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 5 Then
    begin
      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO IndexDefsMatch (Description, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2)');
      qry_Upd.SQL.Add('VALUES (:Description, :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2)');
//------------------Branch, Department and RecordType---------------------------
      If RecordType <> '' Then
        qry_Upd.Parameters.ParamByName('Description').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;
                                  
                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(GetFields(RecordType, UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text)))));

                              If (DestColumn <> 'RECORD TYPE')AND
                                 (DestColumn <> 'ALTERNATIVE RECORD TYPE')AND
                                 (DestColumn <> 'TEXT1')AND
                                 (DestColumn <> 'TEXT2')AND
                                 (DestColumn <> 'TEXT3')AND
                                 (DestColumn <> 'TEXT4')AND
                                 (DestColumn <> 'TEXT5')AND
                                 (DestColumn <> 'TEXT6')AND
                                 (DestColumn <> 'TEXT7')AND
                                 (DestColumn <> 'TEXT8')AND
                                 (DestColumn <> 'TEXT9')AND
                                 (DestColumn <> 'TEXT10')AND
                                 (DestColumn <> 'DATE1')AND
                                 (DestColumn <> 'DATE2')AND
                                 (DestColumn <> 'DATE3')AND
                                 (DestColumn <> 'NUMBER1')AND
                                 (DestColumn <> 'NUMBER2')Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing IndexDefs Match Values.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('Text1').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text2').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text3').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text4').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text5').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text6').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text7').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text8').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text9').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Text10').DataType := ftString;
            qry_Upd.Parameters.ParamByName('Date1').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date2').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Date3').DataType := ftDateTime;
            qry_Upd.Parameters.ParamByName('Number1').DataType := ftInteger;
            qry_Upd.Parameters.ParamByName('Number2').DataType := ftInteger;

            qry_Upd.Parameters.ParamByName('Text1').Value := Null;
            qry_Upd.Parameters.ParamByName('Text2').Value := Null;
            qry_Upd.Parameters.ParamByName('Text3').Value := Null;
            qry_Upd.Parameters.ParamByName('Text4').Value := Null;
            qry_Upd.Parameters.ParamByName('Text5').Value := Null;
            qry_Upd.Parameters.ParamByName('Text6').Value := Null;
            qry_Upd.Parameters.ParamByName('Text7').Value := Null;
            qry_Upd.Parameters.ParamByName('Text8').Value := Null;
            qry_Upd.Parameters.ParamByName('Text9').Value := Null;
            qry_Upd.Parameters.ParamByName('Text10').Value := Null;
            qry_Upd.Parameters.ParamByName('Date1').Value := Null;
            qry_Upd.Parameters.ParamByName('Date2').Value := Null;
            qry_Upd.Parameters.ParamByName('Date3').Value := Null;
            qry_Upd.Parameters.ParamByName('Number1').Value := Null;
            qry_Upd.Parameters.ParamByName('Number2').Value := Null;

            For Y := 1 to 30 Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Description').Value := TempStr;
                      end
                    else if DestFields[Y] = 'ALTERNATIVE RECORD TYPE' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('Description').Value := Translate_Alternative_RecordType(TempStr);
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName(DestFields[Y]).Value :=  TempStr;
                      end;
                  end;
              end;

            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;
        end;
    end
//==============================================================================
//===================COOL=======================================================
//==============================================================================
  else If rgrp_ImportType.ItemIndex = 6 Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT COOLID FROM IndexDefinitions WHERE Description = :DS');
      qry_SQL.Parameters.ParamByName('DS').Value := RecordType;
      qry_SQL.Open;
      COOLID := '[dbo].[COOL_' + qry_SQL.FieldbyName('COOLID').AsString + ']';
      qry_SQL.Close;
      qry_COOLDefs.Close;
      qry_COOLDefs.SQL.Clear;
      qry_COOLDefs.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
      qry_COOLDefs.Parameters.ParamValues['DS'] := RecordType;
      qry_COOLDefs.Open;
      qry_COOLDefs.First;
      COOLFieldList := 'AddedBy, Branch, Department, RecordType, RecordCat, ';
      COOLParamList := ':AddedBy, :Branch, :Department, :RecordType, :RecordCat, ';
      B := 0;
      While not qry_COOLDefs.EOF Do
        begin
          Application.ProcessMessages;
          Inc(B);
          COOLFieldList := COOLFieldList + qry_COOLDefs.FieldbyName('FIELDNAME').AsString + ', ';
          COOLParamList := COOLParamList + ':' + InttoStr(B) + ', ';

          qry_COOLDefs.Next;
        end;
      COOLFieldList := copy(COOLFieldList, 1, length(COOLFieldList)-2);
      COOLParamList := copy(COOLParamList, 1, length(COOLParamList)-2);

      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      qry_Upd.SQL.Add('INSERT INTO ' + COOLID + '(' + COOLFieldList + ')');
      qry_Upd.SQL.Add('VALUES (' + COOLParamList + ')');
//------------------Branch, Department and RecordType---------------------------
      qry_Upd.Parameters.ParamByName('AddedBy').Value := User;
      qry_Upd.Parameters.ParamByName('Branch').Value := Branch;
      qry_Upd.Parameters.ParamByName('Department').Value := Department;
      qry_Upd.Parameters.ParamByName('RecordType').Value := RecordType;
//----------------------------Index---------------------------------------------
      B := 0;
      For Y := 1 to CoCount Do
        begin
          If (scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y)) <> Nil) Then
            If (TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text <> '')Then
              begin
                SourceColumn := TComboBox(scrollbox_Mappings.FindComponent('cb_Source'+InttoStr(Y))).Text;

                If (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text, -1) > 0)and
                   (StrtoIntDef(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text, -1) > 0)Then
                  begin
                    ColSubStringStart := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringStart'+InttoStr(Y))).Text);
                    ColSubStringCount := StrtoInt(TEdit(scrollbox_Mappings.FindComponent('edt_SubstringCount'+InttoStr(Y))).Text);
                  end
                else
                  begin
                    ColSubStringStart := 0;
                    ColSubStringCount := 0;
                  end;

                For G := 0 to sgrd_Import.ColCount-1 Do
                  begin
                    If UpperCase(trim(sgrd_Import.Cells[G, 0])) = UpperCase(trim(SourceColumn)) Then
                      begin
                        If (scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y)) <> Nil) Then
                          If (TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text <> '')Then
                            begin
                              DestColumn := UpperCase(trim(TComboBox(scrollbox_Mappings.FindComponent('cb_Dest'+InttoStr(Y))).Text));

                              If (DestColumn <> 'RECORDCAT')AND
                                 (not(qry_COOLDefs.Locate('FieldName', DestColumn, [])))Then
                                begin
                                  Messagedlg('Invalid Import Column '+DestColumn, mtError, [mbOK], 0);
                                  mem_Result.Lines.Append('Error : Invalid Import Column '+DestColumn);
                                  exit;
                                end;

                              Inc(B);
                              SourceFields[B] := G;
                              DestFields[B] := DestColumn;
                              SubStringStart[B] := ColSubStringStart;
                              SubStringCount[B] := ColSubStringCount;
                            end;
                      end;
                  end;
              end;
        end;
//----------------------------Import--------------------------------------------
      pBar_Result.Max := sgrd_Import.RowCount-1;
      mem_Result.Lines.Append(DateTimetoStr(Now)+' => Now importing COOL Values.');
      Application.ProcessMessages;
      For X := 1 to sgrd_Import.RowCount-1 Do
        begin
          pBar_Result.Position := X;
          Application.ProcessMessages;

          try
            qry_Upd.Parameters.ParamByName('RecordCat').DataType := ftString;
            qry_COOLDefs.First;
            B := 0;
            While not qry_COOLDefs.EOF Do
              begin
                Application.ProcessMessages;
                Inc(B);
                qry_Upd.Parameters.ParamByName(InttoStr(B)).DataType := ftString;
                qry_Upd.Parameters.ParamByName(InttoStr(B)).Value := Null;
                qry_COOLDefs.Next;
              end;

            Tot := qry_COOLDefs.RecordCount + 1;

            For Y := 1 to Tot Do
              begin
                If (SourceFields[Y] >= 0)AND(DestFields[Y] <> '')Then
                  begin
                    TempStr := DoSubString(SubStringStart[Y], SubStringCount[Y], trim(sgrd_Import.Cells[SourceFields[Y], X]));
                    If DestFields[Y] = 'RECORDCAT' Then
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          qry_Upd.Parameters.ParamByName('RecordCat').Value := TempStr;
                      end
                    else
                      begin
                        If trim(sgrd_Import.Cells[SourceFields[Y], X]) <> '' Then
                          begin
                            qry_COOLDefs.First;
                            B := 0;
                            While not qry_COOLDefs.EOF Do
                              begin
                                Application.ProcessMessages;
                                Inc(B);
                                If UpperCase(DestFields[Y]) = UpperCase(qry_COOLDefs.FieldbyName('FIELDNAME').AsString) Then
                                  begin
                                    qry_Upd.Parameters.ParamByName(InttoStr(B)).Value :=  TempStr;
                                    break;
                                  end;
                                qry_COOLDefs.Next;
                              end;
                          end;
                      end;
                  end;
              end;

            qry_Upd.ExecSQL;
          except
            on E : Exception do
              begin
                mem_Result.Lines.Append(DateTimetoStr(Now)+' => Cannot Import Row '+InttoStr(X)+': '+e.Message);
              end;
          end;
        end;
    end;
  Messagedlg('Finished!', mtInformation, [mbOK], 0);
end;

end.
