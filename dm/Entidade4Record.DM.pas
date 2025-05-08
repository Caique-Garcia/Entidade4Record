unit Entidade4Record.DM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TBanco = record
    Banco: string;
    Usuario: string;
    Senha: string;
    Tabela: string;
    Local: string;
  end;


  TDM = class(TDataModule)
    Conexao: TFDConnection;
    Query: TFDQuery;
  private


    { Private declarations }
  public
    function Conectar(const DB: TBanco): Boolean;
    function GerarRecordDaTabela(const Tabela: string): TStringList;
    function GerarClasseDaTabela(const NomeTabela, NomeClasse: string): TStringList;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.Conectar(const DB: TBanco): Boolean;
begin
  //Faz a coneção com o banco de dados
  Result := False;
  Conexao.Connected := False;
  Conexao.Params.Database := DB.Banco;
  Conexao.Params.Password := DB.Senha;
  Conexao.Params.UserName := DB.Usuario;
  Conexao.Params.Add('Server='+DB.Local);
  Conexao.Params.Add('Port=3306');

  try
     Conexao.Connected := True;
     Result := Conexao.Connected;
  except on e: Exception do
     raise Exception.Create(e.Message);
  end;

end;

function TDM.GerarClasseDaTabela(const NomeTabela, NomeClasse: string): TStringList;
var
  Qry: TFDQuery;
  i: Integer;
  CampoNome, CampoTipo: string;
begin
  Result := TStringList.Create;
  Qry    := TFDQuery.Create(nil);
  try
    Qry.Connection := Conexao;
    Qry.SQL.Text := Format('SELECT * FROM %s LIMIT 1', [NomeTabela]);
    Qry.Open;

    Result.Add('type');
    Result.Add('  ' + NomeClasse + ' = class');
    Result.Add('  private');

    // Atributos privados
    for i := 0 to Qry.FieldCount - 1 do
    begin
      CampoNome := Qry.Fields[i].FieldName;

      if Qry.Fields[i] is TIntegerField then
        CampoTipo := 'Integer'
      else if Qry.Fields[i] is TStringField then
        CampoTipo := 'string'
      else if Qry.Fields[i] is TDateTimeField then
        CampoTipo := 'TDateTime'
      else if Qry.Fields[i] is TFloatField then
        CampoTipo := 'Double'
      else
        CampoTipo := 'Variant';

      Result.Add(Format('    F%s: %s;', [CampoNome, CampoTipo]));
    end;

    Result.Add('  public');

    // Propriedades públicas
    for i := 0 to Qry.FieldCount - 1 do
    begin
      CampoNome := Qry.Fields[i].FieldName;

      if Qry.Fields[i] is TIntegerField then
        CampoTipo := 'Integer'
      else if Qry.Fields[i] is TStringField then
        CampoTipo := 'string'
      else if Qry.Fields[i] is TDateTimeField then
        CampoTipo := 'TDateTime'
      else if Qry.Fields[i] is TFloatField then
        CampoTipo := 'Double'
      else
        CampoTipo := 'Variant';

      Result.Add(Format('    property %s: %s read F%s write F%s;', [CampoNome, CampoTipo, CampoNome, CampoNome]));
    end;

    Result.Add('  end;');
  finally
    Qry.Free;
  end;
end;

function TDM.GerarRecordDaTabela(const Tabela: string): TStringList;
var
  Qry : TFDQuery;
  Campo : TField;
  Linha : string;
begin
  Qry := TFDQuery.Create(nil);
  Result := TStringList.Create;
  try
    Qry.Connection := Conexao;
    Qry.SQL.Text := 'SELECT * FROM ' + Tabela + ' WHERE 1=0'; // só estrutura
    Qry.Open;

    Result.Add('unit uRecord_' + Tabela + ';');
    Result.Add('');
    Result.Add('interface');
    Result.Add('');
    Result.Add('type');
    Result.Add('  T' + Tabela + ' = record');

    for Campo in Qry.Fields do
    begin
      if Campo.DataType in [ftString, ftWideString] then
        Linha := Format('    %s: string;', [Campo.FieldName])
      else if Campo.DataType in [ftInteger, ftSmallint, ftWord] then
        Linha := Format('    %s: Integer;', [Campo.FieldName])
      else if Campo.DataType in [ftFloat, ftBCD, ftFMTBcd, ftCurrency] then
        Linha := Format('    %s: Currency;', [Campo.FieldName])
      else if Campo.DataType = ftBoolean then
        Linha := Format('    %s: Boolean;', [Campo.FieldName])
      else if Campo.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp] then
        Linha := Format('    %s: TDateTime;', [Campo.FieldName])
      else
        Linha := Format('    %s: string;', [Campo.FieldName]);

      Result.Add(Linha);
    end;

    Result.Add('  end;');
    Result.Add('');
    Result.Add('implementation');
    Result.Add('');
    Result.Add('end.');

    //Result.SaveToFile(Caminho + '\uRecord_' + Tabela + '.pas');
  finally
    Qry.Free;
  end;
end;

end.
