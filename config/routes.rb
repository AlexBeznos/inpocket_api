Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: 'json' } do
    resources :places, only: [:index, :show] do
      resources :beacons, only: [:index]
      resources :presents, only: [:index, :show]
      resources :feedbacks, only: [:index, :create]
      resources :shares, only: [:index]
      resources :menu_items, only: [:index]
      resources :orders, only: [:index, :create]
      resources :menu_categories, only: [:index], shallow: true do
        resources :menu_items, only: [:index, :show]
      end
    end

    resources :devices, only: [] do
      post 'authenticate', to: 'device_auth#create', on: :collection
    end

    resources :users, only: [] do
      get 'self', to: 'self_users#show', on: :collection
    end
  end
end
