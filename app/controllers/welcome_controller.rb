class WelcomeController < ApplicationController

  def index
    @jobs = Job.where.not(job_state: 'Completed').order('due_date asc')
  end
end
