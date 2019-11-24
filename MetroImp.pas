unit MetroImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ADODB, DBCtrls,
  ComCtrls, ToolWin;

type
  Tfrm_DataImpMatch = class(TForm)
    grd_DataImport: TDBGrid;
    Panel1: TPanel;
    ScrollBox2: TScrollBox;
    lbl_Col1: TLabel;
    lbl_Col2: TLabel;
    lbl_Col3: TLabel;
    lbl_Col4: TLabel;
    lbl_Col5: TLabel;
    lbl_Col6: TLabel;
    lbl_Col9: TLabel;
    lbl_Col10: TLabel;
    lbl_Col7: TLabel;
    lbl_Col8: TLabel;
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    edt_Col1: TEdit;
    edt_Col2: TEdit;
    edt_Col3: TEdit;
    edt_Col4: TEdit;
    edt_Col5: TEdit;
    edt_Col6: TEdit;
    edt_Col7: TEdit;
    edt_Col8: TEdit;
    edt_Col9: TEdit;
    edt_Col10: TEdit;
    edt_Col11: TEdit;
    edt_Col12: TEdit;
    edt_Col13: TEdit;
    edt_Col14: TEdit;
    edt_Col15: TEdit;
    Label48: TLabel;
    btn_Search: TBitBtn;
    chk_Partial: TCheckBox;
    lbl_RecordFound: TLabel;
    Bevel2: TBevel;
    DTS_DataImport: TDataSource;
    qry_DataImport: TADOQuery;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    qry_SQL: TADOQuery;
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_SelectClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    mRecordType     :String;
    ColNames   :Array[1..15] of String;
  public
    { Public declarations }
    Text1, Text2, Text3, Text4, Text5,
    Text6, Text7, Text8, Text9, Text10,
    Date1, Date2, Date3, Number1, Number2    :Variant;
    function Execute(RecordType :String):Integer;
  end;

var
  frm_DataImpMatch: Tfrm_DataImpMatch;

implementation

uses main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_DataImpMatch.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_DataImpMatch.btn_SearchClick(Sender: TObject);
Var
   FillInFlag    :Boolean;
   J, I          :Integer;
   Edit          :TEdit;
begin
  FillInFlag := False;
  if (edt_Col1.Text <> '')and(edt_Col1.Visible) Then FillInFlag := True;
  if (edt_Col2.Text <> '')and(edt_Col2.Visible) Then FillInFlag := True;
  if (edt_Col3.Text <> '')and(edt_Col3.Visible) Then FillInFlag := True;
  if (edt_Col4.Text <> '')and(edt_Col4.Visible) Then FillInFlag := True;
  if (edt_Col5.Text <> '')and(edt_Col5.Visible) Then FillInFlag := True;
  if (edt_Col6.Text <> '')and(edt_Col6.Visible) Then FillInFlag := True;
  if (edt_Col7.Text <> '')and(edt_Col7.Visible) Then FillInFlag := True;
  if (edt_Col8.Text <> '')and(edt_Col8.Visible) Then FillInFlag := True;
  if (edt_Col9.Text <> '')and(edt_Col9.Visible) Then FillInFlag := True;
  if (edt_Col10.Text <> '')and(edt_Col10.Visible) Then FillInFlag := True;
  if (edt_Col11.Text <> '')and(edt_Col11.Visible) Then FillInFlag := True;
  if (edt_Col12.Text <> '')and(edt_Col12.Visible) Then FillInFlag := True;
  if (edt_Col13.Text <> '')and(edt_Col13.Visible) Then FillInFlag := True;
  if (edt_Col14.Text <> '')and(edt_Col14.Visible) Then FillInFlag := True;
  if (edt_Col15.Text <> '')and(edt_Col15.Visible) Then FillInFlag := True;

  if not FillInFlag Then
    begin
      MessageDlg('Please specify some search criteria!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;

  qry_DataImport.Close;
  qry_DataImport.SQL.Clear;
  qry_DataImport.SQL.Add('SELECT');
  For J := 1 to 10 Do
    begin
      If ColNames[J] <> '' Then
        qry_DataImport.SQL.Add('  d.Text'+InttoStr(J)+' AS ['+ColNames[J]+'],');
    end;
  For J := 11 to 13 Do
    begin
      If ColNames[J] <> '' Then
        qry_DataImport.SQL.Add('  d.Date'+InttoStr(J-10)+' AS ['+ColNames[J]+'],');
    end;
  For J := 14 to 15 Do
    begin
      If ColNames[J] <> '' Then
        qry_DataImport.SQL.Add('  d.Number'+InttoStr(J-13)+' AS ['+ColNames[J]+'],');
    end;
  qry_DataImport.SQL.Add('  d.Description AS [RecordType]');
  qry_DataImport.SQL.Add('FROM');
  qry_DataImport.SQL.Add('  IndexDefsMatch d');
  qry_DataImport.SQL.Add('WHERE');
  qry_DataImport.SQL.Add('  Description = :RecordType');
  qry_DataImport.Parameters.ParamValues['RecordType'] := mRecordType;

  I := 0;
  For J := 1 to 15 Do
    begin
      If ColNames[J] <> '' Then
        begin
          Inc(I);
          If (J >= 1)AND(J <= 10) Then
            begin
              Edit := TEdit(FindComponent('edt_Col'+InttoStr(I)));
              If Edit.Text <> '' Then
                begin
                  If chk_Partial.Checked Then
                    begin
                      qry_DataImport.SQL.Add('  AND (Text'+InttoStr(J)+' LIKE :Text'+InttoStr(J)+')');
                      qry_DataImport.Parameters.ParamValues['Text'+InttoStr(J)] := '%'+Edit.Text+'%';
                    end
                  else
                    begin
                      qry_DataImport.SQL.Add('  AND (Text'+InttoStr(J)+' = :Text'+InttoStr(J)+')');
                      qry_DataImport.Parameters.ParamValues['Text'+InttoStr(J)] := Edit.Text;
                    end;
                end;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              Edit := TEdit(FindComponent('edt_Col'+InttoStr(I)));
              If Edit.Text <> '' Then
                begin
                  qry_DataImport.SQL.Add('  AND (Date'+InttoStr(J-10)+' = :Date'+InttoStr(J-10)+')');
                  qry_DataImport.Parameters.ParamValues['Date'+InttoStr(J-10)] := StrtoDate(Edit.Text);
                end;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              Edit := TEdit(FindComponent('edt_Col'+InttoStr(I)));
              If Edit.Text <> '' Then
                begin
                  qry_DataImport.SQL.Add('  AND (Number'+InttoStr(J-13)+' = :Number'+InttoStr(J-13)+')');
                  qry_DataImport.Parameters.ParamValues['Number'+InttoStr(J-13)] := StrtoDate(Edit.Text);
                end;
            end;
        end;
    end;
  Screen.Cursor := CrHourglass;
  try
    qry_DataImport.Open;
    Application.ProcessMessages;
    frm_Console.AutoSizeNewColumns(grd_DataImport);
  finally
    Screen.Cursor := CrDefault;
  end;
  lbl_RecordFound.Caption := 'Records found: '+InttoStr(qry_DataImport.RecordCount);
  If not qry_DataImport.isEmpty Then
    exit;
  MessageDLG('No records found',mtInformation,[mbOK],0);
end;

procedure Tfrm_DataImpMatch.btn_SelectClick(Sender: TObject);
begin
  If qry_DataImport.IsEmpty Then
    begin
      Messagedlg('First select a record.', mtInformation, [mbOK], 0);
      exit;
    end;

  If ColNames[1] <> '' Then Text1 := qry_DataImport.FieldbyName(ColNames[1]).value else Text1 := Null;
  If ColNames[2] <> '' Then Text2 := qry_DataImport.FieldbyName(ColNames[2]).value else Text2 := Null;
  If ColNames[3] <> '' Then Text3 := qry_DataImport.FieldbyName(ColNames[3]).value else Text3 := Null;
  If ColNames[4] <> '' Then Text4 := qry_DataImport.FieldbyName(ColNames[4]).value else Text4 := Null;
  If ColNames[5] <> '' Then Text5 := qry_DataImport.FieldbyName(ColNames[5]).value else Text5 := Null;
  If ColNames[6] <> '' Then Text6 := qry_DataImport.FieldbyName(ColNames[6]).value else Text6 := Null;
  If ColNames[7] <> '' Then Text7 := qry_DataImport.FieldbyName(ColNames[7]).value else Text7 := Null;
  If ColNames[8] <> '' Then Text8 := qry_DataImport.FieldbyName(ColNames[8]).value else Text8 := Null;
  If ColNames[9] <> '' Then Text9 := qry_DataImport.FieldbyName(ColNames[9]).value else Text9 := Null;
  If ColNames[10] <> '' Then Text10 := qry_DataImport.FieldbyName(ColNames[10]).value else Text10 := Null;
  If ColNames[11] <> '' Then Date1 := qry_DataImport.FieldbyName(ColNames[11]).value else Date1 := Null;
  If ColNames[12] <> '' Then Date2 := qry_DataImport.FieldbyName(ColNames[12]).value else Date2 := Null;
  If ColNames[13] <> '' Then Date3 := qry_DataImport.FieldbyName(ColNames[13]).value else Date3 := Null;
  If ColNames[14] <> '' Then Number1 := qry_DataImport.FieldbyName(ColNames[14]).value else Number1 := Null;
  If ColNames[15] <> '' Then Number2 := qry_DataImport.FieldbyName(ColNames[15]).value else Number2 := Null;

  ModalResult := mrOK;
end;

function Tfrm_DataImpMatch.Execute(RecordType :String):Integer;
Var
   J, I       :Integer;
   MaxLblLen  :Integer;
begin
  mRecordType := RecordType;
  lbl_RecordFound.Caption := 'Records found: 0';
  grd_DataImport.Columns.Clear;
  qry_DataImport.Close;
//----
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('select * from IndexDefinitions where Description = :DS');
  qry_SQL.Parameters.ParambyName('DS').Value := RecordType;
  qry_SQL.Open;
  For J := 1 to 15 Do
    ColNames[J] := trim(qry_SQL.FieldbyName('Col'+InttoStr(J)).AsString);
  qry_SQL.Close;
//----
  MaxLblLen := 0;
  I := 0;
  For J := 1 to 15 Do
    begin
      If ColNames[J] <> '' Then
        begin
          Inc(I);
          If (J >= 1)AND(J <= 10) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 300;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end;
          TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
          TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
        end;
    end;

  qry_SQL.Close;

  For J := 1 to 15 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Left := MaxLblLen+8;
    end;

  Result := ShowModal;
end;


end.
