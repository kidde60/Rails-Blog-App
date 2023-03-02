require 'rails_helper'

describe Comment, type: :model do
  context 'test comments' do
    before :each do
      @user = User.create(name: 'Jennie', photo: 'https://unsplash.com/photos/Th-i7Z1ufK8', bio: 'Artist')
      @post = @user.posts.create(title: 'Cafe', text: 'My fav place')
      @comment = @post.comments.create(text: 'Love it!')
    end

    it 'Comments should exist' do
      expect(@comment.text).to eq 'Love it!'
    end
  end
end
