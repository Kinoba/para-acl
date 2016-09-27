module Para
  module Acl
    class Routes < Para::Plugins::Routes
      def draw
        plugin :acl do
          component :acl_roles, path: :roles
          crud_component :acl_roles, path: :roles
          patch "roles/:component_id" => "roles_component#update"
        end
      end
    end
  end
end
