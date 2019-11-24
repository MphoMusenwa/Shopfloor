//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit DataVer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;


type
  Tfrm_DataVer = class(TForm)
    edt_Value: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edt_ValueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    VerifyText :String;
    function Execute:TModalResult;
  end;

var
  frm_DataVer: Tfrm_DataVer;

implementation

uses MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_DataVer.edt_ValueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   J        :Integer;
   TempStr  :String;
begin
  If (Key = 13) Then
    begin
      TempStr := '';
      For J := length(edt_Value.Text) downto 1 Do
        TempStr := TempStr + copy(edt_Value.Text, J, 1);

      If TempStr <> VerifyText Then
        begin
          edt_Value.SelStart := 0;
          edt_Value.SelLength := length(edt_Value.Text);
          dm_Metrofiler.ShowBalloonTop(edt_Value.handle, 'Data Verification', 'The verified Text does not match! Please re-enter or press <ESC> to abort.', 1);
        end
      else ModalResult := mrOK;
    end;
  If Key = 27 Then
    begin
      ModalResult := mrCancel;
    end;
end;

function Tfrm_DataVer.Execute:TModalResult;
begin
  edt_Value.Text := '';
  Result := ShowModal;
end;


procedure Tfrm_DataVer.FormShow(Sender: TObject);
begin
  edt_Value.SetFocus;
  dm_Metrofiler.ShowBalloonTop(edt_Value.Handle, 'Data Verification', 'Please verify your captured field by typing it backwards and then press <ENTER>.', 0);
end;

end.
