require File.expand_path('../request', __FILE__)

module VoipApi

  class API
    include Request
    
    attr_accessor *Configuration::VALID_OPTIONS

    # Creates a new API
    def initialize(options={})
      options = VoipApi.options.merge(options)
      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
  end
  
end
