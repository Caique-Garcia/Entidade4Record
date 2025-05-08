object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 534
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clGray
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object PageControl: TPageControl
    Left = 0
    Top = 24
    Width = 627
    Height = 512
    ActivePage = Conexao
    TabOrder = 0
    object Conexao: TTabSheet
      Caption = 'Conex'#227'o'
      object PanelContainer: TPanel
        Left = 0
        Top = 0
        Width = 619
        Height = 480
        Align = alClient
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        object PanelOpc: TPanel
          Left = 0
          Top = 0
          Width = 177
          Height = 480
          Align = alLeft
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object Label1: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 10
            Width = 171
            Height = 17
            Margins.Top = 10
            Margins.Bottom = 5
            Align = alTop
            Alignment = taCenter
            Caption = 'Op'#231#245'es'
            ExplicitWidth = 45
          end
          object BtnConectar: TButton
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 167
            Height = 41
            Cursor = crHandPoint
            Hint = 'Conectar ao banco de dados'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alTop
            Caption = 'Conectar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BtnConectarClick
          end
          object btnSair: TButton
            AlignWithMargins = True
            Left = 5
            Top = 434
            Width = 167
            Height = 41
            Cursor = crHandPoint
            Hint = 'Sair do programa'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alBottom
            Caption = 'Sair'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnSairClick
          end
          object BtnStart: TButton
            AlignWithMargins = True
            Left = 5
            Top = 88
            Width = 167
            Height = 41
            Cursor = crHandPoint
            Hint = 'Conectar ao banco de dados'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alTop
            Caption = 'Start'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BtnStartClick
          end
        end
        object PanelCorpo: TPanel
          Left = 177
          Top = 0
          Width = 442
          Height = 480
          Align = alClient
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          object PanelDados: TPanel
            Left = 0
            Top = 0
            Width = 442
            Height = 229
            Align = alTop
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object Shape1: TShape
              Left = 6
              Top = 38
              Width = 416
              Height = 188
              Brush.Style = bsClear
              Pen.Color = clGray
              Pen.Style = psInsideFrame
            end
            object Label2: TLabel
              Left = 81
              Top = 155
              Width = 38
              Height = 17
              Caption = 'Senha:'
            end
            object Label3: TLabel
              Left = 78
              Top = 186
              Width = 41
              Height = 17
              Caption = 'Tabela:'
            end
            object Label4: TLabel
              Left = 86
              Top = 126
              Width = 33
              Height = 17
              Caption = 'Local:'
            end
            object Label5: TLabel
              Left = 71
              Top = 93
              Width = 48
              Height = 17
              Caption = 'Usuario:'
            end
            object Label6: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 6
              Width = 436
              Height = 17
              Margins.Top = 6
              Align = alTop
              Alignment = taCenter
              Caption = 'Configura'#231#227'o Banco'
              ExplicitWidth = 117
            end
            object Label9: TLabel
              Left = 81
              Top = 62
              Width = 38
              Height = 17
              Caption = 'Banco:'
            end
            object EditSenha: TEdit
              Left = 134
              Top = 152
              Width = 235
              Height = 25
              PasswordChar = '*'
              TabOrder = 2
            end
            object EditTabela: TEdit
              Left = 134
              Top = 183
              Width = 235
              Height = 25
              TabOrder = 3
            end
            object EditLocal: TEdit
              Left = 134
              Top = 121
              Width = 235
              Height = 25
              TabOrder = 1
              Text = 'localhost'
            end
            object EditUsuario: TEdit
              Left = 134
              Top = 90
              Width = 235
              Height = 25
              TabOrder = 0
              Text = 'root'
            end
            object EditBanco: TEdit
              Left = 134
              Top = 59
              Width = 235
              Height = 25
              TabOrder = 4
            end
          end
          object PanelMemoLog: TPanel
            Left = 0
            Top = 229
            Width = 442
            Height = 251
            Align = alClient
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            object LabelStatusBanco: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 15
              Width = 436
              Height = 17
              Margins.Top = 15
              Align = alTop
              Alignment = taCenter
              Caption = 'Banco de dados conectado!'
              Font.Charset = ANSI_CHARSET
              Font.Color = 9551480
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              Visible = False
              ExplicitWidth = 164
            end
          end
        end
      end
    end
    object Resultado: TTabSheet
      Caption = 'Resultado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 177
        Height = 480
        Align = alLeft
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 10
          Width = 171
          Height = 17
          Margins.Top = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Op'#231#245'es'
          ExplicitWidth = 45
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 5
          Top = 35
          Width = 167
          Height = 41
          Cursor = crHandPoint
          Hint = 'Conectar ao banco de dados'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Exportar '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BtnConectarClick
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 5
          Top = 434
          Width = 167
          Height = 41
          Cursor = crHandPoint
          Hint = 'Sair do programa'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alBottom
          Caption = 'Sair'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSairClick
        end
        object BtnVoltar: TButton
          AlignWithMargins = True
          Left = 5
          Top = 86
          Width = 167
          Height = 41
          Cursor = crHandPoint
          Hint = 'Conectar ao banco de dados'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Voltar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BtnVoltarClick
        end
      end
      object Panel2: TPanel
        Left = 177
        Top = 0
        Width = 442
        Height = 480
        Align = alClient
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object Label8: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 15
          Width = 436
          Height = 17
          Margins.Top = 15
          Align = alTop
          Alignment = taCenter
          Font.Charset = ANSI_CHARSET
          Font.Color = 9551480
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
          ExplicitWidth = 4
        end
        object Memo: TSynMemo
          Left = 0
          Top = 35
          Width = 442
          Height = 445
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5263440
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Pitch = fpFixed
          Font.Style = []
          TabOrder = 0
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Highlighter = SynDWSSyn1
          ReadOnly = True
          FontSmoothing = fsmNone
        end
      end
    end
  end
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 627
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clBtnHighlight
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object Label10: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 15
      Width = 609
      Height = 17
      Margins.Left = 15
      Margins.Top = 15
      Align = alTop
      Caption = 
        'Transforme uma tabela do banco de dados em Record criado em Delp' +
        'hi'
      ExplicitWidth = 427
    end
  end
  object SynDWSSyn1: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    IdentifierAttri.Foreground = clMenuHighlight
    IdentifierAttri.Style = [fsBold]
    KeyAttri.Foreground = 5511957
    Left = 536
    Top = 472
  end
end
