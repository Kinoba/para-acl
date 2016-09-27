module Para
  module Acl
    class Routes < Para::Plugins::Routes
      def draw
        plugin :acl do
          component :acl_roles, path: :roles do
            resources :roles
            patch :update
          end
        end
      end
    end
  end
end
