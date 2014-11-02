class CreateClientSlas < ActiveRecord::Migration
  def change
    create_table :client_slas do |t|
      t.string :name
      t.integer :client_id
      t.integer :business_unit_id
      t.string :job_type

      t.timestamps
    end
  end
end
