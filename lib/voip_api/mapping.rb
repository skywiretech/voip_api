require 'hashie'

module VoipApi
  # Correlates garbage SOAP keys into pretty, sane, hash keys
  module Mapping

    # A parent class which ignores undeclared keys
    class VoipMapping < Hashie::Trash
      include Hashie::Extensions::IgnoreUndeclared
    end

    # Normalizes Voip Innovations Soap keys into a sane format for DIDs
    class VoipDID < VoipMapping
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

    # Normalizes Voip Innovations Soap keys into a sane format for DIDLocators
    class VoipDIDLocator < VoipMapping
      property :tn
      property :rate_center, from: :rateCenter
      property :state
      property :tier
      property :lata_id, from: :lataId
      property :outbound_cnam, from: :outboundCNAM
      property :t_38, from: :t38
      property :sms
    end

    # Normalizes Voip Innovations Soap keys into a sane format for DIDCounts
    class VoipDIDCount < VoipMapping
      property :rate_center, from: :rateCenter
      property :state
      property :lata_id, from: :lataId
      property :tier
      property :did_count, from: :didCount
      property :cnam
      property :t_38, from: :t38
      property :sms
    end

    # Normalizes Voip Innovations Soap keys into a sane format for PortDetails
    class VoipPortDetail < VoipMapping
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

    # Normalizes Voip Innovations Soap keys into a sane format for EndpointGroups
    class VoipEndpointGroup < VoipMapping
      property :name
      property :id
    end

    # Normalizes Voip Innovations Soap keys into a sane format for PortDIDs
    class VoipPortDID < VoipMapping
      property :tn
      property :tier
      property :rate_center, from: :rateCenter
      property :state
      property :lata
      property :endpoint_group, from: :endpointGroup
      property :cnam
      property :e_911, from: :e911
    end

    # Normalizes Voip Innovations Soap keys into a sane format for DIDParams
    class VoipDIDParam < VoipMapping
      property :tn
      property :epg
      property :cnam
      property :ref_id, from: :refId
    end

    # Normalizes Voip Innovations Soap keys into a sane format for Status911
    class VoipStatus911 < VoipMapping
      property :status_code, from: :statusCode
      property :status_description, from: :statusDescription
    end

    # Normalizes Voip Innovations Soap keys into a sane format for DID911
    class VoipDID911 < VoipMapping
      property :location_id, from: :locationId
      property :tn
      property :caller_name, from: :callerName
      property :address1
      property :address2
      property :city
      property :state
      property :zip_code, from: :zipCode
      property :latitude
      property :longitude
      property :status_code, from: :statusCode
      property :status_description, from: :statusDescription
      property :activated_time, from: :activatedTime
      property :date_added, from: :dateAdded
    end

    # Normalizes Voip Innovations Soap keys into a sane format for VILocation
    class VoipVILocation < VoipMapping
      property :location_id, from: :locationId
      property :address1
      property :address2
      property :city
      property :state
      property :zip_code, from: :zipCode
      property :plus_four, from: :plusFour
      property :caller_name, from: :callerName
      property :latitude
      property :longitude
      property :activated_time, from: :activatedTime
      property :update_time, from: :updateTime
      property :status_code, from: :statusCode
      property :status_description, from: :statusDescription
    end

  end
end
