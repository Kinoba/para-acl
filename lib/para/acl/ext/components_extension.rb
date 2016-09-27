module Para
  module Acl
    module ComponentsExtension
      extend ActiveSupport::Concern

      included do
        has_many :role_components, dependent: :destroy
        has_many :roles, through: :role_components
      end
    end
  end
end
