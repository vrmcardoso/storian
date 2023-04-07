Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users
  root 'landing#index'

  authenticate :user do
    resources :users do
      resources :pen_names, shallow: true
      resources :worlds, shallow: true do
        resources :maps, :races, :nations, :religions, :traditions, :magic_systems, :locations, :languages, :characters,
                  shallow: true
        resources :historical_timelines, shallow: true do
          resources :events, shallow: true
        end
        resources :series, shallow: true do
          resources :books, shallow: true
        end
        resources :books, shallow: true
      end
    end
    # Add any other routes that require authentication here
  end
end
