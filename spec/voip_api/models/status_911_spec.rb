require 'spec_helper'

module VoipApi
  describe Status911 do
    
    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "can give you a description of an attribute" do
        Status911.description(:status_code).should eq("Used to determine the status of the database call")
        Status911.description(:status_description).should eq("Describes the staus of the database call")
      end

      it "should be able to create a new status_911 from their erratic variable names" do
        hashie_params = VoipApi::Mapping::VoipStatus911.new({
          statusCode: "statusCode",
          statusDescription: "statusDescription",
        })
        status_911 = Status911.new(hashie_params)
        status_911.status_code.should eq("statusCode")
        status_911.status_description.should eq("statusDescription")
      end
    end

  end
end
