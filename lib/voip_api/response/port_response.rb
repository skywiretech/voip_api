module VoipApi

  # A PortResponse is returned by calls to porting (LNP) information methods.
  # @see VoipApi::API::PortRequest#get_port_details
  # @see VoipApi::API::PortRequest#is_portable
  class PortResponse < Response

    # @!visibility private
    def initialize(response)
      super
    end

    # Parses the SOAP response returned from Savon into a format we can use
    # @param action [Symbol] The SOAP action used in the request
    # @return [Hash] Returns a hash containing the pertinent information.
    def parse(action=nil)
      result = {voip_response: {response_code: nil, response_message: nil}, payload: {is_portable: nil}}
      if body
        response_key = "#{action}_response".to_sym
        result_key = "#{action}_result".to_sym
        response_result = body[response_key][result_key]
        unless response_result.nil?
          # Set the query result and code (These are the codes returned by VOIP Innovations)
          result[:voip_response][:response_code]    = response_result[:response_code]
          result[:voip_response][:response_message] = response_result[:response_message]

          # TODO: check to see if the response_code is 100 (success)
          result[:payload][:is_portable] = response_result[:is_portable]

          my_port_details = response_result[:port_details]
          if my_port_details
            # Setup the Port Detail itself
            port_detail = VoipApi::PortDetail.new(my_port_details)

            # Setup the Port DIDs
            my_port_dids = my_port_details[:dids]
            if my_port_dids
              my_port_dids.each do |port_did_key, port_did_values|
                # Put it on the response object and on the actual object I guess
                result[:payload][:port_dids] ||= VoipApi::DIDList.new
                port_did = VoipApi::PortDID.new(port_did_values)
                port_detail.port_dids.push(port_did)
                result[:payload][:port_dids].push(port_did)
              end
            end

            # Throw this thing inside payload
            result[:payload][:port_details] = port_detail
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
        [:general, "Success"]
      else
        [:unknown, "Unknown code: #{code}"]
      end
    end

  end
  
end
