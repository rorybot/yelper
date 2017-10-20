require 'rails_helper'
require 'helpers/restaurants_helper_spec'

feature 'restaurants' do

  include Devise::Test::IntegrationHelpers

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    p user
    sign_in(user)
  end


  scenario 'adding a new restaurant' do
    # p current_user
    # p user_session
    visit '/restaurants/new'
    expect(page).to have_content('Name')
      create_cafe_rouge
      expect(current_path).to eq '/restaurants/1'
  end

  context 'adding a blank restaurant name' do
    it 'cannot be added to database/site' do
      visit '/restaurants/new'
      click_button('Create Restaurant')
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurant has been added' do
    scenario 'should display restaurant' do
      Restaurant.create(name: "Pizza Express", description: "Bloody nice")
      visit '/restaurants'
      expect(page).to have_content("Pizza Express")
      expect(page).not_to have_content("No restaurants yet")
    end
  end
end
