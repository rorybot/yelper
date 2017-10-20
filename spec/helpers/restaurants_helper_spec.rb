require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RestaurantsHelper. For example:
#
# describe RestaurantsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

def create_cafe_rouge
  visit '/restaurants/new'
     fill_in('restaurant[name]', :with => "Cafe Rouge")
     fill_in('restaurant[address]', :with => "Kensington Church Street")
     fill_in('restaurant[description]', :with => "French Bistro")
     click_button('Create Restaurant')
end

# def sign_in(user)
#     post user_session_path \
#       "user[email]"    => user.email,
#       "user[password]" => user.password
#   end
