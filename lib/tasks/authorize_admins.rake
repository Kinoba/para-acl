module Para
  module Acl
    class AuthorizeAdmins
      def run
        admin_user_class.find_each do |admin_user|
          admin_user.role = super_admin_role
          admin_user.save!
        end
      end

      private

      def admin_user_class
        @admin_user_class ||= admin_user_class_name.constantize
      end

      def admin_user_class_name
        @admin_user_class_name ||= Para.config.acl.admin_user_class
      end

      def super_admin_role
        @super_admin_role  ||= Para::Acl::Role.where(
          name: Para::Acl.super_admin_default_role_name,
          authorize_new_components: true
        ).first_or_create!
      end
    end
  end
end

namespace :para do
  namespace :acl do
    desc 'Make all existing admins be super users'
    task authorize_admins: :environment do
      Para::Acl::AuthorizeAdmins.new.run
    end
  end
end
