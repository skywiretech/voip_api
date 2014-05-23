require File.expand_path('../request', __FILE__)

module VoipApi
  
  # Account is a class which holds all the configuration options
  # for connecting to the VOIP Innovations API.
  # @attr [String] login The login name for the VOIP Innovations API
  # @attr [String] secret The login password for the VOIP Innovations API
  # @attr [String] namespace The XML namespace to use in conjunction with the WSDL
  # @attr [String] wsdl The SOAP WSDL definition to use for interacting with the API
  # @attr [Array] filters An array of symbols to mask when generating SOAP XML requests
  # @attr [Boolean] use_sandbox Should we use the Sandbox mode for sending API Requests
  # @attr [Boolean] use_test_wsdl Should we use the local copy of the WSDL definition
  # @attr [Boolean] strip_namespaces Savon configures Nori to strip any namespace identifiers from the response
  # @attr [Boolean] pretty_print_xml Pretty print the request and response XML in your logs for debugging purposes
  class Account
    include Request
    include VoipApi::Mapping
    
    # Setup our default options
    Configuration::VALID_OPTIONS.each { |k| attr_accessor k }

    # Creates a new account, which is currently the basis for all VOIP Innovations API calls.
    def initialize(options={})

      # Pull in the default configuration...
      my_options = VoipApi.options.merge(options)

      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", my_options[key])
      end

      # ... But set up our custom stuff we might have done.
      if use_sandbox
        if use_test_wsdl
          @wsdl = "spec/fixtures/wsdl/voip_sandbox_wsdl.asmx"
        else
          @wsdl = VoipApi::Configuration::SANDBOX_WSDL
        end
      else
        if use_test_wsdl
          # Use our local copy
          @wsdl = "spec/fixtures/wsdl/voip_production_wsdl.asmx"
        else
          # Hit the latest production copy
          @wsdl = VoipApi::Configuration::PRODUCTION_WSDL
        end
      end
    end

  end
end
