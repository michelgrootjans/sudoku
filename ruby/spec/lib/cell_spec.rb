require 'spec_helper'

describe Cell do
  context "#new" do
    its(:solved?){should == false}
    its(:possible_values){should == [1, 2, 3, 4, 5, 6]}
    its(:value){should == :unknown}
  end

  context "disable 4" do
    before :each do
      subject.disable 4
    end

    its(:solved?){should == false}
    its(:possible_values){should == [1, 2, 3, 5, 6]}
    its(:value){should == :unknown}
  end

  context "disable 2 and 4" do
    before :each do
      subject.disable 2
      subject.disable 4
    end

    its(:solved?){should == false}
    its(:possible_values){should == [1, 3, 5, 6]}
    its(:value){should == :unknown}
  end

  context "disable all except 3" do
    before :each do
      subject.disable 1
      subject.disable 2
      subject.disable 4
      subject.disable 5
      subject.disable 6
    end

    its(:solved?){should == true}
    its(:possible_values){should == [3]}
    its(:value){should == 3 }
  end

  context "disable all" do
    before :each do
      subject.disable 1
      subject.disable 2
      subject.disable 3
      subject.disable 4
      subject.disable 5
      subject.disable 6
    end

    its(:solved?){should == false}
    its(:possible_values){should == []}
    its(:value){should == :impossible }
  end

  context "set known value" do
    before :each do
      subject.value = 3
    end

    its(:solved?){should == true}
    its(:possible_values){should == [3]}
    its(:value){should == 3 }
  end
end