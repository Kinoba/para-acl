module Para
  module Acl
    class UserRole < ActiveRecord::Base
      belongs_to :role
      belongs_to :user, polymorphic: true
    end
  end
end
