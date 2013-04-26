Mrmeetmanager::Application.routes.draw do
  root :to => "swimmers#show"
  resources :meets do
    post 'find_events' => "swimmers#find_events"
    get 'all_heats' => "heats#all_heats"
    get 'delete_heats' => "heats#delete_heats"
    get 'seed_heats' => "heats#seed"
    resources :events, :only => [:create, :destroy, :new, :update, :show] do 
      resources :heats, :only => [:create, :show, :update] do 
        resources :heat_entry, :only => [:create, :update]
      end
    end

    resources :teams, :only => [:create, :destroy, :new, :update] do 
      put 'upload' => "teams#import_files"
      resources :swimmers, :only => [:create, :destroy, :new, :index, :show] do 
      post 'add_event' => "swimmers#add_event"
      end
    end 
  end

end
