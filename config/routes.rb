Rails.application.routes.draw do
  resources :facturas do
    post :pagar, on: :member
    get :imprimir, on: :member
  end
  resources :gastos
  resources :departamentos
  resources :consorcios do
    get :contabilidad, on: :member
    get :liquidacion, on: :member
    post :generar_facturas, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "consorcios#index"
end
