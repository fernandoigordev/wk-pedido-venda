unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  Datasnap.DBClient, Model.ItemPedidoVenda, System.Generics.Collections, Controller.PedidoVenda, Model.PedidoVenda;

type
  TViewPedido = class(TForm)
    PanelTitulo: TPanel;
    LabelTitulo: TLabel;
    PageControlCadastro: TPageControl;
    TabSheetListagem: TTabSheet;
    PanelPesquisaTop: TPanel;
    PanelBotaoNovo: TPanel;
    ShapeBotaoNovo: TShape;
    SpeedButtonNovo: TSpeedButton;
    DBGridListagem: TDBGrid;
    TabSheetCadastro: TTabSheet;
    ScrollBoxCadastro: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    PanelCadastroBottom: TPanel;
    PanelBotaoSalvar: TPanel;
    ShapeBotaoSalvar: TShape;
    SpeedButtonSalvar: TSpeedButton;
    PanelBotaoCancelar: TPanel;
    ShapeBotaoCancelar: TShape;
    SpeedButtonCancelar: TSpeedButton;
    DBEditCodigo: TDBEdit;
    DBEditCodigoCliente: TDBEdit;
    PanelDadosPedido: TPanel;
    PanelBotaoTop: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    DBGridItemPedido: TDBGrid;
    Label3: TLabel;
    cdsPedido: TClientDataSet;
    cdsItemPedido: TClientDataSet;
    cdsPedidoNumero: TIntegerField;
    cdsPedidoDataEmissao: TDateField;
    cdsPedidoCodigoCliente: TIntegerField;
    cdsPedidoValorTotal: TCurrencyField;
    cdsItemPedidoCodigo: TIntegerField;
    cdsItemPedidoNumeroPedido: TIntegerField;
    cdsItemPedidoCodigoProduto: TIntegerField;
    cdsItemPedidoQuantidade: TIntegerField;
    cdsItemPedidoValorUnitario: TCurrencyField;
    cdsItemPedidoValorTotal: TCurrencyField;
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    dsCliente: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoCodigo: TIntegerField;
    cdsProdutoPrecoVenda: TCurrencyField;
    cdsCliente: TClientDataSet;
    cdsClienteCodigo: TIntegerField;
    cdsClienteDescricao: TStringField;
    cdsPedidoDescricaoCliente: TStringField;
    DBLookupComboBoxCliente: TDBLookupComboBox;
    cdsItemPedidoDescricaoProduto: TStringField;
    cdsItemPedidoPrecoDoProduto: TCurrencyField;
    cdsProdutoDescricao: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridListagemKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FControllerPedidoVenda: TControllerPedidoVenda;
    procedure PreencheCdsProduto;
    procedure PreencheCdsCliente;
    procedure PreencheCdsPedido;
    procedure PreencheCdsItemPedido(AListaItem: TObjectList<TModelItemPedidoVenda>);
    Procedure PopulaPedido(APedido: TModelPedidoVenda);

    procedure ListarPedidos;
    procedure AbreTelaItemPedido;
    procedure MudarAba(ATabSheet: TTabSheet);
  public
    { Public declarations }
  end;

var
  ViewPedido: TViewPedido;

implementation

uses
  View.ItemPedidoVenda, Controller.Cliente, Model.Cliente,
  Controller.Produto, Model.Produto;

{$R *.dfm}

procedure TViewPedido.AbreTelaItemPedido;
var
  LViewItemPedidoVenda: TViewItemPedidoVenda;
begin
  LViewItemPedidoVenda := TViewItemPedidoVenda.Create(Self);
  try
    LViewItemPedidoVenda.SetCds(cdsItemPedido, cdsProduto);
    LViewItemPedidoVenda.ShowModal;
  finally
    LViewItemPedidoVenda.Free;
  end;
end;

procedure TViewPedido.DBGridListagemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if cdsPedido.RecordCount > 0 then
    begin
      cdsPedido.Edit;
      MudarAba(TabSheetCadastro);
    end;
  end;
end;

procedure TViewPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerPedidoVenda.Free;
end;

procedure TViewPedido.FormCreate(Sender: TObject);
begin
  ListarPedidos;
end;

procedure TViewPedido.ListarPedidos;
begin
  FControllerPedidoVenda := TControllerPedidoVenda.Create;
  PreencheCdsCliente;
  PreencheCdsProduto;
  PreencheCdsPedido;
end;

procedure TViewPedido.MudarAba(ATabSheet: TTabSheet);
begin
  PageControlCadastro.ActivePage := ATabSheet;
end;

procedure TViewPedido.PopulaPedido(APedido: TModelPedidoVenda);
var
  LItemPedido: TModelItemPedidoVenda;
begin
  APedido.Numero := cdsPedidoNumero.AsInteger;
  Apedido.DataEmissao := cdsPedidoDataEmissao.AsDateTime;
  Apedido.CodigoCliente := cdsPedidoCodigoCliente.AsInteger;
  Apedido.ValorTotal := cdsPedidoValorTotal.AsCurrency;

  cdsItemPedido.First;
  while not cdsItemPedido.Eof do
  begin
    LItemPedido := TModelItemPedidoVenda.Create;
    LItemPedido.Codigo := cdsItemPedidoCodigo.AsInteger;
    LItemPedido.NumeroPedido := cdsItemPedidoNumeroPedido.AsInteger;
    LItemPedido.CodigoProduto := cdsItemPedidoCodigoProduto.AsInteger;
    LItemPedido.Quantidade := cdsItemPedidoQuantidade.AsInteger;
    LItemPedido.ValorUnitario := cdsItemPedidoValorUnitario.AsCurrency;
    LItemPedido.ValorTotal := cdsItemPedidoValorTotal.AsCurrency;
    Apedido.Itens.Add(LItemPedido);
    cdsItemPedido.Next;
  end;
end;

procedure TViewPedido.PreencheCdsCliente;
var
  LControllerCliente: TControllerCliente;
  LListaClientes: TObjectList<TModelCliente>;
  LCliente: TModelCliente;
begin
  cdsCliente.EmptyDataSet;
  LControllerCliente := TControllerCliente.Create;
  try
    LListaClientes := LControllerCliente.GetAll;
    try
      for LCliente in LListaClientes do
      begin
        cdsCliente.Append;
        cdsClienteCodigo.AsInteger := LCliente.Codigo;
        cdsClienteDescricao.AsString := LCliente.Nome;
        cdsCliente.Post;
      end;
    finally
      LListaClientes.Free;
    end;
  finally
    LControllerCliente.Free;
  end;
end;

procedure TViewPedido.PreencheCdsItemPedido(AListaItem: TObjectList<TModelItemPedidoVenda>);
var
  LModel: TModelItemPedidoVenda;
begin
  for LModel in AListaItem do
  begin
    cdsItemPedido.Append;
    cdsItemPedidoCodigo.AsInteger := LModel.Codigo;
    cdsItemPedidoNumeroPedido.AsInteger := LModel.NumeroPedido;
    cdsItemPedidoCodigoProduto.AsInteger := LModel.CodigoProduto;
    cdsItemPedidoQuantidade.AsInteger := LModel.Quantidade;
    cdsItemPedidoValorUnitario.AsCurrency := LModel.ValorUnitario;
    cdsItemPedidoValorTotal.AsCurrency := LModel.ValorTotal;
    cdsItemPedido.Post;
  end;
end;

procedure TViewPedido.PreencheCdsPedido;
var
  LListaPedido: TObjectList<TModelPedidoVenda>;
  LPedido: TModelPedidoVenda;
begin
  cdsPedido.EmptyDataSet;
  cdsItemPedido.EmptyDataSet;

  LListaPedido := FControllerPedidoVenda.GetAll;
  for LPedido in LListaPedido do
  begin
    cdsPedido.Append;
    cdsPedidoNumero.AsInteger := LPedido.Numero;
    cdsPedidoDataEmissao.AsDateTime := LPedido.DataEmissao;
    cdsPedidoCodigoCliente.AsInteger := LPedido.CodigoCliente;
    cdsPedidoValorTotal.AsCurrency := LPedido.ValorTotal;
    cdsPedido.Post;
    PreencheCdsItemPedido(LPedido.Itens);
  end;
end;

procedure TViewPedido.PreencheCdsProduto;
var
  LControllerProduto: TControllerProduto;
  LListaProduto: TObjectList<TModelProduto>;
  LProduto: TModelProduto;
begin
  cdsProduto.EmptyDataSet;
  LControllerProduto := TControllerProduto.Create;
  try
    LListaProduto := LControllerProduto.GetAll;
    try
      for LProduto in LListaProduto do
      begin
        cdsProduto.Append;
        cdsProdutoCodigo.AsInteger := LProduto.Codigo;
        cdsProdutoDescricao.AsString := LProduto.Descricao;
        cdsProdutoPrecoVenda.AsCurrency := LProduto.PrecoVenda;
        cdsProduto.Post;
      end;
    finally
      LListaProduto.Free;
    end;
  finally
    LControllerProduto.Free;
  end;

end;

procedure TViewPedido.SpeedButton1Click(Sender: TObject);
begin
  AbreTelaItemPedido;
end;

procedure TViewPedido.SpeedButtonCancelarClick(Sender: TObject);
begin
  cdsPedido.Cancel;
  MudarAba(TabSheetListagem);
end;

procedure TViewPedido.SpeedButtonNovoClick(Sender: TObject);
begin
  cdsPedido.Append;
  MudarAba(TabSheetCadastro);
end;

procedure TViewPedido.SpeedButtonSalvarClick(Sender: TObject);
var
  LModel: TModelPedidoVenda;
begin
  cdsPedido.Post;

  LModel := TModelPedidoVenda.Create;
  try
    PopulaPedido(LModel);
    if LModel.Numero > 0 then
      FControllerPedidoVenda.Update(LModel)
    else
      FControllerPedidoVenda.Insert(LModel);
  finally
    LModel.Free;
  end;

  MudarAba(TabSheetListagem);
end;

end.
