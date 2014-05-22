module VoipApi
  module Models
    # Represents and Endpoint Group object.
    # @attr [String] name The name of the Endpoint Group
    # @attr [String] id The ID of the Endpoint Group
    class EndpointGroup
      attr_accessor :name, :id
      
      # @!visibility private
      def initialize(hashie_params={})
        # Setup all our attributes if we respond to it.
        hashie_params.each do |k, v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      # Describes the attribute passed in
      # @param attribute [Symbol] A symbol representing the attribute for which you desire a description of
      def self.description(attribute)
        case attribute
        when :name
          "The name of the Endpoint Group"
        when :id
          "The ID of the Endpoint Group"
        end
      end
    end
  end
end
