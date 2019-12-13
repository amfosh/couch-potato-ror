class Note < ApplicationRecord
    has_many :shows
    has_many :users, through: :shows
    # accepts_nested_attributes_for :show
    validates :content, presence: true

end
