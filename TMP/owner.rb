# ========= Owner (Team owner) =============
#  Maps users to rosters (teams)
class Owner < ActiveRecord::Base
  attr_accessible :roster_id

  belongs_to :roster
  
  validates :user_id,   :presence => true
  validates :roster_id, :presence => true, :uniqueness => true
end


