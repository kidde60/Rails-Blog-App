require 'rails_helper'

RSpec.describe 'Post index details page', type: :system do
  subject do
    @user = User.create(
      name: 'William',
      posts_counter: 3,
      bio: 'Web developer',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCKAAjmfrQ3AVA4NKGkhBtYMPfAoDHDhb3pgU6MJhW5Q&s'
    )

    @post1 = Post.create(
      author: @user,
      title: 'First Sample post',
      text: 'posts example or sample body',
      comments_counter: 1,
      likes_counter: 2
    )

    @post2 = Post.create(
      author: @user,
      title: 'Second Sample post',
      text: 'posts example or sample body',
      comments_counter: 1,
      likes_counter: 2
    )
    @post3 = Post.create(
      author: @user,
      title: 'Third Sample post',
      text: 'posts example or sample body',
      comments_counter: 1,
      likes_counter: 2
    )

    @comment = Comment.create(
      post: @post3,
      author: @user,
      text: 'I would love to attend that school'
    )
  end

  before { subject.save }
  describe 'testing for user post index page' do
    it 'should display the title of the post' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@post1.title)
    end

    it 'should displays the user profile.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@user.name)
    end

    it 'should see how many comments a post has.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('Comments: 1')
    end

    it 'should see how many likes a post has.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('Likes: 2')
    end

    it 'should see some of the post body' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@post1.title)
    end

    it 'should see the username of each commentor.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('William')
    end

    it 'should see the comment each commentor.' do
      visit(user_post_path(@user, @post1))
      page.has_content?('William: I would love to attend that school.')
    end
  end
end
