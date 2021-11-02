unit ULocalEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation;

type
  TfrmLocalEstoque = class(TForm)
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    edtPrefixoF: TEdit;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    ListaLocalEstoque: TListView;
    Rectangle2: TRectangle;
    imgLogoCad: TImage;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaLocalEstoqueItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPrefixoFChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    vIdLocalEstoque,vNomeLocalEstoque :string;
    procedure GeraListaLocalEstoque;
  end;

var
  frmLocalEstoque: TfrmLocalEstoque;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB;

procedure TfrmLocalEstoque.btnFecharClick(Sender: TObject);
begin
if vIdLocalEstoque.Length=0 then
 begin
   ShowMessage('Selecione um Local!');
   Exit;
 end
 else
 begin
  dmDB.vIdLocalEstoqueSel := vIdLocalEstoque;
  dmDB.vNomeLocalEstoque  := vNomeLocalEstoque;
  Close;
 end;
end;

procedure TfrmLocalEstoque.btnSelecionarClick(Sender: TObject);
begin
if vIdLocalEstoque.Length=0 then
 begin
   ShowMessage('Selecione um Local!');
   Exit;
 end
 else
 begin
  dmDB.vIdLocalEstoqueSel := vIdLocalEstoque;
  dmDB.vNomeLocalEstoque  := vNomeLocalEstoque;
  Close;
 end;
end;

procedure TfrmLocalEstoque.edtPrefixoFChangeTracking(Sender: TObject);
begin
  if edtPrefixoF.Text.Length >0 then
  begin
    dmDB.TLocalEstoque.Filtered := false;
    dmDB.TLocalEstoque.Filter   := 'nome like '+QuotedStr('%'+edtPrefixoF.Text+'%');
    dmDB.TLocalEstoque.Filtered := true;
    GeraListaLocalEstoque;
  end
  else
  begin
   dmDB.TLocalEstoque.Filtered := false;
   dmDB.TLocalEstoque.Close;
   dmDB.TLocalEstoque.Open;
   GeraListaLocalEstoque;
  end;
end;

procedure TfrmLocalEstoque.FormShow(Sender: TObject);
begin
 frmLocalEstoque.StyleBook := frmPrincipal.StyleBook1;
 dmDB.TLocalEstoque.Close;
 dmDB.TLocalEstoque.Open();
 GeraListaLocalEstoque;
end;

procedure TfrmLocalEstoque.GeraListaLocalEstoque;
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
    dmDb.TLocalEstoque.First;
    ListaLocalEstoque.Items.Clear;
    while not dmDb.TLocalEstoque.eof do
     begin
       item := ListaLocalEstoque.Items.Add;
         with frmLocalEstoque do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TLocalEstoqueId.AsString;
             txt.TagString := dmDb.TLocalEstoquenome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TLocalEstoquenome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgLocalEstoque.Bitmap;
           end;
           dmDb.TLocalEstoque.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmLocalEstoque.ListaLocalEstoqueItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdLocalEstoque :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;
  vNomeLocalEstoque :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;
end;

end.
