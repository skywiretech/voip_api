require File.expand_path('../request', __FILE__)

module VoipApi
  class Account
    include Request
    include VoipApi::Mapping
    
    attr_accessor *Configuration::VALID_OPTIONS

    # Creates a new account
    def initialize(options={})
      options = VoipApi.options.merge(options)
      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
