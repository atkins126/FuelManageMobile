unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,System.IOUtils,FMX.Dialogs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TdmDB = class(TDataModule)
    qryConfig: TFDQuery;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    FCon: TFDConnection;
    SQLiteDriverLink: TFDPhysSQLiteDriverLink;
    TUsuario: TFDQuery;
    TUsuarioid: TIntegerField;
    TUsuariostatus: TWideStringField;
    TUsuariodatareg: TWideStringField;
    TUsuarioidusuario: TWideStringField;
    TUsuariodataalteracao: TWideStringField;
    TUsuarioidusuarioalteracao: TWideStringField;
    TUsuarionome: TStringField;
    TUsuarioemail: TStringField;
    TUsuariocelular: TStringField;
    TUsuariousuario: TStringField;
    TUsuariosenha: TStringField;
    TUsuariotipo: TWideStringField;
    TUsuariosyncaws: TWideStringField;
    TOperadorMaquina: TFDQuery;
    TOperadorMaquinaid: TIntegerField;
    TOperadorMaquinastatus: TWideStringField;
    TOperadorMaquinadatareg: TWideStringField;
    TOperadorMaquinaidusuario: TWideStringField;
    TOperadorMaquinadataalteracao: TWideStringField;
    TOperadorMaquinaidusuarioalteracao: TWideStringField;
    TOperadorMaquinanome: TStringField;
    TOperadorMaquinarg: TStringField;
    TOperadorMaquinacpf: TStringField;
    TOperadorMaquinacnh: TStringField;
    TOperadorMaquinacelular: TStringField;
    TOperadorMaquinasyncaws: TWideStringField;
    TOperadorMaquinasyncfaz: TWideStringField;
    TCentroCusto: TFDQuery;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TWideStringField;
    TCentroCustodatareg: TWideStringField;
    TCentroCustoidusuario: TWideStringField;
    TCentroCustodataalteracao: TWideStringField;
    TCentroCustoidusuarioalteracao: TWideStringField;
    TCentroCustonome: TStringField;
    TCentroCustosyncaws: TWideStringField;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TWideStringField;
    TLocalEstoquedatareg: TWideStringField;
    TLocalEstoqueidusuario: TWideStringField;
    TLocalEstoquedataalteracao: TWideStringField;
    TLocalEstoqueidusuarioalteracao: TWideStringField;
    TLocalEstoquenome: TStringField;
    TLocalEstoquecapacidade: TBCDField;
    TLocalEstoquesyncaws: TWideStringField;
    TLocalEstoqueidcentrocusto: TWideStringField;
    TProdutos: TFDQuery;
    TProdutosid: TIntegerField;
    TProdutosstatus: TWideStringField;
    TProdutosdatareg: TWideStringField;
    TProdutosidusuario: TWideStringField;
    TProdutosdataalteracao: TWideStringField;
    TProdutosidusuarioalteracao: TWideStringField;
    TProdutosnome: TStringField;
    TProdutostipo: TWideStringField;
    TProdutosunidademedida: TStringField;
    TProdutosestoqueminimo: TBCDField;
    TProdutoscodigobarras: TStringField;
    TProdutosidmarca: TWideStringField;
    TProdutoscodigofabricante: TStringField;
    TProdutossyncaws: TWideStringField;
    TProdutoscustomedio: TBCDField;
    TProdutossaldoatual: TBCDField;
    TMaquinas: TFDQuery;
    TMaquinasid: TIntegerField;
    TMaquinasstatus: TWideStringField;
    TMaquinasdatareg: TWideStringField;
    TMaquinasidusuario: TWideStringField;
    TMaquinasdataalteracao: TWideStringField;
    TMaquinasidusuarioalteracao: TWideStringField;
    TMaquinasidmarca: TWideStringField;
    TMaquinasmodelo: TStringField;
    TMaquinasplaca: TStringField;
    TMaquinasano: TWideStringField;
    TMaquinaschassi: TStringField;
    TMaquinasidcombustivel: TWideStringField;
    TMaquinasimg: TWideStringField;
    TMaquinasprefixo: TStringField;
    TMaquinassyncaws: TWideStringField;
    TMaquinassyncfaz: TWideStringField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinashorimetroatual: TBCDField;
    TMaquinasqrcode: TStringField;
    TMaquinasidtipomaquina: TWideStringField;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TWideStringField;
    Tauxatividadeabastecimentodatareg: TWideStringField;
    Tauxatividadeabastecimentoidusuario: TWideStringField;
    Tauxatividadeabastecimentodataalteracao: TWideStringField;
    Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField;
    Tauxatividadeabastecimentonome: TStringField;
    Tauxatividadeabastecimentosyncaws: TWideStringField;
    TAbastecimento: TFDQuery;
    TAbastecimentoOutros: TFDQuery;
    TMaquinasultimoabastecimento: TDateField;
    TAbastecimentoid: TFDAutoIncField;
    TAbastecimentostatus: TWideStringField;
    TAbastecimentodatareg: TWideStringField;
    TAbastecimentoidusuario: TWideStringField;
    TAbastecimentodataalteracao: TWideStringField;
    TAbastecimentoidusuarioalteracao: TWideStringField;
    TAbastecimentoidlocalestoque: TWideStringField;
    TAbastecimentoidmaquina: TWideStringField;
    TAbastecimentoidoperador: TWideStringField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TWideStringField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TWideStringField;
    TAbastecimentohorimetro: TBCDField;
    TAbastecimentoidatividade: TWideStringField;
    TAbastecimentoobs: TStringField;
    TAbastecimentoimg: TWideMemoField;
    TAbastecimentoimg2: TWideMemoField;
    TAbastecimentoimg3: TWideMemoField;
    TAbastecimentoimg4: TWideMemoField;
    TAbastecimentoimg5: TWideMemoField;
    TAbastecimentovalorlitro: TBCDField;
    TAbastecimentoexterno: TWideStringField;
    TAbastecimentoLocalEstoque: TStringField;
    TAbastecimentoMaquina: TStringField;
    TAbastecimentoOperador: TStringField;
    TAbastecimentoAtividade: TStringField;
    TAbastecimentoCombustivelNome: TStringField;
    TAbastecimentoOutrosid: TIntegerField;
    TAbastecimentoOutrosstatus: TWideStringField;
    TAbastecimentoOutrosdatareg: TWideStringField;
    TAbastecimentoOutrosidusuario: TWideStringField;
    TAbastecimentoOutrosdataalteracao: TWideStringField;
    TAbastecimentoOutrosidusuarioalteracao: TWideStringField;
    TAbastecimentoOutrosidabastecimento: TWideStringField;
    TAbastecimentoOutrosidproduto: TWideStringField;
    TAbastecimentoOutrosquantidade: TBCDField;
    TAbastecimentoOutrossyncaws: TWideStringField;
    TAbastecimentoOutrossyncfaz: TWideStringField;
    TAbastecimentoOutrosProduto: TStringField;
    TAbastecimentoidcentrocusto: TIntegerField;
    qryControAcces: TFDQuery;
    qryControAccesid: TFDAutoIncField;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccessenha: TStringField;
    TstartBomba: TFDQuery;
    TstartBombaid: TFDAutoIncField;
    TstartBombastatus: TWideStringField;
    TstartBombadatareg: TWideStringField;
    TstartBombaidusuario: TWideStringField;
    TstartBombadataalteracao: TWideStringField;
    TstartBombaidusuarioalteracao: TWideStringField;
    TstartBombaidlocalestoque: TWideStringField;
    TstartBombaidcentrocusto: TWideStringField;
    TstartBombacombustivel: TWideStringField;
    TstartBombadataastart: TDateField;
    TstartBombahorastart: TTimeField;
    TstartBombadataaend: TDateField;
    TstartBombahoraend: TTimeField;
    TstartBombasyncaws: TWideStringField;
    TstartBombavolumelitrosIni: TBCDField;
    TstartBombaobs: TStringField;
    TstartBombaimgStart: TWideMemoField;
    TstartBombaimgEnd: TWideMemoField;
    TstartBombavolumelitrosFim: TBCDField;
    TstartBombaLocal: TStringField;
    TstartBombaCombustivelNome: TStringField;
    TStartBombaInsert: TFDQuery;
    TStartBombaInsertid: TFDAutoIncField;
    TStartBombaInsertstatus: TWideStringField;
    TStartBombaInsertdatareg: TWideStringField;
    TStartBombaInsertidusuario: TWideStringField;
    TStartBombaInsertdataalteracao: TWideStringField;
    TStartBombaInsertidusuarioalteracao: TWideStringField;
    TStartBombaInsertidlocalestoque: TWideStringField;
    TStartBombaInsertidcentrocusto: TWideStringField;
    TStartBombaInsertcombustivel: TWideStringField;
    TStartBombaInsertdataastart: TDateField;
    TStartBombaInserthorastart: TTimeField;
    TStartBombaInsertdataaend: TDateField;
    TStartBombaInserthoraend: TTimeField;
    TStartBombaInsertsyncaws: TWideStringField;
    TStartBombaInsertvolumelitrosIni: TBCDField;
    TStartBombaInsertobs: TStringField;
    TStartBombaInsertimgStart: TWideMemoField;
    TStartBombaInsertimgEnd: TWideMemoField;
    TStartBombaInsertvolumelitrosFim: TBCDField;
    TAbastecimentokmatual: TBCDField;
    TMaquinasidgrupo: TWideStringField;
    TMaquinashorimetroxkm: TWideStringField;
    TMaquinaskmatual: TBCDField;
    procedure FConBeforeConnect(Sender: TObject);
    procedure TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    vIdCentroCusto,vIdUser,vIdProduto,vNomeProduto,vCodFabricanteProduto,
    vNomeOperador,vIdOperador,vIdAtividade,vNomeAtividade,
    vNomeLocalEstoque,vIdLocalEstoqueSel:string;
    vPrimeiroAcesso:Boolean;
    vTipoOp:integer;//1= start bomba 2= abastecimento
    procedure CreateTablesVersao(NumeroVersao: string);
    function  VerificaTabelaExiste(Atabela: string): Boolean;
    function  VerificaCampoExiste(Acampo, Atabela: string):Boolean;
    function  AutenticaUsuario(Usuario, Senha: string): Boolean;
    procedure AbrirAbastecimento(vFiltro: string);
    procedure AbrirStartBomba(vFiltro: string);
    procedure AbrirStartBombaInsert(vFiltro: string);
    function  BuscaMaquina(vQrCod:string):Boolean;
    procedure AbrirAbastecimentoOutros(vIdAbasteciemnto, vFiltro: string);
    procedure DeletaAbastecimento(vId:string);
    procedure DeletaStartBomba(vId:string);
    procedure DeletaAbastecimentoOutros(vId:string);
    procedure SalvarAcesso(vUsuario, Senha: string);
    procedure AbrirLocalEstoque(vidCentro:string);
    procedure FinalizaDia(idReg,DataEnd,HoraEnd,LitrosEnd,ImgEdn:string);
    function  VerificaStartExiste(vIdLocal,vData:string):Boolean;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmDB }

procedure TdmDB.SalvarAcesso(vUsuario, Senha: string);
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   qryControAcces.Delete;
   qryControAcces.ApplyUpdates(-1);
  end;
  try
   qryControAcces.Close;
   qryControAcces.Open;
   qryControAcces.Insert;
   qryControAccesUsuario.AsString := vUsuario;
   qryControAccesSenha.AsString   := Senha;
   qryControAcces.ApplyUpdates(-1);
  except
   on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
  end;
end;

procedure TdmDB.TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmDB.AbrirAbastecimento(vFiltro: string);
begin
 with TAbastecimento,TAbastecimento.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('p.nome CombustivelNome,');
   Add('b.nome LocalEstoque,');
   Add('c.prefixo  Maquina,');
   Add('d.nome Operador,');
   Add('h.nome Atividade');
   Add('from abastecimento a');
   Add('join produtos p on a.combustivel=p.id');
   Add('join localestoque b on a.idlocalestoque=b.id');
   Add('join maquinaveiculo c on c.id=a.idmaquina');
   Add('join operadormaquinas d on d.id=a.idOperador');
   Add('join auxatividadeabastecimento h on h.id=a.idAtividade');
   Add('where a.status=1');
   Add('and a.idcentrocusto='+vIdCentroCusto);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirAbastecimentoOutros(vIdAbasteciemnto, vFiltro: string);
begin
 with TAbastecimentoOutros,TAbastecimentoOutros.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Produto from abastecimentoOutros a');
   Add('join produtos b on b.id=a.idproduto');
   Add('where a.status=1 and a.idabastecimento='+vIdAbasteciemnto);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirLocalEstoque(vidCentro: string);
begin
 with TLocalEstoque,TLocalEstoque.SQL do
 begin
   Clear;
   Add('select * from localestoque');
   Add('where status=1');
   Add('and idcentrocusto='+vidCentro);
   Open;
 end;
end;

procedure TdmDB.AbrirStartBomba(vFiltro: string);
begin
 with TStartbomba,TStartbomba.sql do
 begin
   Clear;
   Add('select s.*,l.nome Local,p.nome CombustivelNome from startbomba s');
   Add('left join localestoque l on s.idlocalestoque=l.id');
   Add('left join produtos p on p.id=s.combustivel');
   Add('WHERE s.status>-1');
   Add('and s.idcentrocusto='+vIdCentroCusto);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirStartBombaInsert(vFiltro: string);
begin
 with TStartBombaInsert,TStartBombaInsert.sql do
 begin
   Clear;
   Add('select s.* from startbomba s');
   Add('WHERE s.status>1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.DeletaAbastecimentoOutros(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimentooutros');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaAbastecimento(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimento');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaStartBomba(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from startbomba');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

function TdmDB.AutenticaUsuario(Usuario, Senha: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('SELECT * FROM usuario');
  Add('WHERE usuario='+Usuario.QuotedString);
  Add('AND senha='+Senha.QuotedString);
  Open;
  if not qryAux.IsEmpty then
   begin
    vIdUser          := qryAux.FieldByName('id').AsString;
    Result := true
   end
   else
    Result := false;
   end;
   qryAux.Free;
end;

function TdmDB.BuscaMaquina(vQrCod: string): Boolean;
begin
 with TMaquinas,TMaquinas.SQL do
 begin
   Clear;
   Add('select * from maquinaveiculo');
   Add('where qrcode='+vQrCod.QuotedString);
   Open;
   Result := TMaquinas.IsEmpty;
 end;
end;

procedure TdmDB.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 if NumeroVersao='1.0.3' then
 begin
   with vQryAux,vQryAux.SQL do
   begin
    Clear;
    Add('CREATE TRIGGER IF NOT EXISTS');
    Add(' tr_atualiza_maquina AFTER INSERT ON abastecimento');
    Add('BEGIN');
    Add('  UPDATE maquinaveiculo SET ultimoabastecimento=new.dataabastecimento,');
    Add('  horimetroatual=new.horimetro');
    Add('  WHERE id=new.idmaquina;');
    Add('END');
    ExecSQL;
   end;
 end;
end;

end


