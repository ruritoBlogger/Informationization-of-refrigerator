Rails.application.routes.draw do
  get "/home/top" => "home#top"
  get "/home/new" => "home#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
