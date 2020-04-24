Rails.application.routes.draw do

  resources :users, except: :new
  resources :projects, shallow: true do
    resources :risk_registers do
      resources :risks
    end
  end

  get 'users/:id/projects', action: :projects, controller: 'users'
  get 'users/:id/risk_registers', to: 'users#risk_registers'
  get 'users/:id/risks', to: 'users#risks'

  get 'projects/:id/risks', to: 'projects#risks'
end
