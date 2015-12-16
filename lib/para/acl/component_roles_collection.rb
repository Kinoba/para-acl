module Para
  module Acl
    class ComponentRolesCollection
      include ActiveModel::Model
      include ActiveRecord::AttributeAssignment

      def update(attributes)
        assign_attributes(attributes)
        save
      end

      def persisted?
        true
      end

      def save
        ActiveRecord::Base.transaction do
          role_components.values.each(&:save!)
        end if valid?
      end

      def valid?
        role_components.values.all?(&:valid?)
      end

      def roles
        @roles ||= Para::Acl::Role.includes(
          role_components: :component
        ).order('para_acl_roles.name ASC')
      end

      def resources_attributes=(ary)
        ary.each do |_, attributes|
          role_component = role_component_for(attributes.delete(:id))
          role_component.assign_attributes(attributes)
        end
      end

      def resources
        @resources ||= Para::Component::Base.order('para_components.name ASC').each_with_object({}) do |component, hash|
          hash[component] = {}

          roles.each do |role|
            hash[component][role] = role_component = role.role_component_for(component)
            role_component.save if role_component.new_record?
          end
        end
      end

      private

      def role_component_for(id)
        role_components[id.to_i]
      end

      def role_components
        @role_components ||= roles.each_with_object({}) do |role, hash|
          role.role_components.each do |role_component|
            hash[role_component.id] = role_component
          end
        end
      end
    end
  end
end
