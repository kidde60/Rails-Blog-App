require 'rails_helper'

describe User, type: :model do
  context 'test users' do
    before :each do
      @user = User.create(name: 'william', photo: 'https://github.com/kidde60', bio: 'web developer')
    end

    it 'should have the correct name' do
      expect(@user.name).to eql 'william'
    end

    it 'should be invalid for a blank name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end

    it 'should return number of recent posts (3 max)' do
      Post.create(author: @user, title: 'Title', text: 'My sample text')
      Post.create(author: @user, title: 'Title', text: 'My sample text')
      Post.create(author: @user, title: 'Title', text: 'My sample text')
      expect(@user.recent_posts.length).to eq 3
    end
  end
end
