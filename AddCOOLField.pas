unit AddCOOLField;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  Tfrm_AddCOOLField = class(TForm)
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    Panel2: TPanel;
    Image2: TImage;
    Label20: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    cb_FieldName: TComboBox;
    FontDialog1: TFontDialog;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_FontName: TEdit;
    edt_FontSize: TEdit;
    edt_FontStyle: TEdit;
    btn_Browse: TSpeedButton;
    qry_SQL: TADOQuery;
    procedure btn_BrowseClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(RecordType   :String):Integer;
  end;

var
  frm_AddCOOLField: Tfrm_AddCOOLField;

implementation

Uses MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_AddCOOLField.btn_OKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function Tfrm_AddCOOLField.Execute(RecordType   :String):Integer;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT FieldName FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
  qry_SQL.Parameters.ParamByName('DS').Value := RecordType;
  qry_SQL.Open;
  qry_SQL.First;
  cb_FieldName.Items.Clear;
  While not qry_SQL.EOF Do
    begin
      cb_FieldName.Items.Add(qry_SQL.FieldbyName('FieldName').AsString);
      qry_SQL.Next;
    end;
  qry_SQL.Close;
//------------
  edt_FontName.Text := FontDialog1.Font.Name;
  edt_FontSize.Text := InttoStr(FontDialog1.Font.Size);
  edt_FontStyle.Text := '';
  If fsBold in FontDialog1.Font.Style Then
    begin
      edt_FontStyle.Text := edt_FontStyle.Text + 'Bold';
    end;
  If fsItalic in FontDialog1.Font.Style Then
    begin
      If edt_FontStyle.Text <> '' Then
        edt_FontStyle.Text := edt_FontStyle.Text + '|';
      edt_FontStyle.Text := edt_FontStyle.Text + 'Italic';
    end;
  If fsUnderline in FontDialog1.Font.Style Then
    begin
      If edt_FontStyle.Text <> '' Then
        edt_FontStyle.Text := edt_FontStyle.Text + '|';
      edt_FontStyle.Text := edt_FontStyle.Text + 'Underline';
    end;
  If fsStrikeOut in FontDialog1.Font.Style Then
    begin
      If edt_FontStyle.Text <> '' Then
        edt_FontStyle.Text := edt_FontStyle.Text + '|';
      edt_FontStyle.Text := edt_FontStyle.Text + 'StrikeOut';
    end;
//------------
  Result := ShowModal;
end;


procedure Tfrm_AddCOOLField.btn_BrowseClick(Sender: TObject);
begin
  If FontDialog1.Execute() Then
    begin
      edt_FontName.Text := FontDialog1.Font.Name;
      edt_FontSize.Text := InttoStr(FontDialog1.Font.Size);
      edt_FontStyle.Text := '';
      If fsBold in FontDialog1.Font.Style Then
        begin
          edt_FontStyle.Text := edt_FontStyle.Text + 'Bold';
        end;
      If fsItalic in FontDialog1.Font.Style Then
        begin
          If edt_FontStyle.Text <> '' Then
            edt_FontStyle.Text := edt_FontStyle.Text + '|';
          edt_FontStyle.Text := edt_FontStyle.Text + 'Italic';
        end;
      If fsUnderline in FontDialog1.Font.Style Then
        begin
          If edt_FontStyle.Text <> '' Then
            edt_FontStyle.Text := edt_FontStyle.Text + '|';
          edt_FontStyle.Text := edt_FontStyle.Text + 'Underline';
        end;
      If fsStrikeOut in FontDialog1.Font.Style Then
        begin
          If edt_FontStyle.Text <> '' Then
            edt_FontStyle.Text := edt_FontStyle.Text + '|';
          edt_FontStyle.Text := edt_FontStyle.Text + 'StrikeOut';
        end;
    end;
end;

end.
