Rails.application.routes.draw do
  root 'recipes#index'
  get '/recipes/search', to: 'recipes#search'
  get 'recipes', to: 'recipes#index'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
