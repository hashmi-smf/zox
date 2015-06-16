class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	def index
	  if current_user.role != "admin"
		@events = current_user.events.order(:follow_up == Date.today).includes(:site)
	  else
		@events = Event.all.order(:follow_up == Date.today).includes(:site, :user)
	  end
	end

	def new
		@event = current_user.events.new
	end

	def create
		@event = current_user.events.new(event_params)
		if @event.save
			redirect_to events_path, notice: "Event was successfully created"
		else
			render :new
		end

	end

	def show
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to events_path, notice: "Event was successfully updated"
		else
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_url, notice: "Event was successfully deleted"
	end

	private

	def set_event
		if current_user.role == "admin"
			@event = Event.find(params[:id])
		else
			@event = current_user.events.find(params[:id])
		end
	end

	def event_params
     params.require(:event).permit(:name, :mobile, :budget, :email, :description, 
                                   :complete,:follow_up, :lead_id, :site_id, :status, 
                                   :user_id)		
	end
end
