module VoipApi

  # A PortDetail gives information about a given port
  # Methods using PortDetail object(s): getPortDetails, isPortable
  class PortDetail
    attr_accessor :id, :status, :end_user, :billing_tn, :porting_from, :sales_rep, 
      :submitted_date, :foc_date, :requested_foc_date, :default_endpooint_group, :port_dids

    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
      # TODO: let them pass in the PortDIDs list
      @port_dids = VoipApi::DIDList.new
    end

    def self.description(attribute)
      case attribute
      when :id
        "The port identification number"
      when :status
        "The current status of this port"
      when :end_user
        "The end user associated with the port"
      when :billing_tn
        "The BTN associated with this port"
      when :porting_from
        "The losing carrier or network"
      when :sales_rep
        "The porting representative assigned to this portId"
      when :submitted_date
        "The date and time that the port was submitted"
      when :foc_date
        "The date currently set for this port to FOC"
      when :requested_foc_date
        "The requested FOC date for this port"
      when :default_endpooint_group
        "The endpoint group to which the DIDs in this port will be assigned to upon completion"
      when :port_dids
        "Returns a collection of PortDIDs, one for each DID in the port"
      end
    end
  end

end
