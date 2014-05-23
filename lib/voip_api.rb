require 'hashie/trash'
require 'voip_api/configuration'
require 'voip_api/api_request'
require 'voip_api/mapping'
require 'voip_api/account'
require 'voip_api/response'
require 'voip_api/interface'
require 'voip_api/models/did'
require 'voip_api/models/did_locator'
require 'voip_api/models/did_count'
require 'voip_api/models/did_list'
require 'voip_api/models/did_param'
require 'voip_api/models/port_detail'
require 'voip_api/models/endpoint_group'
require 'voip_api/models/port_did'
require 'voip_api/models/status_911'
require 'voip_api/models/did_911'
require 'voip_api/models/vi_location'

# Extract all the configuration related stuff to this module
module VoipApi
  extend Configuration

  # Creates a new account instance for interacting with the API
  # using the defaults provided or using the options passed in.
  def self.account(options={})
    VoipApi::Account.new(options)
  end

  # Creates a new interface instance for abstracting out the API
  # Request details, and returns a pretty, sane, object.
  def self.interface
    VoipApi::Interface.new
  end

  # Delegate to VoipApi::Interface
  def self.method_missing(method, *args, &block)
    return super unless interface.respond_to?(method)
    interface.send(method, *args, &block)
  end

  # Delegate to VoipApi::Interface
  def self.respond_to?(method)
    return interface.respond_to?(method) || super
  end
  
end
