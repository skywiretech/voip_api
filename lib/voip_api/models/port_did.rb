module VoipApi
  module Models
    # A PortDID provides general information about a number contained in a port. This object is contained within PortDetails.
    # @attr [String] tn The telephone numbers within this port
    # @attr [String] tier The tier that the TN or TNs are porting to
    # @attr [String] rate_center The rate center that the TN resides in
    # @attr [String] state The two letter abbreviation for the state in which the TN resides
    # @attr [String] lata The LATA in which the TN resides
    # @attr [String] endpoint_group The endpoint group to which the TN will be assigned
    # @attr [String] cnam Returns TRUE or FALSE indicating if the TN has the inbound CNAM feature enabled
    # @attr [String] e_911 Returns TRUE or FALSE indicating if the TN has e911 provisioned
    # @see VoipApi::API::PortRequest#get_port_details
    class PortDID
      include Comparable

      attr_accessor :tn, :tier, :rate_center, :state, :lata, :endpoint_group, :cnam, :e_911

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
          "The telephone numbers within this port"
        when :tier
          "The tier that the TN or TNs are porting to"
        when :rate_center
          "The rate center that the TN resides in"
        when :state
          "The two letter abbreviation for the state in which the TN resides"
        when :lata
          "The LATA in which the TN resides"
        when :endpoint_group
          "The endpoint group to which the TN will be assigned"
        when :cnam
          "Returns TRUE or FALSE indicating if the TN has the inbound CNAM feature enabled"
        when :e_911
          "Returns TRUE or FALSE indicating if the TN has e911 provisioned"
        end
      end
    end
  end
end
