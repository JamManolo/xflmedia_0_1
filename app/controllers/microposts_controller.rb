class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :index]
  before_filter :authorized_user, :only => :destroy
  # before_filter :authorized_group_member, :only => :create
  
  def index
    @microposts = Micropost.paginate(:page => params[:page], :per_page => 20)
    @title = "All microposts"
  end
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @micropost.group_id == 0 ? root_path : group_path(@micropost.group)
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  private
  
    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end

end

