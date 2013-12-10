require 'spec_helper'

describe ProductsController do

  describe "GET 'index'" do

    it "is successful" do
      get :index
      response.should be_successful
    end

  end

end
