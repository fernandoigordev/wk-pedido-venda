unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  Datasnap.DBClient, Model.ItemPedidoVenda, System.Generics.Collections,
  Controller.PedidoVenda, Model.PedidoVenda, View.ItemPedidoVenda;

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
    PanelDadosPedido: TPanel;
    PanelBotaoTop: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    DBGridItemPedido: TDBGrid;
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
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    dsCliente: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoCodigo: TIntegerField;
    cdsProdutoPrecoVenda: TCurrencyField;
    cdsCliente: TClientDataSet;
    cdsClienteCodigo: TIntegerField;
    cdsClienteDescricao: TStringField;
    cdsPedidoDescricaoCliente: TStringField;
    DBLookupComboBoxCliente: TDBLookupComboBox;
    cdsItemPedidoDescricaoProduto: TStringField;
    cdsItemPedidoPrecoDoProduto: TCurrencyField;
    cdsProdutoDescricao: TStringField;
    Panel1: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    cdsItemPedidoTotalItens: TAggregateField;
    Panel3: TPanel;
    PanelExcluirPedido: TPanel;
    Shape3: TShape;
    SpeedButton3: TSpeedButton;
    PanelCarregarPedido: TPanel;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridItemPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridListagemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditCodigoClienteChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FControllerPedidoVenda: TControllerPedidoVenda;
    procedure PreencheCdsProduto;
    procedure PreencheCdsCliente;
    procedure PreencheCdsPedido;
    procedure PreencheCdsItemPedido(AListaItem: TObjectList<TModelItemPedidoVenda>);
    Procedure PopulaPedido(APedido: TModelPedidoVenda);
    procedure DeleteItemPedidoVenda(ACodigo: Integer);
    procedure HabilitaBotoesAcao;

    procedure ListarPedidos;
    procedure AbreTelaItemPedido(ATipoOperacao: TTipoOperacao);
    procedure MudarAba(ATabSheet: TTabSheet);
    function Valida: Boolean;
    function GetCodigoPedido: Integer;
  public
    { Public declarations }
  end;

var
  ViewPedido: TViewPedido;

implementation

uses
  Controller.Cliente, Model.Cliente, Controller.Produto, Model.Produto,
  Controller.ItemPedidoVenda, System.UITypes;

{$R *.dfm}

procedure TViewPedido.AbreTelaItemPedido(ATipoOperacao: TTipoOperacao);
var
  LViewItemPedidoVenda: TViewItemPedidoVenda;
begin
  LViewItemPedidoVenda := TViewItemPedidoVenda.Create(Self);
  try
    LViewItemPedidoVenda.SetCds(cdsItemPedido, cdsProduto, ATipoOperacao);
    LViewItemPedidoVenda.ShowModal;
  finally
    LViewItemPedidoVenda.Free;
  end;
end;

procedure TViewPedido.DBEditCodigoClienteChange(Sender: TObject);
begin
  HabilitaBotoesAcao;
end;

procedure TViewPedido.DBGridItemPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    if cdsItemPedido.RecordCount > 0 then
    begin
      AbreTelaItemPedido(toEditar);
    end;
  end
  else if Key = vkDelete then
  begin
    if MessageDlg('Deseja realmente excluir o Item: ' + cdsItemPedidoCodigo.AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if not (cdsItemPedido.State in [dsEdit, dsInsert]) then
      begin
        DeleteItemPedidoVenda(cdsItemPedidoCodigo.AsInteger);
        cdsItemPedido.Delete;
      end;
    end;
  end;
end;

procedure TViewPedido.DBGridListagemKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    if cdsPedido.RecordCount > 0 then
    begin
      cdsPedido.Edit;
      MudarAba(TabSheetCadastro);
    end;
  end
  else if Key = vkDelete then
  begin
    if MessageDlg('Deseja realmente excluir o pedido de número: ' + cdsPedidoNumero.AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if not (cdsPedido.State in [dsEdit, dsInsert]) then
      begin
        FControllerPedidoVenda.Delete(cdsPedidoNumero.AsInteger);
        ListarPedidos;
      end;
    end;
  end;
end;

procedure TViewPedido.DeleteItemPedidoVenda(ACodigo: Integer);
var
  LControllerItemPedido: TControllerItemPedidoVenda;
begin
  LControllerItemPedido := TControllerItemPedidoVenda.Create;
  try
    LControllerItemPedido.Delete(ACodigo);
  finally
    LControllerItemPedido.Free;
  end;
end;

procedure TViewPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerPedidoVenda.Free;
end;

procedure TViewPedido.FormCreate(Sender: TObject);
begin
  FControllerPedidoVenda := TControllerPedidoVenda.Create;
  ListarPedidos;
  MudarAba(TabSheetListagem);
end;

function TViewPedido.GetCodigoPedido: Integer;
var
  LCodigoPedido: String;
begin
  Result := 0;
  if InputQuery('Consulta de Pedido', 'Digite o código do Pedido:', LCodigoPedido) then
  begin
    Result := StrToIntDef(LCodigoPedido, 0);
    if Result <= 0 then
      ShowMessage('O Código digitado é inválido.');
  end
  else
    ShowMessage('Operação cancelada pelo usuário.');
end;

procedure TViewPedido.HabilitaBotoesAcao;
var
  LHabilitaBotoes: Boolean;
begin
  LHabilitaBotoes := DBEditCodigoCliente.Text = EmptyStr;
  PanelCarregarPedido.Enabled := LHabilitaBotoes;
  PanelExcluirPedido.Enabled := LHabilitaBotoes;
end;

procedure TViewPedido.ListarPedidos;
begin
  PreencheCdsCliente;
  PreencheCdsProduto;
  PreencheCdsPedido;
end;

procedure TViewPedido.MudarAba(ATabSheet: TTabSheet);
begin
  PageControlCadastro.ActivePage := ATabSheet;
end;

procedure TViewPedido.PopulaPedido(APedido: TModelPedidoVenda);
var
  LItemPedido: TModelItemPedidoVenda;
begin
  APedido.Numero := cdsPedidoNumero.AsInteger;
  if cdsPedidoDataEmissao.AsDateTime > 0 then
    Apedido.DataEmissao := cdsPedidoDataEmissao.AsDateTime
  else
    Apedido.DataEmissao := Now;
  Apedido.CodigoCliente := cdsPedidoCodigoCliente.AsInteger;
  Apedido.ValorTotal := cdsItemPedidoTotalItens.Value;

  cdsItemPedido.First;
  while not cdsItemPedido.Eof do
  begin
    LItemPedido := TModelItemPedidoVenda.Create;
    LItemPedido.Codigo := cdsItemPedidoCodigo.AsInteger;
    LItemPedido.NumeroPedido := cdsItemPedidoNumeroPedido.AsInteger;
    LItemPedido.CodigoProduto := cdsItemPedidoCodigoProduto.AsInteger;
    LItemPedido.Quantidade := cdsItemPedidoQuantidade.AsInteger;
    LItemPedido.ValorUnitario := cdsItemPedidoValorUnitario.AsCurrency;
    LItemPedido.ValorTotal := cdsItemPedidoValorTotal.AsCurrency;
    Apedido.Itens.Add(LItemPedido);
    cdsItemPedido.Next;
  end;
end;

procedure TViewPedido.PreencheCdsCliente;
var
  LControllerCliente: TControllerCliente;
  LListaClientes: TObjectList<TModelCliente>;
  LCliente: TModelCliente;
begin
  cdsCliente.EmptyDataSet;
  LControllerCliente := TControllerCliente.Create;
  try
    LListaClientes := LControllerCliente.GetAll;
    try
      for LCliente in LListaClientes do
      begin
        cdsCliente.Append;
        cdsClienteCodigo.AsInteger := LCliente.Codigo;
        cdsClienteDescricao.AsString := LCliente.Nome;
        cdsCliente.Post;
      end;
    finally
      LListaClientes.Free;
    end;
  finally
    LControllerCliente.Free;
  end;
end;

procedure TViewPedido.PreencheCdsItemPedido(AListaItem: TObjectList<TModelItemPedidoVenda>);
var
  LModel: TModelItemPedidoVenda;
begin
  for LModel in AListaItem do
  begin
    cdsItemPedido.Append;
    cdsItemPedidoCodigo.AsInteger := LModel.Codigo;
    cdsItemPedidoNumeroPedido.AsInteger := LModel.NumeroPedido;
    cdsItemPedidoCodigoProduto.AsInteger := LModel.CodigoProduto;
    cdsItemPedidoQuantidade.AsInteger := LModel.Quantidade;
    cdsItemPedidoValorUnitario.AsCurrency := LModel.ValorUnitario;
    cdsItemPedidoValorTotal.AsCurrency := LModel.ValorTotal;
    cdsItemPedido.Post;
  end;
end;

procedure TViewPedido.PreencheCdsPedido;
var
  LListaPedido: TObjectList<TModelPedidoVenda>;
  LPedido: TModelPedidoVenda;
begin
  cdsPedido.EmptyDataSet;
  cdsItemPedido.EmptyDataSet;

  LListaPedido := FControllerPedidoVenda.GetAll;
  try
    for LPedido in LListaPedido do
    begin
      cdsPedido.Append;
      cdsPedidoNumero.AsInteger := LPedido.Numero;
      cdsPedidoDataEmissao.AsDateTime := LPedido.DataEmissao;
      cdsPedidoCodigoCliente.AsInteger := LPedido.CodigoCliente;
      cdsPedidoValorTotal.AsCurrency := LPedido.ValorTotal;
      cdsPedido.Post;
      PreencheCdsItemPedido(LPedido.Itens);
    end;
  finally
    LListaPedido.Free;
  end;
end;

procedure TViewPedido.PreencheCdsProduto;
var
  LControllerProduto: TControllerProduto;
  LListaProduto: TObjectList<TModelProduto>;
  LProduto: TModelProduto;
begin
  cdsProduto.EmptyDataSet;
  LControllerProduto := TControllerProduto.Create;
  try
    LListaProduto := LControllerProduto.GetAll;
    try
      for LProduto in LListaProduto do
      begin
        cdsProduto.Append;
        cdsProdutoCodigo.AsInteger := LProduto.Codigo;
        cdsProdutoDescricao.AsString := LProduto.Descricao;
        cdsProdutoPrecoVenda.AsCurrency := LProduto.PrecoVenda;
        cdsProduto.Post;
      end;
    finally
      LListaProduto.Free;
    end;
  finally
    LControllerProduto.Free;
  end;
end;

procedure TViewPedido.SpeedButton1Click(Sender: TObject);
begin
  AbreTelaItemPedido(toInserir);
end;

procedure TViewPedido.SpeedButton2Click(Sender: TObject);
var
  LCodigoPedido: Integer;
begin
  LCodigoPedido := GetCodigoPedido;
  if LCodigoPedido > 0 then
  begin
    if MessageDlg('Deseja realmente carregar o Pedido: ' + LCodigoPedido.ToString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if cdsPedido.State in dsEditModes then
      begin
        cdsPedido.Cancel;
        if cdsPedido.Locate('Numero', LCodigoPedido, []) then
          cdsPedido.Edit
        else
        begin
          cdsPedido.Append;
          TaskMessageDlg('Pedido N° ' + LCodigoPedido.ToString , 'O Pedido não foi localizado.', mtError, [mbOK], 0);
        end;
      end;
    end;
  end;
end;

procedure TViewPedido.SpeedButton3Click(Sender: TObject);
var
  LCodigoPedido: Integer;
begin
  LCodigoPedido := GetCodigoPedido;
  if LCodigoPedido > 0 then
  begin
    if MessageDlg('Deseja realmente excluir o Pedido: ' + LCodigoPedido.ToString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FControllerPedidoVenda.Delete(LCodigoPedido);
    end;
  end;
end;

procedure TViewPedido.SpeedButtonCancelarClick(Sender: TObject);
begin
  cdsPedido.Cancel;
  ListarPedidos;
  MudarAba(TabSheetListagem);
end;

procedure TViewPedido.SpeedButtonNovoClick(Sender: TObject);
begin
  cdsPedido.Append;
  MudarAba(TabSheetCadastro);
end;

procedure TViewPedido.SpeedButtonSalvarClick(Sender: TObject);
var
  LModel: TModelPedidoVenda;
begin
  if Valida then
  Begin
    cdsPedido.Post;

    LModel := TModelPedidoVenda.Create;
    try
      PopulaPedido(LModel);
      if LModel.Numero > 0 then
        FControllerPedidoVenda.Update(LModel)
      else
        FControllerPedidoVenda.Insert(LModel);
    finally
      LModel.Free;
    end;

    ListarPedidos;
    MudarAba(TabSheetListagem);
  End;
end;

function TViewPedido.Valida: Boolean;
begin
  Result := True;

  if DBLookupComboBoxCliente.Text.IsEmpty then
  begin
    TaskMessageDlg('Validação', 'Cliente inválido! Verifique o código informado.',
                   mtError, [mbOK], 0);
    DBEditCodigoCliente.SetFocus;
    Exit(False);
  end;

  if cdsItemPedido.IsEmpty then
  begin
    TaskMessageDlg('Validação', 'Número de itens do pedido inválido! O Pedido precisa ter ao menos um item.',
                   mtError, [mbOK], 0);
    DBGridItemPedido.SetFocus;
    Exit(False);
  end;
end;

end.
