class Hospital < ActiveRecord::Base
  has_many :exams
  belongs_to :location

  default_scope { where(status: true) }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
  def delete
    self.is_deleted = true
    save
  end

 # def self.default_scope
 #   where :status => true
 # end

end
