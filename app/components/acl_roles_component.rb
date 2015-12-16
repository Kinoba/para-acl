class AclRolesComponent < Para::Component::Crud
  register :acl_roles, self

  def resources
    @resources ||= Para::Acl::Role.all
  end

  def model_type
    '::Para::Acl::Role'
  end
end
