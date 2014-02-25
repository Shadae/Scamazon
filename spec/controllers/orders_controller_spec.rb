require 'spec_helper' 

describe OrdersController do
  describe "GET 'order/new'" do
    it "successfully hits the page" do
      get :new
      expect(response).to be_successful
    end
  end
end
