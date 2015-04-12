class Exam < ActiveRecord::Base
  belongs_to :hospital
  has_many :packages
  has_many :items, through: :packages

  serialize :category, Array
end
