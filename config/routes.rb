Rails.application.routes.draw do
#   resources :users, :only[:index, :show] do
#   resources :posts, :only[:index, :show]
#   # resources :likes
#   # resources :comments
# end
root'users#index'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]
 end
end
