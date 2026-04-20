Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :posts
  resources :users do
    member do
      get "followers", action: :show_followers
      get :posts
      get :comments
      get :following
      get :follower

    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  post 'dashboard/switch_partials', to: 'dashboard#switch', as: :switch_partials
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  post '/dashboard', to: 'dashboard#index', as: :dashboard_post
  get '/comments', to: 'comments#index', as: :all_comments

  # Defines the root path route ("/")
   root "dashboard#index"

  resources :follows, only: [:create, :destroy]

end
