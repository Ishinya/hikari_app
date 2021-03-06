class Status < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :category_id, presence: true, uniqueness:{scope: [:user_id] }
  validates :experience, numericality: {greater_than_or_equal_to: 0 }
  validates :recent_experience, numericality: {greater_than_or_equal_to: 0 }
  
  def level
    lv = 1
    levels = Level.all.order("value ASC")
    levels.each do |level|
      if level.sufficiency <= experience
        lv = level.value
      end
    end
    lv
  end
  
  def next_level_required_experience
    next_level = Level.find_by(value: level + 1)
    next_level.sufficiency
  end
end
