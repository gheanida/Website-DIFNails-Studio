class Customer::BaseController < ApplicationController
  before_action :authenticate_customer!
  layout 'customer'
end