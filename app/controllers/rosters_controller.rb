class RostersController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :destroy, :index, :edit]
  before_filter :authorized_manager, :only => [:destroy, :edit]
  
  def index
    @title = "All rosters"
    @rosters = Roster.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @roster = Roster.find(params[:id])
    @title = @roster.name
  end
  
  def new
    @group = Group.find(params[:group])
    @title = "Set up your team in league " + @group.name
    @roster = Roster.new(:group_id => @group.id)
  end
  
  def create
    @roster = current_user.rosters.build(params[:roster])
    if @roster.save
      flash[:success] = "Roster created!"
      redirect_to @roster
    else
      @title = "Create a roster (league)"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit roster"
  end
  
  def update
    @roster = Roster.find(params[:id])
    if @roster.update_attributes(params[:roster])
      flash[:success] = "Roster profile updated"
      redirect_to @roster
    else
      @title = "Edit roster"
      render 'edit'
    end
  end

  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy
    redirect_back_or rosters_path
  end
  
  private
  
    def authorized_manager
      @roster = current_user.rosters.find_by_id(params[:id])
      redirect_to root_path if @roster.nil?
    end
    
    def correct_group
      @roster = current_user.rosters.find_by_id(params[:id])
      Group.find(params[:group])
    end
    
end

