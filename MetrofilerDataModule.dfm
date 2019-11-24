object dm_Metrofiler: Tdm_Metrofiler
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 851
  Width = 1033
  object ADOConnect_mFiler: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=MET123;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=MetrofilerV5;Data Source=CLV-WKS-161;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Workstation ID=CLV-WKS-391;Use Encryption for Data=False;Tag wit' +
      'h column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object qry_SQL: TADOQuery
    Connection = ADOConnect_mFiler
    Parameters = <>
    Left = 136
    Top = 16
  end
  object qry_ReadImage: TADOQuery
    Connection = ADOConnect_mFiler
    Parameters = <>
    Left = 216
    Top = 16
  end
  object qry_InsertImage: TADOQuery
    Connection = ADOConnect_mFiler
    Parameters = <>
    Left = 216
    Top = 80
  end
  object qry_InsAud: TADOQuery
    Connection = ADOConnect_mFiler
    Parameters = <
      item
        Name = 'UserId'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'AuditType'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'System'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Barcode'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'TrxNo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'eRecNo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Comment'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Bytes'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'INSERT INTO AuditTrial (UserId, AuditType, System, Barcode, TrxN' +
        'o, eRecNo, Comment, Bytes)'
      
        'VALUES(:UserId, :AuditType, :System, :Barcode, :TrxNo, :eRecNo, ' +
        ':Comment, :Bytes)')
    Left = 48
    Top = 136
  end
  object PrintDialog: TPrintDialog
    Left = 136
    Top = 136
  end
  object SaveDialogExcel: TSaveDialog
    Filter = 'Excel Files|*.xls'
    Left = 424
    Top = 8
  end
  object RegSec1: TRegSec
    Users = 0
    Devices01 = 0
    Devices02 = 0
    Devices03 = 0
    Devices04 = 0
    Devices05 = 0
    Devices06 = 0
    Devices07 = 0
    Devices08 = 0
    Devices09 = 0
    Devices10 = 0
    Trial = False
    Left = 384
    Top = 184
  end
  object RegSec2: TRegSec
    SoftwareTitle = 'MetroFiler'
    Users = 0
    Devices01 = 0
    Devices02 = 0
    Devices03 = 0
    Devices04 = 0
    Devices05 = 0
    Devices06 = 0
    Devices07 = 0
    Devices08 = 0
    Devices09 = 0
    Devices10 = 0
    Trial = False
    Left = 440
    Top = 184
  end
  object qry_CookieCache: TADOQuery
    Connection = ADOConnect_mFiler
    LockType = ltReadOnly
    Parameters = <>
    Left = 304
    Top = 16
  end
end
