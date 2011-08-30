class GroupsController < ApplicationController

  before_filter :authenticate, :only => [:new, :create, :destroy, :index, :edit]
  before_filter :authorized_manager, :only => [:destroy, :edit]
  
  def index
    @title = "All groups"
    @groups = Group.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @group = Group.find(params[:id])
    @title = @group.name
    @lineup_format = @group.lineup_formats.first
    @micropost = Micropost.new(:group_id => @group.id) if @group.is_member?(current_user.id)
    @feed_items = @group.feed.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @title = "Create a league"
    @group = Group.new
    @league_format = LeagueFormat.new(:group_id => @group.id)
    @lineup_format = LineupFormat.new(:group_id => @group.id)
    @scoring_format = ScoringFormat.new(:group_id => @group.id)
  end
  
  def create
    @group = current_user.groups.build(params[:group])
    @league_format = @group.league_formats.build(params[:league_format])
    @lineup_format = @group.lineup_formats.build(params[:lineup_format])
    @scoring_format = @group.scoring_formats.build(params[:scoring_format])
    if @league_format.save and @scoring_format.save and @lineup_format.save and @group.save
      flash[:success] = "Group created!"
      redirect_to @group
    else
      @league_format.destroy unless @league_format.nil?
      @lineup_format.destroy unless @lineup_format.nil?
      @scoring_format.destroy unless @scoring_format.nil?
      @title = "Create a league"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit league settings for " + @group.name
    @league_format = @group.league_formats.first
    @lineup_format = @group.lineup_formats.first
    @scoring_format = @group.scoring_formats.first
  end
  
  def update
    @group = Group.find(params[:id])
    @league_format = @group.league_formats.first
    @lineup_format = @group.lineup_formats.first
    @scoring_format = @group.scoring_formats.first
    if @scoring_format.update_attributes(params[:scoring_format]) and
       @lineup_format.update_attributes(params[:lineup_format]) and
       @league_format.update_attributes(params[:league_format]) and
       @group.update_attributes(params[:group])
      flash[:success] = "Group profile updated"
      redirect_to @group
    else
      @title = "Edit group"
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_back_or groups_path
  end
  
  def members
    @title = "Members"
    @group = Group.find(params[:id])
    render 'show_members'
  end
  
  def edit_membership
    @title = "Edit membership"
    @group = Group.find(params[:id])
    @users = User.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new_invitation
    @group = Group.find(params[:id])
    @title = "Invite members to " + @group.name
    @invitation = Invitation.new(:group_id => @group.id)
  end
  
  def send_invitation
    @jmcsent = []
    @jmcfail = []
    @group = Group.find(params[:invitation][:group_id])
    @emails = get_emails(params[:invitation][:email_list])
    @emails.each do |email|
      email.strip!
      params[:invitation][:email] = email
      @invitation = @group.invitations.build(params[:invitation])
      if @invitation.save
        @user = User.find_by_email(@invitation.email)
        GroupMailer.league_invitation(@group,@invitation,@user).deliver
        @jmcsent.push("'" + @invitation.email + "'")
        @group.add_member!(@user) unless @user.nil?
      else
        @jmcfail.push("'" + @invitation.email + "'")
      end
    end
    @title = "Invite members to " + @group.name
    jmcmsg = @jmcsent.empty? ? '' : "Invitation sent to " + stringify(@jmcsent)
    unless @jmcfail.empty?
      flash[:failure] = jmcmsg + " with failed attempts to " + stringify(@jmcfail)
    else
      flash[:success] = jmcmsg
    end
    @title = "Invite members to " + @group.name
    @invitation.email_list.clear
    render 'new_invitation'
  end
  
  def accept_invitation
    @group = Group.find(params[:membership][:league_id])
    @membership = @group.memberships.build(params[:membership])
    if @membership.save or Membership.where(:member_id => params[:membership][:member_id],
                                            :league_id => params[:membership][:league_id])
      @invitation = @group.invitations.where(:email => current_user.email)
      @invitation.first.update_attributes(:is_open => false)
      @roster = Roster.new(:group_id => @group_id)
      redirect_to @group
    end
  end
  
  private
  
    def handle_lineup_format
      @group = current_user.groups.find_by_id(params[:id])      
      
    end
  
    def authorized_manager
      @group = current_user.groups.find_by_id(params[:id])
      redirect_to root_path if @group.nil?
    end
    
end

