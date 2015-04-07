class Category < ActiveRecord::Base
  has_many :items
  has_many :exam_lists
  
  serialize :name, Hash 
end
