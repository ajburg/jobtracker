class JobSlasController < SecuredController



  def index
    @jobslas = Job_sla.all
  end

end
