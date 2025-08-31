unit Controller.Produto;

interface

uses
  Model.Produto, Dao.Base, Dao.Produto, System.Generics.Collections;

type
  TControllerProduto = class
  private
    FDao: TDAOBase<TModelProduto>;
  public
    constructor Create;
    destructor Destroy;override;
    function GetAll: TObjectList<TModelProduto>;
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  FDao := TDaoProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  FDao.Free;
  inherited;
end;

function TControllerProduto.GetAll: TObjectList<TModelProduto>;
begin
  Result := FDao.GetAll;
end;

end.
