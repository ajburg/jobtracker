class CreateJobSlas < ActiveRecord::Migration
  def change
    create_table :job_slas do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.datetime :finished_datetime
      t.string :current_state
      t.integer :client_sla_id
      t.integer :job_id

      t.timestamps
    end
  end
end
