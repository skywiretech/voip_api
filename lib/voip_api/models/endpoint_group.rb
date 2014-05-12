module VoipApi

  class EndpointGroup
    attr_accessor :name, :id
    
    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

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
