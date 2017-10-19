require 'rails_helper'
require 'helpers/restaurants_helper_spec'

feature 'restaurants' do

  context "editing restaurants" do
    scenario 'should edit restaurant in db when restaurant is edited in edit page' do
    	 visit '/restaurants/new'
    			create_cafe_rouge
    			expect(current_path).to eq '/restaurants/1'
          click_link('Edit')
          fill_in('restaurant[name]', :with => "Adele's Bistro")
          fill_in('restaurant[address]', :with => "Chelsea")
          fill_in('restaurant[description]', :with => "French")
          click_button('Update Restaurant')
          expect(current_path).to eq '/restaurants/1'
    			expect(page).to have_content("Adele's Bistro")
    end
  end

  context 'deleting restaurants' do
    scenario 'should delete a restaurant when delete button is pressed', js: true do
    create_cafe_rouge
         expect(current_path).to eq '/restaurants/1'
         expect(page).to have_content('Cafe Rouge')
         visit '/restaurants'
         click_link('Delete')
         page.driver.browser.switch_to.alert.accept
         expect(current_path).to eq '/restaurants'
         expect(page).not_to have_content('Cafe Rouge')
         expect(page).to have_content('No restaurants yet')
    end
  end

  context 'reviewing restaurants' do
    scenario 'user can select a rating' do
      create_cafe_rouge
      fill_in('rating[rater]', :with => "Some Bozo")
      fill_in('rating[comment]', :with => "It sucked")
      select "1", :from => "rating[score]"
      click_button('Create Rating')
      expect(page).to have_content ("It sucked")
    end

    scenario 'user can see average of ratings' do
      create_cafe_rouge
      fill_in('rating[rater]', :with => "Some Bozo")
      fill_in('rating[comment]', :with => "It sucked")
      select "2", :from => "rating[score]"
      click_button('Create Rating')
      fill_in('rating[rater]', :with => "Some Bozo")
      fill_in('rating[comment]', :with => "It sucked")
      select "4", :from => "rating[score]"
      click_button('Create Rating')
      expect(page).to have_content ("Rating: 3") #becoz 3 is avg of 6
    end

  end
end
