program wk_pedido_venda;

uses
  Vcl.Forms,
  View.PedidoVenda in 'src\View\View.PedidoVenda.pas' {ViewPedido},
  View.ItemPedidoVenda in 'src\View\View.ItemPedidoVenda.pas' {ViewItemPedidoVenda},
  Dao.Base in 'src\Dao\Dao.Base.pas',
  Dao.PedidoVenda in 'src\Dao\Dao.PedidoVenda.pas',
  Model.Connection in 'src\Model\Model.Connection.pas' {ModelConnection: TDataModule},
  Model.PedidoVenda in 'src\Model\Model.PedidoVenda.pas',
  Controller.PedidoVenda in 'src\Controller\Controller.PedidoVenda.pas',
  Dao.ItemPedidoVenda in 'src\Dao\Dao.ItemPedidoVenda.pas',
  Model.ItemPedidoVenda in 'src\Model\Model.ItemPedidoVenda.pas',
  Dao.Cliente in 'src\Dao\Dao.Cliente.pas',
  Model.Cliente in 'src\Model\Model.Cliente.pas',
  Model.Produto in 'src\Model\Model.Produto.pas',
  Dao.Produto in 'src\Dao\Dao.Produto.pas',
  Controller.Cliente in 'src\Controller\Controller.Cliente.pas',
  Controller.Produto in 'src\Controller\Controller.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPedido, ViewPedido);
  Application.Run;
end.
