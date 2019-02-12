object SignedUpDM: TSignedUpDM
  OldCreateOrder = False
  Height = 214
  Width = 414
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211')
    Connected = True
    Left = 48
    Top = 40
    UniqueId = '{EE7343A0-693D-46F5-9610-492C4895263E}'
  end
  object SignedUpSearch: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'STUDENT_CODE'
        ParamType = ptInput
        Size = 20
      end
      item
        DataType = ftInteger
        Name = 'SIGNEDUP_TYPE'
        ParamType = ptInput
      end>
    ProviderName = 'SignedUpSearchProvider'
    RemoteServer = DSProviderConnection1
    Left = 248
    Top = 40
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 136
    Top = 40
  end
  object BasketDetail: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'SUBJECT_CODE'
        ParamType = ptInput
        Size = 20
      end
      item
        DataType = ftString
        Name = 'STUDENT_CODE'
        ParamType = ptInput
        Size = 20
      end>
    ProviderName = 'BasketDetailProvider'
    RemoteServer = DSProviderConnection1
    Left = 320
    Top = 40
  end
end
