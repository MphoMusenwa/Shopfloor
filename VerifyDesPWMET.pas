unit VerifyDesPWMET;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB;

type
  Tfrm_VerifyDesPWMET = class(TForm)
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
    lbl_DataType: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    qry_SQL: TADOQuery;
    procedure btn_SelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SetupRecordTypeFiels(RecordType  :String):Boolean;
  end;

var
  frm_VerifyDesPWMET: Tfrm_VerifyDesPWMET;

implementation

{$R *.dfm}

procedure Tfrm_VerifyDesPWMET.btn_SelectClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function Tfrm_VerifyDesPWMET.SetupRecordTypeFiels(RecordType  :String):Boolean;
Var
   ColNames   :Array[1..15] of String;
   J, I       :Integer;
   MaxLblLen  :Integer;
begin
  ScrollBox2.Visible := (RecordType <> '');
  lbl_DataType.Visible := (RecordType <> '');
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;

  If RecordType = '' then
    exit;

  If RecordType = '"General Search"' Then
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT ''Text1'' Col1, ''Text2'' Col2, ''Text3'' Col3, ''Text4'' Col4, ''Text5'' Col5, ''Text6'' Col6, ''Text7'' Col7, ''Text8'' Col8, ''Text9'' Col9, ''Text10'' Col10,');
     qry_SQL.SQL.Add('''Date1'' Col11, ''Date2'' Col12, ''Date3'' Col13,');
     qry_SQL.SQL.Add('''Number1'' Col14, ''Number2'' Col15');
     qry_SQL.Open;
   end
  else
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :DS');
     qry_SQL.Parameters.ParambyName('DS').Value := RecordType;
     qry_SQL.Open;
   end;

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
end;

end.
