class InvitationsController < ApplicationController

	def index
		@invitations = Invitation.all
	end

	def new
		@invitation = Invitation.new
	end

	def edit
	end

	def show
    @show = Invitation.find(params[:id])
  end

  def create
  	@invitation = Invitation.new(invitation_params)

  if @invitation.save
    redirect_to root_path, notice: "Invitation was submitted successfully!"
  else
    render :new
  end
  end

  protected

  def invitation_params
    params.require(:invitation).permit(
      :date, :location, :bridename, :bridephone, :brideemail, :bridebio, :groomname, :groomphone, :groomemail, :groombio, :user_id
    )
  end

end
