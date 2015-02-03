module VoipApi
  module API

    # Represents an API request for things relating to CNAM
    class CNAMRequest < ApiRequest

      # @attr [Constant] klass The class name to use for parsing the Savon response
      def initialize(klass=nil)
        self.klass ||= VoipApi::APIResponse::CNAMResponse
      end

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Sandbox API
      def self.sandbox_soap_action_keys
        [:get_cnam_display, :update_cnam_display, :remove_cnam]
      end

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Production API
      def self.production_soap_action_keys
        sandbox_soap_action_keys
      end

      # This method gets caller ID display name on file for the DID you query.
      # @param tn [String] The tn of the DID for which you are requesting CNAM details about
      def get_cnam_display(tn)
        raise ArgumentError unless tn.is_a?(String)
        self.arguments = {tn: tn}
        self.action = :get_cnam_display
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method updates caller ID display name for a specific DID (DID must support CNam Storage).
      # @param tn [String] The DID for which you are updating the CNAM entry
      # @param name [String] The Caller ID to be updated on this DID. Limit 15 characters(including spaces)
      def update_cnam_display(tn, name)
        raise ArgumentError unless tn.is_a?(String)
        raise ArgumentError unless name.is_a?(String)
        self.arguments = {tn: tn, name: name}
        self.action = :update_cnam_display
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method removes caller ID display name on the specified DID.
      # @param tn [String] The telephone number
      def remove_cnam(tn)
        raise ArgumentError unless tn.is_a?(String)
        self.arguments = {tn: tn}
        self.action = :remove_cnam
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # Parsing and Chaining Operations

      # The information regarding the Display Name
      # @return [Object] Returns the Display Name for the DID queried
      # @!group Chaining
      def display_name
        payload[:display_name].nil? ? nil : payload[:display_name]
      end
    end

  end
end
