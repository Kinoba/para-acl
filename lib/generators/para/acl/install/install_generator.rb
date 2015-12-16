module Para
  module Acl
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      class_option :migrate, type: :boolean, default: false, :aliases => "-m"

      def install_migrations
        rake 'para_acl_engine:install:migrations'
      end

      def migrate
        rake 'db:migrate' if options[:migrate]
      end
    end
  end
end
