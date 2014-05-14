module VoipApi

  # A Response911 is returned by calls to 911 methods.

  # Methods using Response911 object(s): getLocations, addLocation, removeLocation, 
  # provisionLocation, getProvisioningHistory, audit911, query911, remove911, update911, 
  # insert911, Add911Alert, Remove911Alert, Query911Alert, validate911

  # @see VoipApi::API::X911Request#add_911_alert
  # @see VoipApi::API::X911Request#add_location
  # @see VoipApi::API::X911Request#audit_911
  # @see VoipApi::API::X911Request#get_locations
  # @see VoipApi::API::X911Request#get_provisioning_history
  # @see VoipApi::API::X911Request#insert_911
  # @see VoipApi::API::X911Request#provision_location
  # @see VoipApi::API::X911Request#query_911
  # @see VoipApi::API::X911Request#query_911_alert
  # @see VoipApi::API::X911Request#remove_911
  # @see VoipApi::API::X911Request#remove_911_alert
  # @see VoipApi::API::X911Request#remove_location
  # @see VoipApi::API::X911Request#update_911
  # @see VoipApi::API::X911Request#validate_911
  class X911Response < Response

    # @!visibility private
    def initialize(response)
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

          # See if we have DID911 data
          x911_dids = response_result[:did911s]
          if x911_dids
            # At least initialize the container item
            result[:payload][:dids_911] ||= VoipApi::DIDList.new

            if x911_dids[:did911].is_a?(Hash)
              # Single DID911 Entry (Hash)
              result[:payload][:dids_911].push(DID911.new(VoipApi::Mapping::VoipDID911.new(x911_dids[:did911])))
            else
              # Multiple DIDs (Array)
              # Store the DIDs in the DIDList container
              x911_dids.each do |key, did_result_set|
                did_result_set.each do |did_data|
                  result[:payload][:dids_911].push(DID911.new(VoipApi::Mapping::VoipDID911.new(did_data)))
                end
              end
            end
          end

          # VI_locations
          vi_locations = response_result[:vi_locations]
          if vi_locations
            result[:payload][:vi_locations] ||= VoipApi::DIDList.new
            if vi_locations.is_a?(Hash)
              # Single element
              result[:payload][:vi_locations].push(VILocation.new(VoipApi::Mapping::VoipVILocation.new(vi_locations[:vi_location])))
            else
              # Multiple elements
              vi_locations.each do |key, location_result_set|
                location_result_set.each do |location_data|
                  # Store the VI_Locations in a List essentially.
                  result[:payload][:vi_locations].push(VILocation.new(VoipApi::Mapping::VoipVILocation.new(location_data)))
                end
              end
            end
          end

          # TODO: 911 Statuses

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
        [:general, "Success"]
      when 101 
        [:general, "No records found"]
      when 903
        [:response_911, "Could not locate Dash Emergency Provisioning Service"]
      when 904
        [:response_911, "Dash action resulted in incorrect status"]
      when 905
        [:response_911, "LockedException occurred while calling Dash service"]
      when 906
        [:response_911, "NotFoundException occurred while calling Dash service"]
      when 907
        [:response_911, "API LockedException; The specified DID record is currently in use"]
      when 908
        [:response_911, "ParseException occurred while calling Dash service for the specified telephone number"]
      when 909
        [:response_911, "You do not own the specified number"]
      when 910
        [:response_911, "Location does not exist"]
      when 911
        [:response_911, "Location already exists and is provisioned"]
      when 940
        [:add_911_alert, "Email cannot be greater than 150 characters"]
      when 941
        [:add_911_alert, "911 is not enabled"]
      when 942
        [:add_911_alert, "Email already exists for this DID"]
      when 943
        [:add_911_alert, "Can not exceed 10 emails"]
      when 205200 
        [:remove_911, "Zero records deleted/archived"]
      when 206200  
        [:get_locations, "No locations could be found"]
      else
        [:unknown, "Unknown code: #{code}"]
      end
    end

    # Provides detailed information about the 911 Status based on the lookup response
    # @param status_code [Integer] The response status_code returned in the SOAP XML envelope
    # @return [Array<Symbol, String>] Returns an array of the 911 provisioning status
    def self.status_911_detail(status_code)
      case status_code.to_s
      when "INVALID"
        [:general, "Unable to geocoded address"]
      when "PROVISIONED"
        [:general, "Location is currently provisioned for URI"]
      when "GEOCODED"
        [:general, "Location is geocoded"]
      else
        [:unknown, "Unknown status code: #{status_code}"]
      end
    end
  end

end
