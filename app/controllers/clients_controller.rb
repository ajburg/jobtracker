class ClientsController < SecuredController

  def index
    @clients = Client.all.order('name asc')

  end

end
