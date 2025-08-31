unit View.ItemPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient;

type
  TViewItemPedidoVenda = class(TForm)
    PanelTitulo: TPanel;
    LabelTitulo: TLabel;
    PanelCadastroBottom: TPanel;
    PanelBotaoSalvar: TPanel;
    ShapeBotaoSalvar: TShape;
    SpeedButtonSalvar: TSpeedButton;
    PanelBotaoCancelar: TPanel;
    ShapeBotaoCancelar: TShape;
    SpeedButtonCancelar: TSpeedButton;
    PanelConteudo: TPanel;
    Label1: TLabel;
    DBEditCodigo: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBoxEstado: TDBLookupComboBox;
    dsProduto: TDataSource;
    dsItemPedido: TDataSource;
  private
    { Private declarations }
  public
    procedure SetCds(ACdsItemPedido, ACdsProduto: TClientDataSet);

  end;


implementation

{$R *.dfm}

{ TViewItemPedidoVenda }

procedure TViewItemPedidoVenda.SetCds(ACdsItemPedido, ACdsProduto: TClientDataSet);
begin
  dsItemPedido.DataSet := ACdsItemPedido;
  dsProduto.DataSet := ACdsProduto;
end;

end.
