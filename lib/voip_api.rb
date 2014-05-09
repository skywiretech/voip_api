require 'hashie/trash'
require 'voip_api/configuration'
require 'voip_api/api/did_request'
require 'voip_api/mapping'
require 'voip_api/account'
require 'voip_api/response'
require 'voip_api/did'
require 'voip_api/did_locator'
require 'voip_api/did_list'
require 'voip_api/did_locator_list'

module VoipApi
  # Extract all the configuration related stuff to this module
  extend Configuration

  def self.account(options={})
    VoipApi::Account.new(options)
  end
  
end
