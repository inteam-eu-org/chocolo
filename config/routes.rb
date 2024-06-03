Rails.application.routes.draw do
  get '/', to: 'public/home#index', as: 'home'

  root "public/home#index"
end
