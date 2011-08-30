class SessionsController < ApplicationController

  def new
    @title = "Sign in"
    @email_prefill = params[:email].nil? ? '' : params[:email]
    #Session.new(email_prefill)
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in" 
      render 'new'
    elsif !user.confirmed?
      flash.now[:error] = "This account is awaiting confirmation. " +
                          "Please check confirmation email for instructions."
      @title = "Sign in"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page
      sign_in user
      redirect_back_or user
    end  
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end

