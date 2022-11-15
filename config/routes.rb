Rails.application.routes.draw do
  root to: "files#new"
  resources :files, only: %i[create show]
end
