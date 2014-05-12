module VoipApi

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
          my_dids = response_result[:di_ds]
          if my_dids
            # At least initialize the container item
            result[:payload][:dids] ||= VoipApi::DIDList.new

            if my_dids[:did].is_a?(Hash)
              # Single DID Entry (Hash)
              result[:payload][:dids].push(DID.new(VoipApi::Mapping::VoipDID.new(my_dids[:did])))
            else
              # Multiple DIDs (Array)
              # Store the DIDs in the DIDList container
              my_dids.each do |key, did_result_set|
                did_result_set.each do |did_data|
                  result[:payload][:dids].push(DID.new(VoipApi::Mapping::VoipDID.new(did_data)))
                end
              end
            end
          end

          # Setup the locators
          my_did_locators = response_result[:did_locators]
          if my_did_locators
            my_did_locators.each do |did_locator_set, locator_data_array|
              locator_data_array.each do |locator_data|
                # Store the DIDLocators in the DIDList container
                result[:payload][:did_locators] ||= VoipApi::DIDList.new
                result[:payload][:did_locators].push(DIDLocator.new(VoipApi::Mapping::VoipDIDLocator.new(locator_data)))
              end
            end
          end

          # Setup the did_counts
          my_did_counts = response_result[:did_counts]
          if my_did_counts
            my_did_counts.each do |did_count_set, did_count_data_array|
              did_count_data_array.each do |kount_data|
                result[:payload][:did_counts] ||= VoipApi::DIDList.new
                result[:payload][:did_counts].push(DIDCount.new(VoipApi::Mapping::VoipDIDCount.new(kount_data)))
              end
            end
          end
        end
      end
      result
    end

    def self.status_code_detail(code)
      case code.to_i
      when 100
        [:general, "Number is available, assigned, or reserved to you"]
      when 101200
        [:audit_dids, "No records found"]
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
