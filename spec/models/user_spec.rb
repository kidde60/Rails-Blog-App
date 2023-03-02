require 'rails_helper'

describe User, type: :model do
  context 'test users' do
    before :each do
      @user = User.create(name: 'Jennie', photo: 'https://unsplash.com/photos/Th-i7Z1ufK8', bio: 'Artist')
    end

    it 'should have the correct name' do
      expect(@user.name).to eql 'Jennie'
    end

    it 'should be invalid for a blank name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
      @user.update_user_post_counter = -5
      expect(@user).to_not be_valid
    end

    it 'should return number of recent posts (3 max)' do
      Post.create(author: @user, title: 'Hi', text: 'This is a test')
      Post.create(author: @user, title: 'Hi', text: 'This is a test')
      Post.create(author: @user, title: 'Hi', text: 'This is a test')
      expect(@user.recent_posts.length).to eq 3
    end
  end
end
