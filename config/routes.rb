Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end

  resources :track_lists do
    resources :stocks, controller: :track_list_stocks, param: :stock_id, only: %i[new create destroy]

    member do
      post :serialize
    end
  end
end
