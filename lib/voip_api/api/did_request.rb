# This is the API interface for interacting with VOIP Innovations API
module VoipApi
  module API

    class DIDRequest
      attr_accessor :arguments, :response, :action

      # And what can you do...?
      # Technically, these are the SOAP actions that Savon permits
      def self.sandbox_soap_action_keys
        [
          :assign_did,
          :audit_di_ds,
          :config_did,
          :get_did_count,
          :get_di_ds,
          :get_port_details,
          :is_portable,
          :query_did,
          :release_did,
          :reserve_did,
        ]
      end

      def self.production_soap_action_keys
        sandbox_soap_action_keys.push(:get_did_forward)
      end

      # SANDBOX OPERATIONS

      def assign_did
        :assign_did
      end

      def audit_dids
        :audit_di_ds
      end

      def config_did
        :config_did
      end

      def get_did_count
        :get_did_count
      end

      def get_dids(my_params={})
        raise ArgumentError, 'Argument is not a Hash!'unless my_params.is_a?(Hash)

        defaults = {}
        # Make the defaults be nil
        [:state, :lata, :rate_center, :npa, :nxx, :tier, :t_38, :cnam].each { |k| defaults[k] = nil}

        # Make it sane.
        params = defaults.merge(my_params)

        if params
          state       = params[:state]
          lata        = params[:lata]
          rate_center = params[:rate_center]
          npa         = params[:npa]
          nxx         = params[:nxx]
          tier        = params[:tier]
          t_38        = params[:t_38]
          cnam        = params[:cnam]

          # Setup the instance variables
          @arguments = params
          @action = :get_di_ds
          @response = VoipApi.account.request(:get_di_ds, @arguments)
          self
        else
          # Requires at least one param
          false
        end
      end

      def get_port_details
        :get_port_details
      end

      def is_portable
        :is_portable
      end

      def query_did(did)
        raise ArgumentError unless did.is_a?(String)
        @arguments = {did: did}
        @action = :query_did
        @response = VoipApi.account.request(:query_did, @arguments)
        self
      end

      def release_did
        :release_did
      end

      def reserve_did
        :reserve_did
      end

      # PRODUCTION OPERATIONS

      # Not available in sandbox
      def get_did_forward
        # TODO: assuming that this is the right name of the SOAP action
        :get_did_forward
      end

      # Parsing and Chaining Operations

      # Get THEIR response code
      def voip_response(key=nil)
        if key
          parsed_response[:voip_response][key]
        else
          parsed_response[:voip_response]
        end
      end
      
      def voip_response_code
        voip_response(:response_code)
      end

      def voip_response_message
        voip_response(:response_message)
      end

      def dids_list
        payload[:dids].nil? ? nil : payload[:dids]
      end

      def dids
        if dids_list
          dids_list.dids
        else
          []
        end
      end

      def did_locators_list
        payload[:did_locators].nil? ? nil : payload[:did_locators]
      end

      def did_locators
        if did_locators_list
          did_locators_list.did_locators
        else
          []
        end
      end

      # TODO: Counts

      def payload
        # Hand of the dirty work to the response class
        parsed_response[:payload]
      end

      def parsed_response
        @response.parse(@action)
      end

    end

  end
end
