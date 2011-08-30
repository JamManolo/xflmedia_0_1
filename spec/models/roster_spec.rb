require 'spec_helper'

describe Roster do
  
  before(:each) do
    @user = Factory(:user, :email => Factory.next(:email))
    @group = Factory(:group)
    @attr = {
      :name  => "USuck",
      :group_id => @group.id
    }
  end
  
  it "should create a new instance given valid attributes" do
    @user.rosters.create!(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      @roster = @user.rosters.create(@attr)
    end
    
    it "should have a user method" do
      @roster.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @roster.user.id.should == @user.id
    end

    it "should have the right owner via user/roster mappings" do
      @user.rosters.first.should == @roster
    end
   
    it "should have a name attribute" do
      @roster.should respond_to(:name)
    end
 
    it "should have a group_id attribute" do
      @roster.should respond_to(:group_id)
    end
 
     it "should have the right value for group_id" do
      @roster[:group_id].should == @attr[:group_id]
    end

  end
  
  describe "group associations" do

    before(:each) do
      @roster = @user.rosters.create(@attr)
    end
    
    it "should have a group method" do
      @roster.should respond_to(:group)
    end
    
    it "should have the right associated group" do
      @roster.group.id.should == @group.id
    end
    
    it "should have the right associated league" do
      @group.add_member!(@user)
      @roster.user.leagues.should include(@roster.group)
    end
    
  end
  
  describe "validations" do
  
    it "should require a group_id" do
      Roster.new(:name => "KickAss").should_not be_valid
    end
    
    it "should require nonblank name" do
      @user.rosters.build(:name => "  ", 
                          :group_id => 1).should_not be_valid
    end
    
    it "should accept good name" do
      @user.rosters.build(:name => "a" * 40,
                          :group_id => 17).should be_valid
    end
 
    it "should reject long name" do
      @user.rosters.build(:name => "a" * 41, 
                          :group_id => 17).should_not be_valid
    end
    
    it "should reject invalid group_id" do
      @user.rosters.build(:name => "KickAss",
                          :group_id => "Seventeen").should_not be_valid
    end
  end

end
