unit getdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  Tfrm_GetDate = class(TForm)
    mCal: TMonthCalendar;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PrevYear, PrevMonth   :Word;
  public
    { Public declarations }
    InitDate     :TDateTime;
    Init         :Boolean;

    function Execute(mLeft, mTop :Integer):Integer;
  end;

var
  frm_GetDate: Tfrm_GetDate;

implementation

{$R *.dfm}

function Tfrm_GetDate.Execute(mLeft, mTop :Integer):Integer;
Var
   DD  :Word;
begin
  If Init Then
    mCal.Date := InitDate
  else mCal.Date := Now;
//---
  Top := mTop+30;
  Left := mLeft;

  DecodeDate(mCal.Date, PrevYear, PrevMonth, DD);

  Result := ShowModal;
end;



procedure Tfrm_GetDate.FormShow(Sender: TObject);
begin
  frm_GetDate.Width := mCal.Width+4;
end;

end.
