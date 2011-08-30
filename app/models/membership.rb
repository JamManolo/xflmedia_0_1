# ========= Membership ====================
#  Maps groups (leagues) to members (users)
class Membership < ActiveRecord::Base
  attr_accessible :member_id, :league_id
  
  belongs_to :member, :class_name => "User"
  belongs_to :league, :class_name => "Group"
  
  validates :league_id, :presence => true
  validates :member_id, :presence => true,
                        :uniqueness => { :scope => [:league_id],
                                         :message => ": user has membership" }
end
