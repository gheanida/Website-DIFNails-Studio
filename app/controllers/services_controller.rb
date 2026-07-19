class ServicesController < ApplicationController
  def index
    @categories = ServiceCategory.all
    @services = Service.where(is_active: true).includes(:service_category)

    if params[:category_id].present?
      @services = @services.where(service_category_id: params[:category_id])
    end

    if params[:q].present?
      @services = @services.where("name LIKE ?", "%#{params[:q]}%")
    end

    @services = @services.order(:name)
  end

  def show
    @service = Service.find(params[:id])
  end
end