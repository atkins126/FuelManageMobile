--
-- File generated with SQLiteStudio v3.0.6 on ter nov 2 09:38:32 2021
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: abastecimento
CREATE TABLE abastecimento (id integer NOT NULL PRIMARY KEY, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4, idlocalestoque int4 NOT NULL, idmaquina int4 NOT NULL, idoperador int4 NOT NULL, volumelt numeric (15, 3), combustivel int4 NOT NULL, dataabastecimento date NOT NULL, hora time NOT NULL, syncaws int4 NOT NULL DEFAULT 0, horimetro numeric (15, 3), idatividade int4, obs varchar (100), img TEXT, img2 TEXT, img3 TEXT, img4 TEXT, img5 TEXT, valorlitro numeric (15, 3), externo int4 NOT NULL DEFAULT 0, idcentrocusto INTEGER NOT NULL, kmatual numeric (15, 3))

-- Table: produtos
CREATE TABLE produtos ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL, tipo int4 NOT NULL, unidademedida varchar(10) NULL, estoqueminimo numeric(15, 2) NULL, codigobarras varchar(20) NULL, idmarca int4 NULL, codigofabricante varchar(30) NULL, syncaws int4 NOT NULL DEFAULT 0, customedio numeric(15, 4) NULL, saldoatual numeric(15, 4) NULL, CONSTRAINT "Produtos_pkey" PRIMARY KEY (id)
)

-- Table: control_access
CREATE TABLE control_access (
id INTEGER PRIMARY KEY AUTOINCREMENT,
usuario STRING, data_access DATETIME DEFAULT (CURRENT_TIMESTAMP), senha VARCHAR (100))

-- Table: maquinaveiculo
CREATE TABLE maquinaveiculo (id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4, idmarca int4, modelo varchar (50) NOT NULL, placa varchar (20), ano int4, chassi varchar (30), idcombustivel int4, img bytea, prefixo varchar (20), syncaws int4 NOT NULL DEFAULT 0, syncfaz int4 NOT NULL DEFAULT 0, ultimoabastecimento date, horimetroultimarev numeric (15, 3), horimetroatual numeric (15, 3) DEFAULT 0, qrcode varchar (20), idsubgrupo int4, idgrupo int4, tipomedicao int4 NOT NULL DEFAULT 1, kmatual numeric (15, 3), CONSTRAINT maquinaveiculo_pkey PRIMARY KEY (id))

-- Table: usuario
CREATE TABLE usuario ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(100) NOT NULL, email varchar(100) NULL, celular varchar(20) NULL, usuario varchar(25) NOT NULL, senha varchar(50) NOT NULL, tipo int4 NOT NULL, syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT usuarios_pk PRIMARY KEY (id)
)

-- Table: CONFIG
CREATE TABLE CONFIG (IP_SERVIDOR TEXT (15), POTA_SERVIDOR INTEGER, SERIAL TEXT (20), SalvarLogin INTEGER DEFAULT (0))

-- Table: operadormaquinas
CREATE TABLE operadormaquinas ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL, rg varchar(10) NULL, cpf varchar(20) NULL, cnh varchar(20) NULL, celular varchar(20) NULL, syncaws int4 NOT NULL DEFAULT 0, syncfaz int4 NOT NULL DEFAULT 0, CONSTRAINT "OperadorMaquinas_pkey" PRIMARY KEY (id)
)

-- Table: localestoque
CREATE TABLE localestoque ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL, capacidade numeric(15, 3) NULL, syncaws int4 NOT NULL DEFAULT 0, idcentrocusto int4 NOT NULL, CONSTRAINT localestoque_pkey PRIMARY KEY (id)
)

-- Table: startbomba
CREATE TABLE startbomba (id integer NOT NULL PRIMARY KEY AUTOINCREMENT, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4, idlocalestoque int4 NOT NULL, idcentrocusto int4 NOT NULL, combustivel int4 NOT NULL, dataastart date NOT NULL, horastart time NOT NULL, dataaend date, horaend time, syncaws int4 NOT NULL DEFAULT 0, volumelitrosIni numeric (15, 3) NOT NULL, obs varchar (100), imgStart TEXT, imgEnd TEXT, volumelitrosFim NUMERIC (15, 3))

-- Table: tranferencialocalestoque
CREATE TABLE tranferencialocalestoque ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, idlocalestoqueorigem int4 NOT NULL, idlocalestoquedetino int4 NOT NULL, idproduto int4 NOT NULL, qtde numeric(15, 3) NULL, datamov date NOT NULL, hora time NOT NULL, syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT tranferencialocalestoque_pk PRIMARY KEY (id))

-- Table: centrocusto
CREATE TABLE centrocusto ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL, syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT centrocusto_pkey PRIMARY KEY (id)
)

-- Table: abastecimentooutros
CREATE TABLE abastecimentooutros (id integer NOT NULL PRIMARY KEY AUTOINCREMENT, status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4, idabastecimento int4 NOT NULL, idproduto int4 NOT NULL, quantidade numeric (15, 3), syncaws int4 NOT NULL DEFAULT 0, syncfaz int4 NOT NULL DEFAULT 0)

-- Table: auxatividadeabastecimento
CREATE TABLE auxatividadeabastecimento ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1, datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL, syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT auxatividadeabastecimento_pkey PRIMARY KEY (id)
)

-- Trigger: tr_atualiza_maquina
CREATE TRIGGER tr_atualiza_maquina AFTER INSERT ON abastecimento BEGIN UPDATE maquinaveiculo SET ultimoabastecimento = new.dataabastecimento, horimetroatual = new.horimetro WHERE id = new.idmaquina; END

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
