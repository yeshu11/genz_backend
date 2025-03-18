Rails.application.routes.draw do
  resources :jobs do
    member do
      delete :delete_and_move
    end
    resources :resumes, only: [:index, :create]
  end
  
  mount ActiveStorage::Engine => "/rails/active_storage"

  get "/resumes", to: "resumes#index"

  resources :deleted_jobs, only: [:index, :show, :destroy] do
    member do
      post :restore  # ✅ New route for restoring a deleted job
    end
  end

  namespace :admin do
    root to: "admin_sessions#new"  # ✅ Redirect /admin to login form
    resources :jobs, only: [:create, :update, :destroy, :show]
    post "/login", to: "admin_sessions#create"
    delete "/logout", to: "admin_sessions#destroy"
  end

  # ✅ Super Admin Routes
  namespace :super_admin do
    resources :jobs, only: [:index, :create, :update, :destroy, :show]
    resources :resumes, only: [:index]
    resources :deleted_jobs, only: [:index, :show, :destroy] do
      member do
        post :restore  # ✅ Allow Super Admin to restore deleted jobs
      end
    end

    # ✅ Super Admin can create Admins
    post "/admins", to: "admins#create"
  end

  get '/careers', to: 'jobs#index'
end