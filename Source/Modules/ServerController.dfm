object IWServerController: TIWServerController
  OnCreate = IWServerControllerBaseCreate
  AppName = 'M16Site'
  Description = 'Site da M16 Tech (IntraWeb)'
  DisplayName = 'M16 Tech (Site)'
  Port = 8888
  Version = '15.2.69'
  OnConfig = IWServerControllerBaseConfig
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
  object Pool: TIWDataModulePool
    OnCreateDataModule = PoolCreateDataModule
    OnFreeDataModule = PoolFreeDataModule
    Active = False
    Version = '2.1.0'
    RaiseExceptions = True
    AutoGrow = False
    GrowToSize = 100
    PoolCount = 20
    Left = 60
    Top = 12
  end
end
