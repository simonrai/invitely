class EventsController < ApplicationController

	before_filter :load_invitation

	def new
		@event = @invitation.events.build
	end

	def create
    @event = @invitation.events.build(event_params)
    @event.invitation_id = @invitation.id

    if @event.save
      redirect_to invitation_path(@invitation), notice: "Event successfully added."
    else
      render :new
    end
  end

	def edit
		@event = Event.find(params[:id])
	end

	def update
    @event = @invitation.events.find(params[:id])

		if @event.update_attributes(event_params)
      redirect_to invitation_path(@invitation), notice: "Event successfully updated."
    else
      render :edit
    end
	end

	def show
    @event = Event.find(params[:id])
  end

	protected

	def event_params
    params.require(:event).permit(:name, :date, :time, :location, :rsvp, :notes, :order, :invitation_id)
  end

  def load_invitation
    @invitation = Invitation.find(params[:invitation_id])
  end

end