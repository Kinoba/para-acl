module Admin
  module Para
    module Acl
      class RolesComponentController < ::Para::Admin::ComponentController
        def show
          @components_roles = ::Para::Acl::ComponentRolesCollection.new
        end

        def update
          @components_roles = ::Para::Acl::ComponentRolesCollection.new

          if @components_roles.update(component_roles_params)
            flash_message(:success, @components_roles)
            redirect_to @component.path
          else
            flash_message(:error, @components_roles)
            render 'show'
          end
        end

        private

        def component_roles_params
          params.require(:components_roles).permit(
            resources_attributes: [:id, :allow]
          )
        end
      end
    end
  end
end
