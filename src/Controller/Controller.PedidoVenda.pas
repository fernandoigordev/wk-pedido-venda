unit Controller.PedidoVenda;

interface

uses
  Model.PedidoVenda, Dao.Base, Dao.PedidoVenda, System.Generics.Collections;

type
  TControllerPedidoVenda = class
  private
    FDao: TDAOBase<TModelPedidoVenda>;
  public
    constructor Create;
    destructor Destroy;override;

    function GetAll: TObjectList<TModelPedidoVenda>;
    function GetById(AId: Integer): TModelPedidoVenda;
    procedure Insert(AModel: TModelPedidoVenda);
    procedure Update(AModel: TModelPedidoVenda);
    procedure Delete(AId: Integer);
  end;

implementation

{ TControllerPedidoVenda }

constructor TControllerPedidoVenda.Create;
begin
  FDao := TDaoPedidoVenda.Create;
end;

procedure TControllerPedidoVenda.Delete(AId: Integer);
begin
  FDao.Delete(AId);
end;

destructor TControllerPedidoVenda.Destroy;
begin
  FDao.Free;
  inherited;
end;

function TControllerPedidoVenda.GetAll: TObjectList<TModelPedidoVenda>;
begin
  Result := FDao.GetAll;
end;

function TControllerPedidoVenda.GetById(AId: Integer): TModelPedidoVenda;
begin
  Result := FDao.GetById(AId);
end;

procedure TControllerPedidoVenda.Insert(AModel: TModelPedidoVenda);
begin
  FDao.Insert(AModel);
end;

procedure TControllerPedidoVenda.Update(AModel: TModelPedidoVenda);
begin
  FDao.Update(AModel);
end;

end.
