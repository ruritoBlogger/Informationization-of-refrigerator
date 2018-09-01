Rails.application.routes.draw do

  get "main/profile" => "main#profile"

  get "home/top" => "home#top"
  get "home/new" => "home#new"
  get "home/login" => "home#login"

  post "user/create" => "user#create"
  post "user/login" => "user#login"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
