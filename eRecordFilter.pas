unit eRecordFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrm_eRecordFullTextFilter = class(TForm)
    btn_OK: TButton;
    btn_Cancel: TButton;
    btn_Clear: TButton;
    mem_Filters: TMemo;
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_eRecordFullTextFilter: Tfrm_eRecordFullTextFilter;

implementation

{$R *.dfm}

procedure Tfrm_eRecordFullTextFilter.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_eRecordFullTextFilter.btn_ClearClick(Sender: TObject);
begin
  mem_Filters.Clear;
end;

procedure Tfrm_eRecordFullTextFilter.btn_OKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
