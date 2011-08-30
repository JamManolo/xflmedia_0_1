require 'spec_helper'

describe Group do

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :name        => "Home Boyz Football League",
      :affiliation => "nfl"
    }
  end
  
  it "should create a new instance given valid attributes" do
    @user.groups.create!(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      @group = @user.groups.create(@attr)
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
      @group.manager.user_id.should == @user.id
    end

    it "should have the right group via user/group mappings" do
      @user.managers.first.should == @group.manager
    end

  end
  
  describe "validations" do
  
    it "should require an affiliation" do
      Group.new(:name => "Fred's League").should_not be_valid
    end
    
    it "should require nonblank name" do
      @user.groups.build(:name => "  ", :affiliation => "nba").should_not be_valid
    end
    
    it "should accept good name" do
      @user.groups.build(:name => "a" * 40, :affiliation => "nfl").should be_valid
    end
 
     it "should reject long name" do
      @user.groups.build(:name => "a" * 41, :affiliation => "nfl").should_not be_valid
    end
    
    it "should reject invalid affiliation" do
      @user.groups.build(:name => "UFL", :affiliation => "nascar").should_not be_valid
    end
  end
  
  describe "members" do
    before(:each) do
      @group = Factory(:group)
    end
    
    it "should have a members method" do
      @group.should respond_to(:members)
    end
    
    it "should have a users method" do
      @group.should respond_to(:users)
    end
  end  

end
