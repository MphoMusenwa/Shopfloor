unit ManualRetrieval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrm_ManualRetrieval = class(TForm)
    Label1: TLabel;
    cb_ReqName: TComboBox;
    btn_OK: TButton;
    btn_Cancel: TButton;
    cb_ReqUserID: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ManualRetrieval: Tfrm_ManualRetrieval;

implementation

{$R *.dfm}

end.
