module Para
  module Acl
    module Admin
      class RolesController < ::Para::Admin::ResourcesController
        resource :role, class: 'Para::Acl::Role'
      end
    end
  end
end
