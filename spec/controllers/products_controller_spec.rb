require 'spec_helper'

describe ProductsController do

  let(:product1) { Product.create!(name: "apples", 
                                   description: "delicious",
                                   category: "fruit",
                                   price: "100") }
  let(:product2) { Product.create!(name: "bananas", 
                                   description: "yummy",
                                   category: "fruit",
                                   price: "200") }

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

        get :index
        expect(assigns(:products)).to match_array([product1, product2])
    end
  
  end

  describe "POST 'index" do
    
    it "is successful" do
      post :index
      expect(response).to be_successful
    end
  
  end

  describe "create new page" do
    render_views

    it "is successful" do
      get :new
      expect(response).to be_successful
    end

    it "renders the new product template" do
      get :new
      expect(response).to render_template("new")
    end

    it "should create new product" do
      post 'create', {product: {name: "carrot",
                                description: "crunchy",
                                category: "vegetable",
                                price: 100}}
      expect(response).to be_redirect
    end

  it "should create new product" do
      expect {post 'create', {product: {name: nil,
                                description: "crunchy",
                                category: "vegetable",
                                price: 100}}}.not_to change(Product, :count).by(1)
    end
  
  end

  describe "edit page" do
    
  
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

    it "shows the category of the product" do
      request 
      expect(product1.category).to be_present
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


  end



  
end
