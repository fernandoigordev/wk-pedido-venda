unit Dao.ItemPedidoVenda;

interface

uses
  Dao.Base, Model.ItemPedidoVenda, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TDaoItemPedidoVenda = class(TDAOBase<TModelItemPedidoVenda>)
  private
    FQuery: TFDQuery;
  public
    function GetAll: TObjectList<TModelItemPedidoVenda>; override;
    function GetAllByPedido(ANumeroPedido: Integer): TObjectList<TModelItemPedidoVenda>;
    function GetById(AId: Integer): TModelItemPedidoVenda; override;
    procedure Insert(AModel: TModelItemPedidoVenda); override;
    procedure Update(AModel: TModelItemPedidoVenda); override;
    procedure Delete(AId: Integer); override;
  end;

implementation

uses
  Data.DB;

{ TDaoItemPedidoVenda }

procedure TDaoItemPedidoVenda.Delete(AId: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'DELETE FROM ItemPedidoVenda WHERE Codigo = :Codigo';
  FQuery.ParamByName('Codigo').AsInteger := AId;
  FQuery.ExecSQL;
end;

function TDaoItemPedidoVenda.GetAll: TObjectList<TModelItemPedidoVenda>;
var
  LModel: TModelItemPedidoVenda;
begin
  Result := TObjectList<TModelItemPedidoVenda>.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM ItemPedidoVenda';
    FQuery.Open;

    FQuery.First;
    while not FQuery.Eof do
    begin
      LModel := TModelItemPedidoVenda.Create;
      LModel.Codigo        := FQuery.FieldByName('Codigo').AsInteger;
      LModel.NumeroPedido  := FQuery.FieldByName('NumeroPedido').AsInteger;
      LModel.CodigoProduto := FQuery.FieldByName('CodigoProduto').AsInteger;
      LModel.Quantidade    := FQuery.FieldByName('Quantidade').AsInteger;
      LModel.ValorUnitario := FQuery.FieldByName('ValorUnitario').AsCurrency;
      LModel.ValorTotal    := FQuery.FieldByName('ValorTotal').AsCurrency;
      Result.Add(LModel);
      FQuery.Next;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TDaoItemPedidoVenda.GetAllByPedido(ANumeroPedido: Integer): TObjectList<TModelItemPedidoVenda>;
var
  LModel: TModelItemPedidoVenda;
begin
  Result := TObjectList<TModelItemPedidoVenda>.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text :=
    'SELECT * FROM ItemPedidoVenda WHERE NumeroPedido = :NumeroPedido';
    FQuery.ParamByName('NumeroPedido').AsInteger := ANumeroPedido;
    FQuery.Open;

    FQuery.First;
    while not FQuery.Eof do
    begin
      LModel := TModelItemPedidoVenda.Create;
      LModel.Codigo        := FQuery.FieldByName('Codigo').AsInteger;
      LModel.NumeroPedido  := FQuery.FieldByName('NumeroPedido').AsInteger;
      LModel.CodigoProduto := FQuery.FieldByName('CodigoProduto').AsInteger;
      LModel.Quantidade    := FQuery.FieldByName('Quantidade').AsInteger;
      LModel.ValorUnitario := FQuery.FieldByName('ValorUnitario').AsCurrency;
      LModel.ValorTotal    := FQuery.FieldByName('ValorTotal').AsCurrency;
      Result.Add(LModel);
      FQuery.Next;
    end;
  except
    Result.Free;
    raise;
  end;

end;

function TDaoItemPedidoVenda.GetById(AId: Integer): TModelItemPedidoVenda;
begin
  Result := TModelItemPedidoVenda.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM ItemPedidoVenda WHERE Codigo = :Codigo';
    FQuery.ParamByName('Codigo').AsInteger := AId;
    FQuery.Open;

    if not FQuery.IsEmpty then
    begin
      Result.Codigo        := FQuery.FieldByName('Codigo').AsInteger;
      Result.NumeroPedido  := FQuery.FieldByName('NumeroPedido').AsInteger;
      Result.CodigoProduto := FQuery.FieldByName('CodigoProduto').AsInteger;
      Result.Quantidade    := FQuery.FieldByName('Quantidade').AsInteger;
      Result.ValorUnitario := FQuery.FieldByName('ValorUnitario').AsCurrency;
      Result.ValorTotal    := FQuery.FieldByName('ValorTotal').AsCurrency;
    end;
  except
    Result.Free;
    raise;
  end;
end;

procedure TDaoItemPedidoVenda.Insert(AModel: TModelItemPedidoVenda);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'INSERT INTO ItemPedidoVenda (NumeroPedido, CodigoProduto, Quantidade, ValorUnitario, ValorTotal) ' +
    'VALUES (:NumeroPedido, :CodigoProduto, :Quantidade, :ValorUnitario, :ValorTotal)';

  FQuery.ParamByName('NumeroPedido').AsInteger  := AModel.NumeroPedido;
  FQuery.ParamByName('CodigoProduto').AsInteger := AModel.CodigoProduto;
  FQuery.ParamByName('Quantidade').AsInteger    := AModel.Quantidade;
  FQuery.ParamByName('ValorUnitario').AsCurrency := AModel.ValorUnitario;
  FQuery.ParamByName('ValorTotal').AsCurrency    := AModel.ValorTotal;
  FQuery.ExecSQL;
end;

procedure TDaoItemPedidoVenda.Update(AModel: TModelItemPedidoVenda);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'UPDATE ItemPedidoVenda SET NumeroPedido = :NumeroPedido, ' +
    'CodigoProduto = :CodigoProduto, Quantidade = :Quantidade, ' +
    'ValorUnitario = :ValorUnitario, ValorTotal = :ValorTotal ' +
    'WHERE Codigo = :Codigo';

  FQuery.ParamByName('Codigo').AsInteger        := AModel.Codigo;
  FQuery.ParamByName('NumeroPedido').AsInteger  := AModel.NumeroPedido;
  FQuery.ParamByName('CodigoProduto').AsInteger := AModel.CodigoProduto;
  FQuery.ParamByName('Quantidade').AsInteger    := AModel.Quantidade;
  FQuery.ParamByName('ValorUnitario').AsCurrency := AModel.ValorUnitario;
  FQuery.ParamByName('ValorTotal').AsCurrency    := AModel.ValorTotal;
  FQuery.ExecSQL;
end;

end.
