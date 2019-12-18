class Status < ApplicationRecord
    belongs_to :shows
    has_many :users, through: :shows
end
