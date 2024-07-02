# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'devise/passwordless/sessions' }

  post '/themes/:id', to: 'public/themes#show', as: 'theme', constraints: { format: 'json' }

  get '/', to: 'public/home#index', as: 'home'
  root 'public/home#index'
end
