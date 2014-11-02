class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :user_role

      t.timestamps
    end
  end
end
