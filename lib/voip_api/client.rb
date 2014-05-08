module VoipApi

  class Client < API
    # Include our other files that relate to clients
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{ |f| require f }
    include VoipApi::Mapping
  end
  
end
