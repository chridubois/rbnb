Rails.application.routes.draw do
  root to: "jerseys#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :jerseys, only: %i[index new create edit update destroy show]
  # do
    # resources :orders, only: [:create]
  # end
  get '/shop' => 'jerseys#shop'
  get "/profil", to: "pages#profil"
  get '/no_results' => 'jerseys#no_results'
  get '/my_basket' => 'orders#my_basket'
  get '/my_sales' => 'pages#my_sales'
  resources :orders, only: %i[create update destroy show index]
end
