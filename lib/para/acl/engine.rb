require 'para/acl/rails/active_record_extension'

module Para
  module Acl
    class Engine < ::Rails::Engine
      initializer 'Set para ability class' do
        config.to_prepare do
          Para.config.ability_class_name = 'Para::Acl::Ability'
        end
      end

      initializer 'Add extension to ActiveRecord' do
        ActiveSupport.on_load(:active_record) do
          include Para::Acl::ActiveRecordExtension
        end
      end
    end
  end
end
