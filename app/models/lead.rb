class Lead < ActiveRecord::Base
	has_many :events
	validates :name, :website, presence: true
end
