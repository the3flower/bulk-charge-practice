Rails.application.routes.draw do
  root to: "csv_files#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :csv_files, only: [ :index, :new, :destroy ] do
    member do
      get "download"
    end
    collection do
      post "upload"
    end
  end
  resources :transactions, only: [ :index, :create, :show ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
