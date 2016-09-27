class AclRolesComponent < Para::Component::Base
  register :acl_roles, self

  def resources
    @resources ||= Para::Acl::Role.all
  end

  def model_type
    '::Para::Acl::Role'
  end

  def model
    @model ||= model_type.constantize
  end
end
