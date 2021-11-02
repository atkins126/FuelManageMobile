unit UAtividadeAbastecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts;

type
  TfrmAtividadeAbastecimento = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    Rectangle1: TRectangle;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    Lista: TListView;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    vNomeAtividade,
    vIdAtividade:string;
    procedure GeraLista;
  end;

var
  frmAtividadeAbastecimento: TfrmAtividadeAbastecimento;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB;

procedure TfrmAtividadeAbastecimento.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAtividadeAbastecimento.btnSelecionarClick(Sender: TObject);
begin
 if vIdAtividade.Length=0 then
 begin
   ShowMessage('Selecione uma Atividade!');
   Exit;
 end
 else
 begin
  dmDB.vIdAtividade       := vIdAtividade;
  dmDB.vNomeAtividade     := vNomeAtividade;
  Close;
 end
end;

procedure TfrmAtividadeAbastecimento.edtNomeFiltroChangeTracking(
  Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.Tauxatividadeabastecimento.Filtered := false;
   dmDb.Tauxatividadeabastecimento.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDb.Tauxatividadeabastecimento.Filtered := true;
 end
 else
 begin
   dmDb.Tauxatividadeabastecimento.Filtered := false;
   dmDb.Tauxatividadeabastecimento.Close;
   dmDb.Tauxatividadeabastecimento.Open;
 end;
 GeraLista;
end;

procedure TfrmAtividadeAbastecimento.FormShow(Sender: TObject);
begin
 dmDB.Tauxatividadeabastecimento.Close;
 dmDB.Tauxatividadeabastecimento.Open();
 GeraLista;
end;

procedure TfrmAtividadeAbastecimento.GeraLista;
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
    dmDb.Tauxatividadeabastecimento.First;
    Lista.Items.Clear;
    while not dmDb.Tauxatividadeabastecimento.eof do
     begin
       item := Lista.Items.Add;
         with frmAtividadeAbastecimento do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.Tauxatividadeabastecimentoid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.Tauxatividadeabastecimentonome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgAtividades.Bitmap;

           end;
           dmDB.Tauxatividadeabastecimento.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmAtividadeAbastecimento.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdAtividade:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeAtividade:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

end.
