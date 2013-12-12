require 'spec_helper'

describe SessionsController do
  describe "Get'new'" do

    it "is successful" do
      get :new
      response.should be_successful
    end
  end

  describe "create" do

    it "is successful" do
      post 'create', {user: {email: "email", 
                             password_digest: "password"}}
      expect(response).to be_redirect
    end
  end
end
