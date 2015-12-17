module Para
  module Acl
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def install_migrations
        rake 'para_acl_engine:install:migrations'
        rake 'db:migrate'
      end

      def add_role_mixin_to_admin
        admin_user_class_file_path = File.join(
          'app', 'models', "#{ admin_user_class_name.underscore }.rb"
        )

        inject_into_file admin_user_class_file_path, after: "< ActiveRecord::Base" do
          "\n  has_admin_role"
        end
      end

      def add_role_to_super_admins
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
