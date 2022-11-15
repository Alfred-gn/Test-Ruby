Rails.application.routes.draw do
  root to: "documents#new"
  resources :documents, only: %i[create show]
end
