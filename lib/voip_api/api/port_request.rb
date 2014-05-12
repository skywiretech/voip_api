module VoipApi
  module API

    class PortRequest < ApiRequest
      def initialize(klass=nil)
        @klass ||= VoipApi::PortResponse
      end

      def self.sandbox_soap_action_keys
        [:get_port_details, :is_portable]
      end

      def self.production_soap_action_keys
        sandbox_soap_action_keys
      end

      # get_port_details : Returns the details of a specified port ID.
      # <portId>int</portId>
      def get_port_details(port_id)
        raise ArgumentError unless port_id.is_a?(Integer)
        @arguments = {port_id: port_id}
        @action = :get_port_details
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      # is_portable : This method allows the user to determine if a telephone number is portable.
      # <tn>string</tn>
      def is_portable(tn)
        raise ArgumentError unless tn.is_a?(String)
        @arguments = {tn: tn}
        @action = :is_portable
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      # Parsing and Chaining Operations

      def port_details
        payload[:port_details].nil? ? nil : payload[:port_details]
      end

      def port_dids_list
        payload[:port_dids].nil? ? nil : payload[:port_dids]
      end

      def port_dids
        port_dids_list ? port_dids_list.collection : []
      end

      def is_portable?
        payload[:is_portable]
      end
    end
    
  end
end
