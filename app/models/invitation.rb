class Invitation < ActiveRecord::Base

	belongs_to :user, dependent: :destroy

	has_many :events

	accepts_nested_attributes_for :events

end
