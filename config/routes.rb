Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :admins

  get ':id/edit' => 'categories#edit', :as => 'edit_category'
  get 'categories' => 'categories#index', :as => 'categories'
  get 'posts' => 'posts#index', :as => 'posts'
  post 'emails' => 'emails#create', :as => 'emails'

  resources :categories, except: [:edit, :index], path: "/" do
    resources :posts, path: "/", except: :index
  end

  resources :emails, except: [:index, :show, :create, :new, :edit, :update, :destroy] do 
    member do
      get :unsubscribe
    end
  end

end