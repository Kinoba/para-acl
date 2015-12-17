module Para
  module Acl
    class UserRole < ActiveRecord::Base
      belongs_to :role, class_name: 'Para::Acl::Role'
      belongs_to :user, polymorphic: true

      validates :role, :user, presence: true
    end
  end
end
