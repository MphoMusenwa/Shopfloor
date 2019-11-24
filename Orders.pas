unit Orders;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, DBTables,
  GetComp, GetDept;

type
  Tfrm_Orders = class(TForm)
    Panel1: TPanel;
    button_Close: TBitBtn;
    Label6: TLabel;
    lbCompany: TLabel;
    Label7: TLabel;
    lbDept: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    txtQty: TMaskEdit;
    Label3: TLabel;
    txtComments: TEdit;
    Label4: TLabel;
    qryGetCompany: TQuery;
    qryGetDept: TQuery;
    qryTranTypes: TQuery;
    qryDelivery: TQuery;
    cmbItems: TComboBox;
    cmbDelivery: TComboBox;
    lblItemDes: TLabel;
    Label5: TLabel;
    dbCode: TEdit;
    dbDepartment: TEdit;
    dsDep: TDataSource;
    memTemp: TDBMemo;
    memDelAddress: TMemo;
    button_Submit: TBitBtn;
    qrySubmit: TQuery;
    qryAuthority: TQuery;
    procedure button_SelectCompanyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbCodeChange(Sender: TObject);
    procedure dbDepartmentChange(Sender: TObject);
    procedure button_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmbItemsChange(Sender: TObject);
    procedure button_SubmitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TItem = class(TObject)
  sChargeCode : string;
  sTranCode : string;
  sDescription : string;
end;

var
  frm_Orders: Tfrm_Orders;
  tempItem : TItem;

implementation

{$R *.DFM}

uses Main;

procedure Tfrm_Orders.button_SelectCompanyClick(Sender: TObject);
begin
 if frm_GetCompany.ShowModal = mrOK then
  begin
    dbCode.Text := frm_GetCompany.CompanyCode;
    dbDepartment.SetFocus;
  end;
end;

procedure Tfrm_Orders.Button1Click(Sender: TObject);
begin
  if frm_GetDept.Execute(dbCode.Text)  = mrOK then
  begin
    dbDepartment.Text := frm_GetDept.DeptCode;
  end;
end;

procedure Tfrm_Orders.dbCodeChange(Sender: TObject);
begin
  qryGetCompany.Active := false;
  qryGetCompany.ParamByName('Code').AsString := dbCode.Text;
  qryGetCompany.Active := true;
  lbCompany.Caption := qryGetCompany.FieldbyName('Company').AsString;
  qryGetCompany.Active := false;
  lbDept.Caption := '';
//  cmbAuthority.Items.Clear;
//  cmbAuthority.ItemIndex := -1;
  if length(dbDepartment.Text) > 0 then
  begin
//    cmbAuthority.Items.Clear;
//    cmbAuthority.ItemIndex := -1;
    qryGetDept.Active := false;
    qryGetDept.ParamByName('Code').AsString := dbCode.Text;
    qryGetDept.ParamByName('Dept').AsString := dbDepartment.Text;
    qryGetDept.Active := true;
    lbDept.Caption := qryGetDept.FieldByName('Name').AsString;
    qryGetDept.Active := false;
    if lbDept.Caption = '' then
      dbDepartment.Text := '';
  end;
end;

procedure Tfrm_Orders.dbDepartmentChange(Sender: TObject);
var
  sTemp : string;
begin
  qryGetDept.Active := false;
  qryGetDept.ParamByName('Code').AsString := dbCode.Text;
  qryGetDept.ParamByName('Dept').AsString := dbDepartment.Text;
  qryGetDept.Active := true;
  if not qryGetDept.Eof then
    begin
      lbDept.Caption := qryGetDept.FieldByName('Name').AsString;
      memDelAddress.Lines := memTemp.Lines;
//      cmbAuthority.Items.Clear;
//      cmbAuthority.ItemIndex := -1;
      qryAuthority.Close;
      qryAuthority.ParamByName('Code').AsString := dbCode.Text;
      qryAuthority.ParamByName('Department').AsString := dbDepartment.Text;
      qryAuthority.Open;
      while not qryAuthority.Eof do
        begin
          sTemp := qryAuthority.Fields[0].AsString + ',(';
          sTemp := sTemp + qryAuthority.Fields[1].AsString + ' ';
          sTemp := sTemp + qryAuthority.Fields[2].AsString + ')';
//          cmbAuthority.Items.Add(sTemp);
          qryAuthority.Next;
        end;
      qryAuthority.Close;
    end
  else
    begin
      lbDept.Caption := '';
      memDelAddress.Lines.Clear;
    end;
  qryGetDept.Active := false;
end;

procedure Tfrm_Orders.button_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Orders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.itm_Tools_Orders.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Orders.FormCreate(Sender: TObject);
begin
  ShowHint := frm_Console.bShowHints;
  Screen.Cursor := crDefault;
  cmbDelivery.Items.Clear;
  cmbItems.Items.Clear;

  qryTranTypes.Open;
  while not qryTranTypes.eof do
   with qryTranTypes do
    begin
      tempItem := TItem.Create;
      tempItem.sChargeCode := FieldByName('ChargeCode').AsString;
      tempItem.sTranCode := FieldByName('TranType').AsString;
      tempItem.sDescription := FieldByName('Description').AsString;
      cmbItems.Items.AddObject(tempItem.sChargeCode,tempItem);
      Next;
    end;

  qryDelivery.Open;
  while not qryDelivery.eof do
   with qryDelivery do
    begin
      cmbDelivery.Items.Add(FieldByName('DeliveryType').AsString);
      Next;
    end;
end;

procedure Tfrm_Orders.cmbItemsChange(Sender: TObject);
begin
  tempItem := cmbItems.Items.Objects[cmbItems.ItemIndex] as TItem;
  lblItemDes.Caption := tempItem.sDescription;
end;

procedure Tfrm_Orders.button_SubmitClick(Sender: TObject);
  var
    iIdx : integer;
    iPos : integer;
    sTemp : string;
  begin
{    IF ( cmbAuthority.ItemIndex = -1 ) THEN
      BEGIN
        MessageDlg('Please choose an Authority code!',mtWarning,[mbOk],0);
        Exit;
      END;
}
    if MessageDlg('Are you sure the details are correct?',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      exit;
    qrySubmit.Close;
    qrySubmit.Sql.Clear;
    qrySubmit.Sql.Add('INSERT Requisition (Authority_Code, Delivery_Address,');
    qrySubmit.Sql.Add('DeliveryType, Code, Department, Comments, Type, OrderType, Qty) ');
//    iPos := Pos(',(',cmbAuthority.Text);
//    if iPos > 0 then sTemp := Copy(cmbAuthority.Text,1,iPos-1)
//    else Exit;
    qrySubmit.Sql.Add('VALUES ("' + sTemp + '","');
    for iIdx := 0 to (memDelAddress.Lines.Count - 1) do
    if Length(memDelAddress.Lines[iIdx]) > 0 then
      begin
      sTemp := memDelAddress.Lines[iIdx];
      iPos := Pos('"',sTemp);
      if iPos <> 0 then Delete(sTemp,iPos,1);
      iPos := Pos(chr(39),sTemp);
      if iPos <> 0 then Delete(sTemp,iPos,1);
      qrySubmit.Sql.Add(sTemp);
      end;
    qrySubmit.Sql.Add('","' + cmbDelivery.Text + '",');
    qrySubmit.Sql.Add('"' + dbCode.Text + '",');
    qrySubmit.Sql.Add('"' + dbDepartment.Text + '",');
    if Length(txtComments.Text) > 0 then
      begin
      sTemp := txtComments.Text;
      iPos := Pos('"',sTemp);
      if iPos <> 0 then Delete(sTemp,iPos,1);
      iPos := Pos(chr(39),sTemp);
      if iPos <> 0 then Delete(sTemp,iPos,1);
      qrySubmit.Sql.Add('"' + sTemp + '",');
      end
    else
      qrySubmit.Sql.Add('NULL,');
    qrySubmit.Sql.Add('"ORDER",');
    qrySubmit.Sql.Add('"' + cmbItems.Text + '",');
    qrySubmit.Sql.Add(txtQty.Text + ')');
    qrySubmit.ExecSQL;
    MessageDlg('Order submitted to Requisition Clerk',mtConfirmation, [mbOK],0);
  end;

procedure Tfrm_Orders.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.