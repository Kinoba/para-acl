module Para
  module Acl
    class Routes < Para::Plugins::Routes
      def draw
        plugin :acl do
          component :acl_roles do
            scope ':model' do
              resources :crud_resources, path: '/'
            end
          end

          patch "acl_roles/:component_id" => "acl_roles_component#update"
        end
      end
    end
  end
end
