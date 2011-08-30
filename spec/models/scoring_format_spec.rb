require 'spec_helper'

describe ScoringFormat do
  
  before(:each) do
    @attr = { :name                   => "aufl-standard",
              :pass_tds_pts           =>   4,
              :pass_yds_min           => 100,
              :pass_yds_min_pts       =>   1,
              :pass_yds_incr          =>  20,
              :pass_yds_incr_pts      =>   1,
              :pass_yds_bonus_min     =>   0,
              :pass_yds_bonus_min_pts =>   0,
              :pass_tds_bonus_min     =>   0,
              :pass_tds_bonus_min_pts =>   0,
              :pass_int_pts           =>  -2,
              :pass_int_pick_6_pts    =>   0,
              :rush_tds_pts           =>   6,
              :rush_yds_min           =>  50,
              :rush_yds_min_pts       =>   1,
              :rush_yds_incr          =>  10,
              :rush_yds_incr_pts      =>   1,
              :rush_yds_bonus_min     =>   0,
              :rush_yds_bonus_min_pts =>   0,
              :rush_tds_bonus_min     =>   0,
              :rush_tds_bonus_min_pts =>   0,
              :rec_tds_pts            =>   6,
              :rec_rec_pts            =>   0,
              :rec_yds_min            =>  50,
              :rec_yds_min_pts        =>   1,
              :rec_yds_incr           =>  10,
              :rec_yds_incr_pts       =>   1,
              :rec_yds_bonus_min      =>   0,
              :rec_yds_bonus_min_pts  =>   0,
              :rec_tds_bonus_min      =>   0,
              :rec_tds_bonus_min_pts  =>   0,
              :misc_tds_pts           =>   6,
              :misc_tds_bonus_min     =>   0,
              :misc_tds_bonus_min_pts =>   0,
              :two_pt_conv_pass_pts   =>   1,
              :two_pt_conv_rush_pts   =>   2,
              :two_pt_conv_rec_pts    =>   2,
              :pat_pts                =>   1,
              :pat_missed_pts         =>   0,
              :fg_0039_pts            =>   3,
              :fg_4049_pts            =>   4,
              :fg_5099_pts            =>   5,
              :fg_missed_pts          =>  -1,
              :fum_lost_pts           =>  -2,
              :d_safety_pts           =>   2,
              :d_shutout_pts          =>  14, 
              :d_pts_allowed_level_1     =>   6,
              :d_pts_allowed_level_1_pts =>  10,
              :d_pts_allowed_level_2     =>  13, 
              :d_pts_allowed_level_2_pts =>   7,
              :d_pts_allowed_level_3     =>  20, 
              :d_pts_allowed_level_3_pts =>   3,
              :d_pts_allowed_level_7     =>  28,
              :d_pts_allowed_level_7_pts =>   0,
              :d_pts_allowed_level_8     =>  35,
              :d_pts_allowed_level_8_pts =>  -3,
              :d_pts_allowed_level_9     =>  42,
              :d_pts_allowed_level_9_pts =>  -7,
              :d_yds_allowed_level_1     =>  99,
              :d_yds_allowed_level_1_pts =>  10,
              :d_yds_allowed_level_2     => 199,
              :d_yds_allowed_level_2_pts =>   5,
              :d_yds_allowed_level_3     => 299,
              :d_yds_allowed_level_3_pts =>   0,
              :d_yds_allowed_level_7     => 300,
              :d_yds_allowed_level_7_pts =>   0,
              :d_yds_allowed_level_8     => 400,
              :d_yds_allowed_level_8_pts =>  -5,
              :d_yds_allowed_level_9     => 500,
              :d_yds_allowed_level_9_pts => -10,
              :d_fr_pts           => 2,
              :d_int_pts          => 2,
              :d_sack_pts         => 1,
              :d_block_kick_pts   => 2,
              :idp_tackle_pts     => 1,
              :idp_assist_pts     => 0,
              :idp_ff_pts         => 0,
              :idp_fr_pts         => 2,
              :idp_int_pts        => 2,
              :idp_sack_pts       => 2,
              :idp_safety_pts     => 2,
              :idp_block_kick_pts => 2,
    }
    @group = Factory(:group)
    @test_scoring = { :name => @attr[:name] }  
  end
  
  it "should create a new instance given valid attributes" do
    @group.scoring_formats.create!(@attr)
  end
  
  describe "associations" do

    before(:each) do
     @scoring_format = @group.scoring_formats.create!(@attr)
    end
    
    it "should have a name attribute" do
      @scoring_format.should respond_to(:name)
    end

    it "should have the right name" do
      @scoring_format.name.should == @test_scoring[:name]
    end

    it "should have a pass_yds_min attribute" do
      @scoring_format.should respond_to(:pass_yds_min)
    end

  end
end
