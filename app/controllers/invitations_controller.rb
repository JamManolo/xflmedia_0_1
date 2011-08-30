class InvitationsController < ApplicationController
  
  def create
    @invitation = Invitation.new()
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
  end
  
end
