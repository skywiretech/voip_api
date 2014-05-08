require 'savon'

module VoipApi

  module Request

    def request(api_method, params={})
      client = Savon.client do |globals|
        globals.wsdl @wsdl
        globals.namespace @namespace
        globals.filters @filters
      end

      # Call client.call(:whatever) here
      response = client.call(api_method, message: params)

      # TODO: make a response object here
    end

  end
  
end
