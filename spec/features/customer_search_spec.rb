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
    create_customer first_name: "Harrison", last_name: "Haddock"
    create_customer first_name: "Helen", last_name: "Hartail"
    #the following should be our search result
    create_customer first_name: "Har", last_name: "Halibut", email: "halibut4life@online.com"

  end

  scenario "Search By Name"do
    visit "/customers"

    #login test

    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
puts page.html #debug
    within "section.search-form" do
      fill_in "keywords", with: "har"
    end

    within "section.search-results" do
      expect(page).to have_content("Results")
      expect(page.all("ol li.list-group-item").count).to eq(8)
      list_group_items = page.all("ol li.list-group-item")

      expect(list_group_items[0]).to have_content("Harrison")
      expect(list_group_items[0]).to have_content("Haddock")
      expect(list_group_items[2]).to have_content("Helen")
      expect(list_group_items[2]).to have_content("Hartail")
    end
  end


end
