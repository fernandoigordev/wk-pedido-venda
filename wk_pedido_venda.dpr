program wk_pedido_venda;

uses
  Vcl.Forms,
  View.PedidoVenda in 'src\View\View.PedidoVenda.pas' {ViewPedido},
  View.ItemPedidoVenda in 'src\View\View.ItemPedidoVenda.pas' {ViewItemPedidoVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPedido, ViewPedido);
  Application.Run;
end.
