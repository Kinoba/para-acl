module Para
  module Acl
    class Role < ActiveRecord::Base
      has_many :user_roles, dependent: :destroy
      has_many :users, through: :user_roles, source_type: 'AdminUser'

      has_many :role_components, dependent: :destroy
      has_many :components, through: :role_components

      def role_component_for(component)
        role_components_by_component[component.id] ||= role_components.build(
          component_id: component.id
        )
      end

      def role_components_by_component
        @role_components_by_component ||= role_components.each_with_object({}) do |role_component, hash|
          hash[role_component.component_id] = role_component
        end
      end
    end
  end
end
