class Exam < ActiveRecord::Base
  belongs_to :hospital
  has_many :packages
  has_many :items, through: :packages

  accepts_nested_attributes_for :packages, allow_destroy: true

 # serialize :category, Array
end
