Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do 
  end

    devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
