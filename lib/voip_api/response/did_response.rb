module VoipApi

  # A DIDResponse is returned by calls to DID methods.
  # @see VoipApi::API::DIDRequest#assign_did
  # @see VoipApi::API::DIDRequest#audit_dids
  # @see VoipApi::API::DIDRequest#config_did
  # @see VoipApi::API::DIDRequest#get_conference_line
  # @see VoipApi::API::DIDRequest#get_did_forward
  # @see VoipApi::API::DIDRequest#get_did_group
  # @see VoipApi::API::DIDRequest#get_did_groups
  # @see VoipApi::API::DIDRequest#get_dids
  # @see VoipApi::API::DIDRequest#query_did
  # @see VoipApi::API::DIDRequest#release_did
  # @see VoipApi::API::DIDRequest#remove_conference_line
  # @see VoipApi::API::DIDRequest#remove_did_forward
  # @see VoipApi::API::DIDRequest#remove_did_group
  # @see VoipApi::API::DIDRequest#reserve_did
  # @see VoipApi::API::DIDRequest#set_conference_line
  # @see VoipApi::API::DIDRequest#set_did_forward
  # @see VoipApi::API::DIDRequest#set_did_group
  class DIDResponse < Response
    
    # @!visibility private
    def initialize(response)
      @did_list = VoipApi::DIDList.new
      @did_locators = []
      super
    end

    # Parses the SOAP response returned from Savon into a format we can use
    # @param action [Symbol] The SOAP action used in the request
    # @return [Hash] Returns a hash containing the pertinent information.
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

    # Provides detailed information about VOIP Innovations response codes
    # @param code [Integer] The response code returned in the SOAP XML envelope
    # @return [Array<Symbol, String>] Returns an array of the status code category and status code interpretation
    def self.status_code_detail(code)
      case code.to_i
      when 100
        [:general, "Number is available, assigned, or reserved to you"]
      when 104220
        [:assign_dids, "Number is already reserved for you"]
      when 104221
        [:assign_dids, "Unknown error assigning number"]
      when 104225
        [:assign_dids, "Number is already assigned to you"]
      when 104230
        [:assign_dids, "Number is already reserved for another company"]
      when 104235
        [:assign_dids, "Number is already assigned to another company"]
      when 104250
        [:assign_dids, "You do not purchase 800 Origination services"]
      when 104251
        [:assign_dids, "You do not purchase standard origination services"]
      when 104258
        [:assign_dids, "Bad Endpoint Group. This remote is not allowed to service this endpoint group"]
      when 104259
        [:assign_dids, "Tier not available to your account"]
      when 104420
        [:assign_dids, "Could not find number"]
      when 101200
        [:audit_dids, "No records found"]
      when 105221
        [:config_did, "Number is not currently assigned to you"]
      when 105225
        [:config_did, "Number is reserved for you"]
      when 105230
        [:config_did, "Number is already reserved for another company"]
      when 105235
        [:config_did, "Number is already assigned to another company"]
      when 105250
        [:config_did, "You do not purchase 800 Origination services"]
      when 105251
        [:config_did, "You do not purchase standard origination services"]
      when 105258
        [:config_did, "Bad Endpoint Group. This remote is not allowed to service this endpoint group"]
      when 105420
        [:config_did, "Could not find number"]
      when 102230
        [:query_did, "Number reserved for another company"]
      when 102235
        [:query_did, "Number assigned to another company"]
      when 102420
        [:query_did, "No records found"]
      when 106220
        [:release_did, "Number is still reserved for you"]
      when 106225
        [:release_did, "Number is still assigned to you"]
      when 106230
        [:release_did, "Number is currently reserved for another company"]
      when 106231
        [:release_did, "Number currently available"]
      when 106235
        [:release_did, "Number is currently assigned to another company"]
      when 106241
        [:release_did, "Number previously released, but not currently available"]
      when 106420
        [:release_did, "Could not find number"]
      when 103220
        [:reserve_did, "Number already reserved for you"]
      when 103221
        [:reserve_did, "Unknown error reserving number"]
      when 103225
        [:reserve_did, "Number already assigned to you"]
      when 103230
        [:reserve_did, "Number is currently reserved for another company"]
      when 103235
        [:reserve_did, "Number is currently assigned to another company"]
      when 103250
        [:reserve_did, "You do not purchase 800 Origination Services"]
      when 103259
        [:reserve_did, "Tier not available to your account"]
      when 103420
        [:reserve_did, "Could not find number"]
      when 302490
        [:get_dids, "No search criteria defined"]
      else
        [:unknown, "Unknown code: #{code}"]
      end
    end
  end
  
end
