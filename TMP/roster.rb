# ========= Roster (Team) ===============
class Roster < ActiveRecord::Base
  attr_accessible :name, :roles, :group_id
  
  has_one  :owner
  # has_many :players
  # has_many :transactions
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 40 }

  validates :roles, :presence => true,
                    :length   => { :is => 10 }
                    
  validates :group_id, :presence => true, 
                       :numericality => { :greater_than => 0 }
end

