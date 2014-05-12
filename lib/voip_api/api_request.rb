module VoipApi
  module API

    class ApiRequest
      Dir[File.expand_path('../api/*.rb', __FILE__)].each{|f| require f}

      attr_accessor :arguments, :response, :action, :klass

      # This should be defined in the child
      def self.sandbox_soap_action_keys
        raise NotImplementedError
      end

      # This should be defined in the child
      def self.production_soap_action_keys
        raise NotImplementedError
      end

      # Get THEIR response code
      def voip_response(key=nil)
        if key
          parsed_response[:voip_response][key]
        else
          parsed_response[:voip_response]
        end
      end
      
      def voip_response_code
        voip_response(:response_code)
      end

      def voip_response_message
        voip_response(:response_message)
      end

      def payload
        # Hand of the dirty work to the response class
        parsed_response[:payload]
      end

      def parsed_response
        @response.parse(@action)
      end
    end

  end
end
