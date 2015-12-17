class CreateParaAclRoles < ActiveRecord::Migration
  def up
    create_table :para_acl_roles do |t|
      t.string :name
      t.boolean :authorize_new_components

      t.timestamps null: false
    end
  end

  def down
    drop_table :para_acl_roles
  end
end
