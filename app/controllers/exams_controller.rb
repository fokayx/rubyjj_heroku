class ExamsController < ApplicationController
  def index
    @exams = Exam.where(hospital_id: params[:hospital])
    @hospital = Hospital.find(params[:hospital])
  end
end
