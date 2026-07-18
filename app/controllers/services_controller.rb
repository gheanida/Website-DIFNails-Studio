class ServicesController < ApplicationController
  def index
    @categories = ServiceCategory.all
    if params[:category_id].present?
      @services = Service.where(is_active: true, service_category_id: params[:category_id])
    else
      @services = Service.where(is_active: true)
    end
  end

  def show
    @service = Service.find(params[:id])
  end
end
