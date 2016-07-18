require 'para/acl/ext/active_record_extension'
require 'para/acl/ext/components_extension'

module Para
  module Acl
    class Engine < ::Rails::Engine
      initializer 'para.acl.set_para_ability_class_name' do
        config.to_prepare do
          Para.config.ability_class_name = 'Para::Acl::Ability'
        end
      end

      initializer 'para.acl.add_has_admin_role_extension_to_active_record' do
        ActiveSupport.on_load(:active_record) do
          include Para::Acl::ActiveRecordExtension
        end
      end

      initializer 'para.acl.add_para_components_extension' do
        ActiveSupport.on_load(:active_record) do
          Para::Component::Base.send(:include, Para::Acl::ComponentsExtension)
        end
      end
    end
  end
end
