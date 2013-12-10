require 'spec_helper'

describe PurchasepagesController do
  describe "GET 'purchase'" do

    it "successfully hits the page" do
      get :purchase
      response.should be_successful
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
