class Dashboard::DashboardsController < ActionController::Base
 # before_action :check_login
  before_action :authenticate_user!
  layout 'dashboard'
end
