Rails.application.routes.draw do


	root 'home#top'

  get "sort/main" => "sort#main"

  get "sort/:mode_id/show" => "sort#show"

  get "mode/editmode" => "mode#editmode"
  get "mode/conect" => "mode#conect"
  get "mode/editmode2" => "mode#editmode2"

  post "mode/createmode" => "mode#createmode"
  post "mode/conectmode" => "mode#conectmode"
  post "mode/createmode2" => "mode#createmode2"

  get "mode/:mode_id/editmode2" => "mode#editmode2"
  post "mode/:mode_id/destroy" => "mode#destroy"

  get "food/new" => "food#new"
  get "food/index" => "food#index"
  get "food/main" => "food#main"
 # get "food/rent" => "food#rent"
  get "food/makemode" => "food#makemode"
  get "food/editmode" => "food#editmode"

  post "food/create" => "food#create"

  get "food/:id/show" => "food#show"
  get "food/:id/edit" => "food#edit"
  get "food/:id/editinfo" => "food#editinfo"
  patch "food/:id/editinfo" => "food#editinfo"
  patch "food/:id/update" => "food#update"

  post "food/:id/update" => "food#update"
  post "food/:id/destroy" => "food#destroy"
  post "food/:id/updateinfo" => "food#updateinfo"

  get "main/profile" => "main#profile"
  get "main/edit" => "main#edit"
  get "main/setting" => "main#setting"
  get "main/editpw" => "main#editpw"
  get "main/ranking" => "main#ranking"

  get "home/top" => "home#top"
  get "home/new" => "home#new"
  get "home/login" => "home#login"

  patch "user/update" => "user#update"

  post "user/create" => "user#create"
  post "user/login" => "user#login"
  post "user/logout" => "user#logout"
  post "user/update" => "user#update"
  post "user/updatepw" => "user#updatepw"
  post "user/destroy" => "user#destroy"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
