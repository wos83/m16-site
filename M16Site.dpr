{ .$DEFINE SA_Indy }
{ .$DEFINE SA_HSys }
{$DEFINE ISAPI}
{ .$DEFINE IWLIB }
{$IFDEF SA_Indy} {$DEFINE SA} {$ENDIF}
{$IFDEF SA_HSys} {$DEFINE SA} {$ENDIF}
{$IFDEF SA}
program M16Site;
{$ELSE}
library M16Site;
{$ENDIF}

uses
  IWRtlFix,
  Forms,
  {$IFDEF SA_Indy}
  IWStart,
  {$ENDIF }
  {$IFDEF SA_HSys}
  IWStartHSys,
  {$ENDIF }
  {$IFDEF ISAPI}
  ISAPIApp,
  IWInitISAPI,
  {$ENDIF }
  {$IFDEF IWLIB}
  IW.Export,
  {$ENDIF }
  UTF8ContentParser,
  uFrmMain in 'Source\Views\uFrmMain.pas' {FrmMain: TIWAppForm},
  ServerController in 'Source\Modules\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'Source\Modules\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  DatamoduleUnit in 'Source\Modules\DatamoduleUnit.pas' {DataModule1: TDataModule};

{$R *.res}

{$IFDEF ISAPI}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$ENDIF}

begin
  {$IFDEF ISAPI}
  IWRun;
  {$ELSE}
  {$IFDEF SA_Indy}
  TIWStart.Execute(True);
  {$ELSEIF SA_HSys}
  TIWStartHSys.Execute(True);
  {$IFEND}
  {$ENDIF}

end.
