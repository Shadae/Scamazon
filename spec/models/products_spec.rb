require 'spec_helper'

describe Product do

    describe "validations" do 

      let(:product) {Product.new(name: "Apples",
                                  description: "delicious!",
                                  category: "fruit",
                                  price: "200")}

    it "should have a name" do
      product.name = nil
      expect(product).to be_invalid 
    end

    it "should have a description" do
      product.description = nil
      expect(product).to be_invalid
    end

    it "should have a category" do
      product.category = nil
      expect(product).to be_invalid
    end

    it "should have a price" do
      product.price = nil
      expect(product).to be_invalid
    end

  end

end
