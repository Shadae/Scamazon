require 'spec_helper'

describe ReviewsController do
  describe "GET 'new'" do

    it "is successful" do
      get :new
      response.should be_successful
    end
  end

  describe "POST 'new'" do

    it "is successful" do
      post :new
      response.should be_successful
    end

    it "renders the new review template" do
      get :new
      expect(response).to render_template("new")
    end

    it "should create new product" do
      post 'create', {review: {rating: 3,
                               review_text: "This is a great product!"}}
      expect(response).to be_redirect
    end

    it "loads reviews into @review" do
      review1 = Review.create!
      get :show, id: review1.id

      expect(assigns(:review)).to eq(review1)
    end
  end
end
