require File.expand_path('../request', __FILE__)

module VoipApi
  
  # Account is a class which holds all the configuration options
  # for connecting to the VOIP Innovations API.
  # @attr [String] login The login name for the VOIP Innovations API
  # @attr [String] secret The login password for the VOIP Innovations API
  # @attr [String] namespace The XML namespace to use in conjunction with the WSDL
  # @attr [String] wsdl The SOAP WSDL definition to use for interacting with the API
  # @attr [Array] filters An array of symbols to mask when generating SOAP XML requests
  class Account
    include Request
    include VoipApi::Mapping
    
    Configuration::VALID_OPTIONS.each { |k| attr_accessor k }

    # Creates a new account, which is currently the basis for all VOIP Innovations API calls.
    def initialize(options={})
      options = VoipApi.options.merge(options)
      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
