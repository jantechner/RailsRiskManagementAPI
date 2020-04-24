Rails.application.routes.draw do
  # get 'risk_registers/index'
  # get 'risk_registers/show'
  # get 'risk_registers/create'
  # get 'risk_registers/update'
  # get 'risk_registers/delete'
  # get 'project/index'
  # get 'project/show'
  # get 'project/create'
  # get 'project/update'
  # get 'project/destroy'
  resources :projects do
    resources :risk_registers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
