unit Entidade4Record.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Entidade4Record.DM, SynEdit, SynMemo, SynEditHighlighter, SynHighlighterDWS;

type
  TFormPrincipal = class(TForm)
    PageControl: TPageControl;
    Conexao: TTabSheet;
    Resultado: TTabSheet;
    PanelContainer: TPanel;
    PanelOpc: TPanel;
    Label1: TLabel;
    BtnConectar: TButton;
    btnSair: TButton;
    PanelCorpo: TPanel;
    PanelDados: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditSenha: TEdit;
    EditTabela: TEdit;
    EditLocal: TEdit;
    EditUsuario: TEdit;
    PanelMemoLog: TPanel;
    BtnStart: TButton;
    LabelStatusBanco: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label8: TLabel;
    BtnVoltar: TButton;
    Label9: TLabel;
    EditBanco: TEdit;
    Memo: TSynMemo;
    SynDWSSyn1: TSynDWSSyn;
    PanelHeader: TPanel;
    Label10: TLabel;
    procedure BtnConectarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.BtnConectarClick(Sender: TObject);
var
    DB: TBanco;
begin
    //Faz a conexão com o banco de dados
    LabelStatusBanco.Visible := False;
    DB.Banco     := EditBanco.Text;
    DB.Usuario   := EditUsuario.Text;
    DB.Local     := EditLocal.Text;
    DB.Senha     := EditSenha.Text;
    DB.Tabela    := EditTabela.Text;
    if DM.Conectar(DB) then
    begin
      MessageDlg('Conectado com sucesso !!', mtInformation, [mbOK], 2);
      LabelStatusBanco.Visible := True;
    end;
end;

procedure TFormPrincipal.btnSairClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TFormPrincipal.BtnStartClick(Sender: TObject);
var
   Code: TStringList;
begin
    Memo.Lines.Clear;
    if EditTabela.Text = '' then
    begin
        Abort;
    end;

    if Not DM.Conexao.Connected then
    begin
        Abort;
    end;

    Code := DM.GerarRecordDaTabela(EditTabela.Text);
    try
        Memo.Lines.Text := Code.Text;
        PageControl.TabIndex := 1;

    finally
    end;

end;

procedure TFormPrincipal.BtnVoltarClick(Sender: TObject);
begin
  PageControl.TabIndex := 0;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := cafree;
    Application.Terminate;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
    PageControl.TabIndex := 0;
end;

end.
