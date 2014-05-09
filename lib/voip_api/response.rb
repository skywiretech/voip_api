module VoipApi

  class Response
    attr_accessor :savon, :body, :http_code

    def initialize(response)
      self.savon     = response
      self.body      = response.body
      self.http_code = response.http.code
      # TODO: handle errors here
    end

    def self.did_response_methods
      # TODO: get the production ones too
      [
        :assign_did, 
        :audit_di_ds,
        :config_did,
        :get_di_ds,
        :query_did,
        :relese_did,
        :reserve_did,
      ]
    end

    def self.proper_response_class(api_method)
      if did_response_methods.include?(api_method)
        VoipApi::DIDResponse
      else
        nil
      end
    end

  end

  # A DIDResponse is returned by calls to DID methods.
  # Methods using DIDResponse object(s): 
  # assignDID, auditDIDs, configDID, GetConferenceLine, GetDIDForward, GetDIDGroup, GetDIDGroups, getDIDs,
  # queryDID, releaseDID, RemoveConferenceLine, RemoveDIDForward, RemoveDIDGroup, reserveDID, SetConferenceLine,
  # SetDIDForward, SetDIDGroup

  class DIDResponse < Response
    def initialize(response)
      @did_list = VoipApi::DIDList.new
      @did_locators = []
      super
    end

    # Parse the response you received from the API
    def parse(action=nil)
      result = {voip_response: {response_code: nil, response_message: nil}, payload: {}}

      # Did we actually get something back
      if body
        response_key = "#{action}_response".to_sym
        result_key = "#{action}_result".to_sym
        response_result = body[response_key][result_key]

        unless response_result.nil?
          # Set the query result and code (These are the codes returned by VOIP Innovations)
          result[:voip_response][:response_code]    = response_result[:response_code]
          result[:voip_response][:response_message] = response_result[:response_message]

          # TODO: check to see if the response_code is 100 (success)

          # See if we have DID data
          # This only works when we have one record I think.
          my_dids = response_result[:di_ds]
          if my_dids
            # Setup an array of DIDs
            my_dids.each do |key, did_data|
              result[:payload][:dids] ||= VoipApi::DIDList.new
              result[:payload][:dids].push(DID.new(VoipApi::Mapping::VoipDID.new(did_data)))
            end
          end

          # Setup the locators
          my_did_locators = response_result[:did_locators]
          if my_did_locators
            my_did_locators.each do |did_locator_set, locator_data_array|
              locator_data_array.each do |locator_data|
                # TODO: make this use the DIDLocatorList collection
                result[:payload][:did_locators] ||= VoipApi::DIDLocatorList.new
                result[:payload][:did_locators].push(DIDLocator.new(VoipApi::Mapping::VoipDIDLocator.new(locator_data)))
              end
            end
          end

          # TODO: setup the did_counts
        end
      end
      result
    end

    def self.status_code_detail(code)
      case code.to_i
      when 100
        [:general, "Number is available, assigned, or reserved to you"]
      when 102230 
        [:query_did, "Number reserved to another company"]
      when 102235 
        [:query_did, "Number assigned to another company"]
      when 102420 
        [:query_did, "No records found"]
      when 302490
        [:get_dids, "No search criteria defined"]
      else
        [:unknown, "Unknown code: #{code}"]
      end
    end

  end

end
