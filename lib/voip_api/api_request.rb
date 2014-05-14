module VoipApi

  # A helpful namespace
  module API

    # Represents the base class to be inherited from for generating different
    # types of API Requests. This base class should never be instantiated!
    # @attr [Hash] arguments The arguments supplied for the API request
    # @attr [Object] response The response object returned from Savon
    # @attr [Symbol] action The SOAP action key parsed from the WSDL actions
    # @attr [Constant] klass The class name to use for parsing the Savon response
    class ApiRequest
      Dir[File.expand_path('../api/*.rb', __FILE__)].each{|f| require f}

      attr_accessor :arguments, :response, :action, :klass

      # This should be defined in the child
      # @!visibility private
      def self.sandbox_soap_action_keys
        raise NotImplementedError
      end

      # This should be defined in the child
      # @!visibility private
      def self.production_soap_action_keys
        raise NotImplementedError
      end

      # Get THEIR response code
      # @param key [Symbol] The hash key for indexing into the response payload hash
      def voip_response(key=nil)
        if key
          parsed_response[:voip_response][key]
        else
          parsed_response[:voip_response]
        end
      end
      
      # Returns the VOIP Innovations response code returned from their API
      def voip_response_code
        voip_response(:response_code)
      end

      # Returns the VOIP Innovations response message returned from their API
      def voip_response_message
        voip_response(:response_message)
      end

      # Returns a cleanly parsed hash of attributes which contains the relevant data.
      def payload
        # Hand of the dirty work to the response class
        parsed_response[:payload]
      end

      # Returns the result of parsing the SOAP response details
      def parsed_response
        self.response.parse(self.action)
      end
    end

  end
end
