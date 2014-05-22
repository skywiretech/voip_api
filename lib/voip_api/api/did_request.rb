module VoipApi
  module API

    # Represents an API Request for things relating to normal DIDs
    class DIDRequest < ApiRequest

      # @param klass [Constant] The class name to use for parsing the response from Savon
      def initialize(klass=nil)
        self.klass ||= VoipApi::APIResponse::DIDResponse
      end

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Sandbox API
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

      # @return [Array] Returns a list of soap action keys which are used to make requests to their Production API
      def self.production_soap_action_keys
        sandbox_soap_action_keys.push(:get_did_forward)
      end

      # This method assigns an available or reserved DID to a valid endpoint group on your account.
      # Each DIDParam represents a DID to assign. The properties tn and epg are required. Optional properties are cnam, and refid.
      # @param telephone_number [String] The Telephone number to assign to your account.
      # @param endpoint_group_id [Integer] The Endpoint Group ID which indicates what Endpoint Group to assign the Phone Number to
      def assign_did(telephone_number, endpoint_group_id)
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))
        raise ArgumentError unless (endpoint_group_id && endpoint_group_id.is_a?(Integer))
        did_param = VoipApi::Models::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
          epg: endpoint_group_id,
        }))
        self.arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        self.action = :assign_did
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method returns all DIDs that the client currently owns, as well as key information regarding each of those DIDs.
      def audit_dids
        self.arguments = {}
        self.action = :audit_di_ds
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method configures the endpoint group and cnam for DIDs which are assigned to your account.
      # @param telephone_number [String] The telephone_number to configure
      # @param endpoint_group_id [String] The endpoint_group_id to configure
      def config_did(telephone_number, endpoint_group_id)
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))
        raise ArgumentError unless (endpoint_group_id && endpoint_group_id.is_a?(Integer))
        did_param = VoipApi::Models::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
          epg: endpoint_group_id,
        }))
        self.arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        self.action = :config_did
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method allows the user to search the inventory of available DIDs by one or more criteria, and returns the number of DIDs 
      # available at each rate center per tier. At least one search criteria must be passed. Pass an empty String or NULL for criteria 
      # not included in your search.
      # @param [Hash] my_params the options to create a message with.
      # @option my_params [String] :state The state
      # @option my_params [String] :lata The LATA
      # @option my_params [String] :rate_center The Rate Center you wish to use
      # @option my_params [String] :npa The NPA code
      # @option my_params [String] :nxx The NXX code
      # @option my_params [String] :tier The tier number
      # @option my_params [String] :t_38 Whether to search for T38 capable numbers
      # @option my_params [String] :cnam The CNAM
      # @option my_params [String] :orderby The field to order the results by
      # @note orderby - Field to order results by. Default: “state” Options: “rc” for Rate center, 
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
          self.arguments = params
          self.action = :get_did_count
          self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
          self
        else
          # Requires at least one param
          false
        end
      end

      # This method allows the user to search the inventory of available DIDs using one or more search criteria, and returns all DIDs that 
      # meet the desired criteria. At least one search criteria must be passed. Pass an empty String or NULL for criteria not included in 
      # the search parameter.
      # @param [Hash] my_params the options to create a message with.
      # @option my_params [String] :state The state
      # @option my_params [String] :lata The LATA
      # @option my_params [String] :rate_center The Rate Center you wish to use
      # @option my_params [String] :npa The NPA code
      # @option my_params [String] :nxx The NXX code
      # @option my_params [String] :tier The tier number
      # @option my_params [String] :t_38 Whether to search for T38 capable numbers
      # @option my_params [String] :cnam The CNAM
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
          self.arguments = params
          self.action = :get_di_ds
          self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
          self
        else
          # Requires at least one param
          false
        end
      end

      # This method returns key information regarding the DID being queried. If the DID is owned by the client, the function will 
      # return various parameters pertaining to the DID. If the DID is available to purchase or not available, the function will 
      # return such information instead.
      # @param did [String] The telephone number to query
      def query_did(did)
        raise ArgumentError unless did.is_a?(String)
        self.arguments = {did: did}
        self.action = :query_did
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method is used to release DIDs from an account.
      # @param telephone_number [String] The telephone number to release
      def release_did(telephone_number)
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))

        # Make a new DIDParam
        did_param = VoipApi::Models::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
        }))

        self.arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        self.action = :release_did
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # This method will reserve an available DID for a maximum of 30 minutes. If the reserved DID is 
      # not assigned before the time expires, it will be released back into the inventory.
      # @param telephone_number [String] The telephone_number to configure
      # @param endpoint_group_id [String] The endpoint_group_id to configure
      # @option cnam [String] :cnam (default_value) The CNAM
      # @option name [String] :ref_id (default_value) The reference_id
      def reserve_did(telephone_number, endpoint_group_id, cnam = false, ref_id = "")
        raise ArgumentError unless (telephone_number && telephone_number.is_a?(String))
        raise ArgumentError unless (endpoint_group_id && endpoint_group_id.is_a?(Integer))
        did_param = VoipApi::Models::DIDParam.new(VoipApi::Mapping::VoipDIDParam.new({
          tn: telephone_number,
          epg: endpoint_group_id,
          cnam: cnam,
          ref_id: ref_id,
        }))
        self.arguments = {did_params: {"DIDParam" => did_param.to_hash}}
        self.action = :reserve_did
        self.response = VoipApi.account.request(self.action, self.klass, self.arguments)
        self
      end

      # PRODUCTION OPERATIONS

      # Find out where this number forwards
      def get_did_forward
        # TODO: assuming that this is the right name of the SOAP action
        :get_did_forward
      end

      # Parsing and Chaining Operations

      # Returns a DIDList containing all the DIDs
      # @return [Object] Returns a DIDList which has a collection of DIDs
      def dids_list
        payload[:dids].nil? ? nil : payload[:dids]
      end

      # Returns the array of actual DIDs
      # @return [Array] Returns an array of the DID's
      def dids
        dids_list ? dids_list.collection : []
      end

      # Returns a DIDList containing all the DIDLocators
      # @return [Object] Returns a DIDList which has a collection of DIDLocators
      def did_locators_list
        payload[:did_locators].nil? ? nil : payload[:did_locators]
      end

      # Returns the array of actual DIDLocators
      # @return [Array] Returns an array of the DIDLocators
      def did_locators
        did_locators_list ? did_locators_list.collection : []
      end

      # Returns a DIDList containing all the DIDCounts
      # @return [Object] Returns a DIDList which has a collection of DIDCounts
      def did_counts_list
        payload[:did_counts].nil? ? nil : payload[:did_counts]
      end

      # Returns the array of actual DIDCounts
      # @return [Array] Returns an array of the DIDCounts
      def did_counts
        did_counts_list ? did_counts_list.collection : []
      end
    end

  end
end
