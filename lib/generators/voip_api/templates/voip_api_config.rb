# config/initializers/voip_api.rb

# Setup VoipAPI Gem here
VoipApi.configure do |config|

  # By default, this will hit the produciton serve. The WSDL is already defined in a constant
  # but this setting will allow you to specify a different WSDL location
  # config.wsdl = "https://backoffice.voipinnovations.com/Services/APIService.asmx?wsdl"

  # This is already the default namespace
  # config.namespace = "http://tempuri.org/"

  # Change out what options will be filtered from Savon
  # config.filters = [:password, :secret, :pin]

  # Your login name for VOIP Innovations API
  # config.login = "mylogin"

  # Your password for VOIP Innovations API
  # config.secret = "mypassword"

  # Should we hit the sandbox API? This defaults to false
  # config.use_sandbox = false

  # Should we use the local copy of the WSDL so we can run specs?
  # config.use_test_wsdl = false

  # Savon configures Nori to strip any namespace identifiers from the response
  # config.strip_namespaces = true
  
  # Pretty print the request and response XML in your logs for debugging purposes
  # config.pretty_print_xml = true

end
