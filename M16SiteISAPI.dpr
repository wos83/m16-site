library M16SiteISAPI;

uses
  IWRtlFix,
  IWInitISAPI,
  IW.Isapi.ThreadPool,
  uFrmMain in 'Source\Views\uFrmMain.pas' {FrmMain: TIWAppForm},
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
