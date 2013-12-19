require 'spec_helper'

describe StaticPagesController do

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      response.should be_success
    end
  end

  describe "GET 'about_us'" do
    it "returns http success" do
      get 'about_us'
      response.should be_success
    end
  end

  describe "GET 'return_policy'" do
    it "returns http success" do
      get 'return_policy'
      response.should be_success
    end
  end

end
