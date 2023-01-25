Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do

  resources :subs do
    resources :topics
  end
  resources :topics, except: [:index,:create,:update,:destroy,:show] do
      resources :comments
  end
  

  resources :comments, except: [:index,:create,:update,:destroy,:show] do
    resources :likes
  end
 
end
end