unit UOperadorMaquina;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmOperadorMaquina = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    Rectangle1: TRectangle;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    ListaOperador: TListView;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ListaOperadorItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    vIdOperador,vNomeOperador:string;
    procedure GeraLista;
  end;

var
  frmOperadorMaquina: TfrmOperadorMaquina;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB;

procedure TfrmOperadorMaquina.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmOperadorMaquina.btnSelecionarClick(Sender: TObject);
begin
 if vIdOperador.Length=0 then
 begin
   ShowMessage('Selecione um Operador!');
   Exit;
 end
 else
 begin
  dmDB.vIdOperador    := vIdOperador;
  dmDB.vNomeOperador  := vNomeOperador;
  Close;
 end
end;

procedure TfrmOperadorMaquina.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.TOperadorMaquina.Filtered := false;
   dmDb.TOperadorMaquina.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDb.TOperadorMaquina.Filtered := true;
 end
 else
 begin
   dmDb.TOperadorMaquina.Filtered := false;
   dmDb.TOperadorMaquina.Close;
   dmDb.TOperadorMaquina.Open;
 end;
 GeraLista;
end;

procedure TfrmOperadorMaquina.FormShow(Sender: TObject);
begin
 frmOperadorMaquina.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet          := nil;
 dmDB.TOperadorMaquina.Close;
 dmDB.TOperadorMaquina.Open();
 BindSourceDB1.DataSet          := dmDB.TOperadorMaquina;
 GeraLista;
end;

procedure TfrmOperadorMaquina.GeraLista;
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
    dmDb.TOperadorMaquina.First;
    ListaOperador.Items.Clear;
    while not dmDb.TOperadorMaquina.eof do
     begin
       item := ListaOperador.Items.Add;
         with frmOperadorMaquina do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TOperadorMaquinaid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Operador: ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TOperadorMaquinanome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'CPF.: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDB.TOperadorMaquinacpf.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgOperador.Bitmap;

           end;
           dmDB.TOperadorMaquina.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmOperadorMaquina.ListaOperadorItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdOperador:=
   TAppearanceListViewItem(ListaOperador.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeOperador:=
   TAppearanceListViewItem(ListaOperador.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

procedure TfrmOperadorMaquina.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
