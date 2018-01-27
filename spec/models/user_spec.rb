require 'rails_helper'

describe User do
  describe "email" do
    let(:user) {
      User.create!(email: "bademail@jwkyle.com", password: "qwertyuiop", password_confirmation: "qwertyuiop")
    }
    it "prevents invalid e-mail addresses" do
      expect {
        user.update_attribute(:email, "badderemail@online.com")
      }.to raise_error(ActiveRecord::StatementInvalid, /email_must_be_company_email/i)
    end
  end
end
