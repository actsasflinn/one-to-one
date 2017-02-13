Rails.application.routes.draw do
  resources :messages
  resources :users do
    resources :messages
  end

  resources :authors do
    resources :users do
      resources :messages
    end
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
