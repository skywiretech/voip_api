require 'spec_helper'

module VoipApi
  module Models
    describe EndpointGroup do
      describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
        it "can give you a description of an attribute" do
          hashie_params = VoipApi::Mapping::VoipEndpointGroup.new({
            name: "name",
            id: 37,
          })
          eg = EndpointGroup.new(hashie_params)
          eg.name.should eq("name")
          eg.id.should eq(37)
        end

        it "should be able to create a new EndpointGroup from their erratic variable names" do
          EndpointGroup.description(:name).should eq("The name of the Endpoint Group")
          EndpointGroup.description(:id).should eq("The ID of the Endpoint Group")
        end
      end
    end
  end
end
