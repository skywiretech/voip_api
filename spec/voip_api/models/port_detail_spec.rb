require 'spec_helper'

module VoipApi
  module Models
    describe PortDetail do
      describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
        it "can give you a description of an attribute" do
          PortDetail.description(:id).should eq("The port identification number")
          PortDetail.description(:status).should eq("The current status of this port")
          PortDetail.description(:end_user).should eq("The end user associated with the port")
          PortDetail.description(:billing_tn).should eq("The BTN associated with this port")
          PortDetail.description(:porting_from).should eq("The losing carrier or network")
          PortDetail.description(:sales_rep).should eq("The porting representative assigned to this portId")
          PortDetail.description(:submitted_date).should eq("The date and time that the port was submitted")
          PortDetail.description(:foc_date).should eq("The date currently set for this port to FOC")
          PortDetail.description(:requested_foc_date).should eq("The requested FOC date for this port")
          PortDetail.description(:default_endpooint_group).should eq("The endpoint group to which the DIDs in this port will be assigned to upon completion")
          PortDetail.description(:port_dids).should eq("Returns a collection of PortDIDs, one for each DID in the port")
        end

        it "should be able to create a new DID from their erratic variable names" do
          date = Date.today
          hashie_params = VoipApi::Mapping::VoipPortDetail.new({
            id: 37,
            status: 'status',
            endUser: 'endUser',
            billingTN: 'billingTN',
            portingFrom: 'portingFrom',
            salesRep: 'salesRep',
            submittedDate: date,
            focDate: date,
            requestedFocDate: date,
            defaultEndpointGroup: 8674,
          })
          port_detail = PortDetail.new(hashie_params)
          port_detail.id.should eq(37)
          port_detail.status.should eq("status")
          port_detail.end_user.should eq("endUser")
          port_detail.billing_tn.should eq("billingTN")
          port_detail.porting_from.should eq("portingFrom")
          port_detail.sales_rep.should eq("salesRep")
          port_detail.submitted_date.should eq(date)
          port_detail.foc_date.should eq(date)
          port_detail.requested_foc_date.should eq(date)
          port_detail.default_endpooint_group.should eq(8674)
        end
      end
    end
  end
end


