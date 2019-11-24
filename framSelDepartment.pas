unit framSelDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls;

type
  Tfram_SelDepartment = class(TFrame)
    lbl_Dept: TLabel;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    procedure btn_SelDeptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Branch   :String;
  end;

implementation

{$R *.dfm}

procedure Tfram_SelDepartment.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  frm_SelDept.Access := User;
  frm_SelDept.BAccess := edt_Branch.Text;
  frm_SelDept.qry_Dept.Open;
  If frm_SelDept.ShowModal = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
      edt_RType.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

end.
