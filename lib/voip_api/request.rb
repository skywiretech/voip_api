require 'savon'

module VoipApi

  # Represents the Savon Request being sent to the API
  module Request

    # Configures Savon for interfacing with dirty, dirty SOAP API's
    def setup_savon_client
      client = Savon.client do |globals|
        globals.wsdl @wsdl
        globals.namespace @namespace
        globals.filters @filters
        globals.pretty_print_xml @pretty_print_xml
        globals.namespace_identifier :tns
        globals.strip_namespaces @pretty_print_xml
      end
      client
    end

    # Get a list of all operations supported by the WSDL
    def operations
      setup_savon_client.operations.sort
    end

    # Invoke an API request
    # @param api_method [Symbol] The api_method key which savon has parsed from the WSDL
    # @param response_klass [Constant] The name of the class which will parse the response
    # @param my_params [Hash] An array of arguments to be passed to the VOIP Innovations API
    def request(api_method, response_klass, my_params={})
      savon_client = setup_savon_client

      params = my_params.merge(login: VoipApi.account.login, secret: VoipApi.account.secret)

      # Invoke the call to the API
      begin
        savon_response = savon_client.call(api_method, message: params)
      rescue Savon::Error => error
        Logger.log "Savon Error Encountered: #{error.http.code} #{error.message}"
      end

      if savon_response.success? && !savon_response.soap_fault? && !savon_response.http_error?
        # Have this get converted to the appropriate kind of savon_response
        if response_klass
          response_klass.new(savon_response)
        end
      end
    end

  end
  
end
