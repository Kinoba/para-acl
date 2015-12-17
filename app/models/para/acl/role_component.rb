module Para
  module Acl
    class RoleComponent < ActiveRecord::Base
      belongs_to :role
      belongs_to :component, class_name: 'Para::Component::Base'

      validates :role, :component, presence: true

      # If the allow field is not filled this means that we should fallback
      # on the parent role's #authorize_new_components field
      #
      def allow?
        allow == nil ? role.authorize_new_components : allow
      end
    end
  end
end
