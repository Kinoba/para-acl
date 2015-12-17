class CreateParaAclRoleComponents < ActiveRecord::Migration
  def up
    create_table :para_acl_role_components do |t|
      t.references :role, index: true
      t.references :component, index: true
      t.boolean :allow

      t.timestamps null: false
    end

    add_foreign_key :para_acl_role_components, :para_acl_roles, column: :role_id
    add_foreign_key :para_acl_role_components, :para_components, column: :component_id
  end

  def down
    remove_foreign_key :para_acl_role_components, :component
    remove_foreign_key :para_acl_role_components, :role

    drop_table :para_acl_role_components
  end
end
