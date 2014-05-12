module VoipApi
  module API

    class DIDRequest < ApiRequest

      def initialize(klass=nil)
        @klass ||= VoipApi::DIDResponse
      end

      # And what can you do...?
      # Technically, these are the SOAP actions that Savon permits
      def self.sandbox_soap_action_keys
        [
          :assign_did,
          :audit_di_ds,
          :config_did,
          :get_did_count,
          :get_di_ds,
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

      # audit_dids : This method returns all DIDs that the client currently owns, as well as key information regarding each of those DIDs.
      # No Parameters
      def audit_dids
        @arguments = {}
        @action = :audit_di_ds
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      def config_did
        :config_did
      end

      # get_did_count : 
      # This method allows the user to search the inventory of available DIDs by one or more criteria, and returns the number of DIDs 
      # available at each rate center per tier. At least one search criteria must be passed. Pass an empty String or NULL for criteria 
      # not included in your search.
      # Parameters : 
      # <state>string</state>
      # <lata>string</lata>
      # <rateCenter>string</rateCenter>
      # <npa>string</npa>
      # <nxx>string</nxx>
      # <tier>string</tier>
      # <t38>string</t38>
      # <cnam>string</cnam>
      # <orderby>string</orderby>
      # NOTE: orderby :: Field to order results by. Default: “state” Options: “rc” for Rate center, 
      # “lata” for lata id, “state” for state abbrev, “tier” for the tier of the numbers. Options are not case sensitive.
      def get_did_count(my_params={})
        raise ArgumentError, 'Argument is not a Hash!' unless my_params.is_a?(Hash)

        valid_keys = [:state, :lata, :rate_center, :npa, :nxx, :tier, :t_38, :cnam, :orderby]
        params = {}

        # Make the params be nil
        valid_keys.each { |k| params[k] = nil}

        # Make it sane.
        my_params.each { |key, value| params[key] = value if valid_keys.include?(key) }

        if params
          # Setup the instance variables
          @arguments = params
          @action = :get_did_count
          @response = VoipApi.account.request(@action, @klass, @arguments)
          self
        else
          # Requires at least one param
          false
        end
      end

      # get_dids :
      # This method allows the user to search the inventory of available DIDs using one or more search criteria, and returns all DIDs that 
      # meet the desired criteria. At least one search criteria must be passed. Pass an empty String or NULL for criteria not included in 
      # the search parameter.
      # Parameters :
      # <state>string</state>
      # <lata>string</lata>
      # <rateCenter>string</rateCenter>
      # <npa>string</npa>
      # <nxx>string</nxx>
      # <tier>string</tier>
      # <t38>string</t38>
      # <cnam>string</cnam>
      def get_dids(my_params={})
        raise ArgumentError, 'Argument is not a Hash!' unless my_params.is_a?(Hash)

        valid_keys = [:state, :lata, :rate_center, :npa, :nxx, :tier, :t_38, :cnam]
        params = {}

        # Make the params be nil
        valid_keys.each { |k| params[k] = nil}

        # Make it sane.
        my_params.each { |key, value| params[key] = value if valid_keys.include?(key) }

        if params
          # Setup the instance variables
          @arguments = params
          @action = :get_di_ds
          @response = VoipApi.account.request(@action, @klass, @arguments)
          self
        else
          # Requires at least one param
          false
        end
      end

      # query_did :
      # This method returns key information regarding the DID being queried. If the DID is owned by the client, the function will 
      # return various parameters pertaining to the DID. If the DID is available to purchase or not available, the function will 
      # return such information instead.
      # Parameters :
      # <did>string</did>
      def query_did(did)
        raise ArgumentError unless did.is_a?(String)
        @arguments = {did: did}
        @action = :query_did
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      # release_did : This method is used to release DIDs from an account.
      # Parameters : 
      # Each DIDParam represents a DID to release. The tn property is required. Optional properties are cnam, and refid
      def release_did(telephone_number)
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))

        # Make a new DIDParam
        did_param = VoipApi::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
        }))

        @arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        @action = :release_did
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      # reserve_did :
      # This method will reserve an available DID for a maximum of 30 minutes. If the reserved DID is not assigned before the time expires, 
      # it will be released back into the inventory.
      # Parameters :
      # Telephone Number and Endpoint Group ID are required
      # Takes an array of DIDParam's
      def reserve_did(telephone_number, endpoint_group_id, cnam = false, ref_id = "")
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))
        raise ArgumentError unless (endpoint_group_id && endpoint_group_id.is_a?(Integer))
        did_param = VoipApi::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
          epg: endpoint_group_id,
          cnam: cnam,
          ref_id: ref_id,
        }))
        @arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        @action = :reserve_did
        @response = VoipApi.account.request(@action, @klass, @arguments)
        self
      end

      # PRODUCTION OPERATIONS

      def get_did_forward
        # TODO: assuming that this is the right name of the SOAP action
        :get_did_forward
      end

      # Parsing and Chaining Operations

      def dids_list
        payload[:dids].nil? ? nil : payload[:dids]
      end

      def dids
        dids_list ? dids_list.collection : []
      end

      def did_locators_list
        payload[:did_locators].nil? ? nil : payload[:did_locators]
      end

      def did_locators
        did_locators_list ? did_locators_list.collection : []
      end

      def did_counts_list
        payload[:did_counts].nil? ? nil : payload[:did_counts]
      end

      def did_counts
        did_counts_list ? did_counts_list.collection : []
      end
    end

  end
end
