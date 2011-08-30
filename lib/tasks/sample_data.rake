namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
    make_lineup_formats
    make_groups
    make_memberships
    # make_rosters
    make_hbfl
  end
end

def make_users
  admin = User.create!(:name => "XFL Magistrate",
                       :email => "magistrate@xfl.com",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  admin.toggle!(:confirmed)
  10.times do |n|
    name  = Faker::Name.name
    email = "user-#{n+2}@xfl.com"
    password  = "password"
    u = User.create!(:name => name,
                     :email => email,
                     :password => password,
                     :password_confirmation => password)
    #u.toggle!(:confirmed)
  end
  u = User.create!(:name => "Jim Carr",
                   :email => "jimcar@aracnet.com",
                   :password => "foobar",
                   :password_confirmation => "foobar")
  u.toggle!(:confirmed)
end

def make_microposts
  User.all(:limit => 5).each do |user|
    31.times do
      user.microposts.create!(:content => Faker::Lorem.sentence(5), :group_id => 0)
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..10]
  followers = users[3..8]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

@default_scoring_format = {
    :name                   => "xfl-standard",
    :pass_tds_pts           =>   4,
    :pass_yds_min           => 100, :pass_yds_min_pts       =>   1,
    :pass_yds_incr          =>  20, :pass_yds_incr_pts      =>   1,
    :pass_yds_bonus_min     =>   0, :pass_yds_bonus_min_pts =>   0,
    :pass_tds_bonus_min     =>   0, :pass_tds_bonus_min_pts =>   0,
    :pass_int_pts           =>  -2, :pass_int_pick_6_pts    =>   0,
    :rush_tds_pts           =>   6,
    :rush_yds_min           =>  50, :rush_yds_min_pts       =>   1,
    :rush_yds_incr          =>  10, :rush_yds_incr_pts      =>   1,
    :rush_yds_bonus_min     =>   0, :rush_yds_bonus_min_pts =>   0,
    :rush_tds_bonus_min     =>   0, :rush_tds_bonus_min_pts =>   0,
    :rec_tds_pts            =>   6,
    :rec_rec_pts            =>   0, :rec_yds_min            =>  50,
    :rec_yds_min_pts        =>   1, :rec_yds_incr           =>  10,
    :rec_yds_incr_pts       =>   1, :rec_yds_bonus_min      =>   0,
    :rec_yds_bonus_min_pts  =>   0, :rec_tds_bonus_min      =>   0,
    :rec_tds_bonus_min_pts  =>   0, :misc_tds_pts           =>   6,
    :misc_tds_bonus_min     =>   0, :misc_tds_bonus_min_pts =>   0,
    :two_pt_conv_pass_pts   =>   1,
    :two_pt_conv_rush_pts   =>   2, :two_pt_conv_rec_pts    =>   2,
    :pat_pts                =>   1, :pat_missed_pts         =>   0,
    :fg_0039_pts            =>   3, :fg_4049_pts            =>   4,
    :fg_5099_pts            =>   5, :fg_missed_pts          =>  -1,
    :fum_lost_pts           =>  -2, :d_safety_pts           =>   2,
    :d_shutout_pts          =>  14,
    :d_pts_allowed_level_1  =>   6, :d_pts_allowed_level_1_pts =>  10,
    :d_pts_allowed_level_2  =>  13, :d_pts_allowed_level_2_pts =>   7,
    :d_pts_allowed_level_3  =>  20, :d_pts_allowed_level_3_pts =>   3,
    :d_pts_allowed_level_7  =>  28, :d_pts_allowed_level_7_pts =>   0,
    :d_pts_allowed_level_8  =>  35, :d_pts_allowed_level_8_pts =>  -3,
    :d_pts_allowed_level_9  =>  42, :d_pts_allowed_level_9_pts =>  -7,
    :d_yds_allowed_level_1  =>  99, :d_yds_allowed_level_1_pts =>  10,
    :d_yds_allowed_level_2  => 199, :d_yds_allowed_level_2_pts =>   5,
    :d_yds_allowed_level_3  => 299, :d_yds_allowed_level_3_pts =>   0,
    :d_yds_allowed_level_7  => 300, :d_yds_allowed_level_7_pts =>   0,
    :d_yds_allowed_level_8  => 400, :d_yds_allowed_level_8_pts =>  -5,
    :d_yds_allowed_level_9  => 500, :d_yds_allowed_level_9_pts => -10,
    :d_fr_pts               => 2, :d_int_pts          => 2,
    :d_sack_pts             => 1, :d_block_kick_pts   => 2,
    :idp_tackle_pts         => 1, :idp_assist_pts     => 0,
    :idp_ff_pts             => 0, :idp_fr_pts         => 2,
    :idp_int_pts            => 2, :idp_sack_pts       => 2,
    :idp_safety_pts         => 2, :idp_block_kick_pts => 2
}

def make_groups
  user = User.first
  name = "XFL Homeless"
  group = user.groups.create!(:name => name)
  
  group.league_formats.create!(:league_type => "redraft",
                      :team_count => 0, :comp_type => "points", :divisions => 1,
                      :sched_format => "17:0")
                     
  group.lineup_formats.create!(:name => "XFL-001", :qb => 1, :rb => 2, :wr => 3, 
                               :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 1,
                               :ir => 0, :bench => 5)
                               
  group.scoring_formats.create!(@default_scoring_format)
  
  i = 0
  User.all(:limit => 4).each do |user|
    i = i + 1
    name = "XFL-00".concat(i.to_s)
    group = user.groups.create!(:name => name)
    
    group.league_formats.create!(:league_type => "redraft",
                                :team_count => 10, :comp_type => "combo", :divisions => 2,
                                :sched_format => "14:2")

    group.lineup_formats.create!(:name => name, :qb => 1, :rb => 2, :wr => 2, 
                                 :te => 1, :k => 1, :dst => 1, :idp => 0, :flex => 0,
                                 :ir => 3, :bench => 6)
                                 
    group.scoring_formats.create!(@default_scoring_format)
  end
  
  user = User.last
  name = "XFL PREMIER"
  group = user.groups.create!(:name => name)
  
  group.league_formats.create!(:league_type => "dynasty",
                      :team_count => 0, :comp_type => "combo", :divisions => 3,
                      :sched_format => "13:3")

  group.lineup_formats.create!(:name => name, :qb => 1, :rb => 2, :wr => 2, 
                               :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 1,
                               :ir => 3, :bench => 5)
                               
  group.scoring_formats.create!(@default_scoring_format)
  
end

def make_memberships
  users  = User.all
  groups = Group.all

  user   = users.first
  group  = groups[1]
  members = users[0..6]
  leagues = groups[2..3]
  members.each { |member| group.add_member!(member) }
  leagues.each { |league| league.add_member!(user) }

  user   = users.last
  group  = groups.last
  members = users[7..12]
  leagues = groups[1..2]
  members.each { |member| group.add_member!(member) }
  leagues.each { |league| league.add_member!(user) }
end

def make_rosters
  gid = 0
  User.all.each do |user|
    gid = gid + 1 if ( gid % 2 ) == true
    name = "Team_".concat(user.id.to_s)
    user.rosters.create!(:name => name, :group_id => gid, :roles => "2431111000")
  end
end

def make_lineup_formats
  LineupFormat.create!(:name => :xfl,  :group_id => 0, :qb => 1, :rb => 2, :wr => 2,
                       :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 0, :ir => 2,
                       :bench => 5)
  LineupFormat.create!(:name => :cbs,  :group_id => 0, :qb => 1, :rb => 2, :wr => 3,
                       :te => 1, :k => 1, :dst => 1, :idp => 0, :flex => 0, :ir => 1,
                       :bench => 6)
  LineupFormat.create!(:name => :espn, :group_id => 0, :qb => 1, :rb => 2, :wr => 2,
                       :te => 1, :k => 1, :dst => 1, :idp => 0, :flex => 1, :ir => 0,
                       :bench => 6)
  LineupFormat.create!(:name => :ten,  :group_id => 0, :qb => 1, :rb => 2, :wr => 2,
                       :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 1, :ir => 3,
                       :bench => 5)
end

def make_hbfl

  user_info = [
         { :name => "Jim MacPherson", 
           :email => "hahn@dsl-only.net",
           :team => "Black Butte Porter" },
         { :name => "Jeff Bratscher",
           :email => "bratch@comcast.net",
           :team => "Da Bears", },
         { :name => "John Triplett",
           :email => "jbtrip@hevanet.com",
           :team => "Corps of Discovery", },
         { :name => "Johnny Carrasquer",
           :email => "jrhinomon@gmail.com",
           :team => "Dirtbags", },
         { :name => "John Lebold",
           :email => "leebs1@comcast.net",
           :team => "GraveDiggers", },
         { :name => "Mike Short",
           :email => "tallshort1@comcast.net",
           :team => "Iron Maidens", },
         { :name => "Peter Hill",
           :email => "peter@himango.com",
           :team => "Just Go Ho", },
         { :name => "Steve Blaha",
           :email => "sbsiding@comcast.net", 
           :team => "Odds'n'Sods", },
         { :name => "Todd Brumble",
           :email => "todzila65@gmail.com",
           :team => "Sex Offender", },
         { :name => "Keith Whigam",
           :email => "cascoot@aol.com",
           :team => "Stratoloungers", },
         { :name => "Lindsey Burdett",
           :email => "lindseyboy62@yahoo.com",
           :team => "Turd Chukkers", },
         { :name => "Jimmy C",
           :email => "j@aracnet.com",
           :team => "USuck", } ]
           
  league_info = {:league_type => "keeper",
                 :team_count => 12,
                 :divisions => 3,
                 :comp_type => "combo",
                 :sched_format => "14:3",
                 }

  user_info.each do |u|
    u = User.create!(:name => u[:name], :email => u[:email],
                     :password => "hbfl11", :password_confirmation => "hbfl11")
    u.toggle!(:confirmed)
  end         

  user = User.find_by_email("peter@himango.com")
  group = user.groups.create!(:name => "HBFL")
  group.league_formats.create!(league_info)
  group.lineup_formats.create!(:name => group.name, :qb => 1, :rb => 2, :wr => 2, 
                               :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 0,
                               :ir => 2, :bench => 8)
                               
  group.scoring_formats.create!(@default_scoring_format)
                                 
  user_info.each do |u|
    user = User.find_by_email(u[:email])
    group.add_member!(user)
    user.rosters.create!(:name => u[:team], :group_id => group.id)
  end
  
  user = User.find_by_email("j@aracnet.com")
  
  group = user.groups.create!(:name => "AUFL")
  league_info.update(league_type:"redraft")
  group.league_formats.create!(league_info)

  group.lineup_formats.create!(:name => group.name, :qb => 1, :rb => 2, :wr => 2, 
                               :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 0,
                               :ir => 2, :bench => 4)
                               
  group.scoring_formats.create!(@default_scoring_format)
                               
  user_info.each do |u|
    user = User.find_by_email(u[:email])
    group.add_member!(user)
    user.rosters.create!(:name => u[:team], :group_id => group.id)
  end
  
               
end


