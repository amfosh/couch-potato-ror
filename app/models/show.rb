class Show < ApplicationRecord
    belongs_to :user
    has_many :notes, through: :users
    has_one :status

    def self.my_shows(user)
        where(user_id: user)
    end
end