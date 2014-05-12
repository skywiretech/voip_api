module VoipApi
  module Mapping

    class VoipDID < Hashie::Trash
      property :tn
      property :availability
      property :rewrite
      property :status
      property :status_code, from: :statusCode
      property :tier
      property :ref_id, from: :refId
      property :cnam_name, from: :cnamName
      property :state
      property :rate_center, from: :rateCenter
      property :did_group_id, from: :didGroupId
      property :network, from: "Network"
      property :endpoint_id, from: :endpointId
      property :expire_date, from: :expireDate
      property :has_411, from: :has411
      property :has_911, from: :has911
      property :cnam
      property :cnam_storage_active, from: :cnamStorageActive
      property :cnam_storage_availability, from: :cnamStorageAvailability
      property :t_38, from: :t38
      property :failover
      property :forward
    end

    class VoipDIDLocator < Hashie::Trash
      property :tn
      property :rate_center, from: :rateCenter
      property :state
      property :tier
      property :lata_id, from: :lataId
      property :outbound_cnam, from: :outboundCNAM
      property :t_38, from: :t38
      property :sms
    end

    class VoipDIDCount < Hashie::Trash
      property :rate_center, from: :rateCenter
      property :state
      property :lata_id, from: :lataId
      property :tier
      property :did_count, from: :didCount
      property :cnam
      property :t_38, from: :t38
      property :sms
    end

    class VoipPortDetail < Hashie::Trash
      property :id
      property :status
      property :end_user, from: :endUser
      property :billing_tn, from: :billingTN
      property :porting_from, from: :portingFrom
      property :sales_rep, from: :salesRep
      property :submitted_date, from: :submittedDate
      property :foc_date, from: :focDate
      property :requested_foc_date, from: :requestedFocDate
      property :default_endpooint_group, from: :defaultEndpointGroup
    end

    class VoipEndpointGroup < Hashie::Trash
      property :name
      property :id
    end

    class VoipPortDID < Hashie::Trash
      property :tn
      property :tier
      property :rate_center, from: :rateCenter
      property :state
      property :lata
      property :endpoint_group, from: :endpointGroup
      property :cnam
      property :e_911, from: :e911
    end

    class VoipDIDParam < Hashie::Trash
      property :tn
      property :epg
      property :cnam
      property :ref_id, from: :refId
    end

  end
end
