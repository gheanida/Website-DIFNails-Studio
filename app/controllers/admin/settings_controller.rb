class Admin::SettingsController < Admin::BaseController
  def index
    @admin_user = current_admin_user
    @operating_hours = OperatingHour.order(:day_of_week)
  end

  def update_profile
    if current_admin_user.update(profile_params)
      redirect_to settings_path, notice: "Profil berhasil diperbarui."
    else
      @admin_user = current_admin_user
      @operating_hours = OperatingHour.order(:day_of_week)
      render :index, status: :unprocessable_entity
    end
  end

  def update_hours
    params[:operating_hours].each do |id, attrs|
      hour = OperatingHour.find(id)
      hour.update(
        is_open: attrs[:is_open] == "1",
        open_time: attrs[:open_time],
        close_time: attrs[:close_time]
      )
    end
    redirect_to settings_path, notice: "Jam operasional berhasil diperbarui."
  end

  private

  def profile_params
    params.require(:admin_user).permit(:name, :email)
  end
end