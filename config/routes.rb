Rails.application.routes.draw do
  resources :jobs do
    resources :resumes
  end

  resources :categories do
    resources :resumes
  end

  resources :deleted_jobs

  # Admin namespace for job management
  namespace :admin do
    resources :jobs, only: [:create, :update, :destroy]  # Explicit actions for admin jobs
    get '/jobs/:id', to: 'jobs#show', as: 'admin_job'    # Custom named route for admin job show
  end

  # Careers route
  get '/careers', to: 'jobs#index'
end
