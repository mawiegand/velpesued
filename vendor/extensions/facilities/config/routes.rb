Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :facilities do
    resources :facilities, :path => '', :only => [:index]
  end

  # Admin routes
  namespace :facilities, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :facilities, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
