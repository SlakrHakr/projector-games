Rails.application.routes.draw do
  root to: 'games#show', id: 1
  post 'movement/x/:x/y/:y', to: 'games#movement'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
