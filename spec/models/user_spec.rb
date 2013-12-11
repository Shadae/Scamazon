require 'spec_helper'

describe User do
  
  describe "validations" do

    let(:new_user) { User.new(email:     "foo@example.com",
                              user_name: "Foo McBar",
                              password_digest:  "fluffybunnies") }

    it "must have an email" do
      new_user.email = nil
      expect(new_user).to be_invalid
    end

    it "must have a user name" do
      new_user.user_name = nil
      expect(new_user).to be_invalid
    end

    it "must have a password" do
      new_user.password_digest = nil
      expect(new_user).to be_invalid
    end
  end
end
