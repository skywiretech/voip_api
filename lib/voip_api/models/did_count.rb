module VoipApi

  # A DIDCount gives information about a Rate Center and the number of available DIDs by tier
  # Methods using DIDCount object(s): getDIDCount
  class DIDCount
    include Comparable

    attr_accessor :rate_center, :state, :lata_id, :tier, :did_count, :cnam, :t_38, :sms

    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def <=>(other)
      @rate_center <=> other.rate_center
    end

    def self.description(attribute)
      case attribute
      when :rate_center
        "Name of the rate center matching the search criteria"
      when :state
        "Two letter state abbreviation matching the serach criteria"
      when :lata_id
        "The LATA matching the search criteria"
      when :tier
        "The tier in which the numbers reside"
      when :did_count
        "The number of available DIDs in a specified tier for a rate center"
      when :cnam
        "Returns TRUE or FALSE, indicates if the numbers are CNAM Storage capable"
      when :t_38
        "Returns TRUE or FALSE, indicates if the numbers are T38 fax capable"
      when :sms
        "Returns TRUE or FALSE, indicates if the numbers are capable of SMS messaging"
      end
    end

  end

end

