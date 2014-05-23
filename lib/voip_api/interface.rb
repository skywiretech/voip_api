module VoipApi

  # This abstracts out all the nasty ApiRequest logic into a pretty interface
  # @attr [Constant] request_klass The ApiRequest descendant object class
  # @attr [Object] request The ApiRequest object
  # @attr [Array] errors An array containing error messages if any
  class Interface
    attr_accessor :request_klass, :request, :errors

    # @param request_klass [Class] The class of the ApiRequest descendant to use
    def initialize(request_klass=nil)
      @request_klass = request_klass
      @errors = []
    end

    # Populate the errors array with applicable messages
    def populate_errors
      # Make sure we have a request
      if @request
        # Make sure that has a response
        if @request.response
          # Get the request -> response -> klass -> errors
          @response_klass = @request.klass

          # Make sure it isn't nil
          if @response_klass
            if (@request.voip_response_code.to_i == 100)
              # Nothing wrong
            else
              # Something wrong
              @errors.push(@request.voip_response_message) unless @errors.include?(@request.voip_response_message)
            end
          end
        end
      end
    end

    # Delegate to the appropriate ApiRequest descendants
    def method_missing(method, *args, &block)
      klass = VoipApi::API::ApiRequest.delegated_klass(method)
      if klass
        # See if one of my children can handle this
        delegated_klass = klass.new
        if delegated_klass.respond_to?(method)
          # Capture this thing
          @request_klass = delegated_klass

          # Tell the children to take care of it
          @request = delegated_klass.send(method, *args, &block)
          self.populate_errors
          self
        else
          # If we don't handle it, then call super
          super
        end
      else
        # No child
        super
      end
    end

    # Delegate to the appropriate ApiRequest descendants
    def respond_to?(method)
      klass = VoipApi::API::ApiRequest.delegated_klass(method)
      if klass
        # See if one of my children can handle this
        delegated_klass = klass.new

        if delegated_klass.respond_to?(method)
          true
        else
          # If we don't handle it, then call super
          super
        end
      else
        # No child
        super
      end
    end
  end
  
end
