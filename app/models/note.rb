class Note < ApplicationRecord
    belongs_to :show
    belongs_to :user, optional: true
    # has_one :user, through: :show
    accepts_nested_attributes_for :show
    validates :content, presence: true
end
