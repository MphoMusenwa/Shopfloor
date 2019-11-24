unit Getdept;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_GetDept = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryDepartment: TQuery;
    dbgrid_Company: TDBGrid;
    edit_Department: TEdit;
    Label3: TLabel;
    ds_Department: TDataSource;
    qryDeptName: TQuery;
    procedure dbgrid_CompanyDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    function Execute( sCompany : String ) : Integer;
    procedure FormShow(Sender: TObject);
    procedure ds_DepartmentDataChange(Sender: TObject; Field: TField);
    procedure dbgrid_CompanyColEnter(Sender: TObject);
    procedure dbgrid_CompanyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sCompCode : String;
  public
    { Public declarations }
    DeptCode : String;
    DeptName : String;
  end;

var
  frm_GetDept: Tfrm_GetDept;

implementation

{$R *.DFM}

uses Main;

function Tfrm_GetDept.Execute( sCompany : String ) : Integer;
begin
  sCompCode := sCompany;
  Execute   := ShowModal;
end;

procedure Tfrm_GetDept.dbgrid_CompanyDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_GetDept.btnOKClick(Sender: TObject);
begin
  if length(edit_Department.Text) = 0 then
  begin
    MessageDlg('You have not selected a department code.', mtWarning, [mbOK],0);
    ModalResult := mrNone;
  end;

  if DeptCode <> edit_Department.Text then
  begin
    Screen.Cursor  := crHourglass;
//    qrySecurity.Active := false;
//    qrySecurity.ParamByName('code').AsString := sCompCode;
//    qrySecurity.ParamByName('dept').AsString := edit_Department.Text;
//    qrySecurity.Active := true;
//    if qrySecurity.Fields[0].AsInteger = 0 then
//    begin
//      Screen.Cursor := crDefault;
//      MessageDlg('You have entered an invalid department code.', mtWarning, [mbOK],0);
//      ModalResult := mrNone;
//    end;
//    qrySecurity.Active := false;
    DeptCode := edit_Department.Text;
    qryDeptName.Active := false;
    qryDeptName.ParamByName('code').AsString := sCompCode;
    qryDeptName.ParamByName('dept').AsString := DeptCode;
    qryDeptName.Active := true;
    DeptName := qryDeptName.Fields[0].AsString;
    qryDeptName.Active := false;
    Screen.Cursor  := crDefault;
  end;
end;

procedure Tfrm_GetDept.FormShow(Sender: TObject);
begin
       qryDepartment.SQL.Clear;
      qryDepartment.SQL.Add('SELECT DISTINCT m.Code, m.Department, d.Name');
      qryDepartment.SQL.Add('FROM MOPSProtects m, Department d');
      qryDepartment.SQL.Add('WHERE m.Code = d.Code AND');
      qryDepartment.SQL.Add('m.Department = d.Department AND');
      qryDepartment.SQL.Add('(m.uid = USER_ID() or');
      qryDepartment.SQL.Add('m.uid = (select gid from sysusers where sysusers.uid = User_ID()))');
      qryDepartment.SQL.Add('AND m.Code = :Code');

//      qrySecurity.SQL.Clear;
//      qrySecurity.SQL.Add('SELECT count(*)');
//      qrySecurity.SQL.Add('FROM MOPSProtects');
//      qrySecurity.SQL.Add('WHERE (uid = USER_ID() OR');
//      qrySecurity.SQL.Add('uid = (select gid from sysusers where sysusers.uid = User_ID()))');
//      qrySecurity.SQL.Add('AND Code = :Code');
//      qrySecurity.SQL.Add('AND Department = :dept');
//   qryDepartment.Active := false;
//  qryDepartment.Params[0].AsString := sCompCode;
//  qryDepartment.Active := true;
  dbgrid_Company.SetFocus;
end;

procedure Tfrm_GetDept.ds_DepartmentDataChange(Sender: TObject;
  Field: TField);
begin
  edit_Department.Text := qryDepartment.FieldByName('Department').AsString;
  DeptCode             := edit_Department.Text;
  DeptName             := qryDepartment.FieldByName('Name').AsString;
end;

procedure Tfrm_GetDept.dbgrid_CompanyColEnter(Sender: TObject);
begin
  edit_Department.Text := qryDepartment.FieldByName('Department').AsString;
  DeptCode             := edit_Department.Text;
  DeptName             := qryDepartment.FieldByName('Name').AsString;
end;

procedure Tfrm_GetDept.dbgrid_CompanyKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key =  #13 then ModalResult := mrOK;
end;

end.

