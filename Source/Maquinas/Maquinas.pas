unit Maquinas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.Objects,
  FMX.Layouts,FMX.VirtualKeyboard,FMX.Platform, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmMaquinas = class(TForm)
    layListaP: TLayout;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    edtPlacaF: TEdit;
    edtPrefixoF: TEdit;
    Label14: TLabel;
    lblPf: TLabel;
    SpeedButton1: TSpeedButton;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    ListaMaquinas: TListView;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    ClearEditButton3: TClearEditButton;
    Rectangle1: TRectangle;
    imgLogoCad: TImage;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtPrefixoFChangeTracking(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtPlacaFChangeTracking(Sender: TObject);
    procedure ListaMaquinasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure ClearEditButton3Click(Sender: TObject);
  private
    procedure Filtro;
    procedure GeraListaMaquinas;
  public
    vIdMaquinaSel,vMarcaModelo:string;
  end;

var
  frmMaquinas: TfrmMaquinas;

implementation

{$R *.fmx}

uses UPrincipal,UDmDB;

procedure TfrmMaquinas.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMaquinas.btnSelecionarClick(Sender: TObject);
begin
 if vIdMaquinaSel.Length=0 then
 begin
   ShowMessage('Selecione uma Maquina!');
   Exit;
 end
 else
 begin
  dmDB.vIdMaquinaSel := vIdMaquinaSel;
  dmDB.vMarcaModelo  := vMarcaModelo;
  Close;
 end;
end;

procedure TfrmMaquinas.ClearEditButton1Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.ClearEditButton2Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.ClearEditButton3Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro
end;

procedure TfrmMaquinas.edtPlacaFChangeTracking(Sender: TObject);
begin
 Filtro
end;

procedure TfrmMaquinas.edtPrefixoFChangeTracking(Sender: TObject);
begin
 Filtro;
end;


procedure TfrmMaquinas.SpeedButton1Click(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmMaquinas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

procedure TfrmMaquinas.Filtro;
var
 vFiltrado:integer;
 vFiltro:string;
begin
 vFiltrado :=0;
 dmdb.TMaquinas.Filtered := false;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltrado :=1;
   vFiltro := 'MODELO LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 end;
 if edtPlacaF.Text.Length>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'PLACA LIKE '+QuotedStr('%'+edtPlacaF.Text+'%')
  else
   vFiltro := vFiltro+' AND PLACA LIKE'+QuotedStr('%'+edtPlacaF.Text+'%');
   vFiltrado :=1;
 end;
 if edtPrefixoF.Text.Length>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'PREFIXO LIKE'+QuotedStr('%'+edtPrefixoF.Text+'%')
  else
   vFiltro := vFiltro+' and PREFIXO LIKE'+QuotedStr('%'+edtPrefixoF.Text+'%');
  vFiltrado :=1;
 end;
 if vFiltrado=1 then
 begin
  dmdb.TMaquinas.Filter   := vFiltro;
  dmdb.TMaquinas.Filtered := true;
 end
 else
 begin
   dmdb.TMaquinas.Filtered := false;
   dmdb.TMaquinas.Close;
   dmdb.TMaquinas.Open;
   dmdb.TMaquinas.Filter   := vFiltro;
   dmdb.TMaquinas.Filtered := true;
 end;
 GeraListaMaquinas;
end;

procedure TfrmMaquinas.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
 if Key = vkHardwareBack then
 begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
    KeyboardService.HideVirtualKeyboard;
   key := 0;
 end;
end;

procedure TfrmMaquinas.FormShow(Sender: TObject);
begin
 frmMaquinas.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet := nil;
 dmDB.TMaquinas.Close;
 dmDB.TMaquinas.Open();
 BindSourceDB1.DataSet  := dmDB.TMaquinas;
 GeraListaMaquinas;
end;

procedure TfrmMaquinas.GeraListaMaquinas;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.TMaquinas.First;
    ListaMaquinas.Items.Clear;
    while not dmDb.TMaquinas.eof do
     begin
       item := ListaMaquinas.Items.Add;
         with frmMaquinas do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TMaquinasid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TMaquinasprefixo.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := 'Modelo:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TMaquinasmodelo.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := 'Placa: '+dmDb.TMaquinasplaca.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Prefixo: '+dmDb.TMaquinasprefixo.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
//             img.Bitmap     := frmPrincipal.imgMaquina.Bitmap;
           end;
           dmDB.TMaquinas.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmMaquinas.ListaMaquinasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdMaquinaSel :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;
 vMarcaModelo :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').Text+'-'+
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').Text+'-'+
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;
end;

end.
