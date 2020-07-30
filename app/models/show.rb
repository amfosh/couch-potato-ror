class Show < ApplicationRecord 
    has_many :notes
    has_many :users, through: :notes
    validates :show_title, presence: true 
    accepts_nested_attributes_for :notes
    scope :just_added, -> { order(created_at: :desc).limit(3) }
end