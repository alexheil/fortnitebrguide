Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :admins

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :categories, path: "" do
    resources :posts, path: "", except: :index
  end

end