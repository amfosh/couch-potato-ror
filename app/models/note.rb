class Note < ApplicationRecord
    belongs_to :show
    has_many :users, through: :shows

    validates :content, presence: true

    validates :show, uniqueness: { scope: :user, message: "has already been reviewed by you"  }
end
