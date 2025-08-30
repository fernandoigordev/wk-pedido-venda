program wk_pedido_venda;

uses
  Vcl.Forms,
  View.PedidoVenda in 'src\View\View.PedidoVenda.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
