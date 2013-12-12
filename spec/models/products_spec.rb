require 'spec_helper'

describe Product do

    describe "validations" do 

      let(:product) {Product.new(name: "Apples",
                                  description: "delicious!",
                                  price: "200")}

      it "should have a name" do
        product.name = nil
        expect(product).to be_invalid 
      end

      it "should cause an error if name is nil" do
        product.name = nil
        product.save
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "should have a description" do
        product.description = nil
        expect(product).to be_invalid
      end

      it "should cause an error if description is nil" do
        product.description = nil
        product.save
        expect(product.errors[:description]).to include("can't be blank")
      end

      it "should have a price" do
        product.price = nil
        expect(product).to be_invalid
      end

      it "the price should not be negative" do
        product.price = -10
        expect(product).to be_invalid
      end

      it "should cause an error if there is no price" do
        product.price = nil
        product.save 
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "should cause an error if the price is negative" do
        product.price = -10
        product.save
        expect(product.errors[:price]).to include("must be greater than 0")
      end

    end

end
