class User < ApplicationRecord
    has_many :notes
    has_many :shows, through: :notes
    validates :username, uniqueness: true,  presence: true
    validates :email, uniqueness: true, presence: true
    accepts_nested_attributes_for :notes
    has_secure_password

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
