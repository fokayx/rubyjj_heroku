class Hospital < ActiveRecord::Base
  has_many :exams
  belongs_to :location
  has_many :items

  accepts_nested_attributes_for :exams, allow_destroy: true
  accepts_nested_attributes_for :items, allow_destroy: true

  default_scope { where(status: true) }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
  def delete
    self.is_deleted = true
    save
  end

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders] 

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def should_generate_new_friendly_id?
    new_record?
  end

  def slug_candidates
    [
      :name,
      [:name, :area]
    ]
  end
end
