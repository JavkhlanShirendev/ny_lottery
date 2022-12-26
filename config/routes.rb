Rails.application.routes.draw do

  resources :lotteries

  resources :lottery_items

  root to: "lottery_items#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
