class HomeController < ApplicationController
	def index
    @events = Event.all.includes(:user)
    @users = User.all
	end

end
