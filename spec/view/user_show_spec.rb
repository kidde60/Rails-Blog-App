require 'rails_helper'

RSpec.describe 'User', type: :system do
  subject do
    @user = User.create(
      name: 'William',
      posts_counter: 3,
      bio: 'Web developer',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCKAAjmfrQ3AVA4NKGkhBtYMPfAoDHDhb3pgU6MJhW5Q&s'
    )

    @post = Post.create(
      author_id: @user.id,
      title: 'Sample post',
      text: 'posts example or sample body',
      comments_counter: 0,
      likes_counter: 0
    )

    @comment = Comment.create(
      post_id: @post.id,
      author_id: @user.id,
      text: 'My first sample comment'
    )
  end

  before { subject.save }

  describe 'show page' do
    it 'should display the profile picture of the user.' do
      visit(user_path(@user))
      expect(page).to have_css('img')
    end

    it 'should display the user profile.' do
      visit(user_path(@user))
      expect(page).to have_content(@user.name)
    end

    it 'should display the number of posts per user.' do
      visit(user_path(@user))
      expect(page).to have_content(@user.posts.count)
    end

    it 'should display the user bio' do
      visit(user_path(@user))
      expect(page).to have_content(@user.bio)
    end

    it 'should display the first three posts by a user' do
      visit(user_path(@user))
      @user.posts.limit(3).each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'should display a button to see all posts.' do
      visit(user_path(@user))
      expect(page).to have_content('See all posts')
    end

    it 'should redirect to the post details when clicked' do
      visit(user_path(@user))
      click_button('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'should redirect to the clicked post' do
      post = @user.posts.first
      visit(user_posts_path(@user))
      click_link(post.title)
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end