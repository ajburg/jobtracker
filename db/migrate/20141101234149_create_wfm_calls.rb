class CreateWfmCalls < ActiveRecord::Migration
  def change
    create_table :wfm_calls do |t|

      t.timestamps
    end
  end
end
