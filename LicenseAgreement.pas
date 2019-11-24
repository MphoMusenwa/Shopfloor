unit LicenseAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tfrm_LicenseTerms = class(TForm)
    RichEdit1: TRichEdit;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_LicenseTerms: Tfrm_LicenseTerms;

implementation

{$R *.dfm}

end.
