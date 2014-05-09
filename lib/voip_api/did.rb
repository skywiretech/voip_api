# This represents the actual ruby objects for the DID model.

module VoipApi

  class DID
    include Comparable
    
    attr_accessor :tn, :availability, :expire_date, :endpoint, :rewrite, :status, :status_code,
      :ref_id, :cnam, :tier, :t_38, :cnam_name, :cnam_storage_active, :cnam_storage_availability,
      :registered_911, :registered_411, :failover, :forward

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
        "Telephone number"
      when :availability
        "Defines the status of the returned TN"
      when :expire_date
        "Date which this TN will be released if currently reserved"
      when :endpoint
        "This will return an integer that defines which endpoint group this TN will route to if the TN is assigned to you or reserved by you. This can be changed by performing a configDID request"
      when :rewrite
        "Used in rewriting the DNIS for the TN if assigned to you or reserved by you."
      when :status
        "This describes the status code for easy display"
      when :status_code
        "This code defines the status of the DID"
      when :ref_id
        "This is the customer-defined Reference ID that is associated with this request. This field is purely for the benefit of the API user, and could potentially be used to associate a Customer ID, Order ID, or any other Reference ID to an API request"
      when :cnam
        "Denotes whether calling name inbound is true or false"
      when :tier
        "Tier in which the number resides"
      when :t_38
        "Denotes whether T38 is true or false"
      when :cnam_name
        "CNAM Storage Display Name"
      when :cnam_storage_active
        "Denotes whether CNAM storage is active or inactive"
      when :cnam_storage_availability
        "Denotes whether CNAM storage availability is true or false"
      when :registered_911
        "Denotes whether E911 is true or false"
      when :registered_411
        "Denotes whether E411 is true or false"
      when :failover 
        "Failover number (if set) on the DID"
      when :forward
        "Forward number (if set) on the DID"
      end
    end

  end
end


