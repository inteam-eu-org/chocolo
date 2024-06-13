# frozen_string_literal: true

Rails.application.routes.draw do
  post '/themes/:id', to: 'public/themes#show', as: 'theme', constraints: { format: 'json' }

  get '/', to: 'public/home#index', as: 'home'
  root 'public/home#index'
end
