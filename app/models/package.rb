class Package < ActiveRecord::Base
  belongs_to :exam
  belongs_to :item

  accepts_nested_attributes_for :item, allow_destroy: true
end
