unit ServerController;

interface

uses
  Classes,
  DataModuleUnit,
  ExtCtrls,
  Forms,
  HTTPApp,
  IW.Browser.Browser,
  IW.Common.AppInfo,
  IW.Content.Base,
  IW.Content.Form,
  IW.Content.Handlers,
  IW.Content.Redirect,
  IW.HTTP.Reply,
  IW.HTTP.Request,
  IW.Server.Logger,
  IWAppCache,
  IWAppForm,
  IWApplication,
  IWBaseComponent,
  IWBaseForm,
  IWBaseHTML40Component,
  IWBaseHTMLComponent,
  IWCompExtCtrls,
  IWDataModulePool,
  IWException,
  IWExceptionLogger,
  IWExceptionRenderer,
  IWGlobal,
  IWInit,
  IWMimeTypes,
  IWServerControllerBase,
  StrUtils,
  SysUtils,
  UserSessionUnit;

type
  TIWServerController = class(TIWServerControllerBase)
    Pool: TIWDataModulePool;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
    procedure IWServerControllerBaseCreate(Sender: TObject);

    procedure PoolCreateDataModule(var ADataModule: TDataModule);
    procedure PoolFreeDataModule(var ADataModule: TDataModule);
    procedure IWServerControllerBaseConfig(Sender: TObject);
  private
    { Private declarations }

  public
    procedure AfterConstruction; override;
    { Public declarations }
  end;

function UserSession: TIWUserSession;
function IWServerController: TIWServerController;
function LockDataModule: TDataModule1;
procedure UnlockDataModule(ADataModule: TDataModule1);

implementation

{$R *.dfm}

uses
  uFrmMain;

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

{ TIWServerController }

procedure TIWServerController.AfterConstruction;
begin
  inherited;
  ComInitialization := ciMultiThreaded;
end;

procedure TIWServerController.IWServerControllerBaseNewSession(ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  Pool.Active := True;
end;

procedure TIWServerController.PoolCreateDataModule(var ADataModule: TDataModule);
begin
  ADataModule := TDataModule1.Create(nil);
end;

procedure TIWServerController.PoolFreeDataModule(var ADataModule: TDataModule);
begin
  FreeAndNil(ADataModule);
end;

function LockDataModule: TDataModule1;
begin
  Result := TDataModule1(TIWServerController(GServerController).Pool.Lock);
end;

procedure UnlockDataModule(ADataModule: TDataModule1);
var
  LTemp: TDataModule;
begin
  LTemp := ADataModule;
  TIWServerController(GServerController).Pool.Unlock(LTemp);
end;

procedure TIWServerController.IWServerControllerBaseConfig(Sender: TObject);
var
  FormHandler: TContentForm;
begin
  //
  {$REGION 'BaseConfig'}
  {$IFDEF SA}
  Self.Port := 8888;
  {$ENDIF}
  Self.CharSet := 'utf-8';

  Self.LicenseTracking := False;
  Self.HistoryEnabled := False;

  // Self.BackButtonOptions.Mode := TIWBackButtonMode.bmEnable;
  // Self.BackButtonOptions.ShowMessage := True;

  // Self.BackButtonOptions.Mode := TIWBackButtonMode.bmInterceptGlobal; //No User Back Button (Global)
  // Self.BackButtonOptions.Mode := TIWBackButtonMode.bmDisableCompat; // No User Back Button
  Self.BackButtonOptions.Mode := TIWBackButtonMode.bmEnable; // User Back Button

  Self.CacheDir := TIWAppInfo.GetAppPath + 'Cache\';
  Self.TemplateDir := TIWAppInfo.GetAppPath + 'Temp\';

  Self.DebugHTML := True;

  Self.Log := TLogOptions.loFile;
  Self.LogCommandEnabled := True;
  Self.LogSessionEvents := True;

  Self.ExceptionLogger.LogType := TLogType.ltFile;
  Self.ExceptionLogger.FilePath := TIWAppInfo.GetAppPath + 'Error\';
  Self.ExceptionLogger.FileName := 'Error';
  Self.ExceptionLogger.PurgeAfterDays := 365;
  Self.ExceptionLogger.HtmlReportInfos := //
     [TReportInfo.riAppInfo, TReportInfo.riExceptionInfo, TReportInfo.riAppInfo //
     , TReportInfo.riIWAppInfo, TReportInfo.riStackTrace, TReportInfo.riRequestInfo];
  Self.ExceptionLogger.ReportInfos := //
     [TReportInfo.riAppInfo, TReportInfo.riExceptionInfo, TReportInfo.riAppInfo //
     , TReportInfo.riIWAppInfo, TReportInfo.riStackTrace, TReportInfo.riRequestInfo];
  Self.ExceptionLogger.Enabled := True;

  Self.Compression.AllowDeflate := True;
  Self.Compression.AllowGZip := True;
  Self.Compression.Level := 6;
  Self.Compression.MinSize := 512;
  Self.Compression.PreCompress := True;
  Self.Compression.Enabled := True;

  Self.CookieOptions.CookieNameSuffix := EmptyStr;
  Self.CookieOptions.HttpOnly := False;
  Self.CookieOptions.Secure := False;
  Self.CookieOptions.SessionCookies := True;
  Self.CookieOptions.UseCookies := True;

  Self.AllowMultipleSessionsPerUser := False;
  Self.AuthBeforeNewSession := False;
  Self.RestartExpiredSession := True;
  Self.SecurityOptions.CheckSameIP := False;
  Self.SecurityOptions.CheckSameUA := False;
  Self.SecurityOptions.ShowSecurityErrorDetails := False;
  Self.SessionTimeout := 3600; // 60 minutes
  // Self.SessionTimeout := 7200; // 120 minutes
  // Self.SessionTimeout := 720; //12 minutes
  // Self.SessionTimeout := 120; // 2 minutes

  // THttpReply.DefaultCacheTTL := 1440; // 1440 minutes = 24 hours
  THttpReply.DefaultCacheTTL := 60; // 60 minutes = 1 hour
  THttpReply.DefaultCacheControl := 'private';

  Self.ShowStartParams := False;
  Self.IECompatibilityMode := 'IE=edge';
  Self.HttpKeepAlive := True;
  Self.PageTransitions := True;
  Self.JavaScriptOptions.RenderjQuery := False;

  Self.SearchEngineOptions.RedirectToContentHandler := True;
  Self.SearchEngineOptions.ContentHandlerPath := 'SearchEngineRequest';

  {$ENDREGION}
  //
  {$REGION 'Default Pages'}
  // THandlers.Add(EmptyStr, 'IWError.html', TContentForm.Create(TFrmError));
  // THandlers.Add(EmptyStr, '404.html', TContentForm.Create(TFrm404));
  // THandlers.Add(EmptyStr, '500.html', TContentForm.Create(TFrm500));
  {$ENDREGION}
  //

  FormHandler := TContentForm.Create(TFrmMain);
  FormHandler.CanStartSession := True;
  FormHandler.RequiresSessionStart := True;
  THandlers.AddRootHandler(EmptyStr, 'index.html', FormHandler);
end;

initialization

TIWServerController.SetServerControllerClass;

end.
