# ========= Manager (League commissioner) =============
#  Maps users to groups (leagues)
class Manager < ActiveRecord::Base
  attr_accessible :group_id, :user_id
 
  belongs_to :user 
  belongs_to :group

  validates :user_id,  :presence => true
  validates :group_id, :presence => true, :uniqueness => true
end
