module GroupsHelper

  def open_rosters(user)
    groups = []
    Group.all.each do |group|
     if group.is_member?(user) and !group.member_has_roster?(user)
        groups.push(group)
      end
    end
    groups
  end
  
end
