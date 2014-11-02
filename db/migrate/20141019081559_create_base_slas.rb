class CreateBaseSlas < ActiveRecord::Migration
  def change
    create_table :base_slas do |t|
      t.integer :quantity
      t.string :period
      t.string :name

      t.timestamps
    end
  end
end
