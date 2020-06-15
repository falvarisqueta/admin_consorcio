Rails.application.routes.draw do
  resources :gastos
  resources :departamentos
  resources :consorcios do
    get :gastos, on: :member
    get :liquidacion, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "consorcios#index"
end
