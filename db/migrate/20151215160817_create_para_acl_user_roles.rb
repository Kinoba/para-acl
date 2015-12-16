class CreateParaAclUserRoles < ActiveRecord::Migration
  def change
    create_table :para_acl_user_roles do |t|
      t.references :role, index: true
      t.references :user, index: true, polymorphic: true

      t.timestamps null: false
    end

    add_foreign_key :para_acl_user_roles, :para_acl_roles, column: :role_id
  end
end
