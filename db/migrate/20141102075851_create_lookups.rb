class CreateLookups < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
      t.string :name
      t.string :value
      t.string :lookup_type

      t.timestamps
    end
  end
end
