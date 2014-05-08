require 'voip_api/configuration'
require 'voip_api/api'
require 'voip_api/client'

module VoipApi
  # Extract all the configuration related stuff to this module
  extend Configuration

  def self.client(options={})
    VoipApi::Client.new(options)
  end
  
end
