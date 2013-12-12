require 'spec_helper' 

describe OrdersController do
  #this chunk is the form that you fill out to create a new review
  describe "GET 'order/new'" do
    it "successfully hits the page" do
      get :new
      expect(response).to be_successful
    end

    it "validates first name" do
      expect(Order.new(first_name: nil)).to_not be_valid
    end
  end

  #This is the button that is clicked when you create a new review
  describe "POST 'order'" do
    it "successfully hits the page" do
      post :create, {:order => {:first_name=> "foo"}}
      expect(response).to be_successful
    end
  end

  # describe "submit button" do
  #   it "is successful" do
  #     post :make_purchase, {:name => "foo", :zip => '98106'}
  #     :params[:name].should = "foo"



  #     expect(response.body).to include("foo")
  #   end
  # end


end
