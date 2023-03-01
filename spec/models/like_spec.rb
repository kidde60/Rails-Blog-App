require 'rails_helper'

describe Like, type: :model do
  context 'test likes' do
    before :each do
      @user = User.create(name: 'william', photo: 'https://github.com/kidde60', bio: 'web developer')
      @post = Post.create(author: @user, title: 'Title', text: 'My sample text')
      @comment = Comment.create(post: @post, author: @user, text: 'Awesome!')
    end

    it 'comments author should equal user who made the comment' do
      expect(@comment.author).to eq @user
    end
  end
end
