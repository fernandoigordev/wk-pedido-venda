object ModelConnection: TModelConnection
  OnCreate = DataModuleCreate
  Height = 140
  Width = 206
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Database=turmi'
      'Password=123456'
      'Server=localhost'
      'MetaDefSchema=front'
      'MetaCurSchema=front'
      'DriverID=PG')
    Left = 56
    Top = 8
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 56
    Top = 64
  end
end
