require 'spec_helper'

module VoipApi
  describe Interface do
    it "can set the request_klass" do
      interface = Interface.new(VoipApi::API::X911Request)
      interface.request_klass.should eq(VoipApi::API::X911Request)
    end
  end
end
