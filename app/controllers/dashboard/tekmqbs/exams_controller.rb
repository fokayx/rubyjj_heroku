class Dashboard::Tekmqbs::ExamsController < Dashboard::Tekmqbs::AdminController
  before_action :set_exam, only: [ :edit, :update, :package]

  def update
   # render text:params
   # return
    if @exam.update(exam_params)
      redirect_to package_dashboard_tekmqbs_exam_path, notice: '成功修改套餐'
    else
      render :edit
    end
  end

  def package
    @items = @exam.hospital.items
    # Hospital.status = "ture"，醫院必須在線上才能編輯啊窩，不然會找不到hospital~
  end

  private
  def exam_params
    params.require(:exam).permit(:name, :price, :gender , :hospital_id, :item_ids => [])
  end

  def set_exam
     @exam = Exam.find(params[:id])
  end
end
