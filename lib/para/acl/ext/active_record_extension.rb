module Para
  module Acl
    module ActiveRecordExtension
      extend ActiveSupport::Concern

      module ClassMethods
        def has_admin_role
          has_one :user_role, as: :user,
                              class_name: 'Para::Acl::UserRole',
                              dependent: :destroy,
                              autosave: true

          has_one :role,      through: :user_role

          unless method_defined?(:role_id)
            define_method(:role_id) do
              user_role.try(:role_id)
            end
          end

          unless method_defined?(:role_id=)
            define_method(:role_id=) do |id|
              if user_role
                user_role.role_id = id
              else
                build_user_role(role_id: id)
              end
            end
          end
        end
      end
    end
  end
end
