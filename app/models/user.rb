class User < ApplicationRecord
    has_many :shows
    has_many :notes, through: :shows
    has_many :statuses, through: :shows
    validates :username, uniqueness: true,  presence: true
    validates :email, presence: true
    has_secure_password

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
