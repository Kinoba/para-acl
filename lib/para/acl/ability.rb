module Para
  module Acl
    class Ability
      include CanCan::Ability

      attr_reader :user

      def initialize(user)
        @user = user

        can :access, :admin

        # Bypass all authorizations if disabled from configuration
        if Para::Acl.bypass_admin_authorization
          return can :manage, :all
        end

        process_authorizations
      end

      private

      def process_authorizations
        return unless role

        can :manage, :all

        role.role_components.each do |role_component|
          unless role_component.allow?
            cannot :manage, Para::Component::Base, id: role_component.component_id
          end
        end
      end

      def role
        @role ||= Para::Acl::Role.joins(:user_roles).where(
          para_acl_user_roles: {
            user_id: user.id,
            user_type: user.class.name
          }
        ).includes(:role_components).first
      end
    end
  end
end
