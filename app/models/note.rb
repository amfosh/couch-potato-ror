class Note < ApplicationRecord
    belongs_to :show
    belongs_to :user, optional: true
    # has_many :users, through: :shows
    accepts_nested_attributes_for :show
    validates :content, presence: true
end
