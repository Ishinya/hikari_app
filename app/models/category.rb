class Category < ActiveRecord::Base
    has_many :missions
    validates :name , presence: true
end
