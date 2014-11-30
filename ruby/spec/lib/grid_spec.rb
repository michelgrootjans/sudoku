require 'spec_helper'

describe Grid do
  before :each do
    subject.name = "B"
  end

  context "Empty grid" do
    its(:solved){ should == false }
    its(:name)  { should == "B" }

  end

  context "one value is known" do
    before :each do
      subject.set_value(3, 1, 4)
    end

    its(:solved){ should == false }

    it "cell (3,1) should have value 4" do
      subject.value_of(3,1).should == 4
    end

    it "cell (1,2) should not allow 4" do
      subject.possible_values_of(1,2).should == [1, 2, 3, 5, 6]
    end

    it "cell (3,2) should not allow 4" do
      subject.possible_values_of(3,2).should == [1, 2, 3, 5, 6]
    end
  end

  context "add more known values" do
    before :each do
      subject.set_value(3, 1, 4)
      subject.set_value(2, 2, 1)
      subject.set_value(1, 2, 3)
    end

    its(:solved){ should == false }

    it "cell (2,1) should allow 2, 5, 6" do
      subject.possible_values_of(2,1).should == [2, 5, 6]
    end

    it "cell (3,2) should allow 2, 5, 6" do
      subject.possible_values_of(3,2).should == [2, 5, 6]
    end
  end

  context "the grid to the left has found a value" do
    before :each do
      subject.set_value(3, 1, 4)
      subject.set_value(2, 2, 1)
      subject.set_value(1, 2, 3)
      # left channel found "A", 2, 2, 5
    end

    its(:solved){ should == false }

    it "cell (1,1) should allow 2, 5, 6" do
      subject.possible_values_of(1,1).should == [2, 5, 6]
    end

    it "cell (2,1) should allow 2, 6" do
      pending "this is wher we start with communication"
      subject.possible_values_of(2,1).should == [2, 6]
    end
  end

end