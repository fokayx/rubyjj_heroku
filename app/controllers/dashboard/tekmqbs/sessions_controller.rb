class Dashboard::Tekmqbs::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(tekmqbs)
    dashboard_tekmqbs_hospitals_path(tekmqbs)
  end
end
