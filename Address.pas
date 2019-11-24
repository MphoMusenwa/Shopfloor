//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Address;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  Tfrm_Address = class(TForm)
    btn_Ok: TBitBtn;
    btn_Cancel: TBitBtn;
    bvl_Frame: TBevel;
    mem_Comments: TMemo;
    btn_Toggle: TButton;
    mem_RealAddress: TMemo;
    procedure btn_ToggleClick(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Address: Tfrm_Address;

implementation

{$R *.DFM}

procedure Tfrm_Address.btn_ToggleClick(Sender: TObject);
begin
  case btn_Toggle.Tag of
    0 : begin
          btn_Toggle.Tag := 1;
          btn_Toggle.Caption := 'Comments';
          mem_Comments.Visible := true;
          mem_RealAddress.Visible := false;
        end;
    1 : begin
          btn_Toggle.Tag := 0;
          btn_Toggle.Caption := 'Delivery Address';
          mem_Comments.Visible := false;
          mem_RealAddress.Visible := true;
        end;
  end;
end;

procedure Tfrm_Address.btn_OkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Exit;
end;

procedure Tfrm_Address.btn_CancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Exit;
end;

procedure Tfrm_Address.FormShow(Sender: TObject);
begin
  btn_Toggle.Tag := 0;
  btn_Toggle.Caption := 'Delivery Address';
  mem_Comments.Visible := false;
  mem_RealAddress.Visible := true;
end;

end.
