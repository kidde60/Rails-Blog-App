require 'rails_helper'

RSpec.describe 'Post index view', type: :system do
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
      text: 'My first sample text body posts example',
      comments_counter: 1,
      likes_counter: 2
    )

    @post2 = Post.create(
      author: @user,
      title: 'Second Sample post',
      text: 'My second sample text body post example',
      comments_counter: 1,
      likes_counter: 2
    )
    @post3 = Post.create(
      author: @user,
      title: 'Third Sample post',
      text: 'My third sample text body post example',
      comments_counter: 1,
      likes_counter: 2
    )

    @comment = Comment.create(
      post: @post1,
      author: @user,
      text: 'My sample comment'
    )
  end

  before { subject.save }

  describe 'Testing for user post index view', js: true do
    it 'should display the profile picture of the user.' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_css('img')
    end

    it 'should display the user name.' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@user.name)
    end

    it 'should display the number of posts by a user.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Number of posts: #{@user.posts_counter}")
    end

    it 'should display the title of the post' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@post1.title.to_s)
    end

    it 'should see some text of the post body' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@post1.text.to_s)
    end

    it 'should see the title text' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content('First Sample post')
    end

    it 'should see the number of comments per post.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Comments counter: #{@post1.comments_counter}")
    end

    it 'should see the number of likes per post.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Likes counter: #{@post1.likes_counter}")
    end

    it 'should see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(@user, @post1)
      page.has_button?('Pagination')
    end

    it 'When I click on a post, it should redirects me to that post show page.' do
      visit user_posts_path(@user, @post1)
      click_on(@post1.title)
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end