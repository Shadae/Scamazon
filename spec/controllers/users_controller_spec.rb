require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new' 
      expect(response).to be_success
    end
  end

  it "should create user" do
    post 'create', {user: {email: "email",
                           user_name: "username",
                           password_digest: "password", 
                           password_confirmation: "password"} }
    expect(response).to be_redirect
  end

  describe "show page" do
  end

  it "should set user" do

  end

  it "should show user" do

  end

  it "should destroy user" do
  end

  it "should edit user" do
    
  end


end

