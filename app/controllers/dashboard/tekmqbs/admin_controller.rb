class Dashboard::Tekmqbs::AdminController < ActionController::Base
  before_action :require_jj
  layout 'tekmqbs'
  
  private 
  def require_jj
    redirect_to dashboard_tekmqbs_user_session_path, notice: '權限不足' unless dashboard_tekmqbs_user_signed_in?
  end
  #在進入後台頁面前，先檢查是否已登入管理帳號，未登入就轉到登入頁面。
end
