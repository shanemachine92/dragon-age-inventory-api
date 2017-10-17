Rails.application.routes.draw do
  resources :inventories do
    resources :items
  end
end
