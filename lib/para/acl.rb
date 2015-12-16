module Para
  module Acl
    extend ActiveSupport::Autoload

    autoload :Ability
    autoload :Routes
    autoload :ComponentRolesCollection
    autoload :Version

    mattr_accessor :super_admin_default_role_name
    @@super_admin_default_role_name = "Super Admin"

    mattr_accessor :enable_authorization
    @@enable_authorization = true

    def self.table_name_prefix
      'para_acl_'
    end
  end
end

require 'para/acl/engine' if defined?(Rails)
