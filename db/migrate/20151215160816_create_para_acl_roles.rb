class CreateParaAclRoles < ActiveRecord::Migration
  def up
    create_table :para_acl_roles do |t|
      t.string :name
      t.boolean :authorize_new_components

      t.timestamps null: false
    end

    Para::Acl::Role.create!(
      name: Para::Acl.super_admin_default_role_name,
      authorize_new_components: true
    )
  end

  def down
    drop_table :para_acl_roles
  end
end
