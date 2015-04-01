class Hospital < ActiveRecord::Base
  has_many :exams
  belongs_to :location


  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
  def delete
    self.is_deleted = true
    save
  end

end
