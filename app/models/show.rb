class Show < ApplicationRecord
    belongs_to :user
    has_many :notes, :through :users
    has_one :status
end