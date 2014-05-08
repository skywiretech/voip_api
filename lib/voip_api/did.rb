module VoipApi

  class DID
    attr_accessor :tn, :availability, :expire_date, :endpoint, :rewrite, :status, :status_code,
      :ref_id, :cnam, :tier, :t_38, :cnam_name, :cnam_storage_active, :cnam_storage_availability,
      :registered_911, :registered_411, :failover, :forward

    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    # And what can you do...?
    def self.sandbox_operations
      [
        :audit_di_ds,
        :assign_did,
        :config_did,
        :query_did,
        :release_did,
        :reserve_did,
      ]
    end

    def self.production_operations
      sandbox_operations.push(:get_did_forward)
    end

    # SANDBOX OPERATIONS

    def audit_dids
      :audit_di_ds
    end

    def assign_did
      :assign_did
    end

    def config_did
      :config_did
    end

    def query_did
      :query_did
    end

    def release_did
      :release_did
    end

    def reserve_did
      :reserve_did
    end

    # PRODUCTION OPERATIONS

    # Not available in sandbox
    def get_did_forward
      # TODO: assuming that this is the right name of the SOAP action
      :get_did_forward
    end
  end
  
end
