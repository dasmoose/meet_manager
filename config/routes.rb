Mrmeetmanager::Application.routes.draw do
  root :to => "swimmers#show"
  resources :meets do
    post 'find_events' => "swimmers#find_events"
    resources :events, :only => [:create, :destroy, :new, :update, :show]
    resources :teams, :only => [:create, :destroy, :new, :update] do 
      resources :swimmers, :only => [:create, :destroy, :new, :index]
    end 
  end

end
