class WelcomeController < ApplicationController

  def index
    @jobs = Job.all.order('due_date asc')
  end
end
