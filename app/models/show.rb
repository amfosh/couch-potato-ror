class Show < ApplicationRecord 
    # belongs_to :user
    has_many :notes
    has_many :users, through: :notes
    # has_one :status
    validates :show_title, presence: true 
    accepts_nested_attributes_for :notes
    scope :just_added, -> { order(created_at: :desc) }

    # validate :not_a_duplicate

    # def not_a_duplicate
    #     binding.pry
    #     show_ids = Show.where(show_title: show_title).select(:id)
    #     note = Note.find_by(show_id: show_ids, user_id: user_ids)
    #     if note
    #         errors.add(:show_title + ' is already on your list')
    #     end
    # end
 

    # def show_status
    #     show = Show.find_by(show_title: show_title, user_id: user_id)
    #     if show.status_id == 1 
    #         "Watched"
    #     elsif show.status_id == 2 
    #         "Watching"
    #     else
    #         "To Watch"
    #     end
    # end
end