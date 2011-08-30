# ======== Group (League) ==============
class Group < ActiveRecord::Base
  
  attr_accessible :name
  
  belongs_to :user

  has_many :microposts
  has_many :rosters
  has_many :league_formats
  has_many :lineup_formats
  has_many :scoring_formats
  has_many :invitations
  
  has_many :memberships, :foreign_key => "league_id", 
                         :dependent => :destroy
                         
  has_many :members, :through => :memberships, :source => :member

  validates :name, :presence => true,
                   :length   => { :maximum => 40 }

  validates :user_id, :presence => true
  
  before_save :default_affliation

  def feed
    Micropost.from_group(self)
  end

  def self.authenticate_membership(id, name)
    group = find_by_id(id)
    (group && group.name == name) ? group : nil
  end
  
  def manager(group)
    group.user
  end

  def commissioner(group)
    group.user
  end
  
  def member_has_roster?(member)
    rosters.where(:user_id => member.id, :group_id => self.id).first
  end
  
  def is_member?(member)
    memberships.find_by_member_id(member)
  end
  
  def add_member!(user)
    memberships.create!(:member_id => user.id)
  end
  
  def remove_member!(user)
    memberships.find_by_member_id(user).destroy
  end
  
  private
  
    def default_affliation
      self.affiliation = "nfl"
    end
  
end

