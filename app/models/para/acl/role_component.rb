module Para
  module Acl
    class RoleComponent < ActiveRecord::Base
      belongs_to :role
      belongs_to :component, class_name: 'Para::Component::Base'
    end
  end
end
