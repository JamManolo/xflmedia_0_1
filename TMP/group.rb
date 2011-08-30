# ======== Group (League) ==============
class Group < ActiveRecord::Base
  attr_accessible :name, :affiliation
  
  #has_one :manager
  belongs_to :user
  
  has_many :members
  has_many :users, :through => :members, :source => :user
  
  validates :name, :presence => true,
                   :length   => { :maximum => 40 }

  validates :affiliation, :presence  => true,
                          :inclusion => { :in => [ "nfl", "nba" ] }
                          
  validates :user_id, :presence => true
end

