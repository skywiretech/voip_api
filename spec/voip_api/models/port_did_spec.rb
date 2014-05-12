require 'spec_helper'

module VoipApi
  describe PortDID do

    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "can give you a description of an attribute" do
        PortDID.description(:tn).should eq("The telephone numbers within this port")
        PortDID.description(:tier).should eq("The tier that the TN or TNs are porting to")
        PortDID.description(:rate_center).should eq("The rate center that the TN resides in")
        PortDID.description(:state).should eq("The two letter abbreviation for the state in which the TN resides")
        PortDID.description(:lata).should eq("The LATA in which the TN resides")
        PortDID.description(:endpoint_group).should eq("The endpoint group to which the TN will be assigned")
        PortDID.description(:cnam).should eq("Returns TRUE or FALSE indicating if the TN has the inbound CNAM feature enabled")
        PortDID.description(:e_911).should eq("Returns TRUE or FALSE indicating if the TN has e911 provisioned")
      end

      it "should be able to create a new PortDID from their erratic variable names" do
        hashie_params = VoipApi::Mapping::VoipPortDID.new({
          tn: 'tn',
          tier: 'tier',
          rateCenter: 'rateCenter',
          state: 'UT',
          lata: 'lata',
          endpointGroup: 37,
          cnam: 'cnam',
          e911: true,
        })
        port_did = PortDID.new(hashie_params)
        port_did.tn.should eq("tn")
        port_did.tier.should eq("tier")
        port_did.rate_center.should eq("rateCenter")
        port_did.state.should eq("UT")
        port_did.lata.should eq("lata")
        port_did.endpoint_group.should eq(37)
        port_did.cnam.should eq("cnam")
        port_did.e_911.should be_true
      end
    end

    describe "concerning enumerable and sorting modules" do
      it "should be able to be sorted by telephone number" do
        @port_did_1 = PortDID.new(tn: '4355551233')
        @port_did_2 = PortDID.new(tn: '4355551234')
        [@port_did_2, @port_did_1].sort.should match_array([@port_did_1, @port_did_2])
      end
    end
    
  end
end
