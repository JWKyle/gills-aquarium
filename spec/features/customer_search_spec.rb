require 'rails_helper'

feature "Customer Search" do

  def create_test_user(email: , password: )
    User.create!(email: email, password: password, password_confirmation: password)
  end

  def create_customer(first_name:, last_name:, email: nil)
    username = "#{Faker::Internet.user_name}#{rand(2000)}"
    email ||= "#{username}#{rand(2000)}@" + "#{Faker::Internet.domain_name}"
    Customer.create!(first_name: first_name, last_name: last_name, username: username, email: email)
  end

  let(:email){"billy@jwkyle.com"}
  let(:password){"Password12345"}

  before do
    create_test_user(email: email, password: password)

    create_customer first_name: "Allen", last_name: "Angel"
    create_customer first_name: "Betty", last_name: "Blenny"
    create_customer first_name: "Charlie", last_name: "Cuddlefish"
    create_customer first_name: "Danielle", last_name: "Dory"
    create_customer first_name: "Elvis", last_name: "Eel"
    create_customer first_name: "Harriett", last_name: "Halibut", email: "halibut4life@online.com"

  end


end
