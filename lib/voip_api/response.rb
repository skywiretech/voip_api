module VoipApi

  class Response
    Dir[File.expand_path('../response/*.rb', __FILE__)].each{|f| require f}

    attr_accessor :savon, :body, :http_code

    def initialize(response)
      self.savon     = response
      self.body      = response.body
      self.http_code = response.http.code
      # TODO: handle errors here
    end

  end

end
