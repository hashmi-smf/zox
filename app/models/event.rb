class Event < ActiveRecord::Base
	validates :name, :mobile, :budget, 
	          :description, :follow_up, :user_id, presence: true
	belongs_to :user, class_name: 'User'
	belongs_to :lead
	belongs_to :site

end
