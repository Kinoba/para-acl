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
          'app', 'models', "#{ Para.config.acl.admin_user_class.underscore }.rb"
        )

        inject_into_file admin_user_class_file_path, after: /< (ActiveRecord::Base|ApplicationRecord)/ do
          "\n  has_admin_role"
        end
      end

      def add_role_to_super_admins
        rake 'para:acl:authorize_admins'
      end
    end
  end
end
