module Para
  module Acl
    module ComponentsExtension
      extend ActiveSupport::Concern

      included do
        before_destroy :clean_role_components
      end

      private

      def clean_role_components
        ::Para::Acl::RoleComponent.where(component: self).destroy_all
      end
    end
  end
end
