require 'spec_helper'

module VoipApi
  module Models
    describe DIDLocator do
      describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
        it "can give you a description of an attribute" do
          DIDLocator.description(:tn).should eq("Telephone number of the DID matching your search criteria")
          DIDLocator.description(:rate_center).should eq("The name of the Rate Center that matches your search criteria")
          DIDLocator.description(:state).should eq("Two-letter state abbreviation that matches your search criteria")
          DIDLocator.description(:tier).should eq("Pricing tier on which the number in your search criteria resides")
          DIDLocator.description(:lata_id).should eq("The LATA that matches your search criteria")
          DIDLocator.description(:outbound_cnam).should eq("Denotes whether or not the the DID in your search criteria supports CNAM Storage")
          DIDLocator.description(:t_38).should eq("Denotes whether or not the DID in your search criteria is T38 capable")
          DIDLocator.description(:sms).should eq("Denotes whether or not the DID in your search criteria supports inbound SMS")
        end

        it "should convert their XML response keys to sane camelcase keys" do
          hashie_params = VoipApi::Mapping::VoipDIDLocator.new({
            tn: "tn",
            state: 'UT',
            lataId: 5,
            rateCenter: 'rateCenter',
            tier: "tier",
            t38: true,
            outboundCNAM: 'outboundCNAM',
            sms: false,
          })
          locator = DIDLocator.new(hashie_params)
          locator.tn.should eq("tn")
          locator.state.should eq("UT")
          locator.lata_id.should eq(5)
          locator.rate_center.should eq("rateCenter")
          locator.tier.should eq("tier")
          locator.t_38.should be_true
          locator.outbound_cnam.should eq("outboundCNAM")
          locator.sms.should be_false
        end
      end

      describe "concerning enumerable and sorting modules" do
        it "should be able to be sorted by telephone number" do
          @did_locator_1 = DIDLocator.new(tn: '4355551233')
          @did_locator_2 = DIDLocator.new(tn: '4355551234')
          [@did_locator_2, @did_locator_1].sort.should match_array([@did_locator_1, @did_locator_2])
        end
      end
    end
  end
end
