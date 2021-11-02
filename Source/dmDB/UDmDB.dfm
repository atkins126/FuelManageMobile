object dmDB: TdmDB
  OldCreateOrder = False
  Height = 403
  Width = 663
  object qryControAcces: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from control_access')
    Left = 168
    Top = 144
    object qryControAccesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControAccesusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 32767
    end
    object qryControAccesdata_access: TDateTimeField
      FieldName = 'data_access'
      Origin = 'data_access'
    end
    object qryControAccessenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object FCon: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos2021\FuelManager\Android\db\FuelM.db'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FConBeforeConnect
    Left = 96
    Top = 96
  end
  object qryConfig: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from config')
    Left = 192
    Top = 216
    object qryConfigIP_SERVIDOR: TWideStringField
      FieldName = 'IP_SERVIDOR'
      Origin = 'IP_SERVIDOR'
      Size = 15
    end
    object qryConfigPOTA_SERVIDOR: TIntegerField
      FieldName = 'POTA_SERVIDOR'
      Origin = 'POTA_SERVIDOR'
    end
    object qryConfigSERIAL: TWideStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
    end
    object qryConfigSalvarLogin: TIntegerField
      FieldName = 'SalvarLogin'
      Origin = 'SalvarLogin'
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select'
      '   a.*,'
      '   p.nome CombustivelNome,'
      '   b.nome LocalEstoque,'
      '   c.prefixo  Maquina,'
      '   d.nome Operador,'
      '   h.nome Atividade'
      '   from abastecimento a'
      '   join produtos p on a.combustivel=p.id'
      '   join localestoque b on a.idlocalestoque=b.id'
      '   join maquinaveiculo c on c.id=a.idmaquina'
      '   join operadormaquinas d on d.id=a.idOperador'
      '   join auxatividadeabastecimento h on h.id=a.idAtividade'
      '   where a.status=1')
    Left = 312
    Top = 184
    object TAbastecimentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TAbastecimentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TAbastecimentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TAbastecimentodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAbastecimentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAbastecimentoidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Size = 32767
    end
    object TAbastecimentoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Size = 32767
    end
    object TAbastecimentoidoperador: TWideStringField
      FieldName = 'idoperador'
      Origin = 'idoperador'
      Size = 32767
    end
    object TAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentocombustivel: TWideStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 32767
    end
    object TAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TAbastecimentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoidatividade: TWideStringField
      FieldName = 'idatividade'
      Origin = 'idatividade'
      Size = 32767
    end
    object TAbastecimentoobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TAbastecimentoimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object TAbastecimentovalorlitro: TBCDField
      FieldName = 'valorlitro'
      Origin = 'valorlitro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoexterno: TWideStringField
      FieldName = 'externo'
      Origin = 'externo'
      Size = 32767
    end
    object TAbastecimentoidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TAbastecimentokmatual: TBCDField
      FieldName = 'kmatual'
      Origin = 'kmatual'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoCombustivelNome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CombustivelNome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoLocalEstoque: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LocalEstoque'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoMaquina: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Maquina'
      Origin = 'prefixo'
      ProviderFlags = []
      ReadOnly = True
    end
    object TAbastecimentoOperador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Operador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoAtividade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Atividade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAbastecimentoOutrosReconcileError
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.nome Produto from abastecimentoOutros a'
      'join produtos b on b.id=a.idproduto'
      'where a.status=1 ')
    Left = 312
    Top = 240
    object TAbastecimentoOutrosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TAbastecimentoOutrosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TAbastecimentoOutrosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TAbastecimentoOutrosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAbastecimentoOutrosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAbastecimentoOutrosidabastecimento: TWideStringField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
      Size = 32767
    end
    object TAbastecimentoOutrosidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoOutrossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TAbastecimentoOutrossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TAbastecimentoOutrosProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoOutrosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from localestoque'
      'where status=1'
      'and idcentrocusto=1')
    Left = 320
    Top = 304
    object TLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TLocalEstoquedatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TLocalEstoquenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TLocalEstoquecapacidade: TBCDField
      FieldName = 'capacidade'
      Origin = 'capacidade'
      Precision = 15
      Size = 3
    end
    object TLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TLocalEstoqueidcentrocusto: TWideStringField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
      Required = True
      Size = 32767
    end
  end
  object TStartbomba: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select s.*,'
      'case'
      ' when S.status=1 then '#39'EM ABERTO'#39
      ' when S.status=2 then '#39'FINALIZADO'#39' '
      'end statusStr,'
      'l.nome Local,p.nome CombustivelNome from startbomba s'
      'left join localestoque l on s.idlocalestoque=l.id'
      'left join produtos p on p.id=s.combustivel'
      'WHERE s.status>-1'
      'and s.idcentrocusto=1')
    Left = 416
    Top = 240
    object TStartbombaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TStartbombastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TStartbombadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TStartbombaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TStartbombadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TStartbombaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TStartbombaidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Required = True
      Size = 32767
    end
    object TStartbombaidcentrocusto: TWideStringField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
      Required = True
      Size = 32767
    end
    object TStartbombacombustivel: TWideStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Required = True
      Size = 32767
    end
    object TStartbombadataastart: TDateField
      FieldName = 'dataastart'
      Origin = 'dataastart'
      Required = True
    end
    object TStartbombahorastart: TTimeField
      FieldName = 'horastart'
      Origin = 'horastart'
      Required = True
    end
    object TStartbombadataaend: TDateField
      FieldName = 'dataaend'
      Origin = 'dataaend'
    end
    object TStartbombahoraend: TTimeField
      FieldName = 'horaend'
      Origin = 'horaend'
    end
    object TStartbombasyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TStartbombavolumelitrosIni: TBCDField
      FieldName = 'volumelitrosIni'
      Origin = 'volumelitrosIni'
      Required = True
      Precision = 15
      Size = 3
    end
    object TStartbombaobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TStartbombaimgStart: TWideMemoField
      FieldName = 'imgStart'
      Origin = 'imgStart'
      BlobType = ftWideMemo
    end
    object TStartbombaimgEnd: TWideMemoField
      FieldName = 'imgEnd'
      Origin = 'imgEnd'
      BlobType = ftWideMemo
    end
    object TStartbombavolumelitrosFim: TBCDField
      FieldName = 'volumelitrosFim'
      Origin = 'volumelitrosFim'
      Precision = 15
      Size = 3
    end
    object TStartbombaLocal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Local'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TStartbombaCombustivelNome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CombustivelNome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TStartbombastatusStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'statusStr'
      Origin = 'statusStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object TStartBombaInsert: TFDQuery
    CachedUpdates = True
    OnReconcileError = TStartBombaInsertReconcileError
    Connection = FCon
    SQL.Strings = (
      'select * from startbomba')
    Left = 424
    Top = 304
    object TStartBombaInsertid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TStartBombaInsertstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TStartBombaInsertdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TStartBombaInsertidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TStartBombaInsertdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TStartBombaInsertidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TStartBombaInsertidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Size = 32767
    end
    object TStartBombaInsertidcentrocusto: TWideStringField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
      Size = 32767
    end
    object TStartBombaInsertcombustivel: TWideStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 32767
    end
    object TStartBombaInsertdataastart: TDateField
      FieldName = 'dataastart'
      Origin = 'dataastart'
    end
    object TStartBombaInserthorastart: TTimeField
      FieldName = 'horastart'
      Origin = 'horastart'
    end
    object TStartBombaInsertdataaend: TDateField
      FieldName = 'dataaend'
      Origin = 'dataaend'
    end
    object TStartBombaInserthoraend: TTimeField
      FieldName = 'horaend'
      Origin = 'horaend'
    end
    object TStartBombaInsertsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TStartBombaInsertvolumelitrosIni: TBCDField
      FieldName = 'volumelitrosIni'
      Origin = 'volumelitrosIni'
      Precision = 15
      Size = 3
    end
    object TStartBombaInsertobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TStartBombaInsertimgStart: TWideMemoField
      FieldName = 'imgStart'
      Origin = 'imgStart'
      BlobType = ftWideMemo
    end
    object TStartBombaInsertimgEnd: TWideMemoField
      FieldName = 'imgEnd'
      Origin = 'imgEnd'
      BlobType = ftWideMemo
    end
    object TStartBombaInsertvolumelitrosFim: TBCDField
      FieldName = 'volumelitrosFim'
      Origin = 'volumelitrosFim'
      Precision = 15
      Size = 3
    end
  end
  object TMaquinas: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from maquinaveiculo')
    Left = 504
    Top = 240
    object TMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMaquinasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TMaquinasdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TMaquinasidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TMaquinasdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TMaquinasidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TMaquinasidmarca: TWideStringField
      FieldName = 'idmarca'
      Origin = 'idmarca'
      Size = 32767
    end
    object TMaquinasmodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Required = True
      Size = 50
    end
    object TMaquinasplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TMaquinasano: TWideStringField
      FieldName = 'ano'
      Origin = 'ano'
      Size = 32767
    end
    object TMaquinaschassi: TStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TMaquinasidcombustivel: TWideStringField
      FieldName = 'idcombustivel'
      Origin = 'idcombustivel'
      Size = 32767
    end
    object TMaquinasimg: TWideStringField
      FieldName = 'img'
      Origin = 'img'
      Size = 32767
    end
    object TMaquinasprefixo: TStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TMaquinassyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TMaquinassyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TMaquinasultimoabastecimento: TDateField
      FieldName = 'ultimoabastecimento'
      Origin = 'ultimoabastecimento'
    end
    object TMaquinashorimetroultimarev: TBCDField
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
    object TMaquinashorimetroatual: TBCDField
      FieldName = 'horimetroatual'
      Origin = 'horimetroatual'
      Precision = 15
      Size = 3
    end
    object TMaquinasqrcode: TStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TMaquinasidgrupo: TWideStringField
      FieldName = 'idgrupo'
      Origin = 'idgrupo'
      Size = 32767
    end
    object TMaquinaskmatual: TBCDField
      FieldName = 'kmatual'
      Origin = 'kmatual'
      Precision = 15
      Size = 3
    end
    object TMaquinasidsubgrupo: TWideStringField
      FieldName = 'idsubgrupo'
      Origin = 'idsubgrupo'
      Size = 32767
    end
    object TMaquinastipomedicao: TWideStringField
      FieldName = 'tipomedicao'
      Origin = 'tipomedicao'
      Required = True
      Size = 32767
    end
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = FCon
    Left = 480
    Top = 128
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from auxatividadeabastecimento'
      'where status>-1')
    Left = 360
    Top = 64
    object Tauxatividadeabastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Tauxatividadeabastecimentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object Tauxatividadeabastecimentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object Tauxatividadeabastecimentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object Tauxatividadeabastecimentodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Tauxatividadeabastecimentonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object Tauxatividadeabastecimentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from operadormaquinas'
      'where status=1')
    Left = 360
    Top = 128
    object TOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOperadorMaquinastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TOperadorMaquinadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TOperadorMaquinaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TOperadorMaquinadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TOperadorMaquinaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TOperadorMaquinanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TOperadorMaquinarg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TOperadorMaquinacpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TOperadorMaquinacnh: TStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TOperadorMaquinacelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TOperadorMaquinasyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TOperadorMaquinasyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TProdutos: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from produtos'
      'where status=1')
    Left = 552
    Top = 72
    object TProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TProdutosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TProdutosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TProdutosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TProdutosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TProdutosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TProdutostipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TProdutosunidademedida: TStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TProdutosestoqueminimo: TBCDField
      FieldName = 'estoqueminimo'
      Origin = 'estoqueminimo'
      Precision = 15
      Size = 2
    end
    object TProdutoscodigobarras: TStringField
      FieldName = 'codigobarras'
      Origin = 'codigobarras'
    end
    object TProdutosidmarca: TWideStringField
      FieldName = 'idmarca'
      Origin = 'idmarca'
      Size = 32767
    end
    object TProdutoscodigofabricante: TStringField
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TProdutossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TProdutoscustomedio: TBCDField
      FieldName = 'customedio'
      Origin = 'customedio'
      Precision = 15
    end
    object TProdutossaldoatual: TBCDField
      FieldName = 'saldoatual'
      Origin = 'saldoatual'
      Precision = 15
    end
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from tranferencialocalestoque')
    Left = 568
    Top = 136
    object TMovLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMovLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoquedatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TWideStringField
      FieldName = 'idlocalestoqueorigem'
      Origin = 'idlocalestoqueorigem'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoquedetino: TWideStringField
      FieldName = 'idlocalestoquedetino'
      Origin = 'idlocalestoquedetino'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Origin = 'datamov'
      Required = True
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
    object TMovLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
  end
  object TUsuario: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from usuario'
      'where status=1')
    Left = 416
    Top = 192
    object TUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TUsuariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TUsuariodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TUsuarioidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TUsuariodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TUsuarioidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object TUsuarioemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TUsuariocelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TUsuariousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 25
    end
    object TUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 50
    end
    object TUsuariotipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TUsuariosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
  end
  object TCentroCusto: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from centrocusto'
      'where status=1')
    Left = 232
    Top = 96
    object TCentroCustoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TCentroCustostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TCentroCustodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TCentroCustoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TCentroCustodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TCentroCustoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TCentroCustonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TCentroCustosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
  end
  object TAbastecimentoFoto: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select'
      '*'
      'from abastecimento a')
    Left = 56
    Top = 216
    object TAbastecimentoFotoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TAbastecimentoFotostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAbastecimentoFotoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAbastecimentoFotoidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotoidoperador: TWideStringField
      FieldName = 'idoperador'
      Origin = 'idoperador'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoFotocombustivel: TWideStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
      Required = True
    end
    object TAbastecimentoFotohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
    object TAbastecimentoFotosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoFotoidatividade: TWideStringField
      FieldName = 'idatividade'
      Origin = 'idatividade'
      Size = 32767
    end
    object TAbastecimentoFotoobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TAbastecimentoFotoimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object TAbastecimentoFotoimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object TAbastecimentoFotoimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object TAbastecimentoFotoimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object TAbastecimentoFotoimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object TAbastecimentoFotovalorlitro: TBCDField
      FieldName = 'valorlitro'
      Origin = 'valorlitro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoFotoexterno: TWideStringField
      FieldName = 'externo'
      Origin = 'externo'
      Required = True
      Size = 32767
    end
    object TAbastecimentoFotoidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
      Required = True
    end
    object TAbastecimentoFotokmatual: TBCDField
      FieldName = 'kmatual'
      Origin = 'kmatual'
      Precision = 15
      Size = 3
    end
  end
end
