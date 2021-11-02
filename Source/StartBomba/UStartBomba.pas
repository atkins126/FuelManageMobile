unit UStartBomba;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView, FMX.MediaLibrary.Actions,FMX.Surfaces,
  FMX.StdActns,u99Permissions
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
    ,Soap.EncdDecd;

type
  TfrmStartBomba = class(TForm)
    layBase: TLayout;
    recPrincipal: TRectangle;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Layout5: TLayout;
    Layout37: TLayout;
    Rectangle22: TRectangle;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    Layout38: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    Lista: TListView;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    Rectangle19: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout22: TLayout;
    Label9: TLabel;
    edtLocalEstoqueF: TEdit;
    btnBuscar: TRectangle;
    LaybtnEntrar: TLayout;
    Label25: TLabel;
    Image11: TImage;
    tbiCad: TTabItem;
    TimerMsg: TTimer;
    layTBICad: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout67: TLayout;
    Layout39: TLayout;
    Rectangle15: TRectangle;
    Layout40: TLayout;
    btnConfirmarA: TRectangle;
    Image10: TImage;
    Label24: TLabel;
    Rectangle17: TRectangle;
    Image7: TImage;
    Label23: TLabel;
    layBuscaMaquina: TLayout;
    Rectangle2: TRectangle;
    Layout9: TLayout;
    Label2: TLabel;
    Layout34: TLayout;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    Label3: TLabel;
    edtData: TDateEdit;
    edtHora: TTimeEdit;
    LayLitrosIni: TLayout;
    Rectangle18: TRectangle;
    Layout41: TLayout;
    Label20: TLabel;
    edtLitros: TNumberBox;
    btnImg: TRectangle;
    Image17: TImage;
    Label33: TLabel;
    tbiImg: TTabItem;
    Rectangle25: TRectangle;
    Layout71: TLayout;
    Layout42: TLayout;
    Rectangle21: TRectangle;
    Rectangle27: TRectangle;
    Image14: TImage;
    Label31: TLabel;
    Layout43: TLayout;
    btnSalvarFoto: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    layImgHorimetro: TLayout;
    Rectangle26: TRectangle;
    btnFotoInicio: TRectangle;
    Image12: TImage;
    Label8: TLabel;
    btnFotoFim: TRectangle;
    Image13: TImage;
    Label30: TLabel;
    RecImgStart: TRectangle;
    imgStart: TImage;
    RecImgStop: TRectangle;
    imgStop: TImage;
    laymsg: TLayout;
    RecStatusAcao: TRectangle;
    layBaseMSG: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    ShadowEffect14: TShadowEffect;
    layBtnControls: TLayout;
    SEffectBtnConfirm1: TShadowEffect;
    btnConfirmar: TRectangle;
    layBntConfirm: TLayout;
    imgBntConfirm: TImage;
    lblBtnConfirm: TLabel;
    SEffectBtnConfirm: TShadowEffect;
    btnCancel: TRectangle;
    layBtnCancel: TLayout;
    ImgBtnCancel: TImage;
    lblBtnCancel: TLabel;
    SEffectBtnCancel: TShadowEffect;
    lblmsg: TLabel;
    Image8: TImage;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    lblPage: TLabel;
    layNewOutros: TLayout;
    Rectangle9: TRectangle;
    ToolBar8: TToolBar;
    Rectangle10: TRectangle;
    Label17: TLabel;
    Layout21: TLayout;
    Layout26: TLayout;
    Rectangle12: TRectangle;
    Layout27: TLayout;
    Layout28: TLayout;
    Label18: TLabel;
    edtOutroProduto: TEdit;
    EditButton3: TEditButton;
    Layout29: TLayout;
    Rectangle14: TRectangle;
    Layout30: TLayout;
    Layout32: TLayout;
    Label26: TLabel;
    edtQtdOutroProduto: TEdit;
    Layout33: TLayout;
    btnConfirmaPluvi: TRectangle;
    Label28: TLabel;
    Image21: TImage;
    Rectangle13: TRectangle;
    Image4: TImage;
    Label19: TLabel;
    edtLocalEstoque: TEdit;
    EditButton1: TEditButton;
    ClearEditButton3: TClearEditButton;
    laydataHoraFim: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Label6: TLabel;
    edtHoraFim: TTimeEdit;
    layLitrosFim: TLayout;
    Rectangle5: TRectangle;
    Layout12: TLayout;
    Label11: TLabel;
    edtLitrosFim: TNumberBox;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    Timer1: TTimer;
    GestureManager2: TGestureManager;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    ActionList1: TActionList;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActFoto: TTakePhotoFromCameraAction;
    GestureManager1: TGestureManager;
    layCombustivel: TLayout;
    Rectangle6: TRectangle;
    Layout16: TLayout;
    Label5: TLabel;
    edtCombustivel: TEdit;
    EditButton4: TEditButton;
    ClearEditButton4: TClearEditButton;
    procedure EditButton1Click(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure tbPrincipalChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImgClick(Sender: TObject);
    procedure btnFotoInicioClick(Sender: TObject);
    procedure btnFotoFimClick(Sender: TObject);
    procedure ActFotoDidFinishTaking(Image: TBitmap);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmarAClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure Rectangle27Click(Sender: TObject);
    procedure btnBuscarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnBuscarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSalvarFotoClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
     FImageStream: TStringStream;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
    {$IFDEF ANDROID}
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);

    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    {$ENDIF}
    protected
     property ImageStream: TStringStream read FImageStream write FImageStream;
    procedure AfterConstruction; override;
  public
    vFlagSync,vIdStart,dLocalEstoque:string;
    permissao : T99Permissions;
    vImg64Start,vImg64Stop,vIdCombustivel,vIdLocalEstoque : string;
    vImgCapture,vStart:integer;
    procedure GeraLista(vFiltro:string);
    function Base64FromBitmap(Bitmap: TBitmap): string;
    function BitmapFromBase64(const base64: string): TBitmap;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure LimpaCampos;
  end;

var
  frmStartBomba: TfrmStartBomba;

implementation

{$R *.fmx}

uses UPrincipal, ULocalEstoque, UDmDB, UProdutos;

procedure TfrmStartBomba.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro := ' and s.dataastart='+FormatDateTime('yyyy-mm-dd',edtDataF.DateTime).QuotedString;
 if edtLocalEstoqueF.Text.Length>0 then
  vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
 GeraLista(vFiltro);
end;

procedure TfrmStartBomba.btnBuscarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnExcluiItem.Opacity :=0.5;
end;

procedure TfrmStartBomba.btnBuscarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  btnExcluiItem.Opacity :=1;
end;

procedure TfrmStartBomba.btnConfirmarAClick(Sender: TObject);
begin
 if edtLocalEstoque.Text.Length=0 then
 begin
   ShowMessage('Informe a Bomba!!');
   edtLocalEstoque.SetFocus;
   Exit;
 end;
 if(vStart=0)then
 begin
  if(imgStart.Bitmap.IsEmpty)then
  begin
   ShowMessage('Foto do Inicio é Obrigatoria!!');
   Exit;
  end;
 end;
 if(vStart=1)then
 begin
  if(imgStop.Bitmap.IsEmpty)then
  begin
   ShowMessage('Foto do Fim é Obrigatoria!!');
   Exit;
  end;
  dmdb.TStartbombaInsertstatus.AsInteger                := 2;
 end;


 if(edtLitros.Value=0)and(vStart=0)then
  begin
   MessageDlg('O Volume em litros Inicial esta zerado deseja confirmar assim mesmo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
     end;
     mrNo:
     begin
      Exit;
     end;
    end;
   end);
  end;
  if(edtLitrosFim.Value=0)and(vStart=1)then
  begin
   MessageDlg('O Volume em litros Final esta zerado deseja confirmar assim mesmo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin

     end;
     mrNo:
     begin
      Exit;
     end;
    end;
   end);
  end;
 dmdb.TStartBombaInsertidlocalestoque.AsString         := vIdLocalEstoque;
 dmdb.TStartBombaInsertdataastart.AsString             := edtData.Text;
 dmdb.TStartBombaInserthorastart.AsString              := edtHora.Text;
 dmdb.TStartBombaInsertvolumelitrosIni.AsFloat         := edtLitros.Value;
 dmdb.TStartBombaInsertimgStart.AsString               := vImg64Start;
 dmdb.TStartBombaInserthorastart.AsString              := edtHora.Text;
 dmdb.TStartBombaInsertidusuario.AsString              := dmDB.vIdUser;
 dmdb.TStartBombaInsertcombustivel.AsString            := vIdCombustivel;
 dmdb.TStartBombaInsertidcentrocusto.AsString          := dmDB.vIdCentroCusto;
 dmdb.TStartBombaInsertvolumelitrosFim.AsFloat         := edtLitrosFim.Value;
 dmdb.TStartBombaInsertimgEnd.AsString                 := vImg64Stop;
 dmdb.TStartBombaInserthoraend.AsString                := edtHoraFim.Text;
 try
  dmdb.TStartBombaInsert.ApplyUpdates(-1);
  ShowMessage('Registro confirmado com sucesso!!');
  btnBuscarClick(sender);
  MudarAba(tbiLista,sender);
 except
    on E: Exception do
     ShowMessage('Erro ao salvar registro:'+E.Message);
 end;
end;

procedure TfrmStartBomba.btnFotoFimClick(Sender: TObject);
begin
 vImgCapture:=2;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmStartBomba.btnFotoInicioClick(Sender: TObject);
begin
 vImgCapture:=1;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmStartBomba.btnImgClick(Sender: TObject);
begin
 if vImg64Start.Length>0 then
  imgStart.Bitmap  := BitmapFromBase64(vImg64Start)
 else
  imgStart.Bitmap  := nil;
 if vImg64Stop.Length>0 then
  imgStop.Bitmap  := BitmapFromBase64(vImg64Stop)
 else
  imgStop.Bitmap  := nil;
 MudarAba(tbiImg,sender);
end;

procedure TfrmStartBomba.btnNovoClick(Sender: TObject);
begin
 imgStart.Bitmap   := nil;
 imgStop.Bitmap    := nil;
 dmDB.TStartBombaInsert.Close;
 dmDB.TStartBombaInsert.Open;
 dmdb.TStartBombaInsert.Insert;
 vStart :=0;
 LimpaCampos;
 MudarAba(tbiCad,sender);
end;

procedure TfrmStartBomba.btnSalvarFotoClick(Sender: TObject);
begin
 if not imgStart.Bitmap.IsEmpty then
    vImg64Start := Base64FromBitmap(imgStart.Bitmap);
 if not imgStop.Bitmap.IsEmpty then
    vImg64Stop := Base64FromBitmap(imgStop.Bitmap);
 MudarAba(tbiCad,sender);
end;

procedure TfrmStartBomba.btnVoltar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmStartBomba.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
 TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
          APostProc;
  end);
end;

procedure TfrmStartBomba.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;

procedure TfrmStartBomba.ActFotoDidFinishTaking(Image: TBitmap);
begin
  if vImgCapture=1 then
  begin
   imgStart.Bitmap.Assign(Image);
   Exit;
  end;
  if vImgCapture=2 then
  begin
   imgStop.Bitmap.Assign(Image);
   Exit;
  end;
end;

procedure TfrmStartBomba.AfterConstruction;
begin
  inherited;
  Self.ImageStream := TStringStream.Create;
end;

function TfrmStartBomba.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TfrmStartBomba.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmStartBomba.EditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtLocalEstoque.Text   := dmDB.vNomeLocalEstoque;
      vIdLocalEstoque        := dmDB.vIdLocalEstoqueSel;
      vFiltro := ' and s.dataastart='+FormatDateTime('yyyy-mm-dd',edtData.DateTime).QuotedString;
      vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
      dmDB.AbrirStartBomba(vFiltro);
      if not dmDB.TStartbomba.IsEmpty then
      begin
        ShowMessage('Já existe um start para esse Bomba nessa data!');
        edtLocalEstoque.Text :='';
      end;
      if not dmDB.VerificaStartAberto(vIdLocalEstoque) then
      begin
        ShowMessage('Existe um start em aberto para esse Bomba Finalize ante de iniciar!');
        edtLocalEstoque.Text :='';
      end;
    end);
  finally
    frmLocalEstoque.free;
  end;
end;

procedure TfrmStartBomba.EditButton4Click(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(Self);
  try
    frmprodutos.vAbastecimento :=1;
    frmProdutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdCombustivel          := dmDB.vIdProduto;
      edtCombustivel.Text     := dmDB.vNomeProduto;
    end);
  finally
    frmProdutos.free;
  end;
end;

procedure TfrmStartBomba.FormCreate(Sender: TObject);
begin
 {$IFDEF ANDROID}
   PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
   PermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
   PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
 {$ENDIF}

end;

procedure TfrmStartBomba.FormDestroy(Sender: TObject);
begin
 permissao.DisposeOf;
end;

procedure TfrmStartBomba.FormShow(Sender: TObject);
begin
 RecImgStart.Height      := (frmStartBomba.Height/2)-82;
 RecImgStop.Height       := (frmStartBomba.Height/2)-82;
 permissao               := T99Permissions.Create;
 btnExcluiItem.Visible   := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiLista;
 GeraLista('');
end;

procedure TfrmStartBomba.GeraLista(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirStartBomba(vFiltro);
 dmDB.TStartbomba.First;
 Lista.Items.Clear;
 while not dmDB.TStartbomba.eof do
 begin
   item := Lista.Items.Add;
   with frmStartBomba do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TStartbombaLocal.AsString;
       txt.TagString := dmDB.TStartbombaid.AsString;

       txt           := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text      := 'Start: ';
       txt           := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text      := dmDB.TStartbombadataastart.AsString;
       txt.TagString := dmDB.TStartbombasyncaws.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora: ';
       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TStartbombahorastart.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Litros Start: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TStartbombavolumelitrosIni.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Litros Fim: ';
       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TStartbombavolumelitrosFim.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Status: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.TStartbombastatusStr.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text16'));
       txt.Text := 'Finalizar';

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgStart.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image11'));
       img.Bitmap     := frmPrincipal.imgFinalizar.Bitmap;
     end;
     dmDB.TStartbomba.Next;
   end;
 end;
end;

procedure TfrmStartBomba.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (Length(AGrantResults) = 2) and
  (AGrantResults[0] = TPermissionStatus.Granted) and
  (AGrantResults[1] = TPermissionStatus.Granted) then
   ActLibrary.Execute
  else
   TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');
end;

procedure TfrmStartBomba.LimpaCampos;
begin
 edtLocalEstoque.Text :='';
 edtLitros.Text       :='';
 edtLitrosFim.Text    :='';
 edtCombustivel.Text  :='';
end;

procedure TfrmStartBomba.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdStart   := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
  vFlagSync          := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;

  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image11' then
    begin
     dmDB.TStartBombaInsert.Close;
     dmDB.TStartBombaInsert.Open;
     dmDB.TStartBombaInsert.Filtered := false;
     dmDB.TStartBombaInsert.Filter   := 'id='+vIdStart;
     dmDB.TStartBombaInsert.Filtered := true;
     dmdb.TStartBombaInsert.Edit;
     vStart               := 1;
     dmDB.AbrirStartBomba(' and s.id='+vIdStart);
     edtLocalEstoque.Text := dmDB.TStartbombaLocal.AsString;
     vImg64Start          := dmDB.TStartbombaimgStart.AsString;
     vImg64Stop           := dmDB.TStartbombaimgEnd.AsString;
     edtCombustivel.Text  := dmDB.TStartbombaCombustivelNome.AsString;
     vIdLocalEstoque      := dmDB.TStartbombaidlocalestoque.AsString;
     vIdCombustivel       := dmDB.TStartbombacombustivel.AsString;
     edtLitros.Value      := dmDB.TStartbombavolumelitrosIni.AsFloat;
     edtData.Date         := dmDB.TStartbombadataastart.AsDateTime;
     edtLitrosFim.Value   := dmDB.TStartbombavolumelitrosFim.AsFloat;
     edtHora.Date         := dmDB.TStartbombahorastart.AsDateTime;
     edtHoraFim.Date      := dmDB.TStartbombahoraend.AsDateTime;
     MudarAba(tbiCad,sender);
     Exit;
    end;
  end;
end;

procedure TfrmStartBomba.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmStartBomba.Rectangle17Click(Sender: TObject);
begin
 MudarAba(tbiLista,sender);
end;

procedure TfrmStartBomba.Rectangle27Click(Sender: TObject);
begin
 MudarAba(tbiCad,sender);
end;

procedure TfrmStartBomba.SearchEditButton1Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtLocalEstoqueF.Text   := dmDB.vNomeLocalEstoque;
      vIdLocalEstoque        := dmDB.vIdLocalEstoqueSel;
    end);
  finally
    frmLocalEstoque.free;
  end;
end;

procedure TfrmStartBomba.TakePicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (Length(AGrantResults) = 3) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) and
           (AGrantResults[2] = TPermissionStatus.Granted) then
                ActFoto.Execute
        else
                TDialogService.ShowMessage('Você não tem permissão para tirar fotos');
end;

procedure TfrmStartBomba.tbPrincipalChange(Sender: TObject);
begin
  case tbPrincipal.TabIndex of
  0:lblPage.Text            := 'Stard End Bomba';
  1:lblPage.Text            := 'Novo Start';
  2:lblPage.Text            := 'Fotos Start';
 end;
end;

end.
