class UsersController < ApplicationController

  before_filter :authenticate,        :except => [:show, :new, :create, :confirm]
  before_filter :correct_user,          :only => [:edit, :update]
  before_filter :admin_user, :not_self, :only => [:destroy]
  before_filter :not_signed_in,         :only => [:new, :create]
    
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 15)
    @user = @users.first
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 5)
    @groups = @user.groups.paginate(:page => params[:page])
    @rosters = @user.rosters.paginate(:page => params[:page])
    @leagues = @user.leagues.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def new
    email_prefill = params[:email].nil? ? {} : { :email => params[:email] }
    @user = User.new(email_prefill)
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Thanks for signing up. " +
                        "Confirmation email has been sent to " + @user.email
      redirect_to root_path
    else
      @user.password.clear
      @user.password_confirmation.clear
      @title = "Sign up 2"
      render 'new'
    end
  end
  
  def confirm
    @user = User.find(params[:id])
    if @user.confirmed?
      flash[:error] = "Welcome to XFL Media World!"
      redirect_to signin_path(:email => @user.email)
    elsif params[:code] == @user.confirmation_code and
         @user.update_attribute(:confirmed, true) and
         @user.update_attribute(:confirmation_code, "superfluous")
      flash[:success] = "Confirmation successful! Welcome to XFL Media World!"
      redirect_to signin_path(:email => @user.email)
    else
      @title = "Sign up 3"
      render 'new'      
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def following
    show_follow(:following)
  end
  
  def followers
    show_follow(:followers)
  end
  
  def show_follow(action)
    @title = action.to_s.capitalize
    @user = User.find(params[:id])
    @users = @user.send(action).paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def leagues
    # Display the groups the user belongs to
    @user = User.find(params[:id])
    @title = "#{@user.name} group memberships"
    @leagues = @user.send(:leagues).paginate(:page => params[:page])
    render 'show_leagues'
  end

  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def not_self
      @user = User.find(params[:id])
      redirect_to(root_path) unless !current_user?(@user)
    end
    
    def not_signed_in
      redirect_to(root_path) unless !signed_in?
    end

end
