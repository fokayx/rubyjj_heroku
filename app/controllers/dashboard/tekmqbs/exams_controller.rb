class Dashboard::Tekmqbs::ExamsController < Dashboard::Tekmqbs::AdminController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def new
    @exam = Exam.new
   # @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
    #  redirect_to dashboard_tekmqbs_hospital_path(params[:hospital_id]), notice: '成功新增套餐'
    else
      render :new
    end
  end

  def edit
   # @hospital = Hospital.find(params[:hospital_id])
    #要多傳一個hospital的參數給網址囉。不對是多從網址多抓一個hospital的參數回來給form
  end

  def update
    if @exam.update(exam_params)
      redirect_to dashboard_tekmqbs_hospital_path(params[:hospital_id]), notice: '成功修改套餐'
    else
      render :edit
    end
  end

  def show
  end

  private
  def exam_params
    params.require(:exam).permit(:name, :price, :gender , :hospital_id,
      :packages_attributes => [:id, :category, :item_id, :_destroy
    ])
  end

  def set_exam
     @exam = Exam.find(params[:id])
  end
end
