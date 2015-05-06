class ExamsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital])
    @exams = Exam.where(hospital_id: @hospital.id).page(params[:page]).per(24)
  end
end
