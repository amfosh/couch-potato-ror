class Note < ApplicationRecord
    belongs_to :show

    validates :content, presence: true
end
