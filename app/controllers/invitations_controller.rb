class InvitationsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]

	def index
		@invitations = Invitation.all
	end

	def new
		@invitation = Invitation.new
	end

	def edit
	end

	def show
    @invitation = Invitation.find(params[:id])
  end

  def create
  	@invitation = Invitation.new(invitation_params)
    @invitation.user_id = current_user.id

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

  def check_user
    if current_user != @listing.user
      redirect_to root_path, alert: "Sorry, you cannot edit this listing."
    end
  end

end
