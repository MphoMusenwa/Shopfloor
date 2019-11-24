unit Requis;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB, DBTables,
  GRequis, Grids, DBGrids, Menus, DefSel, TabNotBk, BoxList,
  GetDept, GetComp, IniFiles, ComCtrls;

type
  Tfrm_Requisitions = class(TForm)
    btn_Close: TBitBtn;
    btn_DisplayFile: TBitBtn;
    btn_FindBox: TBitBtn;
    btn_FindFile: TBitBtn;
    btn_Generate: TBitBtn;
    btn_ListFiles: TBitBtn;
    btn_Logoff: TBitBtn;
    btn_Logon: TBitBtn;
    btn_SearchBoxes: TBitBtn;
    btn_SelectDept: TButton;
    cmb_Dept: TComboBox;
    cmb_DeptName: TComboBox;
    ds_Boxes: TDataSource;
    ds_Files: TDataSource;
    edt_AuthCode: TEdit;
    edt_BoxNumber: TEdit;
    edt_Code: TEdit;
    edt_Dept: TEdit;
    edt_FileNumber: TEdit;
    edt_Password: TEdit;
    edt_Requisition: TEdit;
    grd_Boxes: TDBGrid;
    grd_Files: TDBGrid;
    grp_AuthInfo: TGroupBox;
    lbl_AuthCode: TLabel;
    lbl_Comp: TLabel;
    lbl_CompCode: TLabel;
    lbl_Company: TLabel;
    lbl_Count: TLabel;
    lbl_Dept: TLabel;
    lbl_DeptCode: TLabel;
    lbl_DeptName: TLabel;
    lbl_DeptNumber: TLabel;
    lbl_Initials: TLabel;
    lbl_Intl: TLabel;
    lbl_Name: TLabel;
    lbl_Nme: TLabel;
    lbl_Note: TLabel;
    lbl_Password: TLabel;
    lbl_Surname: TLabel;
    lbl_Surnm: TLabel;
    ntb_Requis: TTabbedNotebook;
    pnl_Bottom: TPanel;
    pnl_BoxReq: TPanel;
    pnl_Company: TPanel;
    pnl_FileReq: TPanel;
    pnl_Top: TPanel;
    qry_Authority: TQuery;
    qry_Available: TQuery;
    qry_BoxStatus: TQuery;
    qry_Boxes: TQuery;
    qry_CountBoxes: TQuery;
    qry_Departments: TQuery;
    qry_FileStatus: TQuery;
    qry_Files: TQuery;
    qry_ViewName: TQuery;
    lbl_NoFiles: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_DisplayFileClick(Sender: TObject);
    procedure btn_FindBoxClick(Sender: TObject);
    procedure btn_FindFileClick(Sender: TObject);
    procedure btn_GenerateClick(Sender: TObject);
    procedure btn_ListFilesClick(Sender: TObject);
    procedure btn_LogoffClick(Sender: TObject);
    procedure btn_LogonClick(Sender: TObject);
    procedure btn_SearchBoxesClick(Sender: TObject);
    procedure btn_SelectCompClick(Sender: TObject);
    procedure btn_SelectDeptClick(Sender: TObject);
    procedure cmb_DeptChange(Sender: TObject);
    procedure cmb_DeptNameChange(Sender: TObject);
    procedure grd_BoxesDblClick(Sender: TObject);
    procedure grd_FilesDblClick(Sender: TObject);
    procedure itm_RestoreFileWidthsClick(Sender: TObject);
    procedure itm_SaveFileWidthsClick(Sender: TObject);
    procedure ntb_RequisChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure pmRestoreBoxWidthsClick(Sender: TObject);
    procedure pmSaveBoxWidthsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sCompany    : String;    {Company code of user authorised for requisitions}
    sDept       : String;    {Dept code of user authorised for requisitions}
    sFromDept   : String;    {Department code for box/file }
    sAuthCode   : String;    {Authority code of user authorised for requisitions}
    sFileNumber : String;
    sBoxNumber  : String;
    bBoxFile    : Boolean;  {true=box   false=file}
    bLogon      : Boolean;
    procedure SetButtons ( Status : Boolean );
  public
    { Public declarations }
  end;

var
  frm_Requisitions: Tfrm_Requisitions;

implementation

uses Main;

{$R *.DFM}

procedure Tfrm_Requisitions.SetButtons ( Status : Boolean );
begin
  if Status = false then
  begin
    cmb_Dept.Items.Clear;
    cmb_DeptName.Items.Clear;
    lbl_Surname.Caption   := 'N.A.';
    lbl_Name.Caption      := 'N.A.';
    lbl_Initials.Caption  := 'N.A.';
    edt_Code.Text := '';
    edt_Dept.Text := '';
    edt_AuthCode.Text := '';
    edt_Password.Text := '';
    lbl_Company.Caption := '';
    lbl_DeptName.Caption := '';
    qry_Boxes.Active := false;
    qry_Files.Active := false;
  end;

  cmb_Dept.Enabled := Status;
  cmb_DeptName.Enabled := Status;
  btn_Logon.Enabled := Not(Status);
  btn_Logoff.Enabled := Status;
  bLogon := Status;
end;

procedure Tfrm_Requisitions.btn_GenerateClick(Sender: TObject);
begin
  if (length(sBoxNumber) = 0) and (length(sFileNumber) = 0) then
  begin
    MessageDlg('Please select a box or file by doubleclicking the row',
                mtInformation,[mbOK],0);
    Exit;
  end;

  frm_GRequis.DisplayNote(sBoxnumber, sFileNumber, sAuthCode,
                           sCompany, sDept, lbl_Surname.Caption,
                           lbl_Initials.Caption);
  btn_Generate.Enabled := false;
  edt_Requisition.Text := '';
  sBoxnumber := '';
  sFileNumber := '';

  Screen.Cursor := crHourglass;
  if qry_Boxes.Active then
  begin
    qry_Boxes.Active := false;
    qry_Boxes.Active := true;
    pmRestoreBoxWidthsClick(nil);
  end;

  if qry_Files.Active then
  begin
    qry_Files.Active := false;
    qry_Files.Active := true;
    itm_RestoreFileWidthsClick(nil);
  end;

  Screen.Cursor := crDefault;
end;

procedure Tfrm_Requisitions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.btn_Requisitions.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Requisitions.btn_FindBoxClick(Sender: TObject);
begin
 {list boxes or files}
 if cmb_Dept.ItemIndex < 0 then
 begin
    MessageDlg('Please select the department to which the box/file belongs to.',
               mtWarning,[mbOk],0);
    Exit;
 end;

 btn_ListFiles.Enabled := false;
 lbl_Count.Caption := '0 box(es) in this department';
 Screen.Cursor := crHourglass;
 qry_Boxes.Active := false;
 qry_Boxes.SQL.Clear;
 if edt_BoxNumber.Text = '' then
 begin
   qry_Boxes.SQL.Add('rq_CompanyBoxes "'+sCompany+'", "'+
                     cmb_Dept.Items[cmb_Dept.ItemIndex]+'"');
   Caption := 'Display all boxes in '+
              cmb_DeptName.Items[cmb_DeptName.ItemIndex]
 end else
 begin
   qry_Boxes.SQL.Add('rq_CompanyBox "' + edt_BoxNumber.Text + '", "' +
                     sCompany + '", "' +
                     cmb_Dept.Items[cmb_Dept.ItemIndex] + '"');
   Caption := 'Display box ' + edt_Boxnumber.Text + ' in '+
              cmb_DeptName.Items[cmb_DeptName.ItemIndex];
 end;
 qry_Boxes.Active := True;
 if qry_Boxes.RecordCount = 0 then
 begin
  qry_Boxes.Active := False;
  MessageDlg('No Boxes found',mtInformation,[mbOK],0);
  btn_ListFiles.Enabled := False;
  Exit;
 end else
 begin
   pmRestoreBoxWidthsClick(nil);
   if bBoxFile then
     btn_ListFiles.Enabled := True
   else
   begin
     btn_ListFilesClick(Sender);
     ntb_Requis.PageIndex := 2;
   end;
 end;

 qry_CountBoxes.Active := false;
 qry_CountBoxes.ParamByName('code').Asstring := sCompany;
 qry_CountBoxes.ParamByName('dept').Asstring :=
                                   cmb_Dept.Items[cmb_Dept.ItemIndex];
 qry_CountBoxes.Active := true;
 lbl_Count.Caption := qry_CountBoxes.Fields[0].AsString +
                    ' box(es) in this department';
 qry_CountBoxes.Active := false;
end;


procedure Tfrm_Requisitions.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  bLogon := false;
  Top := 0;
  Left := 0;
  Height := 450;
  Width := 494;
  ShowHint := frm_Console.bShowHints;
  bBoxFile := true;
  Screen.Cursor := crDefault;
end;


procedure Tfrm_Requisitions.btn_ListFilesClick(Sender: TObject);
var sViewName   : String;
    sBoxNumber  : String;
    sBriefDescr : String;
    sFieldName  : String;
begin
  sBoxNumber := qry_Boxes.FieldByName('BoxNumber').AsString;
  if length(sBoxNumber) = 0 then
  begin
    MessageDlg('Please select a box first', mtWarning, [mbOK], 0);
    Exit;
  end;

  sBriefDescr := qry_Boxes.FieldByName('BriefDescription').AsString;

  if length(sBriefDescr) = 0 then
  begin
    MessageDlg('Data error. This box does not have a brief description!',
               mtWarning, [mbOK], 0);
    Exit;
  end;

  Caption := 'Display all files in box ' + sBoxNumber;

  {get view name for description}
  if sBriefDescr[1] = '*' then
    sBriefDescr := '*';
  qry_ViewName.ParamByName('Descr').AsString := sBriefDescr;
  qry_ViewName.ParamByName('Code').AsString := edt_Code.Text;
  qry_ViewName.ParamByName('Dept').AsString :=
               cmb_Dept.Items [ cmb_Dept.ItemIndex ];
  qry_ViewName.Active := true;
  sViewName := qry_ViewName.Fields[0].AsString + '.' +
               qry_ViewName.Fields[1].AsString;
  qry_ViewName.Active := false;

  {get files}
  qry_Files.Active := False;
  qry_Files.SQL.Clear;
  qry_Files.SQL.Add('SELECT v.*, s.StatusCode FROM ' + sViewName + ' v, ' +
                    'StatusCodes s, Files f ' +
                    'WHERE v.FileNumber = f.FileNumber AND ' +
                    '      f.Status = s.Status AND ' +
                    '      v.BoxNumber = "'+ sBoxNumber + '"');
  qry_Files.Active := true;
  ds_Files.Enabled := true;
  ntb_Requis.PageIndex := 2;
  itm_RestoreFileWidthsClick(nil);
  lbl_NoFiles.Caption := IntToStr(qry_Files.RecordCount) + ' file(s) displayed';
end;


procedure Tfrm_Requisitions.grd_FilesDblClick(Sender: TObject);
begin
  {make sure the box is in the warehouse}
  sBoxNumber := qry_Files.FieldByName('BOXNUMBER').AsString;
  qry_BoxStatus.Active := false;
  qry_BoxStatus.ParamByName('Box').AsString := sBoxNumber;
  qry_BoxStatus.Active := true;
  if qry_BoxStatus.Fields[0].AsInteger <> 0 then
  begin
    MessageDlg('Sorry '+lbl_Name.Caption+', but box '+sBoxNumber+' is not '+
               'available for requisition.', mtWarning, [mbAbort], 0);
    qry_BoxStatus.Active := false;
    Exit;
  end;
  qry_BoxStatus.Active := false;

  {make sure that the file is available}
  sFileNumber := qry_Files.FieldByName('FILENUMBER').AsString;
  qry_FileStatus.Active := false;
  qry_FileStatus.ParamByName('File').AsString := sFileNumber;
  qry_FileStatus.Active := true;
  sFromDept := qry_FileStatus.FieldByName('DEPARTMENT').AsString;
  if qry_FileStatus.Fields[0].AsInteger <> 0 then
  begin
    MessageDlg('Sorry '+lbl_Name.Caption+', but file '+sFileNumber+' is not '+
               'available for requisition.', mtWarning, [mbAbort], 0);
    qry_FileStatus.Active := false;
    Exit;
  end;
  qry_FileStatus.Active := false;

  edt_Requisition.Text := 'FILE # : ' + sFileNumber;
  sBoxNumber := '';
  btn_Generate.Caption := 'File Requisition';
  btn_Generate.Enabled := true;
end;

procedure Tfrm_Requisitions.grd_BoxesDblClick(Sender: TObject);
begin
  sBoxNumber := qry_Boxes.FieldByName('BOXNUMBER').AsString;

  qry_BoxStatus.Active := false;
  qry_BoxStatus.Params[0].AsString := sBoxNumber;
  qry_BoxStatus.Active := true;
  sFromDept := qry_BoxStatus.FieldByName('DEPARTMENT').AsString;

  if qry_BoxStatus.FieldByName('STATUS').AsInteger <> 0 then
  begin
    MessageDlg('Sorry '+lbl_Name.Caption+', but box '+sBoxNumber+' is not '+
               'available for requisition.', mtWarning, [mbAbort], 0);
    qry_BoxStatus.Active := false;
    Exit;
  end;
  qry_BoxStatus.Active := false;

  sBoxNumber := qry_Boxes.FieldByName('BOXNUMBER').AsString;
  edt_Requisition.Text := 'BOX # : ' + sBoxNumber;
  sFileNumber := '';
  btn_Generate.Caption := 'Box Requisition';
  btn_Generate.Enabled := true;
end;


procedure Tfrm_Requisitions.btn_FindFileClick(Sender: TObject);
begin
  if frm_DefineSelect.Execute( sCompany, sDept, sAuthCode) = mrOK then
  begin
     Caption := 'Searching for ' + frm_DefineSelect.FileTypeName +
                ' files in ' + frm_DefineSelect.DepartmentName;
     qry_Files.Active := false;
     qry_Files.SQL.Clear;
     qry_Files.SQL := frm_DefineSelect.mem_SQL.Lines;
     qry_Files.Active := true;

     if qry_Files.RecordCount = 0 then
     begin
       MessageDlg('Sorry, no files found.', mtInformation, [mbOK],0);
       lbl_NoFiles.Caption := '0 file(s) displayed';
       qry_Files.Active := false;
     end else
       begin
        itm_RestoreFileWidthsClick(nil);
        lbl_NoFiles.Caption := IntToStr(qry_Files.RecordCount) + ' file(s) displayed';
      end;
  end;
end;

procedure Tfrm_Requisitions.btn_SearchBoxesClick(Sender: TObject);
begin
  if frm_BoxList.Execute(sCompany, sDept, sAuthCode) = mrOK then
  begin
    Caption := 'Display ' + frm_BoxList.sFileType + ' boxes in ' +
               frm_BoxList.sDepartmentName;
    qry_Boxes.SQL.Clear;
    {
    qry_Boxes.SQL.Add('SELECT b.BoxNumber, s.StatusCode, b.BriefDescription FROM' +
                      ' Box b, StatusCodes s WHERE BriefDescription = "' +
                      frm_BoxList.sFileType + '" ' +
                      ' AND b.Code = "' + sCompany + '"'+
                      ' AND b.Department = "'+
                      frm_BoxList.sDepartment +'"');
    }
    qry_Boxes.SQL.Add('rq_CompanyBoxType "' + frm_BoxList.sFileType + '", "'+
                      frm_BoxList.sSpecific + '", "'+
                      sCompany + '", "' + frm_BoxList.sDepartment + '"');
    qry_Boxes.Active := True;
    pmRestoreBoxWidthsClick(nil);
  end;
end;

procedure Tfrm_Requisitions.cmb_DeptNameChange(Sender: TObject);
begin
  cmb_Dept.ItemIndex := cmb_DeptName.ItemIndex;
end;

procedure Tfrm_Requisitions.ntb_RequisChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  if not( bLogon ) and (NewTab <> 0) then
   begin
    AllowChange := false;
    MessageDlg('Please logon with you''re authority code first', mtWarning,
                [mbOk], 0);
    Exit;
   end
  else
   begin
     btn_Generate.Enabled := false;
     edt_Requisition.Text := '';
     if NewTab = 0 then btn_Generate.Caption := '&Requisition';
     if NewTab = 1 then
       begin
         btn_Generate.Caption := 'Box &Requisition';
         lbl_NoFiles.Caption := '';
       end;
     if NewTab = 2 then
       begin
         btn_Generate.Caption := 'File &Requisition';
         if qry_Files.Active then
           lbl_NoFiles.Caption := IntToStr(qry_Files.RecordCount) + ' file(s) displayed'
         else
           lbl_NoFiles.Caption := '0 file(s) displayed';
       end;
   end;

end;

procedure Tfrm_Requisitions.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Requisitions.cmb_DeptChange(Sender: TObject);
begin
  cmb_DeptName.ItemIndex := cmb_Dept.ItemIndex;
end;

procedure Tfrm_Requisitions.btn_LogonClick(Sender: TObject);
var
  iCount : Integer;
begin
  {setup sql to check if code exist}
  Screen.Cursor := crHourglass;
  iCount := 1;
  qry_Authority.ParamByName('Code').AsString := edt_Code.Text;
  qry_Authority.ParamByName('Dept').AsString := edt_Dept.Text;
  qry_Authority.ParamByName('Authority').AsString := edt_AuthCode.Text;
  qry_Authority.Active := True;

  {if recordcount = zero then code does not exist}
  if qry_Authority.EOF then
  begin
    Screen.Cursor := crDefault;
    MessageDlg('Your are not authorised to access the Requisition Component!',
                mtWarning,[mbOK],0);
    qry_Authority.Active := False;
    {throw user out after 3 attempts}
    iCount := iCount + 1;
    if iCount > 3 then Close;
    Exit;
  end;

  qry_Authority.First;
  if qry_Authority.FieldByName('Passw').AsString <> edt_Password.Text then
  begin
    Screen.Cursor := crDefault;
    MessageDlg('Invalid password!',mtWarning,[mbOk],0);
    iCount := iCount + 1;
    if iCount > 3 then Close;
    Exit;
  end;

  sCompany  := edt_Code.Text;
  sAuthCode := edt_AuthCode.Text;
  sDept     := edt_Dept.Text;
  lbl_Surname.Caption   := qry_Authority.FieldByName('Surname').AsString;
  lbl_Name.Caption      := qry_Authority.FieldByName('Name').AsString;
  lbl_Initials.Caption  := qry_Authority.FieldByName('Initials').AsString;
  lbl_Company.Caption   := qry_Authority.FieldByName('Company').AsString;
  lbl_DeptName.Caption  := qry_Authority.FieldByName('Name_1').AsString;
  qry_Authority.Active := false;

  cmb_Dept.Items.Clear;
  cmb_DeptName.Items.Clear;
  {cmb_Dept.Items.Add('<none>');
  cmb_DeptName.Items.Add('<none>');}

  {populate combo box with all departments that the user has access to}
  qry_Departments.Params[0].AsString := sCompany;
  qry_Departments.Params[1].AsString := sDept;
  qry_Departments.Params[2].AsString := sAuthCode;
  qry_Departments.Active := True;

  while not qry_Departments.EOF do
  begin
    cmb_Dept.Items.Add(qry_Departments.Fields[0].AsString);
    cmb_DeptName.Items.Add(qry_Departments.Fields[1].AsString);
    qry_Departments.Next;
  end;

  qry_Departments.Active := False;
  cmb_Dept.ItemIndex := 0;
  cmb_DeptName.ItemIndex := 0;
  SetButtons(TRUE);
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Requisitions.btn_SelectCompClick(Sender: TObject);
begin
  if frm_GetCompany.ShowModal = mrOK then
  begin
    edt_Code.Text := frm_GetCompany.CompanyCode;
    lbl_Company.Caption := frm_GetCompany.CompanyName;
    edt_Dept.SetFocus;
  end;
end;

procedure Tfrm_Requisitions.btn_SelectDeptClick(Sender: TObject);
begin
  if frm_GetDept.Execute(edt_Code.Text) = mrOK then
  begin
    edt_Dept.Text := frm_GetDept.DeptCode;
    lbl_DeptName.Caption := frm_GetDept.DeptName;
    edt_AuthCode.SetFocus;
  end;
end;

procedure Tfrm_Requisitions.btn_LogoffClick(Sender: TObject);
begin
  SetButtons(FALSE);
end;

procedure Tfrm_Requisitions.btn_DisplayFileClick(Sender: TObject);
begin
  qry_Boxes.Active := false;
  qry_Boxes.SQL.Clear;
  if length(edt_FileNumber.Text) > 0 then
  {
    qry_Boxes.SQL.Add('SELECT Box.BoxNumber, Box.Status, BriefDescription FROM Files,Box'+
                        ' WHERE Box.BoxNumber = Files.BoxNumber AND' +
                        ' FileNumber = "' + edFileNumber.Text + '" AND ' +
                        ' Box.Code = "' + sCompany + '"'+ ' AND' +
                        ' Department = "'+
                          cmb_Dept.Items[cmb_Dept.ItemIndex]+'")
  }
    qry_Boxes.SQL.Add('rq_FilesBox "' + edt_FileNumber.Text + '", "' + sCompany
                        + '", "' + cmb_Dept.Items[cmb_Dept.ItemIndex]+ '"')
  else
  begin
    MessageDlg('Please specify the number of the file to display',
               mtWarning, [mbOK], 0);
    Exit;
  end;

  qry_Boxes.Active := true;

  if qry_Boxes.RecordCount = 0 then
  begin
    qry_Boxes.Active := False;
  	MessageDlg('No files found',mtInformation,[mbOK],0);
		btn_ListFiles.Enabled := False;
  end else
  begin
    btn_ListFiles.Enabled := True;
    btn_ListFilesClick(Sender);
    ntb_Requis.PageIndex := 1;
    pmRestoreBoxWidthsClick(nil);
    ntb_Requis.PageIndex := 2;
  end;
  while (NOT qry_Files.EOF) AND
        (qry_Files.FieldByName('FileNumber').AsString <> edt_FileNumber.Text) do
    qry_Files.Next;

  Screen.Cursor := crDefault;
end;

procedure Tfrm_Requisitions.itm_SaveFileWidthsClick(Sender: TObject);
var
  ini    : TIniFile;
  b1, b2 : Byte;
begin
  try
    ini := TIniFile.Create('METROFIL.INI');
    b2 := grd_Files.FieldCount-1;
    if b2 > 0 then
      for b1 := 0 to b2 do
         ini.WriteInteger(  'Column Widths',
                           grd_Files.Fields[b1].FieldName,
                           grd_Files.Fields[b1].DisplayWidth);
  finally
    ini.Free;
  end;
end;

procedure Tfrm_Requisitions.pmSaveBoxWidthsClick(Sender: TObject);
var
  ini   : TIniFile;
  b1,b2 : Byte;
begin
  try
    ini := TIniFile.Create('METROFIL.INI');
    b2 := grd_Boxes.FieldCount-1;
    if b2 > 0 then
      for b1 := 0 to b2 do
          ini.WriteInteger(  'Column Widths',
                            grd_Boxes.Fields[b1].FieldName,
                            grd_Boxes.Fields[b1].DisplayWidth);
  finally
    ini.Free;
  end;
end;


procedure Tfrm_Requisitions.pmRestoreBoxWidthsClick(Sender: TObject);
var
  ini   : TIniFile;
  b1,b2 : integer;
begin
  try
    ini := TIniFile.Create('METROFIL.INI');
    b2  := grd_Boxes.FieldCount-1;
    if b2 > 0 then
      for b1 := 0 to b2 do
        grd_Boxes.Fields[b1].DisplayWidth :=
           ini.ReadInteger( 'Column Widths',
                            grd_Boxes.Fields[b1].FieldName,
                            grd_Boxes.Fields[b1].DisplayWidth);
  finally
    ini.Free;
  end;
end;

procedure Tfrm_Requisitions.itm_RestoreFileWidthsClick(Sender: TObject);
var
  ini   : TIniFile;
  b1,b2 : Integer;
begin
  try
    ini := TIniFile.Create('METROFIL.INI');
    b2 := grd_Files.FieldCount-1;
    if b2 > 0 then
      for b1 := 0 to b2 do
        grd_Files.Fields[b1].DisplayWidth :=
          ini.ReadInteger( 'Column Widths',
                           grd_Files.Fields[b1].FieldName,
                           grd_Files.Fields[b1].DisplayWidth);
  finally
    ini.Free;
  end;
end;

procedure Tfrm_Requisitions.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  ntb_Requis.PageIndex := 0;
  edt_Code.SetFocus;
end;

end.


