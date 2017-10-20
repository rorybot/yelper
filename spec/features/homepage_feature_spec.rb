describe 'site homepage' do

  feature 'visiting the homepage' do


      include Devise::Test::IntegrationHelpers

      before do
        user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
        p user
        sign_in(user)
      end

    it 'has a link that takes you to the restaurant list' do
      visit '/'
      expect(page).to have_content('Crowd-sourced reviews about local businesses')
      click_link('Yelpz Businesses')
      expect(current_path).to eq ('/restaurants')
    end

  end

end
