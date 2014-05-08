module VoipApi
  module Configuration

    # Where Voip Innovations has their latest WSDL definition
    DEFAULT_WSDL_ENDPOINT = "http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl".freeze

    DEFAULT_NAMESPACE = "http://tempuri.org/"

    # The valid keys for creating a new API class
    VALID_OPTIONS = [:login, :password, :namespace, :wsdl_endpoint].freeze

    # @private
    attr_accessor *VALID_OPTIONS

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

    def reset
      self.wsdl_endpoint = DEFAULT_WSDL_ENDPOINT
      self.namespace     = DEFAULT_NAMESPACE
    end
    
  end
end
