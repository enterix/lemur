Lemur::Application.routes.draw do
  scope "(:locale)", locale: /en|ru|uk/ do
    resources :users

    get 'sessions/new', to: 'sessions#new', as: 'new_session'
    post 'sessions', to: 'sessions#create'
    delete 'sessions', to: 'sessions#destroy'

  end
# if didn't find anything - it can be root with locale
  get '/:locale', to: 'users#index', locale: /en|ru|uk/

end