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
    DBEditQuantidade: TDBEdit;
    Label3: TLabel;
    DBEditValorUnitario: TDBEdit;
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
    function Valida: Boolean;
  public
    procedure SetCds(ACdsItemPedido, ACdsProduto: TClientDataSet; ATipoOperacao: TTipoOperacao);

  end;


implementation

uses
  System.UITypes;

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

  DBEditCodigo.Enabled := ATipoOperacao = toInserir;
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
  if Valida then
  begin
    Salvar;
    Close;
  end;
end;

function TViewItemPedidoVenda.Valida: Boolean;
begin
  Result := True;

  if DBLookupComboBoxEstado.Text.IsEmpty then
  begin
    TaskMessageDlg('Validação', 'Produto inválido! Verifique o código informado.',
                   mtError, [mbOK], 0);
    DBEditCodigo.SetFocus;
    Exit(False);
  end;

  if StrToIntDef(DBEditQuantidade.Text, 0) <= 0 then
  begin
    TaskMessageDlg('Validação', 'Quantidade inválida! Quantidade precisa ser maior que 0.',
                   mtError, [mbOK], 0);
    DBEditQuantidade.SetFocus;
    Exit(False);
  end;

  if StrToFloatDef(StringReplace(DBEditValorUnitario.Text, 'R$', '', [rfReplaceAll]).trim, 0) <= 0 then
  begin
    TaskMessageDlg('Validação', 'Preço inválido! Preço precisa ser maior que 0.',
                   mtError, [mbOK], 0);
    DBEditValorUnitario.SetFocus;
    Exit(False);
  end;



end;

end.
