module Para
  module Acl
    class Routes < Para::Plugins::Routes
      def draw
        plugin :acl do
          component :acl_roles, path: :roles, actions: [:show, :update] do
            resources :roles
          end
        end
      end
    end
  end
end
