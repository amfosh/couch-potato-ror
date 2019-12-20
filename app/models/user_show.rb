class UserShow < ApplicationRecord 
    belongs_to :show
    belongs_to :user
    # accepts_nested_attributes_for :show
    # validates :content, presence: true
end