class Show < ApplicationRecord
#     scope :watched, -> { where(watched: true) }
    belongs_to :user
    has_many :notes
    has_one :status

    def self.my_shows(user)
        where(user_id: user)
    end

    def watched 
    end
end