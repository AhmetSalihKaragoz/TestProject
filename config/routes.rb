Rails.application.routes.draw do
  root "search#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update" 

  delete "sign_out", to: "sessions#destroy"

  get '/foods/:id', to: 'foods#show', as: 'foods_show'

end
