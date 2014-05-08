# config/initializers/voip_api.rb

VoipApi.configure do |config|
  # Setup VoipAPI Gem here

  # This is already the default WSDL location
  # config.wsdl = "http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl"

  # This is already the default namespace
  # config.namespace = "http://tempuri.org/"

  # Change out what options will be filtered from Savon
  # config.filters = [:password, :secret]

  # Your login name for VOIP Innovations API
  # config.login = "mylogin"

  # Your password for VOIP Innovations API
  # config.secret = "mypassword"

end
