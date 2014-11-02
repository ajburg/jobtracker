class Job < ActiveRecord::Base

  validates_presence_of :job_no, :job_type, :job_state, :start_date, :due_date, :client_id

  belongs_to :client
  has_many :job_slas
end
