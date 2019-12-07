class Show < ApplicationRecord 
    belongs_to :user
    has_many :notes
    has_one :status
    validates :show_title, presence: true 
    validate :not_a_duplicate
    
    def self.my_shows(user)
        where(user_id: user)
    end

    def not_a_duplicate
        show = Show.find_by(show_title: show_title, user_id: user_id) 
        if !!show && show != self
            errors.add(:show_title, 'is already on your list')
        end
    end
end