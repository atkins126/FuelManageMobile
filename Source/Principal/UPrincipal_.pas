unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ActnList, System.Actions, FMX.TabControl,FireDAC.DApt, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, Data.DB, FireDAC.Comp.DataSet,
  FMX.TreeView,System.Net.HttpClient, FMX.Memo.Types
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  ,AndroidApi.helpers,AndroidApi.JNI.JavaTypes,AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,Androidapi.JNIBridge
 {$ENDIF}
 {$IFDEF MSWINDOWS}
  ,Winapi.Windows, FMX.Memo.Types
 {$ENDIF}
  ;


type
  TfrmPrincipal = class(TForm)
    TbPrincipal: TTabControl;
    tbiLogin: TTabItem;
    rect_update: TRectangle;
    Layout2: TLayout;
    Layout1: TLayout;
    img_seta: TImage;
    layloginCenter: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Layout5: TLayout;
    Layout8: TLayout;
    Label3: TLabel;
    Layout9: TLayout;
    btnEntrar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    layInf: TLayout;
    Rectangle4: TRectangle;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    tbiMnu: TTabItem;
    laymnu: TLayout;
    Layout11: TLayout;
    Rectangle5: TRectangle;
    Layout12: TLayout;
    Layout13: TLayout;
    layInfMnu: TLayout;
    Rectangle10: TRectangle;
    lblVersao: TLabel;
    recTopMnu: TRectangle;
    layTopmnu: TLayout;
    Label11: TLabel;
    Image4: TImage;
    tbiConfig: TTabItem;
    Layout18: TLayout;
    Layout19: TLayout;
    VertScrollBox1: TVertScrollBox;
    Rectangle7: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Layout22: TLayout;
    Rectangle8: TRectangle;
    Layout23: TLayout;
    Rectangle17: TRectangle;
    Layout30: TLayout;
    Layout31: TLayout;
    Label14: TLabel;
    edtIpServidorDados: TEdit;
    Layout32: TLayout;
    btnConfirmar: TRectangle;
    Image9: TImage;
    ShadowEffect1: TShadowEffect;
    Label16: TLabel;
    Rectangle2: TRectangle;
    Layout24: TLayout;
    Layout25: TLayout;
    Label10: TLabel;
    edtPortaServidorDados: TEdit;
    Layout27: TLayout;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Layout28: TLayout;
    Label18: TLabel;
    Image14: TImage;
    tbiSync: TTabItem;
    Rectangle24: TRectangle;
    Layout35: TLayout;
    Label21: TLabel;
    btnFechaSync: TImage;
    Rectangle19: TRectangle;
    Image17: TImage;
    Label19: TLabel;
    imgMnu: TImage;
    StyleBook1: TStyleBook;
    Rectangle3: TRectangle;
    laySelectSync: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Layout36: TLayout;
    btnEnviar: TRectangle;
    Image12: TImage;
    ShadowEffect10: TShadowEffect;
    Label22: TLabel;
    Layout39: TLayout;
    Rectangle12: TRectangle;
    Image13: TImage;
    ShadowEffect16: TShadowEffect;
    lblAbastecimentoPendente: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    mlog: TMemo;
    edtSenha: TEdit;
    LinkFillControlToField1: TLinkFillControlToField;
    Layout16: TLayout;
    bntConfiguracao: TRectangle;
    Image3: TImage;
    ShadowEffect7: TShadowEffect;
    Label7: TLabel;
    Layout14: TLayout;
    btnAbastecimento: TRectangle;
    imgCombustivel: TImage;
    ShadowEffect3: TShadowEffect;
    Label5: TLabel;
    Layout15: TLayout;
    btnSync: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    Label6: TLabel;
    imgScore: TImage;
    Layout17: TLayout;
    imgListaPreto: TImage;
    ClearEditButton1: TClearEditButton;
    PasswordEditButton1: TPasswordEditButton;
    imgOutrosProdutos: TImage;
    imgCombustivelLista: TImage;
    imgLubrificante: TImage;
    imgFiltrosOleo: TImage;
    imgProdutos: TImage;
    imgOperador: TImage;
    imgAtividades: TImage;
    imgLocalEstoque: TImage;
    imgRetanguloLista: TImage;
    Layout26: TLayout;
    Layout29: TLayout;
    Label8: TLabel;
    cbxCentroCusto: TComboBox;
    edtUsuario: TEdit;
    ClearEditButton2: TClearEditButton;
    PasswordEditButton2: TPasswordEditButton;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToFieldid: TLinkFillControlToField;
    Layout43: TLayout;
    Label34: TLabel;
    chkSalvaSenha: TSwitch;
    imgFinish: TImage;
    imgStart: TImage;
    Layout33: TLayout;
    btnStatrFimDiario: TRectangle;
    Image2: TImage;
    ShadowEffect2: TShadowEffect;
    Label9: TLabel;
    Layout34: TLayout;
    Rectangle6: TRectangle;
    Image6: TImage;
    ShadowEffect5: TShadowEffect;
    lblStartDiarioSync: TLabel;
    procedure btnEntrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEntrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfirmarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfirmarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure btnFechaSyncClick(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure bntConfiguracaoClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure btnAbastecimentoClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure cbxCentroCustoChange(Sender: TObject);
    procedure btnStatrFimDiarioClick(Sender: TObject);
  private
    function NetState(out tipoConexao: string): boolean;
    function CheckInternet: boolean;
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
     function  GetVersaoArq: string;
    {$ENDIF}
    {$IFDEF MSWINDOWS}
     function  GetVersaoArqWin:string;
    {$ENDIF}
  public
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDB, UDmSyncData, NetworkState, UAbastecimento, UStartBomba;

procedure TfrmPrincipal.bntConfiguracaoClick(Sender: TObject);
begin
 dmDB.qryConfig.Close;
 dmDB.qryConfig.Open;
 if dmDB.qryConfig.IsEmpty then
  dmDB.qryConfig.Insert
 else
  dmDB.qryConfig.Edit;
 edtIpServidorDados.Text    := dmDB.qryConfigIP_SERVIDOR.AsString;
 edtPortaServidorDados.Text := dmDB.qryConfigPOTA_SERVIDOR.AsString;
 MudarAba(tbiConfig,sender);
end;

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
   actMudarAba.Tab := ATabItem;
   actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmPrincipal.Rectangle19Click(Sender: TObject);
begin
 MudarAba(tbiMnu,sender);
end;

function TfrmPrincipal.NetState(out tipoConexao: string): boolean;
var
 NS: TNetworkState;
begin
    try
        NS := TNetworkState.Create;
        Result := false;
        try
            {$IFNDEF MSWINDOWS}
            if not NS.IsConnected then
                tipoConexao := ''
            else
            if NS.IsWifiConnected then
            begin
                tipoConexao := 'WIFI';
                Result := true;
            end
            else
            if NS.IsMobileConnected then
            begin
                tipoConexao := 'MOBILE';
                Result := true;
            end;
            {$ELSE}
            tipoConexao := 'Não implementado no Windows';
            Result := true;
            showmessage(tipoConexao);
            {$ENDIF}

        except on ex:exception do
        begin
            Result := false;
            tipoConexao := ex.Message;
        end;
        end;
    finally
        NS.DisposeOf;
    end;
end;


procedure TfrmPrincipal.btnConfirmarClick(Sender: TObject);
var
 vResult:string;
 tipoConexao : string;
begin
if edtIpServidorDados.Text.IsEmpty then
 begin
  ShowMessage('Informe o Host do Servidor');
  edtIpServidorDados.SetFocus;
  Exit;
 end;
 if edtPortaServidorDados.Text.IsEmpty then
 begin
  ShowMessage('Informe a Porta do Servidor');
  edtPortaServidorDados.SetFocus;
  Exit;
 end;
 dmDB.qryConfig.Edit;
 dmdb.qryConfigIP_SERVIDOR.AsString      := edtIpServidorDados.Text;
 dmdb.qryConfigPOTA_SERVIDOR.AsString    := edtPortaServidorDados.Text;
 try
   dmdb.qryConfig.ApplyUpdates(-1);
   dmSync.host  := edtIpServidorDados.Text;
   dmSync.Porta := edtPortaServidorDados.Text;
 except
 on E : Exception do
   ShowMessage('Erro ao inserir Configuração : '+E.Message);
 end;
//  if NOT NetState(tipoConexao) then
//  begin
//   ShowMessage('Sem conexão com Internet!!');
//   Exit;
//  end;
   if dmdb.vPrimeiroAcesso then
   begin
    try
       dmSync.GetCentroCusto;
       vResult := dmSync.GetUsuario;
       if vResult='Usuarios Baixados com Sucesso' then
       begin
           ShowMessage('Usuarios baixados com sucesso');
           dmDB.vPrimeiroAcesso := false;
           dmDB.FCon.Commit;
           dmDB.TUsuario.Close;
           dmDB.TUsuario.Open;
           dmDB.TCentroCusto.Close;
           dmDB.TCentroCusto.Open;
           MudarAba(tbiLogin,Sender);
       end
       else
       begin
         ShowMessage(vResult);
       end;
     except
     on E : Exception do
       ShowMessage('Erro ao baixar Usuario: '+E.Message);
     end;
   end
   else
    MudarAba(tbiMnu,Sender);
end;

procedure TfrmPrincipal.btnConfirmarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmPrincipal.btnConfirmarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmPrincipal.btnEntrarClick(Sender: TObject);
begin
 if edtUsuario.Text.Length=0  then
 begin
   ShowMessage('Informe o usuario!');
   Exit;
 end;
 if edtSenha.Text.IsEmpty  then
 begin
   ShowMessage('Informe a Senha!');
   edtSenha.SetFocus;
   Exit;
 end;
 if cbxCentroCusto.ItemIndex=-1 then
 begin
   ShowMessage('Informe o centro de Custo!');
   Exit;
 end;
 if dmDB.AutenticaUsuario(edtUsuario.Text,edtSenha.Text)then
 begin
  if chkSalvaSenha.IsChecked then
  begin
    dmdb.qryConfig.Close;
    dmdb.qryConfig.Open;
    dmdb.qryConfig.Edit;
    dmdb.qryConfigSalvarLogin.AsInteger :=1;
    dmdb.qryConfig.ApplyUpdates(-1);
    dmdb.SalvarAcesso(edtUsuario.Text,edtSenha.Text);
  end;
  MudarAba(tbiMnu,sender);
  imgMnu.Position.Y := 0;
  imgMnu.Opacity := 0;
  imgMnu.AnimateFloatDelay('Position.Y', 50, 0.5, 1, TAnimationType.Out, TInterpolationType.Back);
  imgMnu.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);
 end
 else
  ShowMessage('Usuario ou senha invalidos!');
end;

procedure TfrmPrincipal.btnEntrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmPrincipal.btnEntrarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
  if dmSync.TestaServidor<>'Erro' THEN
  begin
   Animacao.Start;
   mlog.Lines.Add(dmSync.PostAbastecimento);
   mlog.Lines.Add(dmSync.PostAbastecimentoOutros);
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Enviando Start Diário');
    end);
    mlog.Lines.Add(dmSync.PostStartDiario);

    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Enviando Abastecimentos');
    end);
    mlog.Lines.Add(dmSync.PostAbastecimento);

    TThread.Synchronize(nil, procedure
    begin
       mlog.Lines.Add('Enviando Abastecimentos Outros');
    end);
    mlog.Lines.Add(dmSync.PostAbastecimentoOutros);

    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Usuarios...');
    end);
    mlog.Lines.Add(dmSync.GetUsuario);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Operador de Maquina...');
    end);
    mlog.Lines.Add(dmSync.GetOperadorMaquinas);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Atividade Abastecimento...');
    end);
    mlog.Lines.Add(dmSync.GetAtividadesAbastecimento);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Centro de Custo...');
    end);
    mlog.Lines.Add(dmSync.GetCentroCusto);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Local de Estoque...');
    end);
    mlog.Lines.Add(dmSync.GetLocalEstoque);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Produtos...');
    end);
    mlog.Lines.Add(dmSync.GetProdutos);
    TThread.Synchronize(nil, procedure
    begin
     mlog.Lines.Add('Baixando Maquinas...');
    end);
    mlog.Lines.Add(dmSync.GetMaquinas);

    TThread.Synchronize(nil, procedure
    begin
     Animacao.Stop;
     dmDB.FCon.Commit;
     dmDB.FCon.Connected := false;
     dmDB.FCon.Connected;
      MessageDlg('Dados Sincronizados com Sucesso!'+#13+
      'Sistema deve ser reiniciado!', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
        case AResult of
         mrYES:Application.Terminate;
        end;
       end);
    end);
   end).Start;
  end
  else
  begin
    ShowMessage('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TfrmPrincipal.btnEnviarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmPrincipal.btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmPrincipal.btnFechaSyncClick(Sender: TObject);
begin
 MudarAba(tbiMnu,sender);
end;

procedure TfrmPrincipal.btnAbastecimentoClick(Sender: TObject);
begin
  dmDB.vTipoOp :=2;
  frmAbastecimento:= TfrmAbastecimento.Create(nil);
  frmAbastecimento.ShowModal(procedure(ModalResult: TModalResult)
  begin
    if ModalResult = mrOK then
      frmAbastecimento.DisposeOf;
  end);
end;

procedure TfrmPrincipal.btnStatrFimDiarioClick(Sender: TObject);
begin
  dmDB.vTipoOp :=1;
  frmStartBomba:= TfrmStartBomba.Create(nil);
  frmStartBomba.ShowModal(procedure(ModalResult: TModalResult)
  begin
    if ModalResult = mrOK then
      frmStartBomba.DisposeOf;
  end);
end;

procedure TfrmPrincipal.btnSyncClick(Sender: TObject);
var
 tipoConexao:string;
begin
 dmSync.TAbastecimento.Close;
 dmSync.TAbastecimento.Open;
 lblAbastecimentoPendente.Text   := 'Abastecimento Pendente :'+IntToStr(dmSync.TAbastecimento.RecordCount);

 dmSync.TStartDiario.Close;
 dmSync.TStartDiario.Open;
 lblStartDiarioSync.Text        := 'Start Diário Pendente :'+IntToStr(dmSync.TStartDiario.RecordCount);

// if NOT NetState(tipoConexao) then
// begin
//  ShowMessage('Sem conexão com Internet!!');
//  Exit;
// end;
 MudarAba(tbiSync,sender);
end;

procedure TfrmPrincipal.cbxCentroCustoChange(Sender: TObject);
begin
 if cbxCentroCusto.ItemIndex>-1 then
  dmdb.vIdCentroCusto:=LinkFillControlToFieldid.BindList.GetSelectedValue.AsString;
end;

function TfrmPrincipal.CheckInternet: boolean;
var
    http : THTTPClient;
begin
    Result := false;
    try
     http := THTTPClient.Create;
     try
       Result := http.Head('https://google.com').StatusCode < 400;
     except
     end;
    finally
        http.DisposeOf;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure
 begin
   TThread.Synchronize(nil,procedure
   begin
      {$IFDEF MSWINDOWS}
        lblversao.text                 := GetVersaoArqWin;
        dmdb.CreateTablesVersao(GetVersaoArqWin);
      {$ENDIF}
      {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        lblversao.text                 := GetVersaoArq;
        dmdb.CreateTablesVersao(GetVersaoArq);
      {$ENDIF}
      TbPrincipal.TabPosition := TTabPosition.None;
      rect_update.Visible := true;
      img_seta.Position.Y := 0;
      img_seta.Opacity := 0;
      layInf.Opacity := 0;
      recTop.Opacity := 0;

      layloginCenter.Opacity := 0;
      rect_update.BringToFront;
      rect_update.AnimateFloat('Margins.Top', 0, 0.8, TAnimationType.InOut, TInterpolationType.Circular);
      img_seta.AnimateFloatDelay('Position.Y', 50, 0.5, 1, TAnimationType.Out, TInterpolationType.Back);
      img_seta.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);
      recTop.AnimateFloatDelay('Opacity', 1, 0.7, 1);
      layInf.AnimateFloatDelay('Opacity', 1, 0.7, 1.3);
      layloginCenter.AnimateFloatDelay('Opacity', 1,0.7, 2);
   end);
 end).Start;
 dmDB.qryConfig.Close;
 dmDB.qryConfig.Open;
 if dmDB.qryConfigSalvarLogin.AsInteger=1 then
 begin
  chkSalvaSenha.IsChecked := true;
  dmDB.qryControAcces.Close;
  dmDB.qryControAcces.Open;
  if not dmDB.qryControAcces.IsEmpty then
  begin
   edtUsuario.Text := dmDB.qryControAccesUsuario.AsString;
   edtSenha.Text   := dmDB.qryControAccesSenha.AsString;
  end;
 end
 else
  chkSalvaSenha.IsChecked := false;

 dmSync.host  := dmDB.qryConfigIP_SERVIDOR.AsString;
 dmSync.Porta := dmDB.qryConfigPOTA_SERVIDOR.AsString;
 dmDB.TUsuario.Close;
 dmDB.TUsuario.Open;
 dmDB.TCentroCusto.Close;
 dmDB.TCentroCusto.Open;
 if dmDB.TUsuario.IsEmpty then
 begin
   dmDB.vPrimeiroAcesso   := true;
   if dmDB.qryConfig.IsEmpty then
     dmDB.qryConfig.Insert
   else
    dmDB.qryConfig.Edit;
   edtIpServidorDados.Text     := dmDB.qryConfigIP_SERVIDOR.AsString;
   edtPortaServidorDados.Text  := dmDB.qryConfigPOTA_SERVIDOR.AsString;
   tbPrincipal.ActiveTab       := tbiConfig;
 end
 else
 begin
   dmDB.vPrimeiroAcesso      := false;
   tbPrincipal.ActiveTab     := tbiLogin;
   edtUsuario.SetFocus;
 end;
end;
procedure TfrmPrincipal.Image14Click(Sender: TObject);
begin
 if dmDB.vPrimeiroAcesso then
  Application.Terminate
 else
  MudarAba(tbiMnu,Sender);
end;

procedure TfrmPrincipal.Image4Click(Sender: TObject);
begin
 Close;
end;

{$IF DEFINED(iOS) or DEFINED(ANDROID)}
function TfrmPrincipal.GetVersaoArq: string;
var
 PKGInfo:JPackageInfo;
begin
 PKGInfo := SharedActivity.getPackageManager.getPackageInfo(
   SharedActivity.getPackageName,0);
 result := JStringToString(PKGInfo.VersionName)
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
function TfrmPrincipal.GetVersaoArqWin: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;
{$ENDIF}

end.
