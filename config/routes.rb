Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :users do
      post 'authenticate', to: 'pre_sign_in#create', on: :collection
    end
  end
end
