require 'rails_helper'
require 'support/violate_check_constraint_matcher'

describe User do
  describe "email" do
    let(:user) {
      User.create!(email: "bademail@jwkyle.com", password: "qwertyuiop", password_confirmation: "qwertyuiop")
    }
    it "prevents invalid e-mail addresses" do
      expect {
        user.update_attribute(:email, "badderemail@online.com")
      }.to violate_check_constraint(:email_must_be_company_email)
    end
  end
end
