require 'spec_helper'

describe ProductsController do

  describe "GET 'index'" do

    it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all the products" do
      product1, product2 = Product.create!(name: "a", description: "b",category: "c", price: "100"), Product.create!(name: "b", description: "c",category: "d", price: "100")
        get :index
        expect(assigns(:products)).to match_array([product1, product2])
    end
  
  end


  describe "GET 'new'" do

    it "is successful" do
      get :new
      expect(response).to be_successful
    end

    it "renders the new product template" do
      get :new
      expect(response).to render_template("new")
    end
  
  end
 
 describe "POST 'index" do
    
    it "is successful" do
      post :index
      expect(response).to be_successful
    end
  
  end

  
end
