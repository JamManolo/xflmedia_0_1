class LineupFormatsController < ApplicationController

  def index
    @title = "All lineup formats"
    @lineup_formats = LineupFormat.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @lineup_format = LineupFormat.find(params[:id])
    @title = @lineup_format.format
  end
  
  def new
    @group = Group.find(params[:group])
    @lineup_format = LineupFormat.new(:group_id => @group.id)
    @title = "Create custom lineup format for " + @group.name
    set_current_group(@group)
  end
  
  def create
    @group = current_group #Group.find(params[:lineup_format][:group_id])
    @lineup_format = @group.lineup_formats.build(params[:lineup_format])
    if @lineup_format.save
      flash[:success] = "Lineup format created!"
      redirect_to @lineup_format
    else
      @title = "Create a new (custom) lineup format"
      render 'new'
    end
  end
  
  def edit
    @lineup_format = LineupFormat.find(params[:id])
    @title = "Edit lineup format"
  end
  
  def update
    @lineup_format = LineupFormat.find(params[:id])
    if @lineup_format.update_attributes(params[:lineup_format])
      flash[:success] = "Lineup format updated"
      redirect_to @lineup_format
    else
      @title = "Edit lineup format"
      render 'edit'
    end
  end
  
  def destroy
    LineupFormat.find(params[:id]).destroy
    redirect_back or lineup_formats_path
  end
  
end

