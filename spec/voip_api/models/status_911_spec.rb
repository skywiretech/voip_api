require 'spec_helper'

module VoipApi
  module Models
    describe Status911 do
      describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
        it "can give you a description of an attribute" do
          Status911.description(:code).should eq("Used to determine the status of the database call")
          Status911.description(:description).should eq("Describes the staus of the database call")
        end

        it "should be able to create a new status_911 from their erratic variable names" do
          hashie_params = VoipApi::Mapping::VoipStatus911.new({
            code: "code",
            description: "description",
          })
          status_911 = Status911.new(hashie_params)
          status_911.code.should eq("code")
          status_911.description.should eq("description")
        end
      end
    end
  end
end
