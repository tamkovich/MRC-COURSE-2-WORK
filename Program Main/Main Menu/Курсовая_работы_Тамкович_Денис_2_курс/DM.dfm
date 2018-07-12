object DataModule6: TDataModule6
  OldCreateOrder = False
  Left = 794
  Top = 213
  Height = 498
  Width = 350
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ratelist.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 48
  end
  object TGamers: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Gamers'
    Left = 144
    Top = 72
  end
  object Tx9BEGINER: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x9BEGINER'
    Left = 64
    Top = 328
    object Tx9BEGINERid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx9BEGINERUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx9BEGINERDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object DSGamers: TDataSource
    DataSet = TGamers
    Left = 144
    Top = 128
  end
  object Tx9MIDDLE: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x9MIDDLE'
    Left = 144
    Top = 328
    object Tx9MIDDLEid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx9MIDDLEUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx9MIDDLEDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Tx9PROFESSOR: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x9PROFESSOR'
    Left = 232
    Top = 328
    object Tx9PROFESSORid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx9PROFESSORUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx9PROFESSORDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Tx8PROFESSOR: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x8PROFESSOR'
    Left = 224
    Top = 200
    object Tx8PROFESSORid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx8PROFESSORUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx8PROFESSORDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Tx8BEGINER: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x8BEGINER'
    Left = 64
    Top = 200
    object Tx8BEGINERid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx8BEGINERUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx8BEGINERDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Tx8MIDDLE: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'x8MIDDLE'
    Left = 144
    Top = 200
    object Tx8MIDDLEid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Tx8MIDDLEUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Tx8MIDDLEDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object DSx8BEGINER: TDataSource
    DataSet = Qx8B
    Left = 64
    Top = 256
  end
  object DSx8MIDDLE: TDataSource
    DataSet = Qx8M
    Left = 144
    Top = 256
  end
  object DSx8PROFESSOR: TDataSource
    DataSet = Qx8P
    Left = 224
    Top = 256
  end
  object DSx9BEGINER: TDataSource
    DataSet = Qx9B
    Left = 64
    Top = 384
  end
  object DSx9MIDDLE: TDataSource
    DataSet = Qx9M
    Left = 144
    Top = 384
  end
  object DSx9PROFESSOR: TDataSource
    DataSet = Qx9P
    Left = 232
    Top = 384
  end
  object Qx8B: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x8BEGINER ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 24
    Top = 248
    object Qx8Bid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx8BUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx8BDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Qx8M: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x8MIDDLE ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 104
    Top = 240
    object Qx8Mid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx8MUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx8MDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Qx8P: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x8PROFESSOR ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 184
    Top = 240
    object Qx8Pid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx8PUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx8PDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Qx9B: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x9BEGINER ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 16
    Top = 360
    object Qx9Bid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx9BUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx9BDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Qx9M: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x9MIDDLE ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 104
    Top = 368
    object Qx9Mid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx9MUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx9MDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object Qx9P: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 10 * FROM x9PROFESSOR ORDER BY '#1042#1088#1077#1084#1103'  ASC')
    Left = 184
    Top = 368
    object Qx9Pid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object Qx9PUsername: TWideStringField
      DisplayWidth = 14
      FieldName = 'Username'
      Size = 50
    end
    object Qx9PDSDesigner: TDateTimeField
      DisplayWidth = 13
      FieldName = #1042#1088#1077#1084#1103
      DisplayFormat = 'hh:mm:ss'
    end
  end
end
