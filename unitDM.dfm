object DM: TDM
  OldCreateOrder = False
  Height = 398
  Width = 520
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'Password=tche1045734728'
      'DriverID=MySQL'
      'User_Name=root')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object tbProduto: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.produto'
    TableName = 'estoque.produto'
    Left = 152
    Top = 40
  end
  object dsProduto: TDataSource
    DataSet = tbProduto
    Left = 152
    Top = 112
  end
  object tbMovimentacoes: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.movimentacao'
    TableName = 'estoque.movimentacao'
    Left = 240
    Top = 40
  end
  object dsMovimentacoes: TDataSource
    DataSet = tbMovimentacoes
    Left = 248
    Top = 112
  end
  object tbMovProduto: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.movimentacao_produto'
    TableName = 'estoque.movimentacao_produto'
    Left = 344
    Top = 40
  end
  object dsMovProdutos: TDataSource
    DataSet = tbMovProduto
    Left = 344
    Top = 112
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = Conexao
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 240
    Top = 200
  end
  object sqlDiminueEstoque: TFDCommand
    Connection = Conexao
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 240
    Top = 280
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from movimentacao')
    Left = 368
    Top = 208
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 368
    Top = 280
  end
end
