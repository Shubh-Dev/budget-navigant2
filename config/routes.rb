Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:index, :show, :new, :create, :destroy ] 
  resources :payments, only: [:index, :show, :new, :create, :destroy ]

  authenticated :user do
    root :to => 'groups#index', as: :authenticated_root
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "splash#index"
end
