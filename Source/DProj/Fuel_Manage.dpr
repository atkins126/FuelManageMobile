program Fuel_Manage;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Principal\UPrincipal.pas' {frmPrincipal},
  UDmDB in '..\dmDB\UDmDB.pas' {dmDB: TDataModule},
  NetworkState in '..\util\NetworkState.pas',
  UDmSyncData in '..\dmSync\UDmSyncData.pas' {dmsync: TDataModule},
  UAbastecimento in '..\Abastecimento\UAbastecimento.pas' {frmAbastecimento},
  UAtividadeAbastecimento in '..\Atividades\UAtividadeAbastecimento.pas' {frmAtividadeAbastecimento},
  Maquinas in '..\Maquinas\Maquinas.pas' {frmMaquinas},
  UOperadorMaquina in '..\OperadorMaquinas\UOperadorMaquina.pas' {frmOperadorMaquina},
  ULocalEstoque in '..\LocalEstoque\ULocalEstoque.pas' {frmLocalEstoque},
  UProdutos in '..\Produtos\UProdutos.pas' {frmProdutos},
  UStartBomba in '..\StartBomba\UStartBomba.pas' {frmStartBomba},
  u99Permissions in '..\util\u99Permissions.pas',
  UnitCamera in '..\Camera\UnitCamera.pas' {FrmCamera},
  NetworkState.Android in '..\util\NetworkState.Android.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDB, dmDB);
  Application.CreateForm(Tdmsync, dmsync);
  Application.Run;
end.
