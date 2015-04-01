class Dashboard::Tekmqbs::HospitalsController < Dashboard::Tekmqbs::AdminController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]
  before_action :select_location, only: [:new, :edit]


  def index
    @hospitals = Hospital.all
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
    if @hospital.update(hospital_params)
      redirect_to dashboard_tekmqbs_hospitals_path, notice: '成功修改醫院資料'
    else
      render :edit, notice: '修改失敗,請稍後再試'
    end
  end

  def show
  end

  private 
  def select_location
    @location = Location.all.map do |location|
      [location.name, location.id]
    end
    # @location = Location.all.map { |location| [location.name, location.id] }
  end

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:name, :phone, :address, :area, :web, :location_id, :status)
  end
end
