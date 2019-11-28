class Status < ApplicationRecord
    belongs_to :show

    def watched?
    end
end
