require 'spec_helper'

describe Group do

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :name        => "Home Boyz Football League",
      :affiliation => "nfl",
      :league_type => "redraft",
      :size => 12,
      :comp_type => "combo",
      :divcount => 3,
      :sched_format => "14:3",
      :lineup_format_name => "xfl",
    }
    
    @lineup_format_attr = {
      :name => "group_spec_test", :qb => 1, :rb => 2, :wr => 2,
      :te => 1, :k => 1, :dst => 1, :idp => 1, :flex => 1
    }
    
  end
  
  it "should create a new instance given valid attributes" do
    @user.groups.create!(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      # @lineup_format = Factory(:lineup_format)
      @group = @user.groups.create(@attr)
    end
    
    it "should have a user method" do
      @group.should respond_to(:user)
    end
    
    it "should have a name attribute" do
      @group.should respond_to(:name)
    end
 
    it "should have an affiliation attribute" do
      @group.should respond_to(:affiliation)
    end
    
    it "should have the right value for type" do
      @group[:affiliation].should == @attr[:affiliation]
    end
    
    it "should have the right associated user" do
      @group.user.id.should == @user.id
    end
    
    it "should have a lineup_formats method" do
      @group.should respond_to(:lineup_formats)
    end
    
    it "should have the right lineup format name" do
      @lineup_format = @group.lineup_formats.create(@lineup_format_attr)
      @group.lineup_formats.first.should == @lineup_format
    end
    
    it "should have the right associated lineup format" do
      @lineup_format = @group.lineup_formats.create(@lineup_format_attr)
      @group.lineup_formats.first.id.should == @lineup_format.id
    end

  end
  
  describe "validations" do
  
    it "should require an affiliation" do
      Group.new(:name => "Fred's League").should_not be_valid
    end
    
    it "should require nonblank name" do
      @user.groups.build(:name => "  ").should_not be_valid
    end
    
    it "should accept good name" do
      @user.groups.build(:name => "a" * 40).should be_valid
    end
 
     it "should reject long name" do
      @user.groups.build(:name => "a" * 41).should_not be_valid
    end

  end
  
  describe "members" do
    before(:each) do
      @group = @user.groups.create(@attr)
    end
    
    it "should have a memberships method" do
      @group.should respond_to(:memberships)
    end
    
    it "should have a members method" do
      @group.should respond_to(:members)
    end
  end  

  describe "members" do
  
    before(:each) do
      @group = @user.groups.create(@attr)
      @member = Factory(:user, :email => Factory.next(:email))
    end
    
    it "should have a members method" do
      @group.should respond_to(:members)
    end
    
    it "should have an is_member? method" do
      @group.should respond_to(:is_member?)
    end

    it "should have an add_member! method" do
      @group.should respond_to(:add_member!)
    end
    
    it "should have a remove_member! method" do
      @group.should respond_to(:remove_member!)
    end

    it "should include the member in the members array" do
      new_member = @group.add_member!(@member)
      @group.memberships.should include(new_member)
    end
    
    #it "should not allow adding the same member twice" do
    #  new_member = @group.add_member!(@member)
    #  @group.add_member(@member)
    #  @group.members.length.should == 1
    #end
    
    it "should remove a member" do
      new_member = @group.add_member!(@member)
      @group.remove_member!(new_member.member_id)
      @group.members.should_not include(new_member)
    end
    
    it "should have a manager method" do
      @group.should respond_to(:manager)
    end

    it "should identify the manager (correctly)" do
      @group.manager(@group).should == @user 
    end
    
    it "should identify the manager" do
      @group.user.should == @user
    end

    describe " 'group delete' should destroy associations with" do 
    
      it "members" do
        @group.add_member!(@member)
        @group.destroy
        @member.leagues.should_not include(@group)
      end
      
      it "leagues" do
        @group.add_member!(@member)
        @member.destroy
        @group.members.should_not include(@member)
      end
    end
   
  end
  
  describe "rosters" do
  
    before(:each) do
      @group = @user.groups.create(@attr)
      @roster = @user.rosters.create(:name => "J Team", :group_id => @group.id)
    end
    
    it "should have a rosters method" do
      @group.should respond_to(:rosters)
    end
    
    it "should have the correct roster" do
      @group.rosters.should include(@roster)
    end
  end
end
