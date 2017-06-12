Rails.application.routes.draw do
  devise_for :users
  get 'edit_profile' => 'users#edit'
  patch 'profile' => 'users#update'
  get 'search' => 'home#search'

  resources :articles do
    resources :comments
  end

  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
