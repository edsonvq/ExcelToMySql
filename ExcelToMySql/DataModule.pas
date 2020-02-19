unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSourceDB: TDataSource;
    ConnectionDB: TADOConnection;
    QueryDB: TADOQuery;
    QueryDBNome: TStringField;
    QueryDBSobrenome: TStringField;
    QueryDBIdade: TStringField;
    QueryDBTelefone: TStringField;
    QueryDBCelular: TStringField;
    QueryDBCidade: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
function XlsToStringGrid(Query: string): Boolean;

var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
begin

end;

end.
