class Dashboard::Tekmqbs::ExamsController < Dashboard::Tekmqbs::AdminController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to dashboard_tekmqbs_hospital_path(params[:hospital_id]), notice: '成功新增套餐'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def exam_params
    params.require(:exam).permit(:name, :price, :gender)
  end

  def set_exam
     @exam = Exam.find(params[:id])
  end
end
