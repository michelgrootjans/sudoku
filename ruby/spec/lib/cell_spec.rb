require 'spec_helper'

describe Cell do
  context "#new" do
    its(:solved){should == false}
    its(:possible_values){should == [1, 2, 3, 4, 5, 6]}
    its(:value){should == :unknown}
  end

  context "disable 4" do
    before :each do
      subject.disable 4
    end

    its(:solved){should == false}
    its(:possible_values){should == [1, 2, 3, 5, 6]}
    its(:value){should == :unknown}
  end
end