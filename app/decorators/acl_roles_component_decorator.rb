module AclRolesComponentDecorator
  include Para::Component::CrudDecorator

  def path(options = {})
    find_path([:admin, self], options)
  end

  def name
    I18n.t('admin.acl_roles.name')
  end

  def description
    I18n.t('admin.acl_roles.description')
  end
end
