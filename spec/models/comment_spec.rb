require 'rails_helper'

describe Comment, type: :model do
  context 'test comments' do
    before :each do
      @user = User.create(name: 'william', photo: 'https://github.com/kidde60', bio: 'web developer')
      @post = Post.create(author: @user, title: 'Title', text: 'My sample text')
      @comment = Comment.create(post: @post, author: @user, text: 'Awesome!')
    end

    it 'should increment the comments counter' do
      expect(@post.comments_counter).to eq 1
    end
  end
end
