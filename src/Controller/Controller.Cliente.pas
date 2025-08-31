unit Controller.Cliente;

interface

uses
  Model.Cliente, Dao.Base, Dao.Cliente, System.Generics.Collections;

type
  TControllerCliente = class
  private
    FDao: TDAOBase<TModelCliente>;
  public
    constructor Create;
    destructor Destroy;override;
    function GetAll: TObjectList<TModelCliente>;
  end;

implementation

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  FDao := TDaoCliente.Create;  
end;

destructor TControllerCliente.Destroy;
begin
  FDao.Free;
  inherited;
end;

function TControllerCliente.GetAll: TObjectList<TModelCliente>;
begin
  Result := FDao.GetAll;
end;

end.
