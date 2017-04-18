Rails.application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :home
  resources :books do
    resources :comments
  end

  get 'tag/:tag', to: 'books#index', as: :tag

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
