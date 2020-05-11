Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'welcome/index'
  resources :posts do
    resources :comentarios
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end