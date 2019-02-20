Rails.application.routes.draw do
  root "sub#index"

  resources :subs do
    resources :topics  
  end

  resources :topics do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
