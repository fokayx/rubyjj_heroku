class ExamsController < ApplicationController
  def index
    @exams = Exam.where(hospital_id: params[:hospital]).page(params[:page]).per(24)
    @hospital = Hospital.find(params[:hospital])
  end
end
