unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  Datasnap.DBClient, Model.ItemPedidoVenda, System.Generics.Collections, Controller.PedidoVenda;

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
    DBLookupComboBoxEstado: TDBLookupComboBox;
    PanelDadosPedido: TPanel;
    PanelBotaoTop: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
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
    cdsCliente: TClientDataSet;
    cdsClienteCodigo: TIntegerField;
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    dsCliente: TDataSource;
    cdsClienteDescricao: TStringField;
    cdsProduto: TClientDataSet;
    cdsProdutoCodigo: TIntegerField;
    cdsProdutoDescricao: TStringField;
    cdsProdutoPrecoVenda: TCurrencyField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridListagemKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
  private
    FControllerPedidoVenda: TControllerPedidoVenda;
    procedure PreencheCdsProduto;
    procedure PreencheCdsCliente;
    procedure PreencheCdsPedido;
    procedure PreencheCdsItemPedido(AListaItem: TObjectList<TModelItemPedidoVenda>);

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
  Controller.Produto, Model.Produto, Model.PedidoVenda;

{$R *.dfm}

procedure TViewPedido.AbreTelaItemPedido;
var
  LViewItemPedidoVenda: TViewItemPedidoVenda;
begin
  LViewItemPedidoVenda := TViewItemPedidoVenda.Create(nil);
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

procedure TViewPedido.FormCreate(Sender: TObject);
begin
  ListarPedidos;
end;

procedure TViewPedido.ListarPedidos;
begin
//  PreencheCdsCliente;
//  PreencheCdsProduto;
//  PreencheCdsPedido;
end;

procedure TViewPedido.MudarAba(ATabSheet: TTabSheet);
begin
  PageControlCadastro.ActivePage := ATabSheet;
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
  cdsCliente.EmptyDataSet;
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
  //Peenche o objeto e manda salvar
  if LModel.Numero > 0 then
    FControllerPedidoVenda.Update(LModel)
  else
    FControllerPedidoVenda.Insert(LModel);

  MudarAba(TabSheetListagem);
end;

end.
