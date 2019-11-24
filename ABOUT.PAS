//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit About;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, SysUtils;

type
  TAboutBox = class(TForm)
    img_Logo: TImage;
    Label8: TLabel;
    lbl_Version: TLabel;
    Label2: TLabel;
    lbl_VersionDate: TLabel;
    lbl_Reg: TLabel;
    procedure Label8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses LicenseAgreement, main;

{$R *.DFM}

procedure TAboutBox.Label8Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_LicenseTerms, frm_LicenseTerms);
  try
    frm_LicenseTerms.ShowModal;
  finally
     frm_LicenseTerms.Free;
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
Var
  sVersion :String;
begin
  sVersion := InttoStr(VersionNo);
  lbl_Version.Caption := 'SQL-Server Version: '+
                         copy(sVersion, 1, 1) +
                         '.' +
                         copy(sVersion, 2, 2) +
                         ' (' +
                         copy(sVersion, 4, 3) +
                         ')';

  lbl_VersionDate.Caption := 'Compiled - ' + VersionDate;



end;

end.

