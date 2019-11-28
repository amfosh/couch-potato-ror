class User < ApplicationRecord
    has_secure_password
    has_many :shows
    has_many :notes, through: :shows 
    has_many :statuses, through: :shows
    validates :email, uniqueness: true
    validates :username, :password, presence: true
end
