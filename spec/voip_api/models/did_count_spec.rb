require 'spec_helper'

module VoipApi
  describe DIDCount do
    
    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "can give you a description of an attribute" do
        DIDCount.description(:rate_center).should eq("Name of the rate center matching the search criteria")
        DIDCount.description(:state).should eq("Two letter state abbreviation matching the serach criteria")
        DIDCount.description(:lata_id).should eq("The LATA matching the search criteria")
        DIDCount.description(:tier).should eq("The tier in which the numbers reside")
        DIDCount.description(:did_count).should eq("The number of available DIDs in a specified tier for a rate center")
        DIDCount.description(:cnam).should eq("Returns TRUE or FALSE, indicates if the numbers are CNAM Storage capable")
        DIDCount.description(:t_38).should eq("Returns TRUE or FALSE, indicates if the numbers are T38 fax capable")
        DIDCount.description(:sms).should eq("Returns TRUE or FALSE, indicates if the numbers are capable of SMS messaging")
      end

      it "should be able to create a new DIDCount from their erratic variable names" do
        date = Date.today
        hashie_params = VoipApi::Mapping::VoipDIDCount.new({
          rateCenter: 'rateCenter',
          state: 'UT',
          lataId: 5,
          tier: 'tier',
          didCount: "37",
          cnam: 'cnam',
          t38: 't38',
          sms: false
        })
        dc = DIDCount.new(hashie_params)
        dc.rate_center.should eq("rateCenter")
        dc.state.should eq("UT")
        dc.lata_id.should eq(5)
        dc.tier.should eq("tier")
        dc.did_count.should eq("37")
        dc.cnam.should eq("cnam")
        dc.t_38.should eq("t38")
        dc.sms.should be_false
      end
    end

    describe "concerning enumerable and sorting modules" do
      it "should be able to be sorted by rate_center" do
        @did_1 = DIDCount.new(rate_center: 'AAA')
        @did_2 = DIDCount.new(rate_center: 'ZZZ')
        [@did_2, @did_1].sort.should match_array([@did_1, @did_2])
      end
    end

  end
end
