# ========= Roster (Team) ===============
class Roster < ActiveRecord::Base
  attr_accessible :name, :group_id
  
  belongs_to :user
  belongs_to :group
  
  # has_many :players
  # has_many :transactions
  
  validates :name,  :presence => true,
                    :length => { :maximum => 40 },
                    :uniqueness => { :scope => [:group_id] }

  validates :group_id, :presence => true, 
                       :numericality => { :greater_than => 0 }
                                          
  validates :user_id, :presence => true, 
                      :numericality => { :greater_than => 0 }

  def manager(roster)
    roster.user
  end
  
  def owner(roster)
    roster.user
  end
  
end

