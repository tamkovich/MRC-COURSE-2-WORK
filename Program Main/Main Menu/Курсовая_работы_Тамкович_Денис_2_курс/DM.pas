// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Unit DM для организации связей элементов ADO
unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule6 = class(TDataModule)
    ADOConnection1: TADOConnection;
    TGamers: TADOTable;
    DSGamers: TDataSource;
    Tx9BEGINER: TADOTable;
    Tx9MIDDLE: TADOTable;
    Tx9PROFESSOR: TADOTable;
    Tx8PROFESSOR: TADOTable;
    Tx8MIDDLE: TADOTable;
    DSx8BEGINER: TDataSource;
    DSx8MIDDLE: TDataSource;
    DSx8PROFESSOR: TDataSource;
    DSx9BEGINER: TDataSource;
    DSx9MIDDLE: TDataSource;
    DSx9PROFESSOR: TDataSource;
    Tx8BEGINERid: TAutoIncField;
    Tx8BEGINERUsername: TWideStringField;
    Tx8BEGINERDSDesigner: TDateTimeField;
    Tx8BEGINER: TADOTable;
    Tx8MIDDLEid: TAutoIncField;
    Tx8MIDDLEUsername: TWideStringField;
    Tx8MIDDLEDSDesigner: TDateTimeField;
    Tx8PROFESSORid: TAutoIncField;
    Tx8PROFESSORUsername: TWideStringField;
    Tx8PROFESSORDSDesigner: TDateTimeField;
    Tx9BEGINERid: TAutoIncField;
    Tx9BEGINERUsername: TWideStringField;
    Tx9BEGINERDSDesigner: TDateTimeField;
    Tx9MIDDLEid: TAutoIncField;
    Tx9MIDDLEUsername: TWideStringField;
    Tx9MIDDLEDSDesigner: TDateTimeField;
    Tx9PROFESSORid: TAutoIncField;
    Tx9PROFESSORUsername: TWideStringField;
    Tx9PROFESSORDSDesigner: TDateTimeField;
    Qx8B: TADOQuery;
    Qx8Bid: TAutoIncField;
    Qx8BUsername: TWideStringField;
    Qx8BDSDesigner: TDateTimeField;
    Qx8M: TADOQuery;
    Qx8P: TADOQuery;
    Qx9B: TADOQuery;
    Qx9M: TADOQuery;
    Qx9P: TADOQuery;
    Qx8Mid: TAutoIncField;
    Qx8MUsername: TWideStringField;
    Qx8MDSDesigner: TDateTimeField;
    Qx8Pid: TAutoIncField;
    Qx8PUsername: TWideStringField;
    Qx8PDSDesigner: TDateTimeField;
    Qx9Bid: TAutoIncField;
    Qx9BUsername: TWideStringField;
    Qx9BDSDesigner: TDateTimeField;
    Qx9Mid: TAutoIncField;
    Qx9MUsername: TWideStringField;
    Qx9MDSDesigner: TDateTimeField;
    Qx9Pid: TAutoIncField;
    Qx9PUsername: TWideStringField;
    Qx9PDSDesigner: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule6: TDataModule6;

implementation

{$R *.dfm}

end.
