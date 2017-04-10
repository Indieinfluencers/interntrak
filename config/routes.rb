Rails.application.routes.draw do
  get 'dashboards/show', as: 'dashboard'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :journal_entries, except: [:index, :destroy]
  resources :resources

  root to: 'dashboards#show'
end
