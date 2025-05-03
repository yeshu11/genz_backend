Rails.application.routes.draw do

  root to: "jobs#index"  # Redirect to careers page
  
  # ✅ Devise authentication for Admins
  devise_for :admins, controllers: {
    sessions: 'admin/admin_sessions'
  }

  # ✅ Devise authentication for AdminSuper (Previously SuperAdmin)
  devise_for :admin_supers, controllers: {
    sessions: 'admin_super/admin_super_sessions'
  }

  # ✅ Explicit Logout Routes
  devise_scope :admin do
    delete "/admin/logout", to: "admin/admin_sessions#destroy"
  end

  devise_scope :admin_super do
    delete "/admin_super/logout", to: "admin_super/admin_super_sessions#destroy"
  end

  # ✅ Job Management
  resources :jobs do
    member do
      delete :delete_and_move
    end
    resources :resumes, only: [:index, :create]
  end
  
  # ✅ ActiveStorage for File Uploads
  mount ActiveStorage::Engine => "/rails/active_storage"

  # ✅ Resume & Deleted Jobs Management
  get "/resumes", to: "resumes#index"

  resources :deleted_jobs, only: [:index, :show, :destroy] do
    member do
      post :restore  # ✅ Allow restoring a deleted job
    end
  end

  # ✅ Admin Panel Routes
  namespace :admin do
    root to: "admin_dashboard#index"
    resources :jobs, only: [:create, :update, :destroy, :show]
  end

  # ✅ Admin Super Panel (previously Super Admin)
  namespace :admin_super do
    root to: "super_admin_dashboard#index"
    resources :jobs, only: [:index, :create, :update, :destroy, :show]
    resources :resumes, only: [:index]
    resources :deleted_jobs, only: [:index, :show, :destroy] do
      member do
        post :restore  # ✅ Allow Admin Super to restore deleted jobs
      end
    end

    # ✅ Admin Super can create Admins
    post "/admins", to: "admins#create"

    # ✅ Admin Super Authentication (Sign In & Sign Out)
    post "sign_in", to: "admin_super_sessions#create"
    delete "sign_out", to: "admin_super_sessions#destroy"
  end

  # ✅ Careers Page
  # get '/careers', to: 'jobs#index'
  
  get '/health', to: 'health#index'
end
