require 'spec_helper'

describe WelcomeController do

  describe 'get index' do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end
  end




end
