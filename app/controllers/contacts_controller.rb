class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if verify_recaptcha(model: @contact, message: "reCAHPTCHA OK") && @contact.deliver
      redirect_to root_path, notice: '感謝您的來信, RubyJJ處理中'
    else
      render :new, notice: '抱歉，系統錯誤，請稍候再試,謝謝'
    end
  end

end
