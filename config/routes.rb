Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :people,
  path: '/',
  path_names: {
    sign_in: 'entrar',
    sign_up: 'cadastro',
    sign_out: 'sair'
  },
  controllers: {
    registrations: 'person/registrations',
  #  sessions: 'person/sessions',
  #  confirmations: 'person/confirmations',
  #  passwords: 'person/passwords',
  #  unlocks: 'person/unlocks'
  }

  authenticated :person do
    namespace :person, path: '/' do
      root to: 'pets#index'
      resources :pets, path: 'pets'
    end
  end

  get '/' => redirect('/entrar'), via: :get
  root to: redirect('/')
  match '*path' => redirect('/'), via: :get
end
