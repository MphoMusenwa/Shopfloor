unit framSelBranch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls;

type
  Tfram_SelBranch = class(TFrame)
    lbl_Branch: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    procedure btn_SelBranchClick(Sender: TObject);
    procedure edt_BranchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Branch         :String;
    BranchName     :String;
  end;

implementation

uses SelBranch, Main;

{$R *.dfm}

procedure Tfram_SelBranch.btn_SelBranchClick(Sender: TObject);
begin
  frm_SelBranch.Access := User;
  frm_SelBranch.qry_Branch.Open;
  If frm_SelBranch.ShowModal = mrOK Then
    begin
      Branch := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      BranchName := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Branch.Text := Branch;
      lbl_Branch.Caption := BranchName;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfram_SelBranch.edt_BranchChange(Sender: TObject);
begin
  //---
end;

end.
