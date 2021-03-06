Rails.application.routes.draw do
  resources :chatbox
  root :to => "chatbox#index"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  post 'message', to: "messages#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server, at: '/cable'
end
