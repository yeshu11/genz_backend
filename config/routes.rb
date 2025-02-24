Rails.application.routes.draw do
  resources :jobs do
    resources :resumes, only: [:index, :create] # Resumes only need index & create
  end
  
  # Allow direct file access via Active Storage
  # get "/rails/active_storage/*path", to: "active_storage/disk#show", as: :rails_storage_proxy
  mount ActiveStorage::Engine => "/rails/active_storage" # This is required

  get "/resumes", to: "resumes#index" # Add this route to fetch all resumes

  resources :deleted_jobs, only: [:index, :show, :destroy] # Only necessary actions

  # Admin namespace for job management
  namespace :admin do
    resources :jobs, only: [:create, :update, :destroy, :show]  # Add show directly
  end

  # Careers route - Better organization
  get '/careers', to: 'jobs#index'
end

