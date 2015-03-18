class ReservesController < ApplicationController

  def new
    @reserve = Reserve.new
  end

  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.save
      JjMailer.reserve_email(@reserve).deliver_later
      redirect_to root_path, notice:'感謝你'
    else
      render :new, notice: '系統錯誤,請稍候再試'
    end
  end

  private
  def reserve_params
    params.require(:reserve).permit(:name, :phone, :email)
  end
end
