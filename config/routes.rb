Rails.application.routes.draw do
  get '/popular', to: 'clicks#popular', as: 'popular_links'
  resources :clicks, only: [:index]
  resources :links, except: [:show]
  get '/:token', to: 'links#show', as: 'token'
  root 'links#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
