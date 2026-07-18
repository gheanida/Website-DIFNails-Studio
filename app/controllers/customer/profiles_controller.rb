class Customer::ProfilesController < Customer::BaseController
  before_action :set_customer

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_profile_path, notice: "Your profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
