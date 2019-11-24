unit edtBarcodeRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin;

type
  Tfrm_edtBarcodeRange = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    edt_RType: TEdit;
    btn_SelRecordType: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    chk_AutoGenSuffix: TCheckBox;
    chk_AutoGenBarcode: TCheckBox;
    edt_FromRange: TEdit;
    edt_ToRange: TEdit;
    rgrp_Type: TRadioGroup;
    edt_Suffix: TEdit;
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(InsertState :Boolean; RangeType, Branch, Department, RecordType, Suffix :String; FromRange, ToRange :Integer; AutoGenSuffix, AutoGenBarcode :Boolean):Integer;
  end;

var
  frm_edtBarcodeRange: Tfrm_edtBarcodeRange;

implementation

uses SelBranch, SelDept, SelRType, main;

{$R *.dfm}

function Tfrm_edtBarcodeRange.Execute(InsertState :Boolean; RangeType, Branch, Department, RecordType, Suffix :String; FromRange, ToRange :Integer; AutoGenSuffix, AutoGenBarcode :Boolean):Integer;
begin
  If InsertState Then
    begin
      Caption := 'Add new Barcode Range';

      rgrp_Type.ItemIndex := 0;
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
      edt_RType.Text := '';
      edt_FromRange.Text := '0';
      edt_ToRange.Text := '0';
      edt_Suffix.Text := '';
      chk_AutoGenSuffix.Checked := false;
      chk_AutoGenBarcode.Checked := false;
    end
  else
    begin
      Caption := 'Edit existing Barcode Range';

      rgrp_Type.ItemIndex := 0;
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
      edt_RType.Text := '';
      edt_FromRange.Text := '0';
      edt_ToRange.Text := '0';
      edt_Suffix.Text := '';
      chk_AutoGenSuffix.Checked := false;
      chk_AutoGenBarcode.Checked := false;

      If RangeType = 'C' Then rgrp_Type.ItemIndex := 0;
      If RangeType = 'F' Then rgrp_Type.ItemIndex := 1;
      If RangeType = 'I' Then rgrp_Type.ItemIndex := 2;

      frm_SelBranch.OpenDbOnly(User);
      if frm_SelBranch.qry_Branch.Locate('Branch', Branch, []) then
        begin
          edt_Branch.Text := Branch;
          lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').AsString;

          frm_SelDept.OpenDbOnly(Branch, User);
          if frm_SelDept.qry_Dept.Locate('Department', Department, []) then
            begin
              edt_Dept.Text := Department;
              lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').AsString;

              frm_SelRType.OpenDbOnly(Branch,
                                      Department,
                                      User,
                                      (rgrp_Type.ItemIndex = 0),
                                      (rgrp_Type.ItemIndex = 1),
                                      (rgrp_Type.ItemIndex = 2),
                                      False,
                                      False);
              if frm_SelRType.qry_RType.Locate('Description', RecordType, []) then
                begin
                  edt_RType.Text := RecordType;
                end;
            end;
        end;

      edt_FromRange.Text := InttoStr(FromRange);
      edt_ToRange.Text := InttoStr(ToRange);
      edt_Suffix.Text := Suffix;
      chk_AutoGenSuffix.Checked := AutoGenSuffix;
      chk_AutoGenBarcode.Checked := AutoGenBarcode;
    end;
  Result := ShowModal;
end;


procedure Tfrm_edtBarcodeRange.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_edtBarcodeRange.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
      edt_RType.Text := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_edtBarcodeRange.btn_SelDeptClick(Sender: TObject);
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
      edt_RType.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_edtBarcodeRange.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_Dept.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_Branch.Text,
                          edt_Dept.Text,
                          User,
                          (rgrp_Type.ItemIndex = 0),
                          (rgrp_Type.ItemIndex = 1),
                          (rgrp_Type.ItemIndex = 2),
                          False,
                          False) = mrOK Then
    begin
      edt_RType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

end.
