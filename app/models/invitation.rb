class Invitation < ActiveRecord::Base
  attr_accessor :email_list, :message
  attr_accessible :email, :is_open, :email_list, :message
  
  belongs_to :group
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false, :scope => [:group_id],
                         :message => ": An invitation has already been sent to this address" }
end
