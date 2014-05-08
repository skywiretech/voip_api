require 'spec_helper'

module VoipApi
  describe DID do
    describe "concerning creating a new DID instance" do
      let(:did) { DID.new }

      it "should know the sandbox operations" do
        DID.sandbox_operations.should match_array([:audit_di_ds, :assign_did, :config_did, :query_did, :release_did, :reserve_did])
      end

      it "should know the production operations" do
        DID.production_operations.should match_array([:audit_di_ds, :assign_did, :config_did, :query_did, :release_did, :reserve_did, :get_did_forward])
      end

      it "should return the soap_action used to invoke the API request for now" do
        DID.production_operations.each do |action|
          if action == :audit_di_ds
            did.send(:audit_dids).should eq(action)
          else
            did.send(action).should eq(action)
          end
        end
      end
    end

    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "should be able to create a new DID with their jacked up keys" do
        date = Date.today
        hashie_params= VoipApi::Mapping::VoipDID.new({
          tn: "tn",
          availability: "availability",
          expireDate: date,
          endpoint: 5,
          rewrite: "rewrite",
          status: "status",
          statusCode: "statusCode",
          refId: "refId",
          cnam: false,
          tier: "tier",
          t38: true,
          cnamName: 'Whatever',
          cnamStorageActive: false,
          cnamStorageAvailability: false,
          registered911: true,
          registered411: true,
          failover: 5,
          forward: 37,
        })
        did = DID.new(hashie_params)
        did.tn.should eq("tn")
        did.availability.should eq("availability")
        did.expire_date.should eq(Date.today)
        did.endpoint.should eq(5)
        did.rewrite.should eq("rewrite")
        did.status.should eq("status")
        did.status_code.should eq("statusCode")
        did.ref_id.should eq("refId")
        did.cnam.should be_false
        did.tier.should eq("tier")
        did.t_38.should be_true
        did.cnam_name.should eq("Whatever")
        did.cnam_storage_active.should be_false
        did.cnam_storage_availability.should be_false
        did.registered_911.should be_true
        did.registered_411.should be_true
        did.failover.should eq(5)
        did.forward.should eq(37)
      end
    end
  end
end
