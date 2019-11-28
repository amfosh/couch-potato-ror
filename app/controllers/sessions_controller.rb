class SessionsController < ApplicationController
    def new
    end

    def create
        session[:name] = params[:name]
        if session[:name].present?
            redirect_to '/'
        else 
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end
end