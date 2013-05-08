Mrmeetmanager::Application.routes.draw do
  resources :users
  resources :meets do
    get 'activate' => "meets#toggle_active"
    get 'download_csv' => "teams#download_csv"
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
      resources :swimmers, :only => [:create, :destroy, :new, :index, :show, :edit, :update] do 
        post 'add_event' => "swimmers#add_event"
        resources :swimmer_event_times, :only => [:destroy]
      end
    end 
  end
  match 'login'    => "sessions#new"
  match 'sessions' => "sessions#create",  :via => :post
  match 'logout'   => "sessions#destroy", :via => :delete
  root :to => "meets#event_board"
end
