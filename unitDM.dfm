object DM: TDM
  Height = 415
  Width = 551
  PixelsPerInch = 96
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
    object tbProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbProdutonome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object tbProdutofabricante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Size = 30
    end
    object tbProdutovalidade: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'validade'
      Origin = 'validade'
      EditMask = '##/##/####;1;_'
    end
    object tbProdutoestoque_atual: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
  end
  object dsProduto: TDataSource
    DataSet = tbProduto
    Left = 152
    Top = 112
  end
  object tbMovimentacoes: TFDTable
    Active = True
    AfterScroll = tbMovimentacoesAfterScroll
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
    AfterPost = tbMovProdutoAfterPost
    BeforeDelete = tbMovProdutoBeforeDelete
    AfterDelete = tbMovProdutoAfterDelete
    IndexName = 'id_movimentacao'
    MasterSource = dsMovimentacoes
    MasterFields = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.movimentacao_produto'
    TableName = 'estoque.movimentacao_produto'
    Left = 344
    Top = 40
    object tbMovProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbMovProdutoid_movimentacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
    end
    object tbMovProdutoid_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_produto'
      Origin = 'id_produto'
    end
    object tbMovProdutoqtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
    end
    object tbMovProdutonomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tbProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_produto'
      Size = 50
      Lookup = True
    end
  end
  object dsMovProdutos: TDataSource
    DataSet = tbMovProduto
    Left = 344
    Top = 112
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'update produto set estoque_atual = estoque_atual + :pQtd Where i' +
        'd = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 240
    Top = 200
  end
  object sqlDiminueEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'update produto set estoque_atual = estoque_atual - :pQtd Where i' +
        'd = :pId'
      '')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 240
    Top = 280
  end
  object sqlMovimentacoes: TFDQuery
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
