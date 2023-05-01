Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/learn_more'
  devise_for :users
  root 'landing#index'

  resources :users, except: [:show] do
    resources :pen_names, shallow: true
    resources :series, shallow: true do
      resources :books, shallow: true
    end
    resources :books, shallow: true do
      collection do
        get 'find_series'
      end
    end
  end
  resources :worlds, shallow: true do
    resources :maps, :races, :nations, :religions, :traditions, :magic_systems,
              :locations, :languages, :characters, :series, :books,
              shallow: true
    resources :historical_timelines, shallow: true do
      resources :events, shallow: true
    end
  end

  # Custom route for users#show
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # Custom route for users#dashboard
  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
end
