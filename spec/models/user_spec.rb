require 'spec_helper'

describe User do
  
  describe "validations" do

    let(:new_user) { User.new(email:     "foo@example.com",
                              user_name: "Foo McBar") }

    it "must have an email" do
      new_user.email = nil
      expect(new_user).to be_invalid
    end

    it "must have a user name" do
      expect(new_user).to be_invalid
    end

    it "must have a password" do
      expect(new_user).to be_invalid
    end
  end
end
