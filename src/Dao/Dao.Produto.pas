unit Dao.Produto;

interface

uses
  Dao.Base, Model.Produto, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TDaoProduto = class(TDAOBase<TModelProduto>)
  private
    FQuery: TFDQuery;
  public
    function GetAll: TObjectList<TModelProduto>; override;
    function GetById(AId: Integer): TModelProduto; override;
    procedure Insert(AModel: TModelProduto); override;
    procedure Update(AModel: TModelProduto); override;
    procedure Delete(AId: Integer); override;
  end;

implementation

uses
  Data.DB;

{ TDaoProduto }

procedure TDaoProduto.Delete(AId: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'DELETE FROM Produto WHERE Codigo = :Codigo';
  FQuery.ParamByName('Codigo').AsInteger := AId;
  FQuery.ExecSQL;
end;

function TDaoProduto.GetAll: TObjectList<TModelProduto>;
var
  LModel: TModelProduto;
begin
  Result := TObjectList<TModelProduto>.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM Produto';
    FQuery.Open;

    FQuery.First;
    while not FQuery.Eof do
    begin
      LModel := TModelProduto.Create;
      LModel.Codigo     := FQuery.FieldByName('Codigo').AsInteger;
      LModel.Descricao  := FQuery.FieldByName('Descricao').AsString;
      LModel.PrecoVenda := FQuery.FieldByName('PrecoVenda').AsCurrency;
      Result.Add(LModel);
      FQuery.Next;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TDaoProduto.GetById(AId: Integer): TModelProduto;
begin
  Result := TModelProduto.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM Produto WHERE Codigo = :Codigo';
    FQuery.ParamByName('Codigo').AsInteger := AId;
    FQuery.Open;

    if not FQuery.IsEmpty then
    begin
      Result.Codigo     := FQuery.FieldByName('Codigo').AsInteger;
      Result.Descricao  := FQuery.FieldByName('Descricao').AsString;
      Result.PrecoVenda := FQuery.FieldByName('PrecoVenda').AsCurrency;
    end;
  except
    Result.Free;
    raise;
  end;
end;

procedure TDaoProduto.Insert(AModel: TModelProduto);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'INSERT INTO Produto (Codigo, Descricao, PrecoVenda) ' +
    'VALUES (:Codigo, :Descricao, :PrecoVenda)';

  FQuery.ParamByName('Codigo').AsInteger     := AModel.Codigo;
  FQuery.ParamByName('Descricao').AsString   := AModel.Descricao;
  FQuery.ParamByName('PrecoVenda').AsCurrency := AModel.PrecoVenda;
  FQuery.ExecSQL;
end;

procedure TDaoProduto.Update(AModel: TModelProduto);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'UPDATE Produto SET Descricao = :Descricao, PrecoVenda = :PrecoVenda ' +
    'WHERE Codigo = :Codigo';

  FQuery.ParamByName('Codigo').AsInteger     := AModel.Codigo;
  FQuery.ParamByName('Descricao').AsString   := AModel.Descricao;
  FQuery.ParamByName('PrecoVenda').AsCurrency := AModel.PrecoVenda;
  FQuery.ExecSQL;
end;

end.

