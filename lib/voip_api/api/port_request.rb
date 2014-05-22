module VoipApi
  module API

    # Represents an API request for things relating to Ports
    class PortRequest < ApiRequest
      
      # @attr [Constant] klass The class name to use for parsing the Savon response
      def initialize(klass=nil)
        self.klass ||= VoipApi::APIResponse::PortResponse
      end

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Sandbox API
      def self.sandbox_soap_action_keys
        [:get_port_details, :is_portable]
      end

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Production API
      def self.production_soap_action_keys
        sandbox_soap_action_keys
      end

      # Returns the details of a specified port ID.
      # @param port_id [Integer] The ID of the port for which you are requesting details about
      def get_port_details(port_id)
        raise ArgumentError unless port_id.is_a?(Integer)
        self.arguments = {port_id: port_id}
        self.action = :get_port_details
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method allows the user to determine if a telephone number is portable.
      # @param tn [String] The telephone number
      def is_portable(tn)
        raise ArgumentError unless tn.is_a?(String)
        self.arguments = {tn: tn}
        self.action = :is_portable
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # Parsing and Chaining Operations

      # The information regarding the Port Details.
      # @return [Object] Returns a PortDetail object containing the information parsed from the request
      # @!group Chaining
      def port_details
        payload[:port_details].nil? ? nil : payload[:port_details]
      end

      # Returns a DIDList containing all the port DIDs
      # @return [Object] Returns a DIDList which has a collection of PortDIDs
      # @!group Chaining
      def port_dids_list
        payload[:port_dids].nil? ? nil : payload[:port_dids]
      end

      # Returns the array of actual PortDIDs
      # @return [Array] Returns an array of the PortDID objects
      # @!group Chaining
      def port_dids
        port_dids_list ? port_dids_list.collection : []
      end

      # Determines whether this telephone number is portable.
      # @return [Boolean] Returns true or false to indicate that this telephone number can be ported.
      # @!group Chaining
      def is_portable?
        payload[:is_portable]
      end
    end
    
  end
end
