module Para
  module Acl
    module ComponentsExtension
      extend ActiveSupport::Concern

      included do
        has_many :role_components, class_name: 'Para::Acl::RoleComponent',
                                   foreign_key: :component_id,
                                   dependent: :destroy
        has_many :roles, through: :role_components
      end
    end
  end
end
