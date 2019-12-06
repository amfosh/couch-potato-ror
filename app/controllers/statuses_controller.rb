class StatusesController < ApplicationController
    def index
        @statuses = Status.alpha
    end
end