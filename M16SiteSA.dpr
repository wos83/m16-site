program M16SiteSA;

uses
  Forms,
  IWJclDebug,
  IWJclStackTrace,
  IWRtlFix,
  IWStart,
  uFrmMain in 'Source\Views\uFrmMain.pas' {FrmMain: TIWAppForm},
  ServerController in 'Source\Modules\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'Source\Modules\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  DatamoduleUnit in 'Source\Modules\DatamoduleUnit.pas' {DataModule1: TDataModule};

{$R *.res}

begin
   TIWStart.Execute(True);

end.
