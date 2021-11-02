unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,System.IOUtils,FMX.Dialogs;

type
  TdmDB = class(TDataModule)
    qryControAcces: TFDQuery;
    FCon: TFDConnection;
    qryControAccesid: TFDAutoIncField;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccessenha: TStringField;
    qryConfig: TFDQuery;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    TAbastecimento: TFDQuery;
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
    TAbastecimentoidcentrocusto: TIntegerField;
    TAbastecimentokmatual: TBCDField;
    TAbastecimentoCombustivelNome: TStringField;
    TAbastecimentoLocalEstoque: TStringField;
    TAbastecimentoMaquina: TStringField;
    TAbastecimentoOperador: TStringField;
    TAbastecimentoAtividade: TStringField;
    TAbastecimentoOutros: TFDQuery;
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
    TStartbomba: TFDQuery;
    TStartbombaid: TFDAutoIncField;
    TStartbombastatus: TWideStringField;
    TStartbombadatareg: TWideStringField;
    TStartbombaidusuario: TWideStringField;
    TStartbombadataalteracao: TWideStringField;
    TStartbombaidusuarioalteracao: TWideStringField;
    TStartbombaidlocalestoque: TWideStringField;
    TStartbombaidcentrocusto: TWideStringField;
    TStartbombacombustivel: TWideStringField;
    TStartbombadataastart: TDateField;
    TStartbombahorastart: TTimeField;
    TStartbombadataaend: TDateField;
    TStartbombahoraend: TTimeField;
    TStartbombasyncaws: TWideStringField;
    TStartbombavolumelitrosIni: TBCDField;
    TStartbombaobs: TStringField;
    TStartbombaimgStart: TWideMemoField;
    TStartbombaimgEnd: TWideMemoField;
    TStartbombavolumelitrosFim: TBCDField;
    TStartbombaLocal: TStringField;
    TStartbombaCombustivelNome: TStringField;
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
    TMaquinasultimoabastecimento: TDateField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinashorimetroatual: TBCDField;
    TMaquinasqrcode: TStringField;
    TMaquinasidgrupo: TWideStringField;
    TMaquinaskmatual: TBCDField;
    qryAux: TFDQuery;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TWideStringField;
    Tauxatividadeabastecimentodatareg: TWideStringField;
    Tauxatividadeabastecimentoidusuario: TWideStringField;
    Tauxatividadeabastecimentodataalteracao: TWideStringField;
    Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField;
    Tauxatividadeabastecimentonome: TStringField;
    Tauxatividadeabastecimentosyncaws: TWideStringField;
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
    TMovLocalEstoque: TFDQuery;
    TMovLocalEstoqueid: TIntegerField;
    TMovLocalEstoquestatus: TWideStringField;
    TMovLocalEstoquedatareg: TWideStringField;
    TMovLocalEstoqueidusuario: TWideStringField;
    TMovLocalEstoquedataalteracao: TWideStringField;
    TMovLocalEstoqueidusuarioalteracao: TWideStringField;
    TMovLocalEstoqueidlocalestoqueorigem: TWideStringField;
    TMovLocalEstoqueidlocalestoquedetino: TWideStringField;
    TMovLocalEstoqueidproduto: TWideStringField;
    TMovLocalEstoqueqtde: TBCDField;
    TMovLocalEstoquedatamov: TDateField;
    TMovLocalEstoquehora: TTimeField;
    TMovLocalEstoquesyncaws: TWideStringField;
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
    TCentroCusto: TFDQuery;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TWideStringField;
    TCentroCustodatareg: TWideStringField;
    TCentroCustoidusuario: TWideStringField;
    TCentroCustodataalteracao: TWideStringField;
    TCentroCustoidusuarioalteracao: TWideStringField;
    TCentroCustonome: TStringField;
    TCentroCustosyncaws: TWideStringField;
    TMaquinasidsubgrupo: TWideStringField;
    TMaquinastipomedicao: TWideStringField;
    TAbastecimentoFoto: TFDQuery;
    TAbastecimentoFotoid: TFDAutoIncField;
    TAbastecimentoFotostatus: TWideStringField;
    TAbastecimentoFotodatareg: TWideStringField;
    TAbastecimentoFotoidusuario: TWideStringField;
    TAbastecimentoFotodataalteracao: TWideStringField;
    TAbastecimentoFotoidusuarioalteracao: TWideStringField;
    TAbastecimentoFotoidlocalestoque: TWideStringField;
    TAbastecimentoFotoidmaquina: TWideStringField;
    TAbastecimentoFotoidoperador: TWideStringField;
    TAbastecimentoFotovolumelt: TBCDField;
    TAbastecimentoFotocombustivel: TWideStringField;
    TAbastecimentoFotodataabastecimento: TDateField;
    TAbastecimentoFotohora: TTimeField;
    TAbastecimentoFotosyncaws: TWideStringField;
    TAbastecimentoFotohorimetro: TBCDField;
    TAbastecimentoFotoidatividade: TWideStringField;
    TAbastecimentoFotoobs: TStringField;
    TAbastecimentoFotoimg: TWideMemoField;
    TAbastecimentoFotoimg2: TWideMemoField;
    TAbastecimentoFotoimg3: TWideMemoField;
    TAbastecimentoFotoimg4: TWideMemoField;
    TAbastecimentoFotoimg5: TWideMemoField;
    TAbastecimentoFotovalorlitro: TBCDField;
    TAbastecimentoFotoexterno: TWideStringField;
    TAbastecimentoFotoidcentrocusto: TIntegerField;
    TAbastecimentoFotokmatual: TBCDField;
    TStartbombastatusStr: TWideStringField;
    TAbastecimentoid: TIntegerField;
    TAbastecimentoOutrosid: TFDAutoIncField;
    procedure TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FConBeforeConnect(Sender: TObject);
    procedure TStartBombaInsertReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private

  public
    vIdMaquinaSel,vMarcaModelo:string;
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
    function  AbriMaquinaPrefixo(qrcode:string):Boolean;
    procedure AbrirAbastecimentoFotos(vId:string);
    function  VerificaStartAberto(vIdLocal:string):Boolean;
    function RetornaIdAbastecimento:integer;
    function VerificaIDExite(Atabela,AId:string):Boolean;
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

procedure TdmDB.TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TStartBombaInsertReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function TdmDB.VerificaCampoExiste(Acampo, Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   while not vQryAux.eof do
   begin
     if Acampo=vQryAux.FieldByName('name').AsString then
       vExiste:=1;
     vQryAux.Next;
   end;
 end;
 Result:=vExiste=1;
 vQryAux.Free;
end;

function TdmDB.VerificaIDExite(Atabela, AId: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from '+Atabela);
  Add('where id='+AId);
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaStartAberto(vIdLocal: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from startbomba');
  Add('where idlocalestoque='+vIdLocal);
  Add('and status=1');
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaStartExiste(vIdLocal, vData: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from startbomba');
  Add('where idlocalestoque='+vIdLocal);
  Add('and dataastart='+vData);
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaTabelaExiste(Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   Result:=vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;

function TdmDB.AbriMaquinaPrefixo(qrcode: string): Boolean;
begin
 with TMaquinas,TMaquinas.SQL do
 begin
   Clear;
   Add('select * from maquinaveiculo where qrcode=:qrcode');
   ParamByName('qrcode').AsString := qrcode;
   Open;
   Result := TMaquinas.IsEmpty;
 end;
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
   Add('left join produtos p on a.combustivel=p.id');
   Add('left join localestoque b on a.idlocalestoque=b.id');
   Add('left join maquinaveiculo c on c.id=a.idmaquina');
   Add('left join operadormaquinas d on d.id=a.idOperador');
   Add('left join auxatividadeabastecimento h on h.id=a.idAtividade');
   Add('where a.status=1');
   Add('and a.idcentrocusto='+vIdCentroCusto);
   Add(vFiltro);
   Add('order by dataabastecimento desc');
   Open;
 end;
end;

procedure TdmDB.AbrirAbastecimentoFotos(vId: string);
begin
 with TAbastecimentoFoto,TAbastecimentoFoto.SQL do
 begin
   Clear;
   Add('select * from abastecimento where id='+vId);
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
   Add('select s.*,');
   Add('case');
   Add('when S.status=1 then ''EM ABERTO''');
   Add('when S.status=2 then ''FINALIZADO''');
   Add('end statusStr,');
   Add('l.nome Local,p.nome CombustivelNome from startbomba s');
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

procedure TdmDB.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'FuelM.db');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := 'E:\20102021\Projetos2021\Pecuarizze\ManejoPastagem\Mobile\db\dbw.db';
   if FileExists(vPath) then
   begin
    FCon.Params.DriverID :='SQLite';
    FCon.Params.Values['Database'] :=vPath;
   end
   else
    ShowMessage('BD Não localizado!!');
 {$ENDIF}
end;

procedure TdmDB.FinalizaDia(idReg, DataEnd, HoraEnd, LitrosEnd, ImgEdn: string);
begin

end;

function TdmDB.RetornaIdAbastecimento: integer;
var
 vid:Integer;
begin
 repeat
   vid := Random(900000);
  until (dmDB.VerificaIDExite('abastecimento',intToStr(vid)));
  Result :=vid;
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

procedure TdmDB

.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 if NumeroVersao='1.0.3' then
 begin
    if VerificaTabelaExiste('usuario') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE usuario ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(100) NOT NULL,');
      Add('email varchar(100) NULL, celular varchar(20) NULL, usuario varchar(25) NOT NULL,');
      Add('senha varchar(50) NOT NULL, tipo int4 NOT NULL, syncaws int4 NOT NULL DEFAULT 0,');
      Add('CONSTRAINT usuarios_pk PRIMARY KEY (id))');
      ExecSQL;
    end;
    if VerificaTabelaExiste('centrocusto') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE centrocusto ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL,');
      Add('nome varchar(50) NULL, syncaws int4 NOT NULL DEFAULT 0,');
      Add('CONSTRAINT centrocusto_pkey PRIMARY KEY (id)');
      Add(')');
      ExecSQL;
    end;
    if VerificaTabelaExiste('centrocusto') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE auxatividadeabastecimento ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL,');
      Add('syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT auxatividadeabastecimento_pkey PRIMARY KEY (id)');
      Add(')');
      ExecSQL;
    end;
    if VerificaTabelaExiste('control_access') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE control_access (');
      Add('id INTEGER PRIMARY KEY AUTOINCREMENT,');
      Add('usuario STRING, data_access DATETIME DEFAULT (CURRENT_TIMESTAMP), senha VARCHAR (100))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('produtos') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE produtos ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL,');
      Add('tipo int4 NOT NULL, unidademedida varchar(10) NULL, estoqueminimo numeric(15, 2) NULL,');
      Add('codigobarras varchar(20) NULL, idmarca int4 NULL, codigofabricante varchar(30) NULL,');
      Add('syncaws int4 NOT NULL DEFAULT 0, customedio numeric(15, 4) NULL,');
      Add('saldoatual numeric(15, 4) NULL, CONSTRAINT "Produtos_pkey" PRIMARY KEY (id))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('maquinaveiculo') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE maquinaveiculo(id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, idusuario int4 NOT NULL,');
      Add('dataalteracao timestamptz, idusuarioalteracao int4, idmarca int4, modelo varchar (50) NOT NULL,');
      Add('placa varchar (20), ano int4, chassi varchar (30), idcombustivel int4, img bytea, prefixo varchar (20),');
      Add('syncaws int4 NOT NULL DEFAULT 0, syncfaz int4 NOT NULL DEFAULT 0, ultimoabastecimento date,');
      Add('horimetroultimarev numeric (15, 3), horimetroatual numeric (15, 3) DEFAULT 0, qrcode varchar (20),');
      Add('idsubgrupo int4, idgrupo int4, tipomedicao int4 NOT NULL DEFAULT 1,');
      Add('kmatual numeric (15, 3), CONSTRAINT maquinaveiculo_pkey PRIMARY KEY (id))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('operadormaquinas') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE operadormaquinas ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL, dataalteracao timestamptz NULL,');
      Add('idusuarioalteracao int4 NULL, nome varchar(50) NULL, rg varchar(10) NULL, cpf varchar(20) NULL,');
      Add('cnh varchar(20) NULL, celular varchar(20) NULL, syncaws int4 NOT NULL DEFAULT 0,');
      Add('syncfaz int4 NOT NULL DEFAULT 0, CONSTRAINT "OperadorMaquinas_pkey"');
      Add('PRIMARY KEY (id))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('localestoque') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE localestoque ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL,');
      Add('capacidade numeric(15, 3) NULL, syncaws int4 NOT NULL DEFAULT 0,');
      Add('idcentrocusto int4 NOT NULL, CONSTRAINT localestoque_pkey PRIMARY KEY (id)');
      Add(')');
      ExecSQL;
    end;

    if VerificaTabelaExiste('startbomba') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE startbomba (id integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
      Add('status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
      Add('idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4,');
      Add('idlocalestoque int4 NOT NULL, idcentrocusto int4 NOT NULL, combustivel int4 NOT NULL,');
      Add('dataastart date NOT NULL, horastart time NOT NULL, dataaend date, horaend time,');
      Add('syncaws int4 NOT NULL DEFAULT 0, volumelitrosIni numeric (15, 3) NOT NULL,');
      Add('obs varchar (100), imgStart TEXT, imgEnd TEXT, volumelitrosFim NUMERIC (15, 3))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('tranferencialocalestoque') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE tranferencialocalestoque(id integer NOT NULL,');
      Add('status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
      Add('idusuario int4 NOT NULL, dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL,');
      Add('idlocalestoqueorigem int4 NOT NULL, idlocalestoquedetino int4 NOT NULL,');
      Add('idproduto int4 NOT NULL, qtde numeric(15, 3) NULL, datamov date NOT NULL,');
      Add('hora time NOT NULL, syncaws int4 NOT NULL DEFAULT 0,');
      Add('CONSTRAINT tranferencialocalestoque_pk PRIMARY KEY (id))');
      ExecSQL;
    end;

    if VerificaTabelaExiste('abastecimentooutros') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE abastecimentooutros (id integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
      Add('status int4 NOT NULL DEFAULT 1, datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
      Add('idusuario int4 NOT NULL, dataalteracao timestamptz, idusuarioalteracao int4,');
      Add('idabastecimento int4 NOT NULL, idproduto int4 NOT NULL, quantidade numeric (15, 3),');
      Add('syncaws int4 NOT NULL DEFAULT 0, syncfaz int4 NOT NULL DEFAULT 0)');
      ExecSQL;
    end;

    if VerificaTabelaExiste('auxatividadeabastecimento') then
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('CREATE TABLE auxatividadeabastecimento ( id integer NOT NULL, status int4 NOT NULL DEFAULT 1,');
      Add('datareg timestamptz DEFAULT CURRENT_TIMESTAMP, idusuario int4 NULL,');
      Add('dataalteracao timestamptz NULL, idusuarioalteracao int4 NULL, nome varchar(50) NULL,');
      Add('syncaws int4 NOT NULL DEFAULT 0, CONSTRAINT auxatividadeabastecimento_pkey PRIMARY KEY (id)');
      Add(')');
      ExecSQL;
    end;

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

end.
