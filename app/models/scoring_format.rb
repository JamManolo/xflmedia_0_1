class ScoringFormat < ActiveRecord::Base
  attr_accessible :name,
                  :pass_tds_pts,
                  :pass_yds_min, :pass_yds_min_pts,
                  :pass_yds_incr, :pass_yds_incr_pts,
                  :pass_yds_bonus_min, :pass_yds_bonus_min_pts,
                  :pass_tds_bonus_min, :pass_tds_bonus_min_pts,
                  :pass_int_pts, :pass_int_pick_6_pts,
                  :rush_tds_pts,
                  :rush_yds_min, :rush_yds_min_pts,
                  :rush_yds_incr, :rush_yds_incr_pts,
                  :rush_yds_bonus_min, :rush_yds_bonus_min_pts,
                  :rush_tds_bonus_min, :rush_tds_bonus_min_pts,
                  :rec_tds_pts, :rec_rec_pts,
                  :rec_yds_min, :rec_yds_min_pts,
                  :rec_yds_incr, :rec_yds_incr_pts,
                  :rec_yds_bonus_min, :rec_yds_bonus_min_pts,
                  :rec_tds_bonus_min, :rec_tds_bonus_min_pts,
                  :misc_tds_pts,
                  :misc_tds_bonus_min, :misc_tds_bonus_min_pts,
                  :two_pt_conv_pass_pts, :two_pt_conv_rush_pts, :two_pt_conv_rec_pts,
                  :pat_pts, :pat_missed_pts,
                  :fg_0039_pts, :fg_4049_pts, :fg_5099_pts, :fg_missed_pts,
                  :fum_lost_pts,
                  :d_safety_pts,
                  :d_shutout_pts, # equiv :d_pts_allowed_level_0_pts
                  :d_pts_allowed_level_1, :d_pts_allowed_level_1_pts,
                  :d_pts_allowed_level_2, :d_pts_allowed_level_2_pts,
                  :d_pts_allowed_level_3, :d_pts_allowed_level_3_pts,
                  :d_pts_allowed_level_7, :d_pts_allowed_level_7_pts,
                  :d_pts_allowed_level_8, :d_pts_allowed_level_8_pts,
                  :d_pts_allowed_level_9, :d_pts_allowed_level_9_pts,
                  :d_yds_allowed_level_1, :d_yds_allowed_level_1_pts,
                  :d_yds_allowed_level_2, :d_yds_allowed_level_2_pts,
                  :d_yds_allowed_level_3, :d_yds_allowed_level_3_pts,
                  :d_yds_allowed_level_7, :d_yds_allowed_level_7_pts,
                  :d_yds_allowed_level_8, :d_yds_allowed_level_8_pts,
                  :d_yds_allowed_level_9, :d_yds_allowed_level_9_pts,
                  :d_fr_pts, :d_int_pts, :d_sack_pts, :d_block_kick_pts,
                  :idp_tackle_pts, :idp_assist_pts, :idp_ff_pts, :idp_fr_pts,
                  :idp_int_pts, :idp_sack_pts, :idp_safety_pts, :idp_block_kick_pts

  belongs_to :group
  
  validates :name, :length => { :maximum => 30 }

  validates :pass_tds_pts,           :presence => true, :inclusion => { :in => (0..6) }
  validates :pass_yds_min,           :presence => true, :inclusion => { :in => (0..100) }
  validates :pass_yds_min_pts,       :presence => true, :inclusion => { :in => (0..5) }
  validates :pass_yds_incr,          :presence => true, :inclusion => { :in => (20..100) }
  validates :pass_yds_incr_pts,      :presence => true, :inclusion => { :in => (0..1) }
  validates :pass_yds_bonus_min,     :presence => true, :inclusion => { :in => [0,300,350,400] }
  validates :pass_yds_bonus_min_pts, :presence => true, :inclusion => { :in => (0..10) }
  validates :pass_tds_bonus_min,     :presence => true, :inclusion => { :in => [0,40,50,60] }
  validates :pass_tds_bonus_min_pts, :presence => true, :inclusion => { :in => (0..6) }
  validates :pass_int_pts,           :presence => true, :inclusion => { :in => (-3..0) }
  validates :pass_int_pick_6_pts,    :presence => true, :inclusion => { :in => (-6..0) }

  validates :rush_tds_pts,           :presence => true, :inclusion => { :in => (0..6) }
  validates :rush_yds_min,           :presence => true, :inclusion => { :in => (0..100) }
  validates :rush_yds_min_pts,       :presence => true, :inclusion => { :in => (0..5) }
  validates :rush_yds_incr,          :presence => true, :inclusion => { :in => (10..100) }
  validates :rush_yds_incr_pts,      :presence => true, :inclusion => { :in => (0..1) }
  validates :rush_yds_bonus_min,     :presence => true, :inclusion => { :in => [0,150,175,200] }
  validates :rush_yds_bonus_min_pts, :presence => true, :inclusion => { :in => (0..10) }
  validates :rush_tds_bonus_min,     :presence => true, :inclusion => { :in => [0,40,50,60] }
  validates :rush_tds_bonus_min_pts, :presence => true, :inclusion => { :in => (0..6) }
  
  validates :rec_tds_pts,            :presence => true, :inclusion => { :in => (0..6) }
  validates :rec_rec_pts,            :presence => true, :inclusion => { :in => (0..2) }
  validates :rec_yds_min,            :presence => true, :inclusion => { :in => (0..100) }
  validates :rec_yds_min_pts,        :presence => true, :inclusion => { :in => (0..5) }
  validates :rec_yds_incr,           :presence => true, :inclusion => { :in => (10..100) }
  validates :rec_yds_incr_pts,       :presence => true, :inclusion => { :in => (0..1) }
  validates :rec_yds_bonus_min,      :presence => true, :inclusion => { :in => [0,150,175,200] }
  validates :rec_yds_bonus_min_pts,  :presence => true, :inclusion => { :in => (0..10) }
  validates :rec_tds_bonus_min,      :presence => true, :inclusion => { :in => [0,40,50,60] }
  validates :rec_tds_bonus_min_pts,  :presence => true, :inclusion => { :in => (0..6) }
  
  validates :misc_tds_pts,           :presence => true, :inclusion => { :in => (0..6) }
  validates :misc_tds_bonus_min,     :presence => true,
                                     :inclusion => { :in => [0,40,50,60,70,80,90,100] }
  validates :misc_tds_bonus_min_pts, :presence => true, :inclusion => { :in => (0..6) }
  
  validates :two_pt_conv_pass_pts, :presence => true, :inclusion => { :in => (0..2) }
  validates :two_pt_conv_rush_pts, :presence => true, :inclusion => { :in => (0..2) }
  validates :two_pt_conv_rec_pts,  :presence => true, :inclusion => { :in => (0..2) }
  
  validates :pat_pts,        :presence => true, :inclusion => { :in => [0,1] }
  validates :pat_missed_pts, :presence => true, :inclusion => { :in => [0,-1] }
  validates :fg_0039_pts,    :presence => true, :inclusion => { :in => [0,3] }
  validates :fg_4049_pts,    :presence => true, :inclusion => { :in => [0,3,4,5] }
  validates :fg_5099_pts,    :presence => true, :inclusion => { :in => [0,3,4,5,6] }
  validates :fg_missed_pts,  :presence => true, :inclusion => { :in => [0,-1,-2,-3,-4,-5,-6] }
  validates :fum_lost_pts,   :presence => true, :inclusion => { :in => [0,-1,-2] }

  validates :d_safety_pts,          :presence => true, :inclusion => { :in => [0,2] }
  validates :d_shutout_pts,         :presence => true, :inclusion => { :in => (0..20) }

  validates :d_pts_allowed_level_1,     :presence => true,
                                        :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_1_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_2,     :presence => true,
                                        :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_2_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_3,     :presence => true,
                                        :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_3_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_pts_allowed_level_7,     :presence => true,
                                        :inclusion => { :in => (28..99) }
  validates :d_pts_allowed_level_7_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }
  validates :d_pts_allowed_level_8,     :presence => true,
                                        :inclusion => { :in => (28..99) }
  validates :d_pts_allowed_level_8_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }
  validates :d_pts_allowed_level_9,     :presence => true,
                                        :inclusion => { :in => (28..99) }
  validates :d_pts_allowed_level_9_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }

  validates :d_yds_allowed_level_1,     :presence => true,
                                        :inclusion => { :in => [0,99,149,199,249,299] }
  validates :d_yds_allowed_level_1_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_yds_allowed_level_2,     :presence => true,
                                        :inclusion => { :in => [0,99,149,199,249,299] }
  validates :d_yds_allowed_level_2_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_yds_allowed_level_3,     :presence => true,
                                        :inclusion => { :in => [0,99,149,199,249,299] }
  validates :d_yds_allowed_level_3_pts, :presence => true, :inclusion => { :in => (0..20) }
  validates :d_yds_allowed_level_7,     :presence => true,
                                        :inclusion => { :in => [300,350,400,450,500] }
  validates :d_yds_allowed_level_7_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }
  validates :d_yds_allowed_level_8,     :presence => true,
                                        :inclusion => { :in => [300,350,400,450,500] }
  validates :d_yds_allowed_level_8_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }
  validates :d_yds_allowed_level_9,     :presence => true,
                                        :inclusion => { :in => [300,350,400,450,500] }
  validates :d_yds_allowed_level_9_pts, :presence => true,
                                        :inclusion => { :in => (-20..0) }
                                        
  validates :d_fr_pts,              :presence => true, :inclusion => { :in => (0..2) }
  validates :d_int_pts,             :presence => true, :inclusion => { :in => (0..2) }
  validates :d_sack_pts,            :presence => true, :inclusion => { :in => (0..2) }
  validates :d_block_kick_pts,      :presence => true, :inclusion => { :in => (0..2) }
  
  validates :idp_safety_pts,        :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_tackle_pts,        :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_assist_pts,        :presence => true, :inclusion => { :in => [0,1] }
  validates :idp_ff_pts,            :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_fr_pts,            :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_int_pts,           :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_sack_pts,          :presence => true, :inclusion => { :in => (0..2) }
  validates :idp_block_kick_pts,    :presence => true, :inclusion => { :in => (0..2) }

end
