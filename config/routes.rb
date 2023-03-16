Rails.application.routes.draw do
  devise_for :users
    # resources :users do
    #     resources :posts do
    #     resources :likes
    #    resources :comments
    #     end
    #   end  
    #   root "users#index"
    root "users#index"
    # will match a GET request to the given URL and send it to the show action in the UsersController.
    get 'users/:id' => 'users#show', as: "user"
    get 'users' => 'users#index', as: "users"
    
    # will match a GET/POST request to the given URL and send it to the corresponding action in the PostsController.
    get 'users/:user_id/posts/new' => 'posts#new', as: "post_new"
    post 'users/:user_id/posts/new' => 'posts#create', as: "post"
    get 'users/:user_id/posts' => 'posts#index', as: "user_posts"
    get 'users/:user_id/posts/:id' => 'posts#show', as: "user_post"
    
    # will match a GET/POST request to the given URL and send it to the corresponding action in the CommentsController.
    get 'users/:user_id/posts/:id/comments/new' => 'comments#new', as: "comments_new"
    post 'users/:user_id/posts/:id/comments' => 'comments#create', as: "comment"
    
    # will match a GET request to the given URL and send it to the create action in the LikesController.
    get 'users/:user_id/posts/:id/likes/new' => 'likes#create', as: "likes_create"
    
end
