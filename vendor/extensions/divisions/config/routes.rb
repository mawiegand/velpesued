Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :divisions do
    resources :groups, :only => [:show]
    resources :divisions, :path => '', :only => [:show]
  end

  # Admin routes
  namespace :divisions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :divisions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
    
    namespace :admin, :path => "#{Refinery::Core.backend_route}/divisions" do
      resources :groups, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
