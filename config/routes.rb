Rails.application.routes.draw do
  devise_for :users

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :inventories, only: :index
  end

  scope module: :v1, contraints: ApiVersion.new('v1', true) do
    resources :inventories do
      resources :items
    end
  end

  post 'signup', to: 'users#create'
  post 'auth_user', to: 'authentication#authenticate_user'
end
