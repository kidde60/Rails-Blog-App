Rails.application.routes.draw do
#   resources :users, :only[:index, :show] do
#   resources :posts, :only[:index, :show]
#   # resources :likes
#   # resources :comments
# end
# root'users#index'
#   resources :users, only: [:index, :show] do
#   resources :posts, only: [:index, :show]
#  end
root to: "users#index"
# will match a GET request to the given URL and send it to the show action in the UsersController.
get 'users/:id' => 'users#show', as: "user"

# will match a GET/POST request to the given URL and send it to the corresponding action in the PostsController.
get 'users/:author_id/posts/new' => 'posts#new', as: "post_new"
post 'users/:author_id/posts/new' => 'posts#create', as: "post"
get 'users/:author_id/posts' => 'posts#index', as: "user_posts"
get 'users/:author_id/posts/:id' => 'posts#show', as: "user_post"

# will match a GET/POST request to the given URL and send it to the corresponding action in the CommentsController.
get 'users/:author_id/posts/:id/comments/new' => 'comments#new', as: "comments_new"
post 'users/:author_id/posts/:id/comments' => 'comments#create', as: "comment"

# will match a GET request to the given URL and send it to the create action in the LikesController.
get 'users/:author_id/posts/:id/likes/new' => 'likes#create', as: "likes_create"

end
