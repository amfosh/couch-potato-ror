class Show < ApplicationRecord 
    has_many :notes
    has_many :users, through: :notes
    validates :show_title, presence: true 
    accepts_nested_attributes_for :notes
    scope :just_added, -> { order(created_at: :desc).limit(3) }

    # validate :not_a_duplicate

    # def not_a_duplicate
    #     binding.pry
    #     show_ids = Show.where(show_title: show_title).select(:id)
    #     note = Note.find_by(show_id: show_ids, user_id: user_ids)
    #     if note
    #         errors.add(:show_title + ' is already on your list')
    #     end
    # end
end