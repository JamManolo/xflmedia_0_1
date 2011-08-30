# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :user do |user|
  user.name                  "Fred Jones"
  user.email                 Factory.next(:email)
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.confirmed             true
  user.admin                 false
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end

Factory.define :group do |group|
  group.name         "HBFL"
  group.association :user
end

Factory.define :league_format do |league_format|
  league_format.league_type  "redraft"
  league_format.team_count   12
  league_format.comp_type    "combo"
  league_format.divisions    3
  league_format.sched_format "14:3"
  league_format.association  :group
end

Factory.define :lineup_format do |lineup_format|
  lineup_format.name  "xfl"
  lineup_format.qb    1
  lineup_format.rb    2
  lineup_format.wr    2
  lineup_format.te    1
  lineup_format.k     1
  lineup_format.dst   1
  lineup_format.idp   1
  lineup_format.flex  0
  lineup_format.ir    0
  lineup_format.bench 6
  lineup_format.association :group
end

Factory.define :roster do |roster|
  roster.name  "USuck"
  roster.group_id "5"
  roster.association :user
end

Factory.define :scoring_format do |scoring_format|
  scoring_format.name                   "xfl-standard"
  scoring_format.pass_tds_pts             4
  scoring_format.pass_yds_min           100
  scoring_format.pass_yds_min_pts         1
  scoring_format.pass_yds_incr           20
  scoring_format.pass_yds_incr_pts        1
  scoring_format.pass_yds_bonus_min       0
  scoring_format.pass_yds_bonus_min_pts   0
  scoring_format.pass_tds_bonus_min       0
  scoring_format.pass_tds_bonus_min_pts   0
  scoring_format.pass_int_pts            -2
  scoring_format.pass_int_pick_6_pts      0
  scoring_format.rush_tds_pts             6
  scoring_format.rush_yds_min            50
  scoring_format.rush_yds_min_pts         1
  scoring_format.rush_yds_incr           10
  scoring_format.rush_yds_incr_pts        1
  scoring_format.rush_yds_bonus_min       0
  scoring_format.rush_yds_bonus_min_pts   0
  scoring_format.rush_tds_bonus_min       0
  scoring_format.rush_tds_bonus_min_pts   0
  scoring_format.rec_tds_pts              6
  scoring_format.rec_rec_pts              0
  scoring_format.rec_yds_min             50
  scoring_format.rec_yds_min_pts          1
  scoring_format.rec_yds_incr            10
  scoring_format.rec_yds_incr_pts         1
  scoring_format.rec_yds_bonus_min        0
  scoring_format.rec_yds_bonus_min_pts    0
  scoring_format.rec_tds_bonus_min        0
  scoring_format.rec_tds_bonus_min_pts    0
  scoring_format.misc_tds_pts             6
  scoring_format.misc_tds_bonus_min       0
  scoring_format.misc_tds_bonus_min_pts   0
  scoring_format.two_pt_conv_pass_pts     1
  scoring_format.two_pt_conv_rush_pts     2
  scoring_format.two_pt_conv_rec_pts      2
  scoring_format.pat_pts                  1
  scoring_format.pat_missed_pts           0
  scoring_format.fg_0039_pts              3
  scoring_format.fg_4049_pts              4
  scoring_format.fg_5099_pts              5
  scoring_format.fg_missed_pts           -1
  scoring_format.fum_lost_pts            -2
  scoring_format.d_safety_pts             2
  scoring_format.d_shutout_pts           14 
  scoring_format.d_pts_allowed_level_1       6
  scoring_format.d_pts_allowed_level_1_pts  10
  scoring_format.d_pts_allowed_level_2      13 
  scoring_format.d_pts_allowed_level_2_pts   7
  scoring_format.d_pts_allowed_level_3      20 
  scoring_format.d_pts_allowed_level_3_pts   3
  scoring_format.d_pts_allowed_level_7      28
  scoring_format.d_pts_allowed_level_7_pts   0
  scoring_format.d_pts_allowed_level_8      35
  scoring_format.d_pts_allowed_level_8_pts  -3
  scoring_format.d_pts_allowed_level_9      42
  scoring_format.d_pts_allowed_level_9_pts  -7
  scoring_format.d_yds_allowed_level_1      99
  scoring_format.d_yds_allowed_level_1_pts  10
  scoring_format.d_yds_allowed_level_2     199
  scoring_format.d_yds_allowed_level_2_pts   5
  scoring_format.d_yds_allowed_level_3     299
  scoring_format.d_yds_allowed_level_3_pts   0
  scoring_format.d_yds_allowed_level_7     300
  scoring_format.d_yds_allowed_level_7_pts   0
  scoring_format.d_yds_allowed_level_8     400
  scoring_format.d_yds_allowed_level_8_pts  -5
  scoring_format.d_yds_allowed_level_9     500
  scoring_format.d_yds_allowed_level_9_pts -10
  scoring_format.d_fr_pts           2
  scoring_format.d_int_pts          2
  scoring_format.d_sack_pts         1
  scoring_format.d_block_kick_pts   2
  scoring_format.idp_tackle_pts     1
  scoring_format.idp_assist_pts     0
  scoring_format.idp_ff_pts         0
  scoring_format.idp_fr_pts         2
  scoring_format.idp_int_pts        2
  scoring_format.idp_sack_pts       2
  scoring_format.idp_safety_pts     2
  scoring_format.idp_block_kick_pts 2
  scoring_format.association :group
end

