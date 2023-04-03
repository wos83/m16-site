unit uFrmMain;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML;

type
  TFrmMain = class(TIWAppForm)
    tpMain: TIWTemplateProcessorHTML;
  public
  end;

implementation

{$R *.dfm}

initialization

TFrmMain.SetAsMainForm;

end.
