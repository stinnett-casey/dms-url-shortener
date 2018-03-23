Rails.application.routes.draw do
  resources :links, except: [:show]
  get '/:token', to: 'links#show', as: 'token'
  root 'links#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
