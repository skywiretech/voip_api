module VoipApi
  module APIResponse
    # A CNAMResponse is returned by calls regarding DID CNAM Storage.
    # @see VoipApi::API::CNAMRequest#get_cnam_display
    # @see VoipApi::API::CNAMRequest#remove_cnam
    # @see VoipApi::API::CNAMRequest#update_cnam_display
    class CNAMResponse < Response

      # @!visibility private
      def initialize(response)
        super
      end

      # Parses the SOAP response returned from Savon into a format we can use
      # @param action [Symbol] The SOAP action used in the request
      # @return [Hash] Returns a hash containing the pertinent information.
      def parse(action=nil)
        result = {voip_response: {response_code: nil, response_message: nil}, payload: {display_name: nil}}
        if body
          response_key = "#{action}_response".to_sym
          result_key = "#{action}_result".to_sym
          response_result = body[response_key][result_key]
          unless response_result.nil?
            # Set the query result and code (These are the codes returned by VOIP Innovations)
            result[:voip_response][:response_code]    = response_result[:response_code]
            result[:voip_response][:response_message] = response_result[:response_message]

            # TODO: parse other stuff
            result[:payload][:display_name] = response_result[:display_name]
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
        when 933
          [:update_cnam_display, "Outbound CNAM is not available for the specified DID"]
        when 934
          [:update_cnam_display, "Invalid name. Valid characters are letters, spaces, and numbers"]
        else
          [:unknown, "Unknown code: #{code}"]
        end
      end
    end
  end
end
