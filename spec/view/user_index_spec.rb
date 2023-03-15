require 'rails_helper'

RSpec.describe 'User', type: :system do
  subject do
    @user = User.create(
      name: 'William',
      posts_counter: 3,
      bio: 'Web developer',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCKAAjmfrQ3AVA4NKGkhBtYMPfAoDHDhb3pgU6MJhW5Q&s'
    )
  end

  describe 'Index page', js: true do
    it 'should displays the username of users.' do
      visit user_path(subject)
      expect(page).to have_content('William')
    end

    it 'should displays the the profile picture of users.' do
      visit user_path(subject)
      expect(page).to have_css('img')
    end

    it 'should display user bio' do
      visit user_path(subject)
      page.has_content?(@user.bio.to_s)
    end

    it 'should direct to the user show page when clicked.' do
      visit users_path
      expect(current_path).to eq(users_path(@user))
    end
  end
end
