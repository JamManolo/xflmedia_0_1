class MembersController < ApplicationController
  before_filter :authenticate
  
  respond_to :html, :js

  def create
    @user = User.find(params[:member][:user_id])
    @group = Group.find(params[:id])
    @group.add_member!(@user)
    respond_with @user
  end

  def destroy
    @user = Member.find(params[:id]).user
    @group = Group.find(params[:id])
    @group.remove_member!(@user)
    respond_with @group
  end
end

