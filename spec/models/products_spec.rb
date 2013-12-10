require 'spec_helper'

describe Product do
  
  describe "validations" do

    it "should have a name" do
      expect(Product.new(name: nil)).to be_invalid
    end

    it "should have a description" do
      expect(Product.new(:description => nil)).to be_invalid
    end

    it "should have a category" do
      expect(Product.new(:category=>nil)).to be_invalid
    end

    it "should have a price" do
      expect(Product.new(:price=>nil)).to be_invalid
    end

  end

end
