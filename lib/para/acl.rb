require 'para/acl/engine' if defined?(Rails)

module Para
  module Acl
    extend ActiveSupport::Autoload

    autoload :Ability
    autoload :Routes
    autoload :ComponentRolesCollection
    autoload :Version

    mattr_accessor :admin_user_class
    @@admin_user_class = 'AdminUser'

    mattr_accessor :super_admin_default_role_name
    @@super_admin_default_role_name = "Super Admin"

    mattr_accessor :bypass_admin_authorization
    @@bypass_admin_authorization = false

    def self.table_name_prefix
      'para_acl_'
    end
  end
end
