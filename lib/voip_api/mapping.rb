module VoipApi
  module Mapping

    class VoipDID < Hashie::Trash
      property :tn
      property :availability
      property :expire_date, from: :expireDate
      property :endpoint
      property :rewrite
      property :status
      property :status_code, from: :statusCode
      property :ref_id, from: :refId
      property :cnam
      property :tier
      property :t_38, from: :t38
      property :cnam_name, from: :cnamName
      property :cnam_storage_active, from: :cnamStorageActive
      property :cnam_storage_availability, from: :cnamStorageAvailability
      property :registered_911, from: :registered911
      property :registered_411, from: :registered411
      property :failover 
      property :forward
    end

  end
end
