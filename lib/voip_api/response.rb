module VoipApi

  # Represents the base class for interpreting the API Response.
  # This should never be instantiated, only inherited from!
  # @attr [Object] savon The Savon ruby object
  # @attr [Text] body The HTTP response body
  # @attr [Integer] http_code The HTTP response code
  class Response
    Dir[File.expand_path('../response/*.rb', __FILE__)].each{|f| require f}

    attr_accessor :savon, :body, :http_code

    # Sets up a response object which is passed in from Savon
    # @param response [Object] the Savon HTTP response object
    def initialize(response)
      self.savon     = response
      self.body      = response.body
      self.http_code = response.http.code
      # TODO: handle errors here
    end

    # Provides detailed information about VOIP Innovations response codes
    # @param code [Integer] The response code returned in the SOAP XML envelope
    # @return [Array<Symbol, String>] Returns an array of the status code category and status code interpretation
    def self.status_code_detail(code)
      case code.to_i
      when 100
        [:general, "Success"]
      when 101
        [:general, "No Records Found"]
      when 900
        [:general, "An exception occurred"]
      when 901
        [:general, "Client IP not found"]
      when 902
        [:general, "Username/password/IP not found"]
      when 944
        [:general, "Invalid Number"]
      when 948
        [:general, "You do not own the specified Endpoint Group"]
      else
        [:unknown, "Unknown code: #{code}"]
      end
    end

  end

end
