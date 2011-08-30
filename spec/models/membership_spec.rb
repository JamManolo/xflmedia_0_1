require 'spec_helper'

describe Membership do
  before(:each) do
    @user  = Factory(:user, :email => Factory.next(:email))
    @group = @user.groups.create!(:name => "Home Boyz Football League",
                                  :affiliation => "nfl",
                                  :league_type => "redraft",
                                  :size => 12,
                                  :comp_type => "combo",
                                  :divcount => 3,
                                  :sched_format => "14:3",
                                  :lineup_format_name => "xfl",)
    @membership = @group.memberships.build(:member_id => @user.id)
  end
  
  it "should create a new instance given valid attributes" do
    @membership.save!
  end
  
  describe "add/remove methods" do

    before(:each) do
      @membership.save
    end

    it "should have a league attribute" do
      @membership.should respond_to(:league)
    end

    it "should have the right league" do
      @membership.league.should == @group
    end
    
    it "should have a member attribute" do
      @membership.should respond_to(:member)
    end
    
    it "should have the right member/user" do
      @membership.member.should == @user
    end

 end
  
  describe "validations" do

    it "should require a league_id" do
      @membership.league_id = nil
      @membership.should_not be_valid
    end

    it "should require a member_id" do
      @membership.member_id = nil
      @membership.should_not be_valid
    end
  end
end
