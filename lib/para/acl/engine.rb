module Para
  module Acl
    class Engine < ::Rails::Engine
      initializer 'Set para ability class' do
        config.to_prepare do
          Para.config.ability_class_name = 'Para::Acl::Ability'
        end
      end
    end
  end
end
