//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit RecordLookup;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Menus, ADODB;

type
  Tfrm_RecordLookup = class(TForm)
    lb_Lookup: TListBox;
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    Remove1: TMenuItem;
    qry_Look: TADOQuery;
    Edit1: TMenuItem;
    procedure Add1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure lb_LookupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
    sColumnHead, sDescription :String;
    sColumnType               :String;
  public
    { Public declarations }
    TextString : String;
    Editable   :Boolean;
    function Execute(ColumnHeading, ColumnType, Description  : String) : Integer;
  end;

var
  frm_RecordLookup: Tfrm_RecordLookup;

implementation

{$R *.DFM}

uses Main, MetrofilerDataModule;

function Tfrm_RecordLookup.Execute(ColumnHeading, ColumnType, Description  : String) : Integer;
begin
  sColumnHead   := ColumnHeading;
  sColumnType   := ColumnType;
  Caption := 'Lookup Values for "'+sColumnHead+'"';
  sDescription  := Description;
//---
  Screen.Cursor := crHourglass;
  lb_Lookup.PopupMenu := PopupMenu1;
  try
    qry_Look.Close;
    qry_Look.SQL.Clear;
    qry_Look.SQL.Add('SELECT TOP 10000 Item FROM IndexDefsLookups');
    qry_Look.SQL.Add('WHERE Description = '+QuotedStr(sDescription));
    qry_Look.SQL.Add('AND ColumnHeading = '+QuotedStr(sColumnHead));
    qry_Look.SQL.Add('ORDER BY Item');
    qry_Look.Open;
    qry_Look.First;
    lb_Lookup.Items.Clear;
    While not qry_Look.EOF Do
      begin
        lb_Lookup.Items.Append(Trim(qry_Look.FieldbyName('ITEM').AsString));
        qry_Look.Next;
      end;
    If Editable Then
      lb_Lookup.PopupMenu := PopupMenu1
    else lb_Lookup.PopupMenu := Nil;
  finally
    qry_Look.Close;
    Screen.Cursor := crDefault;
  end;
  Execute := ShowModal;
end;

procedure Tfrm_RecordLookup.Add1Click(Sender: TObject);
Var
  SStr  :String;
begin
  If not Editable Then
    exit;
  If InputQuery('Enter value for Lookup', 'Value:', SStr) Then
    begin
      If trim(SStr) = '' Then
        begin
          Messagedlg('Enter a valid TEXT value.', mtWarning, [mbOK], 0);
          exit;
        end;
      Screen.Cursor := crHourglass;
      try
        qry_Look.Close;
        qry_Look.SQL.Clear;
        qry_Look.SQL.Add('INSERT INTO IndexDefsLookups (Description, ColumnHeading, Item)');
        qry_Look.SQL.Add('VALUES('+QuotedStr(sDescription)+','+QuotedStr(sColumnHead)+',');
        If pos('TEXT', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add(QuotedStr(SStr)+')')
        else if pos('DATE', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add(QuotedStr(DatetoStr(StrtoDate(SStr)))+')')
        else if pos('NUM', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add(QuotedStr(FloattoStr(StrtoFloat(SStr)))+')')
        else
          begin
            Screen.Cursor := crDefault;
            Messagedlg('Internal Error : Invalid Fieldname passed by system!!', mtError, [mbOK], 0);
            exit;
          end;
        qry_Look.ExecSQL;
//----------
        qry_Look.Close;
        qry_Look.SQL.Clear;
        qry_Look.SQL.Add('SELECT Item FROM IndexDefsLookups');
        qry_Look.SQL.Add('WHERE Description = '+QuotedStr(sDescription));
        qry_Look.SQL.Add('AND ColumnHeading = '+QuotedStr(sColumnHead));
        qry_Look.SQL.Add('ORDER BY Item');
        qry_Look.Open;
        qry_Look.First;
        lb_Lookup.Items.Clear;
        While not qry_Look.EOF Do
          begin
            lb_Lookup.Items.Append(TRIM(qry_Look.FieldbyName('ITEM').AsString));
            qry_Look.Next;
          end;

//---------
        lb_Lookup.ItemIndex := lb_Lookup.Items.IndexOf(SStr);
      finally
        qry_Look.Close;
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure Tfrm_RecordLookup.Remove1Click(Sender: TObject);
begin
  If not Editable Then
    exit;
  If lb_Lookup.ItemIndex < 0 Then
    exit;
//-----
  If Messagedlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
//-----
  Screen.Cursor := crHourglass;
  try
    qry_Look.Close;
    qry_Look.SQL.Clear;
    qry_Look.SQL.Add('DELETE FROM IndexDefsLookups');
    qry_Look.SQL.Add('WHERE Description = '+QuotedStr(sDescription));
    qry_Look.SQL.Add('AND ColumnHeading = '+QuotedStr(sColumnHead));
    qry_Look.SQL.Add('AND [Item] = '+QuotedStr(lb_Lookup.Items.Strings[lb_Lookup.ItemIndex]));
    qry_Look.ExecSQL;
    lb_Lookup.Items.Delete(lb_Lookup.ItemIndex);
  finally
    qry_Look.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_RecordLookup.lb_LookupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Editable Then
    exit;
  If Key = 13 Then
    begin
      TextString := lb_Lookup.Items.Strings[lb_Lookup.ItemIndex];
      ModalResult := mrOK;
      Abort;
    end
  else If Key = 27 Then
    begin
      ModalResult := mrAbort;
      Abort;
    end;
end;

procedure Tfrm_RecordLookup.Edit1Click(Sender: TObject);
Var
  SStr  :String;
  FStr  :String;
begin
 If not Editable Then
    exit;
  If lb_Lookup.ItemIndex <> -1 Then
    begin
      FStr := lb_Lookup.Items.Strings[lb_Lookup.ItemIndex];
      SStr := lb_Lookup.Items.Strings[lb_Lookup.ItemIndex];
    end;
  If InputQuery('Enter value for Lookup', 'Value:', SStr) Then
    begin
      If trim(SStr) = '' Then
        begin
          Messagedlg('Enter a valid TEXT value.', mtWarning, [mbOK], 0);
          exit;
        end;
      Screen.Cursor := crHourglass;
      try
        qry_Look.Close;
        qry_Look.SQL.Clear;
        qry_Look.SQL.Add('UPDATE IndexDefsLookups SET');
        If pos('TEXT', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add('  Item = '+ QuotedStr(SStr))
        else if pos('DATE', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add('  Item = '+ QuotedStr(DatetoStr(StrtoDate(SStr))))
        else if pos('NUM', upperCase(sColumnType)) <> 0 Then
          qry_Look.SQL.Add('  Item = '+ QuotedStr(FloattoStr(StrtoFloat(SStr))))
        else
          begin
            Screen.Cursor := crDefault;
            Messagedlg('Internal Error : Invalid Fieldname passed by system!!', mtError, [mbOK], 0);
            exit;
          end;
        qry_Look.SQL.Add('WHERE Description = '+QuotedStr(sDescription));
        qry_Look.SQL.Add('AND ColumnHeading = '+QuotedStr(sColumnHead));
        qry_Look.SQL.Add('AND [Item] = '+QuotedStr(FStr));
        qry_Look.ExecSQL;
//----------
        qry_Look.Close;
        qry_Look.SQL.Clear;
        qry_Look.SQL.Add('SELECT Item FROM IndexDefsLookups');
        qry_Look.SQL.Add('WHERE Description = '+QuotedStr(sDescription));
        qry_Look.SQL.Add('AND ColumnHeading = '+QuotedStr(sColumnHead));
        qry_Look.SQL.Add('ORDER BY Item');
        qry_Look.Open;
        qry_Look.First;
        lb_Lookup.Items.Clear;
        While not qry_Look.EOF Do
          begin
            lb_Lookup.Items.Append(TRIM(qry_Look.FieldbyName('ITEM').AsString));
            qry_Look.Next;
          end;
//---------
        lb_Lookup.ItemIndex := lb_Lookup.Items.IndexOf(SStr);
      finally
        qry_Look.Close;
        Screen.Cursor := crDefault;
      end;
    end;end;

end.
