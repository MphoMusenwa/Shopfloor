unit SelOffSiteBoxDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ADODB, Mask, DBCtrls,
  ExtCtrls;

type
  Tfrm_SelOffSiteBoxDetails = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cb_ContType: TComboBox;
    qry_SQL: TADOQuery;
    Label2: TLabel;
    btn_SelRecordType: TButton;
    edt_RecordType: TEdit;
    lbl_DataType: TLabel;
    scbar_metadata: TScrollBox;
    pnl_Text1: TPanel;
    lbl_Text1: TLabel;
    edt_Text1: TEdit;
    pnl_Text2: TPanel;
    lbl_Text2: TLabel;
    edt_Text2: TEdit;
    pnl_Text3: TPanel;
    lbl_Text3: TLabel;
    edt_Text3: TEdit;
    pnl_Text4: TPanel;
    lbl_Text4: TLabel;
    edt_Text4: TEdit;
    pnl_Text5: TPanel;
    lbl_Text5: TLabel;
    edt_Text5: TEdit;
    pnl_Text6: TPanel;
    lbl_Text6: TLabel;
    edt_Text6: TEdit;
    pnl_Text7: TPanel;
    lbl_Text7: TLabel;
    edt_Text7: TEdit;
    pnl_Text8: TPanel;
    lbl_Text8: TLabel;
    edt_Text8: TEdit;
    pnl_Text9: TPanel;
    lbl_Text9: TLabel;
    edt_Text9: TEdit;
    pnl_Text10: TPanel;
    lbl_Text10: TLabel;
    edt_Text10: TEdit;
    pnl_Date1: TPanel;
    lbl_Date1: TLabel;
    lbl_DateFormat1: TLabel;
    edt_Date1: TEdit;
    pnl_Date2: TPanel;
    lbl_Date2: TLabel;
    lbl_DateFormat2: TLabel;
    edt_Date2: TEdit;
    pnl_Date3: TPanel;
    lbl_Date3: TLabel;
    lbl_DateFormat3: TLabel;
    edt_Date3: TEdit;
    pnl_Num1: TPanel;
    lbl_Num1: TLabel;
    edt_Num1: TEdit;
    pnl_Num2: TPanel;
    lbl_Num2: TLabel;
    edt_Num2: TEdit;
    Label3: TLabel;
    edt_Boxnumber: TEdit;
    Label4: TLabel;
    edt_Container: TEdit;
    qry_GetContainer: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure edt_ContainerChange(Sender: TObject);
    procedure edt_RecordTypeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearFields();
  public
    { Public declarations }
    Branch     :String[3];
    Department :String[2];
    FileType   :String[30];
    Filenumber :String[20];
  end;

var
  frm_SelOffSiteBoxDetails: Tfrm_SelOffSiteBoxDetails;

implementation

Uses
  MetrofilerDataModule, SelRType, Main;

{$R *.DFM}

procedure Tfrm_SelOffSiteBoxDetails.ClearFields();
begin
  edt_Boxnumber.Text := '';
  cb_ContType.Text := '';
  edt_RecordType.Text := '';
  edt_Text1.Text := '';
  edt_Text2.Text := '';
  edt_Text3.Text := '';
  edt_Text4.Text := '';
  edt_Text5.Text := '';
  edt_Text6.Text := '';
  edt_Text7.Text := '';
  edt_Text8.Text := '';
  edt_Text9.Text := '';
  edt_Text10.Text := '';
  edt_Date1.Text := '';
  edt_Date2.Text := '';
  edt_Date3.Text := '';
  edt_Num1.Text := '';
  edt_Num2.Text := '';
end;


procedure Tfrm_SelOffSiteBoxDetails.BitBtn1Click(Sender: TObject);
begin
  If trim(edt_Container.Text) = '' Then
    begin
      Messagedlg('Please specify a Container Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_Boxnumber.Text) = '' Then
    begin
      Messagedlg('Please specify a Boxnumber.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(cb_ContType.Text) = '' Then
    begin
      Messagedlg('Please select a Container Type for the Container.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_RecordType.Text) = '' Then
    begin
      Messagedlg('Please select a Record Type for the Container.', mtInformation, [mbOK], 0);
      exit;
    end;
  ModalResult := mrOK;
end;

procedure Tfrm_SelOffSiteBoxDetails.btn_SelRecordTypeClick(Sender: TObject);
begin
  If frm_SelRType.Execute(False,
                          Branch,
                          Department,
                          User,
                          True,
                          False,
                          False,
                          False,
                          False) = mrOK Then
    begin
      edt_RecordType.Text := trim(frm_SelRType.qry_RType.FieldbyName('Description').asString);
      lbl_DataType.Caption := 'Record Type Details:';
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_SelOffSiteBoxDetails.edt_ContainerChange(Sender: TObject);
begin
  If edt_Container.Text <> '' Then
    begin
      qry_GetContainer.Close;
      qry_GetContainer.SQL.Clear;
      qry_GetContainer.SQL.Add('SELECT * FROM Containers WHERE Container = :Container');
      qry_GetContainer.Parameters.ParamValues['Container'] := edt_Container.Text;
      qry_GetContainer.Open;
      If qry_GetContainer.IsEmpty Then
        begin
          qry_GetContainer.Close;
          ClearFields;
          exit;
        end;
      //Check if Branch and Department the same
      If (Branch <> trim(qry_GetContainer.FieldbyName('BRANCH').AsString))OR
         (Department <> trim(qry_GetContainer.FieldbyName('DEPARTMENT').AsString))Then
        begin
          Messagedlg('This Container belongs to a different Branch and Department.', mtInformation, [mbOK], 0);
          edt_Container.Text := '';
          qry_GetContainer.Close;
          ClearFields;
          exit;
        end;
      //---else
      edt_Boxnumber.Text := trim(qry_GetContainer.FieldbyName('BOXNUMBER').AsString);
      cb_ContType.Text := trim(qry_GetContainer.FieldbyName('CONTTYPE').AsString);
      edt_RecordType.Text := trim(qry_GetContainer.FieldbyName('FILETYPE').AsString);
      edt_Text1.Text := trim(qry_GetContainer.FieldbyName('TEXT1').AsString);
      edt_Text2.Text := trim(qry_GetContainer.FieldbyName('TEXT2').AsString);
      edt_Text3.Text := trim(qry_GetContainer.FieldbyName('TEXT3').AsString);
      edt_Text4.Text := trim(qry_GetContainer.FieldbyName('TEXT4').AsString);
      edt_Text5.Text := trim(qry_GetContainer.FieldbyName('TEXT5').AsString);
      edt_Text6.Text := trim(qry_GetContainer.FieldbyName('TEXT6').AsString);
      edt_Text7.Text := trim(qry_GetContainer.FieldbyName('TEXT7').AsString);
      edt_Text8.Text := trim(qry_GetContainer.FieldbyName('TEXT8').AsString);
      edt_Text9.Text := trim(qry_GetContainer.FieldbyName('TEXT9').AsString);
      edt_Text10.Text := trim(qry_GetContainer.FieldbyName('TEXT10').AsString);
      edt_Date1.Text := trim(qry_GetContainer.FieldbyName('DATE1').AsString);
      edt_Date2.Text := trim(qry_GetContainer.FieldbyName('DATE2').AsString);
      edt_Date3.Text := trim(qry_GetContainer.FieldbyName('DATE3').AsString);
      edt_Num1.Text := trim(qry_GetContainer.FieldbyName('NUMBER1').AsString);
      edt_Num2.Text := trim(qry_GetContainer.FieldbyName('NUMBER2').AsString);
      qry_GetContainer.Close;
    end
  else ClearFields;
end;

procedure Tfrm_SelOffSiteBoxDetails.edt_RecordTypeChange(Sender: TObject);
Var
  J   :Integer;
  T   :Integer;
begin
//----Build MetaData------
  qry_SQL.Close;
  qry_SQL.SQL.Text := 'SELECT * FROM IndexDefinitions WHERE Description = :Description';
  qry_SQL.Parameters.ParamValues['Description'] := edt_RecordType.Text;
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      scbar_metadata.Visible := False;
      lbl_DataType.Visible := False;
      exit;
    end;

  For J := 1 to 15 Do
    begin
      If (J >= 1)and(J <= 10) Then
        begin
          TPanel(FindComponent('pnl_Text'+InttoStr(J))).Visible := False;
          TLabel(FindComponent('lbl_Text'+InttoStr(J))).Caption := '';
        end
      else If (J >= 11)and(J <= 13) Then
        begin
          TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Visible := False;
          TLabel(FindComponent('lbl_Date'+InttoStr(J-10))).Caption := '';
        end
      else If (J >= 14)and(J <= 15) Then
        begin
          TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Visible := False;
          TLabel(FindComponent('lbl_Num'+InttoStr(J-13))).Caption := '';
        end;
    end;

  T  := 3;
  For J := 1 to 15 Do
    begin
      If trim(qry_SQL.FieldbyName('COL'+InttoStr(J)).asString) <> '' Then
        begin
          If (J >= 1)and(J <= 10) Then
            begin
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Top := T;
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Visible := True;
              TLabel(FindComponent('lbl_Text'+InttoStr(J))).Caption := trim(qry_SQL.FieldbyName('COL'+InttoStr(J)).asString);
            end
          else If (J >= 11)and(J <= 13) Then
            begin
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Top := T;
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Visible := True;
              TLabel(FindComponent('lbl_Date'+InttoStr(J-10))).Caption := trim(qry_SQL.FieldbyName('COL'+InttoStr(J)).asString);
            end
          else If (J >= 14)and(J <= 15) Then
            begin
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Top := T;
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Visible := True;
              TLabel(FindComponent('lbl_Num'+InttoStr(J-13))).Caption := trim(qry_SQL.FieldbyName('COL'+InttoStr(J)).asString);
            end;
          Inc(T, 35);
        end;
    end;
  scbar_metadata.Visible := True;
  lbl_DataType.Visible := True;
end;

procedure Tfrm_SelOffSiteBoxDetails.FormShow(Sender: TObject);
begin
//----Build ContTypes------
  qry_SQL.Close;
  qry_SQL.SQL.Text := 'SELECT * FROM ContTypes ORDER BY ContType';
  qry_SQL.Open;
  qry_SQL.First;
  cb_ContType.Items.Clear;
  While not qry_SQL.EOF Do
    begin
      cb_ContType.Items.Append(qry_SQL.FieldbyName('CONTTYPE').asSTring);
      qry_SQL.Next;
    end;
  qry_SQL.Close;
//------------------------
  edt_Container.Text := '';
  ClearFields();
  scbar_metadata.Visible := False;
  lbl_DataType.Visible := False;
end;

end.
