Rails.application.routes.draw do
  get 'dashboards/show', as: 'dashboard'

  resources :surveys

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :journal_entries, except: [:index, :destroy]
  resources :resources, only: [:index]
  resources :types, only: [:show]
  resources :users, only: [:index]

  root to: 'dashboards#show'
end
