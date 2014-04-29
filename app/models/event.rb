class Event < ActiveRecord::Base

	belongs_to :invitation, dependent: :destroy

end
