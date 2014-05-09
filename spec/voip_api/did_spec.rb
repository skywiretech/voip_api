require 'spec_helper'

module VoipApi
  describe DID do
    
    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "can give you a description of an attribute" do
        DID.description(:tn).should eq("Telephone number")
        DID.description(:availability).should eq("Defines the status of the returned TN")
        DID.description(:expire_date).should eq("Date which this TN will be released if currently reserved")
        DID.description(:endpoint).should eq("This will return an integer that defines which endpoint group this TN will route to if the TN is assigned to you or reserved by you. This can be changed by performing a configDID request")
        DID.description(:rewrite).should eq("Used in rewriting the DNIS for the TN if assigned to you or reserved by you.")
        DID.description(:status).should eq("This describes the status code for easy display")
        DID.description(:status_code).should eq("This code defines the status of the DID")
        DID.description(:ref_id).should eq("This is the customer-defined Reference ID that is associated with this request. This field is purely for the benefit of the API user, and could potentially be used to associate a Customer ID, Order ID, or any other Reference ID to an API request")
        DID.description(:cnam).should eq("Denotes whether calling name inbound is true or false")
        DID.description(:tier).should eq("Tier in which the number resides")
        DID.description(:t_38).should eq("Denotes whether T38 is true or false")
        DID.description(:cnam_name).should eq("CNAM Storage Display Name")
        DID.description(:cnam_storage_active).should eq("Denotes whether CNAM storage is active or inactive")
        DID.description(:cnam_storage_availability).should eq("Denotes whether CNAM storage availability is true or false")
        DID.description(:registered_911).should eq("Denotes whether E911 is true or false")
        DID.description(:registered_411).should eq("Denotes whether E411 is true or false")
        DID.description(:failover).should eq("Failover number (if set) on the DID")
        DID.description(:forward).should eq("Forward number (if set) on the DID")
      end

      it "should be able to create a new DID from their erratic variable names" do
        date = Date.today
        hashie_params = VoipApi::Mapping::VoipDID.new({
          tn: "tn",
          availability: "availability",
          expireDate: date,
          endpoint_id: 5,
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
          has911: true,
          has411: true,
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

    describe "concerning enumerable and sorting modules" do
      it "should be able to be sorted by telephone number" do
        @did_1 = DID.new(tn: '4355551233')
        @did_2 = DID.new(tn: '4355551234')
        [@did_2, @did_1].sort.should match_array([@did_1, @did_2])
      end
    end

  end
end
