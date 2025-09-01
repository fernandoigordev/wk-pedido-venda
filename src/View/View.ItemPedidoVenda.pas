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
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
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
  dsItemPedido.DataSet.Append;
end;

procedure TViewItemPedidoVenda.SpeedButtonCancelarClick(Sender: TObject);
begin
  dsItemPedido.DataSet.Cancel;
  Close;
end;

procedure TViewItemPedidoVenda.SpeedButtonSalvarClick(Sender: TObject);
begin
  dsItemPedido.DataSet.Post;
  Close;
end;

end.
