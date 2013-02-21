Mrmeetmanager::Application.routes.draw do
  root :to => "swimmers#show"
  resources :meets
end
