class Acquisition < ActiveRecord::Base
  belongs_to :mission
  belongs_to :category
  
  validates :category_id, presence: true
  validates :mission_id, presence: true
  validates :experience, numericality: {greater_than: 0 }
end
