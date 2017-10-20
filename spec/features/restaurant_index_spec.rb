require "rails_helper"

feature "restaurants" do

  include Devise::Test::IntegrationHelpers

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    p user
    sign_in(user)
  end

  context 'when first visiting the page' do
    scenario 'should see who is logged in' do
      visit '/'
      expect(page).to have_content('tansaku@gmail.com is logged in')
    end
  end

  context "restaurants are visible in the list of restaurants" do
    scenario "should display 2 restaurants after creating them" do
       Restaurant.create(name: "Pizza Express", rating: 4, address: "London", description: "Pizzas")
       Restaurant.create(name: "McDonalds", rating: 3, address: "Edinburgh", description: "Burgers")
       visit "/restaurants"
       expect(page).to have_content("Pizza Express")
       expect(page).to have_content("McDonalds")
       expect(page).not_to have_content("No restaurants yet")
     end
   end
 end
