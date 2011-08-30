class LeagueFormatsController < ApplicationController

  def index
    @title = "All league formats"
    @league_formats = LeagueFormat.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @league_format = LeagueFormat.find(params[:id])
    @title = @league_format.id
  end
  
  def new
    @group = Group.find(params[:group])
    @league_format = LeagueFormat.new(:group_id => @group.id)
    @title = "Create custom league format for " + @group.name
    set_current_group(@group)
  end
  
  def create
    @group = current_group #Group.find(params[:league_format][:group_id])
    @league_format = @group.league_formats.build(params[:league_format])
    if @league_format.save
      flash[:success] = "League format created!"
      redirect_to @league_format
    else
      @title = "Create a new (custom) league format"
      render 'new'
    end
  end
  
  def edit
    @league_format = LeagueFormat.find(params[:id])
    @title = "Edit league format"
  end
  
  def update
    @league_format = LeagueFormat.find(params[:id])
    if @league_format.update_attributes(params[:league_format])
      flash[:success] = "League format updated"
      redirect_to @league_format
    else
      @title = "Edit league format"
      render 'edit'
    end
  end
  
  def destroy
    LeagueFormat.find(params[:id]).destroy
    redirect_back or league_formats_path
  end
  
end

