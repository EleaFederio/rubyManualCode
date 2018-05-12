Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'players#index'
  get "players" => "players#index"
  get "players/new" => "players#new"
  post "players" => "players#create"
  get 'players/:id' => 'players#show'
end
