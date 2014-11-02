class BaseSlasController < SecuredController
  before_filter only: [:new, :edit, :create] do
    @period = Lookup.where(lookup_type: 'BusinessTime')
  end


  def index
    @baseslas = BaseSla.all
  end

  def show
    id = params[:id]
    @base_sla = BaseSla.find(id)
  end

  def new
    #@period = Lookup.where(lookup_type: 'BusinessTime')
    @base_sla = BaseSla.new
  end

  def create
    #@period = Lookup.where(lookup_type: 'BusinessTime')
    @base_sla = BaseSla.new(white_listed_params)
    if @base_sla.save
      flash[:success] = "New Base SLA #{@base_sla.name} saved successfully."
      redirect_to base_slas_path
    else
      render :new
    end
  end

  def edit
    @base_sla = BaseSla.find(params[:id])
  end

  def update
    @base_sla = BaseSla.find(params[:id])
    if @base_sla.update_attributes(white_listed_params)
      flash[:success] = "BaseSLA #{@base_sla.name} updated successfully."
      redirect_to base_slas_path
    else
      render :edit
    end
  end

  def destroy
    @base_sla = BaseSla.find_by_id(params[:id])
    @base_sla.delete if @base_sla
    flash[:success] = "BaseSLA #{@base_sla.name} deleted successfully."
    redirect_to base_slas_path
  end

 private

  def white_listed_params
    params.require(:base_sla).permit(:quantity, :period, :name)
  end



end
