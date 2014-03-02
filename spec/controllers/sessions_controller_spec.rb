require 'spec_helper'

describe SessionsController do
  describe "Get'new'" do

    it "is successful" do
      get :new
      response.should be_successful
    end
  end

  describe "create" do
    let!(:user){ create(:user) }

    it "is successful" do
      post :create, {email: user.email, 
                     password: 'password'}
      expect(response).to be_redirect
    end
  end
end


