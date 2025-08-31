unit Model.PedidoVenda;

interface

uses
  Model.ItemPedidoVenda, System.Generics.Collections;
type

  TModelPedidoVenda = class
  private
    FNumero: Integer;
    FDataEmissao: TDate;
    FCodigoCliente: Integer;
    FValorTotal: Currency;
    FItens: TObjectList<TModelItemPedidoVenda>;
  public
    constructor Create;
    destructor Destroy;override;

    property Numero: Integer read FNumero write FNumero;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Itens: TObjectList<TModelItemPedidoVenda> read FItens write FItens;
  end;

implementation

{ TModelPedidoVenda }

constructor TModelPedidoVenda.Create;
begin
  FItens := TObjectList<TModelItemPedidoVenda>.Create;
end;

destructor TModelPedidoVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

end.
