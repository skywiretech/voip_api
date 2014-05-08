module VoipApi

  class Client
    # Include our other files that relate to clients
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
  end
  
end
