unit eRecordsForward;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tfrm_eRecordsForward = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    edt_FromUser: TEdit;
    Label1: TLabel;
    edt_ToUser: TEdit;
    btn_Insert: TSpeedButton;
    btn_SelToUser: TButton;
    Label3: TLabel;
    edt_MessageDate: TEdit;
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_SelToUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ToUser, ToName   :String;
    function Execute():Integer;
  end;

var
  frm_eRecordsForward: Tfrm_eRecordsForward;

implementation

uses main, SelSystemUser;

{$R *.dfm}

procedure Tfrm_eRecordsForward.btn_InsertClick(Sender: TObject);
begin
  If trim(edt_ToUser.Text) = '' Then
    begin
      Messagedlg('Please select a user to forward the eRecord(s) to.', mtInformation, [mbOK], 0);
      exit;
    end;
  ModalResult := mrOK;
end;

procedure Tfrm_eRecordsForward.btn_SelToUserClick(Sender: TObject);
begin
  frm_SelSystemUser.qry_AuthCodes.Close;
  frm_SelSystemUser.qry_AuthCodes.SQL.Clear;
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('SELECT');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	a.UserID,');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	a.Name + '' '' + a.Surname AS [Name]');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('FROM');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	AuthCodes a');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('WHERE');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	a.UserType IN (''S'', ''A'') AND');
//------------
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('(');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('(a.SysAdmin = 1)');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('OR');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('(a.UserID IN (SELECT u.UserID FROM AuthRts u WHERE u.Access = 7))');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('OR');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('(a.UserID IN (SELECT r.UserID FROM AuthRts u INNER JOIN RolesRts r ON u.RoleId = r.RoleId WHERE u.Access = 7))');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add(')AND');
//------------
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	((a.valid_option = 1 AND GETDATE() BETWEEN a.Valid_From AND DATEADD(day, 1, a.Valid_To))');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('	OR(a.valid_option = 0))');
  frm_SelSystemUser.qry_AuthCodes.SQL.Add('ORDER BY a.Name, a.Surname');
  frm_SelSystemUser.qry_AuthCodes.Open;
  If frm_SelSystemUser.ShowModal = mrOK Then
    begin
      ToUser := frm_SelSystemUser.qry_AuthCodes.FieldbyName('UserID').AsString;
      ToName := frm_SelSystemUser.qry_AuthCodes.FieldbyName('Name').AsString;
      edt_ToUser.Text := ToName + ' (' + ToUser + ')';
    end;
  frm_SelSystemUser.qry_AuthCodes.Close;
end;

function Tfrm_eRecordsForward.Execute():Integer;
begin
  edt_FromUser.Text := FirstName + ' ' + Surname + ' (' + User + ')';
  edt_ToUser.Text := '';
  edt_MessageDate.Text := DateTimetoStr(Now);
  Result := ShowModal;
end;

end.
