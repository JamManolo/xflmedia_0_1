class ScoringFormatsController < ApplicationController

  def index
    @title = "All scoring formats"
    @scoring_formats = ScoringFormat.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @scoring_format = ScoringFormat.find(params[:id])
    @title = @scoring_format.name
  end
  
  def new
    @group = Group.find(params[:group])
    @scoring_format = ScoringFormat.new(:group_id => @group.id)
    @title = "Customize scoring format for " + @group.name
    set_current_group(@group)
  end
  
  def create
    @group = current_group #Group.find(params[:scoring_format][:group_id])
    @scoring_format = @group.scoring_formats.build(params[:scoring_format])
    if @scoring_format.save
      flash[:success] = "Scoring format created!"
      redirect_to @scoring_format
    else
      @title = "Create a new (custom) scoring format"
      render 'new'
    end
  end
  
  def edit
    @scoring_format = ScoringFormat.find(params[:id])
    @title = "Edit scoring format"
  end
  
  def update
    @scoring_format = ScoringFormat.find(params[:id])
    if @scoring_format.update_attributes(params[:scoring_format])
      flash[:success] = "Scoring format updated"
      redirect_to @scoring_format
    else
      @title = "Edit scoring format"
      render 'edit'
    end
  end
  
  def destroy
    ScoringFormat.find(params[:id]).destroy
    redirect_back or scoring_formats_path
  end
  
end

