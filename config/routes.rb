Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'words#index'
  resources :words, only: [:index, :new, :create, :show] do
  end
end

