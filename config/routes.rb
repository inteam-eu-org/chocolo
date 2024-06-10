Rails.application.routes.draw do
  get '/', to: 'public/home#index', as: 'home'
  post '/themes/:id', to: 'public/themes#show', as: 'theme', constraints: { format: 'json' }

  root "public/home#index"
end
