class Dashboard::Tekmqbs::HospitalsController < Dashboard::Tekmqbs::AdminController
  before_action :set_hospital, only: [ :edit, :update, :destroy, :exam, :item]
  before_action :select_location, only: [:new, :edit, :update]
  before_action :set_exam, only: [:edit, :update, :exam]


  def index
    @hospitals = Hospital.unscoped.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to dashboard_tekmqbs_hospitals_path, notice: '成功新增醫院'
    else 
      render :new
    end
  end

  def edit
  end

  def update
  #  render text:params
  #  return

    if @hospital.update(hospital_params)
      redirect_to :back, notice: '成功修改醫院資料'
    else
      render :edit, notice: '修改失敗,請稍後再試'
    end
  end

  def exam
  end

  def item
    @items = @hospital.items
  end

  private 
  def select_location
    @location = Location.all.map do |location|
      [location.name, location.id]
    end
    # @location = Location.all.map { |location| [location.name, location.id] }
  end

  def set_hospital
    @hospital = Hospital.unscoped.find(params[:id])
  end

  def set_exam
    @exams = @hospital.exams
  end
  def hospital_params
    params.require(:hospital).permit(:name, :phone, :address, :area, :web, :location_id, :status,
      :exams_attributes => [:id, :name, :price, :gender, :_destroy],
      :items_attributes => [:id, :name, :group, :_destroy]
      )
  end
end
