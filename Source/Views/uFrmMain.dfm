object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  LayoutMgr = tpMain
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object tpMain: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'index.html'
    Left = 88
    Top = 16
  end
end
