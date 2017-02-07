Rails.application.routes.draw do
  get 'dashboards/show'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  root to: 'dashboards#show'
end
