Rails.application.routes.draw do
  get 'risks/index'
  get 'risks/show'
  get 'risks/create'
  get 'risks/update'
  get 'risks/destroy'
  resources :users, except: :new
  resources :projects, shallow: true do
    resources :risk_registers do
      resources :risks
    end
  end

  get 'users/:id/projects', action: :projects, controller: 'users'
end
