class MembershipsController < ApplicationController
  before_filter :authenticate
  
  respond_to :html, :js

  def create
    @user = User.find(params[:membership][:member_id])
    @group = Group.find(params[:membership][:league_id])
    @group.add_member!(@user)
    respond_with @user
  end

  def destroy
    @user = Membership.find(params[:id]).member
    @group = Membership.find(params[:id]).league
    @group.remove_member!(@user)
    #unless @group.rosters.nil? or @group.rosters.empty?
    #  homeless = Group.find_by_name("XFL Homeless")
    #  homeless.add_member!(@user) unless homeless.is_member?(@user) or @group == homeless
    #  @roster = @group.rosters.find_by_user_id(@user)
    #  @roster.update_attributes(:group_id => homeless.id)
    #  @roster.save!
    #end
    respond_with @group
  end
  
end

