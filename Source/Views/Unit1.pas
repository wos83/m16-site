unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML;

type
  TfrmMain = class(TIWAppForm)
    tpMain: TIWTemplateProcessorHTML;
  public
  end;

implementation

{$R *.dfm}


initialization
  TfrmMain.SetAsMainForm;

end.
