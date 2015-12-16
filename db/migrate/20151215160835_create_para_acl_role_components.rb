class CreateParaAclRoleComponents < ActiveRecord::Migration
  def up
    create_table :para_acl_role_components do |t|
      t.references :role, index: true
      t.references :component, index: true
      t.boolean :allow, default: false

      t.timestamps null: false
    end

    add_foreign_key :para_acl_role_components, :para_acl_roles, column: :role_id
    add_foreign_key :para_acl_role_components, :para_components, column: :component_id

    role = Para::Acl::Role.find_by_name(Para::Acl.super_admin_default_role_name)

    Para::Component::Base.find_each do |component|
      role.role_components << Para::Acl::RoleComponent.new(
        component: component,
        allow: true
      )
    end
  end

  def down
    remove_foreign_key :para_acl_role_components, :component
    remove_foreign_key :para_acl_role_components, :role

    drop_table :para_acl_role_components
  end
end
