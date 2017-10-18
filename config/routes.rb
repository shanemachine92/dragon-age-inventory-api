Rails.application.routes.draw do
  devise_for :users
  resources :inventories do
    resources :items
  end

  post 'signup', to: 'users#create'
  post 'auth_user', to: 'authentication#authenticate_user'
end
