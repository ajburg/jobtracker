class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :job_no
      t.string :job_type
      t.string :job_state
      t.datetime :start_date
      t.datetime :due_date
      t.string :client_id

      t.timestamps
    end
  end
end
