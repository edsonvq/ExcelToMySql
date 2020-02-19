object DM: TDM
  OldCreateOrder = False
  Left = 634
  Top = 143
  Height = 96
  Width = 303
  object DataSourceDB: TDataSource
    DataSet = QueryDB
    Left = 224
    Top = 8
  end
  object ConnectionDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=root;Persist Security Info=True;User' +
      ' ID=root;Data Source=tst;Initial Catalog=teste'
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object QueryDB: TADOQuery
    Connection = ConnectionDB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 128
    Top = 8
    object QueryDBNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
    object QueryDBSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 45
    end
    object QueryDBIdade: TStringField
      FieldName = 'Idade'
      Size = 45
    end
    object QueryDBTelefone: TStringField
      FieldName = 'Telefone'
      Size = 12
    end
    object QueryDBCelular: TStringField
      FieldName = 'Celular'
      Size = 12
    end
    object QueryDBCidade: TStringField
      FieldName = 'Cidade'
      Size = 45
    end
  end
end
