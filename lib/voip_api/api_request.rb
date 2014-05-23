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

      # What API Requests can the X911Request handle?
      X911_REQUEST_ACTIONS = [
        :add_location,
        :audit_911,
        :get_locations,
        :get_provisioning_history,
        :insert_911,
        :provision_location,
        :query_911,
        :query_911_alert,
        :remove_911,
        # :remove_911_alert, # Not Implemented Yet
        :remove_location,
        :update_911,
        :validate_911,
      ]

      # What API Requests can the PortRequest handle?
      PORT_REQUEST_ACTIONS = [:get_port_details, :is_portable]

      # What API Requests can the DIDRequest handle?
      DID_REQUEST_ACTIONS = [
        :assign_did,
        :audit_dids,
        :config_did,
        :get_did_count,
        # :get_did_forward, # Not Implemented Yet
        :get_dids,
        :query_did,
        :release_did,
        :reserve_did,
      ]

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

      # What class should the Interface use to delegate this action to?
      def self.delegated_klass(action)
        if X911_REQUEST_ACTIONS.include?(action)
          X911Request
        elsif PORT_REQUEST_ACTIONS.include?(action)
          PortRequest
        elsif DID_REQUEST_ACTIONS.include?(action)
          DIDRequest
        else
          nil
        end
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
