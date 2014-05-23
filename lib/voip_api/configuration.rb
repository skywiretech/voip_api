module VoipApi
  # Encapsultes methods and constants relating to configuring the VoipApi gem.
  module Configuration

    # Where Voip Innovations has their latest WSDL definition for the Sandbox Environment
    SANDBOX_WSDL = "http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl".freeze

    # Where Voip Innovations has their latest WSDL definition for the Production Environment
    PRODUCTION_WSDL = "https://backoffice.voipinnovations.com/Services/APIService.asmx?wsdl".freeze

    # The default namespace
    DEFAULT_NAMESPACE = "http://tempuri.org/"

    # Default keys to filter out from Savon data
    DEFAULT_FILTERS = [:password, :secret, :pin]

    # Are we in sandbox mode?
    USE_SANDBOX_MODE = false

    # Are we running the specs? i.e., should we use the local copy of the WSDL?
    USE_TEST_WSDL_COPY = true

    # The valid keys for creating a new API class
    VALID_OPTIONS = [
      :login,
      :secret,
      :namespace, 
      :wsdl, 
      :filters, 
      :use_sandbox, 
      :use_test_wsdl,
      :strip_namespaces,
      :pretty_print_xml,
    ].freeze

    VALID_OPTIONS.each { |k| attr_accessor k }

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Allows setting all configuration options in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      Hash[VALID_OPTIONS.map { |key| [key, send(key)] }]
    end

    # Resets all the values to their defaults.
    def reset
      self.namespace        = DEFAULT_NAMESPACE
      self.filters          = DEFAULT_FILTERS
      self.use_sandbox      = USE_SANDBOX_MODE
      self.use_test_wsdl    = USE_TEST_WSDL_COPY
      self.strip_namespaces = true
      self.pretty_print_xml = true

      # We default to using the local, production copy of the WSDL
      self.wsdl = "spec/fixtures/wsdl/voip_production_wsdl.asmx"

      # Add more directives here
    end
    
  end
end
