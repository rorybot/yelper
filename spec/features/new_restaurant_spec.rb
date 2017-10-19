require 'rails_helper'

feature 'restaurants' do
  scenario 'adding a new restaurant' do
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
end
