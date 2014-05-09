require 'hashie/trash'
require 'voip_api/configuration'
require 'voip_api/api'
require 'voip_api/mapping'
require 'voip_api/account'
require 'voip_api/did'

module VoipApi
  # Extract all the configuration related stuff to this module
  extend Configuration

  def self.account(options={})
    VoipApi::Account.new(options)
  end
  
end
