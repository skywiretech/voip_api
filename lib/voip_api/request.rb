require 'savon'

module VoipApi

  module Request

    def request(api_method, params={})
      client = Savon.client do |globals|
        globals.wsdl @wsdl
        globals.namespace @namespace
        globals.filters @filters
        globals.pretty_print_xml true
        globals.namespace_identifier :tns
        globals.strip_namespaces true
      end

      # Invoke the call to the API
      response = client.call(api_method, message: params)

      # TODO: make a response object here
    end

  end
  
end
