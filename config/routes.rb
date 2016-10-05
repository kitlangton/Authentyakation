Rails.application.routes.draw do
  devise_for :users

  resources :yaks do
    resources :shavings, only: [:create], controller: 'yaks/shavings'
  end

  authenticated :user do
    root to: 'angular#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
