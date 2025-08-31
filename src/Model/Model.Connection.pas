unit Model.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

const
  CS_NOME_ARQUIVO_CONFIGURACAO = 'Configuracao.ini';

type
  TModelConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    Class var FEntityConnection: TModelConnection;
    procedure ConfigurarConexao;
  public
    Class function GetInstance: TModelConnection;

    function GetQuery: TFDQuery;overload;
    function GetQuery(ASql: String): TFDQuery;overload;
  end;

implementation

uses
  IniFiles, Vcl.Dialogs, Vcl.Forms;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TEntityConnection }

procedure TModelConnection.DataModuleCreate(Sender: TObject);
begin
  ConfigurarConexao;
end;

class function TModelConnection.GetInstance: TModelConnection;
begin
  if not Assigned(FEntityConnection) then
    FEntityConnection := TModelConnection.Create(nil);

  Result := FEntityConnection;
end;

function TModelConnection.GetQuery(ASql: String): TFDQuery;
begin
  Result := GetQuery;
  Result.SQL.Text := ASql;
end;

function TModelConnection.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FDConnection;
end;

procedure TModelConnection.ConfigurarConexao;
var
  ArquivoINI: TIniFile;
  CaminhoArquivoConfiguracao: String;
begin
  CaminhoArquivoConfiguracao := Concat(ExtractFilePath(ParamStr(0)), CS_NOME_ARQUIVO_CONFIGURACAO);

  if FileExists(CaminhoArquivoConfiguracao) then
  begin
    ArquivoINI := TIniFile.Create(CaminhoArquivoConfiguracao);
    try
      Self.FDConnection.Params.UserName := ArquivoINI.ReadString('Conexao', 'User_Name', 'Erro ao ler User_Name');
      Self.FDConnection.Params.Database := ArquivoINI.ReadString('Conexao', 'Database', 'Erro ao ler Database');
      Self.FDConnection.Params.Password := ArquivoINI.ReadString('Conexao', 'Password', 'Erro ao ler Password');
      Self.FDConnection.Params.DriverID := ArquivoINI.ReadString('Conexao', 'DriverID', 'Erro ao ler DriverID');
      Self.FDConnection.Params.Values['Server'] := ArquivoINI.ReadString('Conexao', 'Server', 'Erro ao ler Server');
      Self.FDConnection.Params.Values['MetaDefSchema'] := ArquivoINI.ReadString('Conexao', 'MetaDefSchema', 'Erro ao ler MetaDefSchema');
      Self.FDConnection.Params.Values['Port'] := ArquivoINI.ReadString('Conexao', 'Port', 'Erro ao ler Port');

      Self.FDPhysPgDriverLink.VendorHome := ArquivoINI.ReadString('DriveLink', 'VendorHome', 'Erro ao ler VendorHome');
      Self.FDPhysPgDriverLink.VendorLib := ArquivoINI.ReadString('DriveLink', 'VendorLib', 'Erro ao ler VendorLib');

      Self.FDConnection.Connected;
    finally
      ArquivoINI.Free;
    end;
  end
  else
  begin
    ShowMessage(Concat('Arquivo de conexão não encontrado em: ', CaminhoArquivoConfiguracao));
    Application.Terminate;
  end;
end;

end.
