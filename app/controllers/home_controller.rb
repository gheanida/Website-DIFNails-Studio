class HomeController < ApplicationController
  def index
    @featured_services = Service.where(is_active: true).limit(3)
  end
end
