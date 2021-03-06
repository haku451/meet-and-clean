# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#index'

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  # path example : http://localhost:3000/admins/sign_in

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # path example : http://localhost:3000/users/sign_in

  resources :user_events, except: :index

  resources :events

  resources :mobs
end
