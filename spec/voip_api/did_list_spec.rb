require 'spec_helper'

module VoipApi
  describe DIDList do
    describe "concerning Enumerable operations" do
      before(:each) do
        @did_list = DIDList.new
        @did_1 = DID.new(tn: '4355551233', cnam_name: 'BBB')
        @did_2 = DID.new(tn: '4355551234', cnam_name: 'AAA')
        @did_3 = DID.new(tn: '4355551235', cnam_name: 'ZZZ')
        @did_list << @did_1
        @did_list << @did_2
        @did_list << @did_3
      end

      it "supports map" do
        @did_list.map { |k| k.tn }.should match_array(["4355551233","4355551234", "4355551235"])
      end

      it "supports sort_by" do
        @did_list.sort_by { |k| k.cnam_name }.should match_array([@did_2, @did_1, @did_3])
      end

      it "supports select" do
        @did_list.select { |k| k.cnam_name == 'BBB' }.should match_array([@did_1])
      end

      it "supports pushing a new element" do
        @did_4 = DID.new(tn: '4355551236', cnam_name: 'CCC')
        @did_list.dids.push(@did_4)
        @did_list.dids.should match_array([@did_1, @did_2, @did_3, @did_4])
      end

      it "supports popping off an element" do
        @did_list.dids.should match_array([@did_1, @did_2, @did_3])
        @did_list.pop
        @did_list.dids.should match_array([@did_1, @did_2])
      end
    end
  end
end

