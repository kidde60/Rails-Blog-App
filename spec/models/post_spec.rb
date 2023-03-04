require 'rails_helper'

describe Post, type: :model do
  context 'test posts' do
    before :each do
      @user = User.create(name: 'william', photo: 'https://github.com/kidde60', bio: 'web developer')
      @post = Post.create(author: @user, title: 'Title', text: 'My sample text')
    end

    it 'should not have an empty title' do
      expect(@post.title).to eql 'Title'
    end

    it 'should have 0 comments at default' do
      expect(@post.comments_counter).to eq 0
    end

    it 'should not havae a title longer than 250 char' do
      @post.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Pharetra sit amet aliquam id diam maecenas ultricies mi eget.
        Commodo viverra maecenas accumsan lacus vel.
        Platea dictumst vestibulum rhoncus est. Quisque egestas diam in arcu.'
      expect(@post).to_not be_valid
    end

    it 'should return number of recent comments (5 max)' do
      @comment = Comment.create(post: @post, author: @user, text: 'Awesome!')
      @comment = Comment.create(post: @post, author: @user, text: 'Awesome!')
      @comment = Comment.create(post: @post, author: @user, text: 'Awesome!')
      expect(@post.most_recent_comments.length).to eq 3
    end
  end
end
