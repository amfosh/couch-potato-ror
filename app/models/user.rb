class User < ApplicationRecord
    has_many :shows
    has_many :notes, :through :shows 
    has_many :statuses, :through :shows
end
