unit Dao.PedidoVenda;

interface

uses
  Dao.Base, Model.PedidoVenda, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Dao.ItemPedidoVenda;

type
  TDaoPedidoVenda = class(TDAOBase<TModelPedidoVenda>)
  private
    FDaoItemPedidoVenda: TDaoItemPedidoVenda;
  public
    constructor Create;
    destructor Destroy;override;

    function GetAll: TObjectList<TModelPedidoVenda>;override;
    function GetById(AId: Integer): TModelPedidoVenda;override;
    procedure Insert(AModel: TModelPedidoVenda);override;
    procedure Update(AModel: TModelPedidoVenda);override;
    procedure Delete(AId: Integer);override;
  end;

implementation

uses
  Data.DB;

{ TDaoPedidoVenda }

constructor TDaoPedidoVenda.Create;
begin
  inherited Create;
  FDaoItemPedidoVenda := TDaoItemPedidoVenda.Create;
end;

procedure TDaoPedidoVenda.Delete(AId: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'DELETE FROM PedidoVenda WHERE Id = :Id';
  FQuery.ParamByName('Id').AsInteger := AId;
  FQuery.ExecSQL;
end;

destructor TDaoPedidoVenda.Destroy;
begin
  FDaoItemPedidoVenda.Free;
  inherited;
end;

function TDaoPedidoVenda.GetAll: TObjectList<TModelPedidoVenda>;
var
  LModel: TModelPedidoVenda;
begin
  Result := TObjectList<TModelPedidoVenda>.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM PedidoVenda';
    FQuery.Open;

    FQuery.First;
    while not FQuery.Eof do
    begin
      LModel := TModelPedidoVenda.Create;
      LModel.Numero := FQuery.FieldByName('Numero').AsInteger;
      LModel.DataEmissao := FQuery.FieldByName('DataEmissao').AsDateTime;
      LModel.CodigoCliente := FQuery.FieldByName('CodigoCliente').AsInteger;
      LModel.ValorTotal := FQuery.FieldByName('ValorTotal').AsCurrency;
      LModel.Itens := FDaoItemPedidoVenda.GetAllByPedido(LModel.Numero);
      Result.Add(LModel);
      FQuery.Next;
    end;
  Except
    Result.Free;
    raise;
  end;
end;

function TDaoPedidoVenda.GetById(AId: Integer): TModelPedidoVenda;
begin
  Result := TModelPedidoVenda.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM PedidoVenda WHERE Codigo = :Codigo';
    FQuery.ParamByName('Codigo').AsInteger := AId;
    FQuery.Open;

    if not FQuery.IsEmpty then
    begin
      Result.Numero := FQuery.FieldByName('Numero').AsInteger;
      Result.DataEmissao := FQuery.FieldByName('DataEmissao').AsDateTime;
      Result.CodigoCliente := FQuery.FieldByName('CodigoCliente').AsInteger;
      Result.ValorTotal := FQuery.FieldByName('ValorTotal').AsCurrency;
      Result.Itens := FDaoItemPedidoVenda.GetAllByPedido(Result.Numero);
    end;
  Except
    Result.Free;
    raise;
  end;
end;

procedure TDaoPedidoVenda.Insert(AModel: TModelPedidoVenda);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
  'INSERT INTO PedidoVenda(Numero, DataEmissao, CodigoCliente, ValorTotal) ' +
  'VALUES(:Numero, :DataEmissao, :CodigoCliente, :ValorTotal)';

  FQuery.ParamByName('Numero').AsInteger := AModel.Numero;
  FQuery.ParamByName('DataEmissao').AsDate := AModel.DataEmissao;
  FQuery.ParamByName('CodigoCliente').AsInteger := AModel.CodigoCliente;
  FQuery.ParamByName('ValorTotal').AsCurrency := AModel.ValorTotal;
  FQuery.ExecSQL;

  for Var ModelItem in AModel.Itens do
    FDaoItemPedidoVenda.Insert(ModelItem);
end;

procedure TDaoPedidoVenda.Update(AModel: TModelPedidoVenda);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
  'UPDATE PedidoVenda SET DataEmissao = :DataEmissao, CodigoCliente = :CodigoCliente, ValorTotal = :ValorTotal ' +
  'WHERE Numero = :Numero';

  FQuery.ParamByName('Numero').AsInteger := AModel.Numero;
  FQuery.ParamByName('DataEmissao').AsDate := AModel.DataEmissao;
  FQuery.ParamByName('CodigoCliente').AsInteger := AModel.CodigoCliente;
  FQuery.ParamByName('ValorTotal').AsCurrency := AModel.ValorTotal;
  FQuery.ExecSQL;

  for Var ModelItem in AModel.Itens do
    FDaoItemPedidoVenda.Update(ModelItem);
end;

end.
