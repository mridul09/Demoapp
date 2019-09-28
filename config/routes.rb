Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors
  resources :books

  root to: "home#index"


	get '/author/:id', to: 'authors#custom_api'
	get '/book/:id', to: 'books#books_api'
end
