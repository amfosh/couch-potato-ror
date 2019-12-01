class User < ApplicationRecord
    has_many :shows
    has_many :notes, through: :shows 
    has_many :statuses, through: :shows
    validates :username, uniqueness: true,  presence: true
    validates :email, presence: true
    has_secure_password

    # def self.find_or_create_by_omniauth(auth_hash)
    #     self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
    #       user.username = auth_hash["info"]["name"]
    #       user.provider = auth_hash["provider"]
    #       user.uid = auth_hash["uid"]
    #       user.password = SecureRandom.hex
    #     end
    #   end
end
