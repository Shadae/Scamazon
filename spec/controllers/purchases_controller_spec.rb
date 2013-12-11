require 'spec_helper' 

describe PurchasesController do
  describe "GET 'purchase/new'" do

    it "successfully hits the page" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'purchase'" do
    it "successfully hits the page" do
      post :create, {:purchase => {:first_name=> "foo"}}
      expect(response).to be_redirect
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
