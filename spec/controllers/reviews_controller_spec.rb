require 'spec_helper'

describe ReviewsController do
  describe "POST 'create'" do

    it "should create new review" do
      post 'create', {review: {rating: 3,
                               review_text: "This is a great product!"}}
      expect(response).to be_redirect
    end
  end
end
