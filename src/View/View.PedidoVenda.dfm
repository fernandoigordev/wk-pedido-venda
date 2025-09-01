object ViewPedido: TViewPedido
  Left = 0
  Top = 0
  Caption = 'dsItemPedido'
  ClientHeight = 441
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PanelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 50
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Clientes'
    Color = 16750083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    Padding.Left = 20
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    object LabelTitulo: TLabel
      Left = 20
      Top = 0
      Width = 744
      Height = 50
      Align = alClient
      Caption = 'Pedido de venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 143
      ExplicitHeight = 23
    end
  end
  object PageControlCadastro: TPageControl
    Left = 0
    Top = 50
    Width = 764
    Height = 391
    ActivePage = TabSheetCadastro
    Align = alClient
    TabOrder = 1
    object TabSheetListagem: TTabSheet
      Caption = 'TabSheetListagem'
      TabVisible = False
      object PanelPesquisaTop: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object PanelBotaoNovo: TPanel
          AlignWithMargins = True
          Left = 623
          Top = 3
          Width = 120
          Height = 34
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 0
          object ShapeBotaoNovo: TShape
            Left = 0
            Top = 0
            Width = 120
            Height = 34
            Align = alClient
            Brush.Color = 7325480
            Pen.Color = 7325480
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 144
            ExplicitTop = -8
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object SpeedButtonNovo: TSpeedButton
            Left = 0
            Top = 0
            Width = 120
            Height = 34
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Novo'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButtonNovoClick
            ExplicitLeft = 136
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object DBGridListagem: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 43
        Width = 750
        Height = 335
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = dsPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgMultiSelect, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        OnKeyPress = DBGridListagemKeyPress
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Numero'
            Title.Caption = 'N'#250'mero'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCliente'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'DataEmissao'
            Title.Alignment = taRightJustify
            Title.Caption = 'Data de emiss'#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Total'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 138
            Visible = True
          end>
      end
    end
    object TabSheetCadastro: TTabSheet
      Caption = 'TabSheetCadastro'
      ImageIndex = 1
      TabVisible = False
      object ScrollBoxCadastro: TScrollBox
        Left = 0
        Top = 0
        Width = 756
        Height = 381
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object PanelCadastroBottom: TPanel
          Left = 0
          Top = 341
          Width = 756
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          Padding.Right = 10
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object PanelBotaoSalvar: TPanel
            AlignWithMargins = True
            Left = 623
            Top = 3
            Width = 120
            Height = 34
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel1'
            TabOrder = 0
            object ShapeBotaoSalvar: TShape
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Align = alClient
              Brush.Color = 7325480
              Pen.Color = 7325480
              Pen.Style = psClear
              Shape = stRoundRect
              ExplicitLeft = 144
              ExplicitTop = -8
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object SpeedButtonSalvar: TSpeedButton
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Cursor = crHandPoint
              Align = alClient
              Caption = 'Salvar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Roboto'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButtonSalvarClick
              ExplicitLeft = 136
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object PanelBotaoCancelar: TPanel
            AlignWithMargins = True
            Left = 490
            Top = 3
            Width = 120
            Height = 34
            Margins.Right = 10
            Align = alRight
            BevelOuter = bvNone
            Caption = 'PanelBotaoCancelar'
            TabOrder = 1
            object ShapeBotaoCancelar: TShape
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Align = alClient
              Brush.Color = 7094774
              Pen.Color = 7325480
              Pen.Style = psClear
              Shape = stRoundRect
              ExplicitLeft = 144
              ExplicitTop = -8
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object SpeedButtonCancelar: TSpeedButton
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Cursor = crHandPoint
              Align = alClient
              Caption = 'Cancelar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Roboto'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButtonCancelarClick
              ExplicitLeft = 136
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object PanelDadosPedido: TPanel
          Left = 0
          Top = 0
          Width = 756
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 13
            Width = 58
            Height = 21
            Caption = 'Numero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 135
            Top = 13
            Width = 48
            Height = 21
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object DBEditCodigo: TDBEdit
            Left = 16
            Top = 36
            Width = 100
            Height = 29
            DataField = 'Numero'
            DataSource = dsPedido
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEditCodigoCliente: TDBEdit
            Left = 135
            Top = 36
            Width = 48
            Height = 29
            DataField = 'CodigoCliente'
            DataSource = dsPedido
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 1
          end
          object DBLookupComboBoxCliente: TDBLookupComboBox
            Left = 189
            Top = 36
            Width = 554
            Height = 29
            DataField = 'CodigoCliente'
            DataSource = dsPedido
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            KeyField = 'Codigo'
            ListField = 'Descricao'
            ListSource = dsCliente
            ParentFont = False
            TabOrder = 2
          end
        end
        object PanelBotaoTop: TPanel
          Left = 0
          Top = 81
          Width = 756
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          Padding.Right = 10
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          object Label3: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 136
            Height = 34
            Margins.Left = 5
            Align = alLeft
            Caption = 'Produtos do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12434877
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 21
          end
          object Panel2: TPanel
            AlignWithMargins = True
            Left = 623
            Top = 3
            Width = 120
            Height = 34
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel1'
            TabOrder = 0
            object Shape1: TShape
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Align = alClient
              Brush.Color = 16750083
              Pen.Color = 7325480
              Pen.Style = psClear
              Shape = stRoundRect
              ExplicitLeft = 144
              ExplicitTop = -8
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 0
              Width = 120
              Height = 34
              Cursor = crHandPoint
              Align = alClient
              Caption = '+ Adicionar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Roboto'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButton1Click
              ExplicitLeft = 136
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object DBGridItemPedido: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 124
          Width = 750
          Height = 174
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          DataSource = dsItemPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgMultiSelect, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Roboto'
          TitleFont.Style = []
          OnKeyPress = DBGridItemPedidoKeyPress
          Columns = <
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'Codigo'
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoProduto'
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 302
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Title.Alignment = taRightJustify
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorUnitario'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorTotal'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 112
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 0
          Top = 301
          Width = 756
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          Padding.Right = 10
          ParentBackground = False
          ShowCaption = False
          TabOrder = 4
          ExplicitTop = 81
          object Label5: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 115
            Height = 34
            Margins.Left = 5
            Margins.Right = 20
            Align = alLeft
            Caption = 'Total do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12434877
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 490
          end
          object DBEdit1: TDBEdit
            Left = 140
            Top = 0
            Width = 121
            Height = 40
            Align = alLeft
            BorderStyle = bsNone
            DataField = 'TotalItens'
            DataSource = dsItemPedido
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 625
          end
        end
      end
    end
  end
  object cdsPedido: TClientDataSet
    PersistDataPacket.Data = {
      7A0000009619E0BD0100000018000000040000000000030000007A00064E756D
      65726F04000100000000000B44617461456D697373616F04000600000000000D
      436F6469676F436C69656E746504000100000000000A56616C6F72546F74616C
      080004000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'DataEmissao'
        DataType = ftDate
      end
      item
        Name = 'CodigoCliente'
        DataType = ftInteger
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 256
    object cdsPedidoNumero: TIntegerField
      FieldName = 'Numero'
    end
    object cdsPedidoDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object cdsPedidoCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object cdsPedidoValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object cdsPedidoDescricaoCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoCliente'
      LookupDataSet = cdsCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CodigoCliente'
      Size = 60
      Lookup = True
    end
  end
  object cdsItemPedido: TClientDataSet
    PersistDataPacket.Data = {
      B80000009619E0BD010000001800000006000000000003000000B80006436F64
      69676F04000100000000000C4E756D65726F50656469646F0400010000000000
      0D436F6469676F50726F6475746F04000100000000000A5175616E7469646164
      6504000100000000000D56616C6F72556E69746172696F080004000000010007
      535542545950450200490006004D6F6E6579000A56616C6F72546F74616C0800
      04000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'NumeroPedido'
        DataType = ftInteger
      end
      item
        Name = 'CodigoProduto'
        DataType = ftInteger
      end
      item
        Name = 'Quantidade'
        DataType = ftInteger
      end
      item
        Name = 'ValorUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    IndexFieldNames = 'NumeroPedido'
    MasterFields = 'Numero'
    MasterSource = dsPedido
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 256
    object cdsItemPedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsItemPedidoNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object cdsItemPedidoCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object cdsItemPedidoQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object cdsItemPedidoValorUnitario: TCurrencyField
      FieldName = 'ValorUnitario'
    end
    object cdsItemPedidoValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object cdsItemPedidoDescricaoProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoProduto'
      LookupDataSet = cdsProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CodigoProduto'
      Size = 60
      Lookup = True
    end
    object cdsItemPedidoPrecoDoProduto: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'PrecoDoProduto'
      LookupDataSet = cdsProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'PrecoVenda'
      KeyFields = 'CodigoProduto'
      Lookup = True
    end
    object cdsItemPedidoTotalItens: TAggregateField
      FieldName = 'TotalItens'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(Quantidade * ValorTotal)'
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 64
    Top = 312
  end
  object dsItemPedido: TDataSource
    DataSet = cdsItemPedido
    Left = 152
    Top = 312
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 240
    Top = 312
  end
  object cdsProduto: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E0006436F64
      69676F04000100000000000A507265636F56656E646108000400000001000753
      5542545950450200490006004D6F6E6579000944657363726963616F01004900
      00000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'PrecoVenda'
        DataType = ftCurrency
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 256
    object cdsProdutoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsProdutoPrecoVenda: TCurrencyField
      FieldName = 'PrecoVenda'
    end
    object cdsProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      470000009619E0BD010000001800000002000000000003000000470006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 256
    object cdsClienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsClienteDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
  end
end
