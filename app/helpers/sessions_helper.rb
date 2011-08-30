module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user= user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end
    
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
    clear_current_group
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def set_current_group(group)
    clear_current_group
    cookies.permanent.signed[:remember_group_token] = [group.id, group.name]
    self.current_group= group
  end
  
  def current_group=(group)
    @current_group = group
  end

  def current_group
    @current_group ||= group_from_remember_group_token
  end
  
  def clear_current_group
    cookies.delete(:remember_group_token) unless current_group.nil?
    self.current_group = nil
  end

  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil,nil]     
    end
    
    def group_from_remember_group_token
      Group.authenticate_membership(*remember_group_token)
    end
    
    def remember_group_token
      cookies.signed[:remember_group_token] || [nil,nil]     
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
  
end
