Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new', as: 'new'
  post 'score', to: 'games#score', as: 'score'
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'games#new'
end
