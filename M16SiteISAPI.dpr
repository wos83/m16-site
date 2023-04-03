library M16SiteISAPI;

uses
  IWRtlFix,
  IWInitISAPI,
  IW.Isapi.ThreadPool,
  Unit1 in 'Source\Views\Unit1.pas' {frmMain: TIWAppForm},
  ServerController in 'Source\Modules\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'Source\Modules\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  DatamoduleUnit in 'Source\Modules\DatamoduleUnit.pas' {DataModule1: TDataModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  IWRun;
end.
