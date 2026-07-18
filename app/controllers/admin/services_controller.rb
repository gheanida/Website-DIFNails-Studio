class Admin::ServicesController < Admin::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.includes(:service_category).all
  end

  def show
  end

  def new
    @service = Service.new
    @categories = ServiceCategory.all
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_services_path, notice: "Service '#{@service.name}' was successfully created."
    else
      @categories = ServiceCategory.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = ServiceCategory.all
  end

  def update
    if @service.update(service_params)
      redirect_to admin_services_path, notice: "Service '#{@service.name}' was successfully updated."
    else
      @categories = ServiceCategory.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to admin_services_path, notice: "Service was successfully deleted."
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :is_active, :image_url, :service_category_id)
  end
end
