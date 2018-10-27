Rails.application.routes.draw do


  get 'posts/index'
  devise_for :users
resources :users
resources :posts, :post


authenticated :user do
  root to: 'posts#index'
end

  root to: redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
