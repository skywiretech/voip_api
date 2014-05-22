module VoipApi
  module Models
    # A Status911 defines the status code and status description of a modified 911 location or DID.
    # @attr [String] code Used to determine the status of the database call
    # @attr [String] description Describes the staus of the database call
    # @see VoipApi::API::X911Request#provision_location
    # @see VoipApi::API::X911Request#remove_location
    # @see VoipApi::API::X911Request#update_911
    # @see VoipApi::API::X911Request#insert_911
    # @see VoipApi::API::X911Request#remove_911
    class Status911
      attr_accessor :code, :description

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
        when :code
          "Used to determine the status of the database call"
        when :description
          "Describes the staus of the database call"
        end
      end
    end
  end
end
