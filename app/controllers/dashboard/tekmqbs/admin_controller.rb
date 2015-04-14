class Dashboard::Tekmqbs::AdminController < ActionController::Base
  before_action :require_jj
  layout 'tekmqbs'
  
  private 
  def require_jj
    redirect_to dashboard_tekmqbs_user_session_path, notice: '權限不足' unless dashboard_tekmqbs_user_signed_in?
  end
  #在進入後台頁面前，先檢查是否已登入管理帳號，未登入就轉到登入頁面。

  def set_category
    @category = ["身體理學檢查", "血液檢查", "眼科檢查", "耳鼻喉科檢查", "牙科檢查", "心臟功能檢查", 
                 "肺功能檢查", "肝、膽、腎功能檢查", "糞便檢查", "尿液檢查",
                 "超音波檢查", "X光檢查", "內視鏡檢查", "斷層掃描", "核磁共振",
                 "婦科檢查", "乳房檢查", "泌尿科檢查", "腫瘤指標", "醫師諮詢", "其他檢查"]
  end
end
