unit ePendingLinkItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Mask, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  Tfrm_ePendingLinkItem = class(TForm)
    Panel1: TPanel;
    btn_OK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edt_Filenumber: TEdit;
    Label2: TLabel;
    Label29: TLabel;
    Label16: TLabel;
    Label32: TLabel;
    lbl_RBranchSrc: TLabel;
    lbl_RDeptSrc: TLabel;
    btn_RBranchCap: TButton;
    btn_RDeptCap: TButton;
    btn_RRTypeCap: TButton;
    edt_RBranchCap: TEdit;
    edt_RDeptCap: TEdit;
    edt_RRTypeCap: TEdit;
    btn_Search: TBitBtn;
    lbl_DataType: TLabel;
    Panel2: TPanel;
    Label47: TLabel;
    ResultGrid: TDBGrid;
    Splitter1: TSplitter;
    qry_RecordType: TADOQuery;
    scrl_IndexInfoBox: TScrollBox;
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
    qry_Items: TADOQuery;
    dts_Records: TDataSource;
    qry_SQL: TADOQuery;
    btn_SearchBarcode: TBitBtn;
    qry_Det: TADOQuery;
    procedure btn_RBranchCapClick(Sender: TObject);
    procedure btn_RDeptCapClick(Sender: TObject);
    procedure btn_RRTypeCapClick(Sender: TObject);
    procedure edt_RRTypeCapChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_SearchBarcodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute:Integer;
  end;

var
  frm_ePendingLinkItem: Tfrm_ePendingLinkItem;

implementation

uses SelBranch, Main, MetrofilerDataModule, SelDept, SelRType;

{$R *.dfm}

function Tfrm_ePendingLinkItem.Execute:Integer;
begin
  Result := ShowModal;
end;


procedure Tfrm_ePendingLinkItem.btn_RBranchCapClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_RDeptCap.Text := '';
      lbl_RDeptSrc.Caption := '...';
      edt_RRTypeCap.Text := '';

      edt_RBranchCap.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_ePendingLinkItem.btn_RDeptCapClick(Sender: TObject);
begin
  If length(edt_RBranchCap.Text) = 0 Then
    begin
      Messagedlg('Please select a Branch.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_RBranchCap.Text, User) = mrOK Then
    begin
      edt_RRTypeCap.Text := '';

      edt_RDeptCap.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_ePendingLinkItem.btn_RRTypeCapClick(Sender: TObject);
begin
  If length(edt_RDeptCap.Text) = 0 Then
    begin
      Messagedlg('Please select the Department for this Bulk Import.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_RBranchCap.Text,
                          edt_RDeptCap.Text,
                          User,
                          False,
                          False,
                          True,
                          False,
                          False) = mrOK Then
    begin
      edt_RRTypeCap.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_ePendingLinkItem.edt_RRTypeCapChange(Sender: TObject);
Var
  RecordType   :String;
  I, J         :Integer;
  MaxLblLen    :Integer;
  fHeader      :String;
begin
  RecordType := trim(edt_RRTypeCap.Text);
//----
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag := 0;
    end;
//----
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(RecordType));
  qry_RecordType.Open;
  I := 0;
  MaxLblLen := 0;
  For J := 1 to 15 Do
    begin
      fHeader := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
      If fHeader <> '' Then
        begin
          If (J >= 1)AND(J <= 6) Then
            begin
              Inc(I);
              If MaxLblLen < Canvas.TextWidth(fHeader+' :') Then
                MaxLblLen := Canvas.TextWidth(fHeader+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := fHeader+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
            end
          else if (J >= 11)AND(J <= 12) Then
            begin
              Inc(I);
              If MaxLblLen < Canvas.TextWidth(fHeader+' :') Then
                MaxLblLen := Canvas.TextWidth(fHeader+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := fHeader+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              Inc(I);
              If MaxLblLen < Canvas.TextWidth(fHeader+' :') Then
                MaxLblLen := Canvas.TextWidth(fHeader+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := fHeader+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
            end;
        end;
    end;

  qry_RecordType.Close;

  For J := 1 to 15 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Left := MaxLblLen+8;

      If (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag >= 1)AND
         (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag <= 6)Then
        begin
          TEdit(FindComponent('edt_Col'+InttoStr(J))).Width := 300;
        end
      else If (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag >= 11)AND
              (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag <= 12)Then
        begin
          TEdit(FindComponent('edt_Col'+InttoStr(J))).Width := 100;
        end
      else If (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag >= 14)AND
              (TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag <= 15)Then
        begin
          TEdit(FindComponent('edt_Col'+InttoStr(J))).Width := 100;
        end
    end;
end;

procedure Tfrm_ePendingLinkItem.btn_SearchBarcodeClick(Sender: TObject);
Var
  SelectStr     :String;
  RecordType    :String;
  J             :Integer;
  fHeader       :String;
begin
  if (length(edt_RBranchCap.Text) = 0) Then
    begin
      MessageDlg('Please select the Branch!!',mtInformation,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_RDeptCap.Text) = 0) then
    begin
      MessageDlg('Please select the Department!!',mtInformation,[mbOK],0);
      exit;
    end;
  if (length(edt_Filenumber.Text) = 0)Then
    begin
      MessageDlg('Please enter a Barcode!!',mtInformation,[mbOK],0);
      exit;
    end;
//--------------------------------------------
  qry_Items.Close;
//--------------------------------------------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT i.Itemnumber, i.Filenumber, i.FileType');
  qry_SQL.SQL.Add('FROM Items i');
  qry_SQL.SQL.Add('INNER JOIN Files f ON i.Filenumber = f.Filenumber');
  qry_SQL.SQL.Add('WHERE f.Branch = :mBranch');
  qry_SQL.SQL.Add('AND f.Department = :mDepartment');
  qry_SQL.SQL.Add('AND i.Itemnumber = :mItem');
  qry_SQL.Parameters.ParamByName('mBranch').Value := edt_RBranchCap.Text;
  qry_SQL.Parameters.ParamByName('mDepartment').Value := edt_RDeptCap.Text;
  qry_SQL.Parameters.ParamByName('mItem').Value := edt_Filenumber.Text;
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      MessageDlg('Barcode not found!!',mtInformation,[mbOK],0);
      exit;
    end;
  RecordType := trim(qry_SQL.FieldbyName('FILETYPE').asString);
  qry_SQL.Close;

  SelectStr := 'SELECT i.Itemnumber, i.Filenumber, ';

//----
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(RecordType));
  qry_RecordType.Open;
  For J := 1 to 15 Do
    begin
      fHeader := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
      If fHeader <> '' Then
        begin
          If (J >= 1)AND(J <= 6) Then
            SelectStr := SelectStr + 'i.TEXT'+InttoStr(J)+' AS "'+fHeader+'",'
          else if (J >= 11)AND(J <= 12) Then
            SelectStr := SelectStr + 'i.DATE'+InttoStr(J-10)+' AS "'+fHeader+'",'
          else if (J >= 14)AND(J <= 15) Then
            SelectStr := SelectStr + 'i.NUMBER'+InttoStr(J-13)+' AS "'+fHeader+'",';
        end;
    end;
  SelectStr := SelectStr + 'i.Status'+#13;
//----
  SelectStr := SelectStr + 'FROM Items i'+#13;
  SelectStr := SelectStr + 'INNER JOIN Files f ON i.Filenumber = f.Filenumber'+#13;
  SelectStr := SelectStr + 'WHERE f.Branch = '+QuotedStr(edt_RBranchCap.Text)+#13;
  SelectStr := SelectStr + 'AND f.Department = '+QuotedStr(edt_RDeptCap.Text)+#13;
  SelectStr := SelectStr + 'AND i.Itemnumber = '+QuotedStr(edt_Filenumber.Text)+#13;

  qry_Items.Close;
  qry_Items.SQL.Clear;
  qry_Items.SQL.Add(SelectStr);
  qry_Items.Open;
  frm_Console.AutoSizeNewColumns(ResultGrid);
end;

procedure Tfrm_ePendingLinkItem.btn_SearchClick(Sender: TObject);
Var
  SelectStr  :String;
  RecordType   :String;
  I, J         :Integer;
  fHeader      :String;
  fDetail      :String;
//--
  fDateParam1  :TDateTime;
  fDateParam2  :TDateTime;
  fDateParam3  :TDateTime;
begin
  if (length(edt_RBranchCap.Text) = 0) Then
    begin
      MessageDlg('Please select the Branch!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_RDeptCap.Text) = 0) then
    begin
      MessageDlg('Please select the Department!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_RRTypeCap.Text) = 0)Then
    begin
      MessageDlg('Please select the Record Type!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
//--------------------------------------------
  qry_Items.Close;
  SelectStr := 'SELECT TOP 500 i.Itemnumber, i.Filenumber, ';

  RecordType := trim(edt_RRTypeCap.Text);
//----
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(RecordType));
  qry_RecordType.Open;
  I := 0;
  For J := 1 to 15 Do
    begin
      fHeader := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
      If fHeader <> '' Then
        begin
          If (J >= 1)AND(J <= 6) Then
            SelectStr := SelectStr + 'i.TEXT'+InttoStr(J)+' AS "'+fHeader+'",'
          else if (J >= 11)AND(J <= 12) Then
            SelectStr := SelectStr + 'i.DATE'+InttoStr(J-10)+' AS "'+fHeader+'",'
          else if (J >= 14)AND(J <= 15) Then
            SelectStr := SelectStr + 'i.NUMBER'+InttoStr(J-13)+' AS "'+fHeader+'",';
        end;
    end;
  SelectStr := SelectStr + 'i.Status'+#13;
//----
  SelectStr := SelectStr + 'FROM Items i'+#13;
  SelectStr := SelectStr + 'INNER JOIN Files f ON i.Filenumber = f.Filenumber'+#13;
  SelectStr := SelectStr + 'WHERE f.Branch = '+QuotedStr(edt_RBranchCap.Text)+#13;
  SelectStr := SelectStr + 'AND f.Department = '+QuotedStr(edt_RDeptCap.Text)+#13;
  SelectStr := SelectStr + 'AND i.FileType = '+QuotedStr(edt_RRTypeCap.Text)+#13;

  fDateParam1 := 0;
  fDateParam2 := 0;
  fDateParam3 := 0;

  For J := 1 to 15 Do
    begin
      fHeader := trim(qry_RecordType.FieldbyName('COL'+InttoStr(J)).AsString);
      If fHeader <> '' Then
        begin
          If (J >= 1)AND(J <= 6) Then
            begin
              Inc(I);
              If TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible Then
                begin
                  fDetail := trim(TEdit(FindComponent('edt_Col'+InttoStr(I))).Text);
                  If fDetail <> '' Then
                    begin
                      SelectStr := SelectStr + 'AND i.[TEXT'+InttoStr(J)+'] LIKE '+QuotedStr(fDetail)+#13;
                    end;
                end;
            end
          else if (J >= 11)AND(J <= 12) Then
            begin
              Inc(I);
              If TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible Then
                begin
                  fDetail := trim(TEdit(FindComponent('edt_Col'+InttoStr(I))).Text);
                  If fDetail <> '' Then
                    begin
                      SelectStr := SelectStr + 'AND i.[DATE'+InttoStr(J-10)+'] = :mDate'+InttoStr(J-10)+#13;
                      If J = 11 Then fDateParam1 := StrtoDateTime(fDetail);
                      If J = 12 Then fDateParam2 := StrtoDateTime(fDetail);
                      If J = 13 Then fDateParam3 := StrtoDateTime(fDetail);
                    end;
                end;

            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              Inc(I);
              If TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible Then
                begin
                  fDetail := trim(TEdit(FindComponent('edt_Col'+InttoStr(I))).Text);
                  If fDetail <> '' Then
                    begin
                      SelectStr := SelectStr + 'AND i.[NUMBER'+InttoStr(J-13)+'] = '+fDetail+#13;
                    end;
                end;
            end;
        end;
    end;

  qry_Items.Close;
  qry_Items.SQL.Clear;
  qry_Items.SQL.Add(SelectStr);
  If fDateParam1 <> 0 Then
    qry_Items.Parameters.ParamValues['mDate1'] := fDateParam1;
  If fDateParam2 <> 0 Then
    qry_Items.Parameters.ParamValues['mDate2'] := fDateParam2;
  If fDateParam3 <> 0 Then
    qry_Items.Parameters.ParamValues['mDate3'] := fDateParam3;
  qry_Items.Open;
  frm_Console.AutoSizeNewColumns(ResultGrid);
end;

procedure Tfrm_ePendingLinkItem.btn_OKClick(Sender: TObject);
begin
  If not qry_Items.IsEmpty Then
    begin
      qry_Det.Close;
      qry_Det.SQL.Clear;
      qry_Det.SQL.Add('SELECT Itemnumber, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2 FROM Items WHERE Itemnumber = :Itemnumber');
      qry_Det.Parameters.ParamByName('Itemnumber').Value := trim(qry_Items.Fields[0].AsString);
      qry_Det.Open;
      qry_Items.Close;
      qry_RecordType.Close;
      ModalResult := mrOK;
      exit;
    end;
//----------
  MessageDlg('Please do a Search.',mtWarning,[mbOK],0);
end;

end.
