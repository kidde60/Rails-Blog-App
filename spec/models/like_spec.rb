require 'rails_helper'

describe Like, type: :model do
  context 'test likes' do
    before :each do
      @user = User.create(name: 'Jennie', photo: 'https://unsplash.com/photos/Th-i7Z1ufK8', bio: 'Artist')
      @post = @user.posts.create(title: 'Cafe', text: 'My fav place')
      @like = @post.likes.create
    end

    it 'The number of likes is expected to be 1' do
      expect(@like.update_likes_counter).to eq(1)
    end
  end
end
