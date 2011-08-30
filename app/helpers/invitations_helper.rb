module InvitationsHelper

  def open_invitations(user)
    Invitation.where(:email => user.email, :is_open => true)
  end
  
  def get_emails(email_list)
    email_list.split(',')
  end
  
  def stringify(emails)
    email_list = ''
    emails.each do |email|
      email_list += email
      email_list += ', ' unless email == emails.last
    end
    email_list
  end

end
