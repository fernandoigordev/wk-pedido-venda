unit Controller.ItemPedidoVenda;

interface

uses
  Dao.ItemPedidoVenda;

type
  TControllerItemPedidoVenda = class
  private
    FDao: TDaoItemPedidoVenda;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Delete(AId: Integer);
  end;

implementation


{ TItemPedidoVenda }

constructor TControllerItemPedidoVenda.Create;
begin
  FDao := TDaoItemPedidoVenda.Create;
end;

procedure TControllerItemPedidoVenda.Delete(AId: Integer);
begin
  FDao.Delete(AId);
end;

destructor TControllerItemPedidoVenda.Destroy;
begin
  FDao.Free;
  inherited;
end;

end.
