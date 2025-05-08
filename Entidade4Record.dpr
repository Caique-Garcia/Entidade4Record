program Entidade4Record;

uses
  Vcl.Forms,
  Entidade4Record.View.Principal in 'view\Entidade4Record.View.Principal.pas' {FormPrincipal},
  Entidade4Record.DM in 'dm\Entidade4Record.DM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
