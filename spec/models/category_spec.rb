require 'spec_helper'

describe Category do

  describe 'validations' do
    let(:category) {Category.new(category: "fruit")}
   
      it "should have a category" do
        category.category = nil
        expect(category).to be_invalid 
      end
    end

end
