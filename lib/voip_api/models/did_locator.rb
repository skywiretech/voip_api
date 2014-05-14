module VoipApi

  # A DIDLocator is a representation of DID information in our database.
  # @attr [String] tn Telephone number of the DID matching your search criteria
  # @attr [String] rate_center The name of the Rate Center that matches your search criteria
  # @attr [String] state Two-letter state abbreviation that matches your search criteria
  # @attr [String] tier Pricing tier on which the number in your search criteria resides
  # @attr [String] lata_id The LATA that matches your search criteria
  # @attr [String] outbound_cnam Denotes whether or not the the DID in your search criteria supports CNAM Storage
  # @attr [String] t_38 Denotes whether or not the DID in your search criteria is T38 capable
  # @attr [String] sms Denotes whether or not the DID in your search criteria supports inbound SMS
  # @see VoipApi::API::DIDRequest#get_dids
  class DIDLocator
    include Comparable

    attr_accessor :tn, :rate_center, :state, :tier, :lata_id, :outbound_cnam, :t_38, :sms

    # @!visibility private
    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
    # @!visibility private
    def <=>(other)
      @tn <=> other.tn
    end

    # Describes the attribute passed in
    # @param attribute [Symbol] A symbol representing the attribute for which you desire a description of
    def self.description(attribute)
      case attribute
      when :tn
        "Telephone number of the DID matching your search criteria"
      when :rate_center
        "The name of the Rate Center that matches your search criteria"
      when :state
        "Two-letter state abbreviation that matches your search criteria"
      when :tier
        "Pricing tier on which the number in your search criteria resides"
      when :lata_id
        "The LATA that matches your search criteria"
      when :outbound_cnam
        "Denotes whether or not the the DID in your search criteria supports CNAM Storage"
      when :t_38
        "Denotes whether or not the DID in your search criteria is T38 capable"
      when :sms
        "Denotes whether or not the DID in your search criteria supports inbound SMS"
      end
    end

  end

end
