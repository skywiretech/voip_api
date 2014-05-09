require 'spec_helper'

module VoipApi
  describe DIDLocatorList do
    describe "concerning Enumerable operations" do
      before(:each) do
        @did_locator_list = DIDLocatorList.new
        @did_locator_1 = DIDLocator.new(tn: '4355551233', outbound_cnam: 'BBB')
        @did_locator_2 = DIDLocator.new(tn: '4355551234', outbound_cnam: 'AAA')
        @did_locator_3 = DIDLocator.new(tn: '4355551235', outbound_cnam: 'ZZZ')
        @did_locator_list << @did_locator_1
        @did_locator_list << @did_locator_2
        @did_locator_list << @did_locator_3
      end

      it "supports map" do
        @did_locator_list.map { |k| k.tn }.should match_array(["4355551233","4355551234", "4355551235"])
      end

      it "supports sort_by" do
        @did_locator_list.sort_by { |k| k.outbound_cnam }.should match_array([@did_locator_2, @did_locator_1, @did_locator_3])
      end

      it "supports select" do
        @did_locator_list.select { |k| k.outbound_cnam == 'BBB' }.should match_array([@did_locator_1])
      end

      it "supports pushing a new element" do
        @did_4 = DIDLocator.new(tn: '4355551236', outbound_cnam: 'CCC')
        @did_locator_list.did_locators.push(@did_4)
        @did_locator_list.did_locators.should match_array([@did_locator_1, @did_locator_2, @did_locator_3, @did_4])
      end

      it "supports popping off an element" do
        @did_locator_list.did_locators.should match_array([@did_locator_1, @did_locator_2, @did_locator_3])
        @did_locator_list.pop
        @did_locator_list.did_locators.should match_array([@did_locator_1, @did_locator_2])
      end
    end
  end
end

