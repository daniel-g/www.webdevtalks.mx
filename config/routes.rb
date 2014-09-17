WDT::Application.routes.draw do
  root to: 'home#index'

  namespace :admin do
    scope :auth do
      get 'github/callback', to: 'sessions#create'
    end

    get 'login', to: 'sessions#new'
  end

  resources 'papers', only: [:create, :new]
end
