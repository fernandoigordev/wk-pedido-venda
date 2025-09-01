unit View.ItemPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient;

type
  TTipoOperacao = (toInserir, toEditar);

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
    procedure DBEditCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Cancelar;
    procedure Salvar;
  public
    procedure SetCds(ACdsItemPedido, ACdsProduto: TClientDataSet; ATipoOperacao: TTipoOperacao);

  end;


implementation

{$R *.dfm}

{ TViewItemPedidoVenda }

procedure TViewItemPedidoVenda.DBEditCodigoExit(Sender: TObject);
begin
  dsItemPedido.DataSet.FieldByName('Quantidade').AsInteger := 1;
  dsItemPedido.DataSet.FieldByName('ValorUnitario').AsCurrency :=
  dsProduto.DataSet.FieldByName('PrecoVenda').AsCurrency;
end;

procedure TViewItemPedidoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cancelar;
end;

procedure TViewItemPedidoVenda.SetCds(ACdsItemPedido, ACdsProduto: TClientDataSet; ATipoOperacao: TTipoOperacao);
begin
  dsItemPedido.DataSet := ACdsItemPedido;
  dsProduto.DataSet := ACdsProduto;

  if ATipoOperacao = toInserir then
    dsItemPedido.DataSet.Append
  else
    dsItemPedido.DataSet.Edit;
end;

procedure TViewItemPedidoVenda.Salvar;
begin
  dsItemPedido.DataSet.FieldByName('ValorTotal').AsCurrency := dsItemPedido.DataSet.FieldByName('ValorUnitario').AsCurrency * dsItemPedido.DataSet.FieldByName('Quantidade').AsInteger;
  dsItemPedido.DataSet.Post;
end;

procedure TViewItemPedidoVenda.Cancelar;
begin
  if dsItemPedido.DataSet.State in dsEditModes then
    dsItemPedido.DataSet.Cancel;
end;

procedure TViewItemPedidoVenda.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TViewItemPedidoVenda.SpeedButtonSalvarClick(Sender: TObject);
begin
  Salvar;
  Close;
end;

end.
