Rails.application.routes.draw do
  get 'sections/new'

 

  get 'sections/index'

  get 'sections/show'

  get 'sections/edit'

  get 'sections/delete'

  get 'pages/index'

  get 'pages/show'

  get 'pages/edit'

  get 'pages/delete'

  get 'pages/new'
 

  root 'demo#index'
  resources :pages do
    member do
      get :delete
    end
  end
  resources :sections do
    member do
      get :delete
    end
  end
  resources :subjects do
    member do
      get :delete
    end
  end
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'
  # get ':controller(/:action(/:id))'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
