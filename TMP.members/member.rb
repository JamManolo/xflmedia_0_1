# ========= Member =============
#  Maps groups to users
class Member < ActiveRecord::Base
  attr_accessible :user_id
  
  belongs_to :group
  belongs_to :user
  
  validates :group_id, :presence => true
  validates :user_id,  :presence => true
end
