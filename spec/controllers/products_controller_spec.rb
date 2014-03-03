require 'spec_helper'

describe ProductsController do

  let!(:product1) { create(:product) }
  let(:product2) { create(:product1) }

  describe "create new page" do

    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "show page" do
    render_views 

    let(:request) { get :show, id: product1.id }
    
    it "is successful" do
      request
      expect(response).to be_successful
    end

    it "shows the name of the product" do
      request
      expect(product1.name).to be_present
    end

    it "shows the description of the product" do
      request
      expect(product1.description).to be_present
    end

    it "shows the price of the product" do
      request
      expect(product1.price).to be_present
    end

    it "shows that a product is retired" do
      product1.retired = true
      product1.save
      request
      expect(response.body).to include("This Product Is No Longer Available.")
    end

    it "doesn't show that a product is retired if it is not" do
      request
      expect(response.body).to_not include("This Product Is No Longer Available.")
    end

    it "has an 'add to cart' button if product is not retired" do
      request
      expect(response.body).to include("Cart")
    end
  end
end
