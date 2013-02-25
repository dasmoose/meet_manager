Mrmeetmanager::Application.routes.draw do
  root :to => "swimmers#show"
  resources :meets do
    resources :events, :only => [:create, :destroy, :new]
  end

end
