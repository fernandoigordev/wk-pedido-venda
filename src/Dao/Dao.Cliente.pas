unit Dao.Cliente;

interface

uses
  Dao.Base, Model.Cliente, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TDaoCliente = class(TDAOBase<TModelCliente>)
  private
    FQuery: TFDQuery;
  public
    function GetAll: TObjectList<TModelCliente>; override;
    function GetById(AId: Integer): TModelCliente; override;
    procedure Insert(AModel: TModelCliente); override;
    procedure Update(AModel: TModelCliente); override;
    procedure Delete(AId: Integer); override;
  end;

implementation

uses
  Data.DB;

{ TDaoCliente }

procedure TDaoCliente.Delete(AId: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'DELETE FROM Cliente WHERE Codigo = :Codigo';
  FQuery.ParamByName('Codigo').AsInteger := AId;
  FQuery.ExecSQL;
end;

function TDaoCliente.GetAll: TObjectList<TModelCliente>;
var
  LModel: TModelCliente;
begin
  Result := TObjectList<TModelCliente>.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM Cliente';
    FQuery.Open;

    FQuery.First;
    while not FQuery.Eof do
    begin
      LModel := TModelCliente.Create;
      LModel.Codigo := FQuery.FieldByName('Codigo').AsInteger;
      LModel.Nome   := FQuery.FieldByName('Nome').AsString;
      LModel.Cidade := FQuery.FieldByName('Cidade').AsString;
      LModel.UF     := FQuery.FieldByName('UF').AsString;
      Result.Add(LModel);
      FQuery.Next;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TDaoCliente.GetById(AId: Integer): TModelCliente;
begin
  Result := TModelCliente.Create;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT * FROM Cliente WHERE Codigo = :Codigo';
    FQuery.ParamByName('Codigo').AsInteger := AId;
    FQuery.Open;

    if not FQuery.IsEmpty then
    begin
      Result.Codigo := FQuery.FieldByName('Codigo').AsInteger;
      Result.Nome   := FQuery.FieldByName('Nome').AsString;
      Result.Cidade := FQuery.FieldByName('Cidade').AsString;
      Result.UF     := FQuery.FieldByName('UF').AsString;
    end;
  except
    Result.Free;
    raise;
  end;
end;

procedure TDaoCliente.Insert(AModel: TModelCliente);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'INSERT INTO Cliente (Codigo, Nome, Cidade, UF) ' +
    'VALUES (:Codigo, :Nome, :Cidade, :UF)';

  FQuery.ParamByName('Codigo').AsInteger := AModel.Codigo;
  FQuery.ParamByName('Nome').AsString    := AModel.Nome;
  FQuery.ParamByName('Cidade').AsString  := AModel.Cidade;
  FQuery.ParamByName('UF').AsString      := AModel.UF;
  FQuery.ExecSQL;
end;

procedure TDaoCliente.Update(AModel: TModelCliente);
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'UPDATE Cliente SET Nome = :Nome, Cidade = :Cidade, UF = :UF ' +
    'WHERE Codigo = :Codigo';

  FQuery.ParamByName('Codigo').AsInteger := AModel.Codigo;
  FQuery.ParamByName('Nome').AsString    := AModel.Nome;
  FQuery.ParamByName('Cidade').AsString  := AModel.Cidade;
  FQuery.ParamByName('UF').AsString      := AModel.UF;
  FQuery.ExecSQL;
end;

end.

