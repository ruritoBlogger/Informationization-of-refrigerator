Rails.application.routes.draw do

  get "main/profile" => "main#profile"
  get "main/edit" => "main#edit"
  get "main/setting" => "main#setting"

  get "home/top" => "home#top"
  get "home/new" => "home#new"
  get "home/login" => "home#login"

  post "user/create" => "user#create"
  post "user/login" => "user#login"
  post "user/logout" => "user#logout"
  post "user/update" => "user#update"
  post "user/destroy" => "user#destroy"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
