object DM: TDM
  OldCreateOrder = False
  Height = 328
  Width = 440
  object Conexao: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 200
    Top = 144
  end
  object Query: TFDQuery
    Connection = Conexao
    Left = 272
    Top = 128
  end
end
