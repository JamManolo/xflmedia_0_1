class GroupMailer < ActionMailer::Base
  default :from => "info@xflmedia.com"
  
  def league_invitation(group,invitation,user)
    @group = group
    @invitation = invitation
    @user = user
    mail(:to => invitation.email, :subject => "League Invitation")
  end
  
end
