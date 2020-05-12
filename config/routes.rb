Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'welcome/index'
  resources :posts do
    collection do
      get :update_like
      get :update_redibbs
    end
    resources :comentarios
  end
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end