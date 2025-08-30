unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  Datasnap.DBClient;

type
  TViewPedido = class(TForm)
    PanelTitulo: TPanel;
    LabelTitulo: TLabel;
    PageControlCadastro: TPageControl;
    TabSheetListagem: TTabSheet;
    PanelPesquisaTop: TPanel;
    PanelBotaoNovo: TPanel;
    ShapeBotaoNovo: TShape;
    SpeedButtonNovo: TSpeedButton;
    DBGridListagem: TDBGrid;
    TabSheetCadastro: TTabSheet;
    ScrollBoxCadastro: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    PanelCadastroBottom: TPanel;
    PanelBotaoSalvar: TPanel;
    ShapeBotaoSalvar: TShape;
    SpeedButtonSalvar: TSpeedButton;
    PanelBotaoCancelar: TPanel;
    ShapeBotaoCancelar: TShape;
    SpeedButtonCancelar: TSpeedButton;
    DBEditCodigo: TDBEdit;
    DBEditCodigoCliente: TDBEdit;
    DBLookupComboBoxEstado: TDBLookupComboBox;
    PanelDadosPedido: TPanel;
    PanelBotaoTop: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    cdsPedido: TClientDataSet;
    cdsItemPedido: TClientDataSet;
    cdsPedidoNumero: TIntegerField;
    cdsPedidoDataEmissao: TDateField;
    cdsPedidoCodigoCliente: TIntegerField;
    cdsPedidoValorTotal: TCurrencyField;
    cdsItemPedidoCodigo: TIntegerField;
    cdsItemPedidoNumeroPedido: TIntegerField;
    cdsItemPedidoCodigoProduto: TIntegerField;
    cdsItemPedidoQuantidade: TIntegerField;
    cdsItemPedidoValorUnitario: TCurrencyField;
    cdsItemPedidoValorTotal: TCurrencyField;
    cdsCliente: TClientDataSet;
    cdsClienteCodigo: TIntegerField;
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    dsCliente: TDataSource;
    cdsClienteDescricao: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure AbreTelaItemPedido;
  public
    { Public declarations }
  end;

var
  ViewPedido: TViewPedido;

implementation

uses
  View.ItemPedidoVenda;

{$R *.dfm}

procedure TViewPedido.AbreTelaItemPedido;
var
  LViewItemPedidoVenda: TViewItemPedidoVenda;
begin
  LViewItemPedidoVenda := TViewItemPedidoVenda.Create(nil);
  try
    LViewItemPedidoVenda.SetCdsItemPedido(cdsItemPedido);
    LViewItemPedidoVenda.ShowModal;
  finally
    LViewItemPedidoVenda.Free;
  end;
end;

procedure TViewPedido.SpeedButton1Click(Sender: TObject);
begin
  AbreTelaItemPedido;
end;

end.
