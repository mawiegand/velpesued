Refinery::Core::Engine.routes.draw do

  namespace :divisions, :path => '' do
    # Frontend routes
    resources :divisions, :only => [:show] do
      resources :groups, :only => [:show]
    end

    # Admin routes
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :divisions, :except => :show do
        collection do
          post :update_positions
        end
      end

      scope '/divisions' do
        resources :groups, :except => :show do
          collection do
            post :update_positions
          end
        end
      end
    end
  end


  # Frontend routes
  namespace :divisions do
    resources :positions, :only => [:index, :show]
  end

  # Admin routes
  namespace :divisions, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/divisions" do
      resources :positions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
