module VoipApi
  module Configuration

    # Allows setting all configuration options in a block
    def configure
      yield self
    end
    
  end
end
