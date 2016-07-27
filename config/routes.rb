Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :places, only: [:index, :show]
    resources :devices, only: [] do
      post 'authenticate', to: 'device_auth#create', on: :collection
    end
  end
end
