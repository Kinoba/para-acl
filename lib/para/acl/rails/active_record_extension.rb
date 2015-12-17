module Para
  module Acl
    module ActiveRecordExtension
      extend ActiveSupport::Concern

      module ClassMethods
        def has_admin_role
          has_one :user_role, as: :user,
                              class_name: 'Para::Acl::UserRole',
                              dependent: :destroy

          has_one :role,      through: :user_role
        end
      end
    end
  end
end
