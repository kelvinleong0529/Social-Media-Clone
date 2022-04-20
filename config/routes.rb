Rails.application.routes.draw do
  # GET /about

  get "about", to: "about#index"
  # go to the "index" method in about_controller.rb
  ## get "about-us", to: "about#index", as: about # if user go to '/about-us/, they will be redirect to "about" path too

  # SIGN-UP
  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  # SIGN IN
  get "sign-in", to: "sessions#new"
  post "sign-in", to: "sessions#create"

  # LOGOUT
  delete "logout", to: "sessions#destroy"

  # PASSWORDS
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  # PASSWORDS RESET
  get "password/reset/", to: "password_resets#new"
  post "password/reset/", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  root to: "main#index"

end
