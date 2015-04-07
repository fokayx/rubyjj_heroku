class Dashboard::DashboardsController < ActionController::Base
 # before_action :check_login
  before_action :authenticate_user!
  layout 'dashboard'

  def check_login

  end

end
