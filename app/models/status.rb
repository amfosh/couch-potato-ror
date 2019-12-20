class Status < ApplicationRecord
    belongs_to :show
    # has_many :users, through: :shows
end
