unit UProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Grid,FMX.VirtualKeyboard,FMX.Platform,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,db;

type
  TfrmProdutos = class(TForm)
    layListaP: TLayout;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    ListaProdutos: TListView;
    Rectangle1: TRectangle;
    imgLogoCad: TImage;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaProdutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure GeraLista;
  public
    vIdProduto,vNomeProduto:string;
    vAbastecimento:integer;
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

uses UPrincipal,UDmDB;

procedure TfrmProdutos.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmProdutos.btnSelecionarClick(Sender: TObject);
begin
 if vIdProduto.Length=0 then
 begin
   ShowMessage('Selecione um Produto!');
   Exit;
 end
 else
 begin
  dmDB.vIdProduto       := vIdProduto;
  dmDB.vNomeProduto     := vNomeProduto;
  Close;
 end
end;


procedure TfrmProdutos.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 GeraLista;
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.TProdutos.Filtered := false;
   dmDb.TProdutos.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDb.TProdutos.Filtered := true;
 end
 else
 begin
   dmDb.TProdutos.Filtered := false;
   dmDb.TProdutos.Close;
   dmDb.TProdutos.Open;
 end;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 vAbastecimento :=0;
end;

procedure TfrmProdutos.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
 frmProdutos.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet   := nil;
 dmDB.TProdutos.Close;
 dmDB.TProdutos.Open();

 if vAbastecimento=1 then
 begin
  dmDB.TProdutos.Filtered := false;
  dmDB.TProdutos.Filter   := 'tipo=0';
  dmDB.TProdutos.Filtered := True;
 end
 else
 begin
  dmDB.TProdutos.Filtered := false;
  dmDB.TProdutos.Filter   := 'tipo>0';
  dmDB.TProdutos.Filtered := True;
 end;
 BindSourceDB1.DataSet   := dmDB.TProdutos;
 GeraLista;
end;

procedure TfrmProdutos.GeraLista;
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
    dmDb.TProdutos.First;
    ListaProdutos.Items.Clear;
    while not dmDb.TProdutos.eof do
     begin
       item := ListaProdutos.Items.Add;
         with frmProdutos do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TProdutosid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';
             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TProdutosnome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgSeed.Bitmap;

           end;
           dmDB.TProdutos.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmProdutos.ListaProdutosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdProduto:=
   TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeProduto:=
   TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

procedure TfrmProdutos.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
