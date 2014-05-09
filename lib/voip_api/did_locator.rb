module VoipApi

  class DIDLocator
    include Comparable

    attr_accessor :tn, :state, :lata_id, :rate_center, :tier, :t_38, :outbound_cnam, :sms

    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
    def <=>(other)
      @tn <=> other.tn
    end

    def self.description(attribute)
      case attribute
      when :tn
        "Telephone number of the DID"
      when :state
        "Two-letter state abbreviation that matches your search criteria"
      when :lata_id
        "The LATA that matches your search criteria"
      when :rate_center
        "Name of the rate center that matches your search criteria"
      when :tier
        "Tier in which the number resides"
      when :t_38
        "Denotes whether T38 is true or false"
      when :outbound_cnam
        "Denotes whether outbound CNAM is available"
      when :sms
        "Has SMS"
      end
    end

  end

end
