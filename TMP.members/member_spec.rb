require 'spec_helper'

describe Member do
  before(:each) do
    @group = Factory(:group)
    @user  = Factory(:user, :email => Factory.next(:email))
    @member = @group.members.build(:user_id => @user.id)
  end
  
  it "should create a new instance given valid attributes" do
    @member.save!
  end
  
  describe "add/remove methods" do

    before(:each) do
      @member.save
    end

    it "should have a user attribute" do
      @member.should respond_to(:user)
    end
    
    it "should have the right user" do
      @member.user.should == @user
    end

    it "should have a group attribute" do
      @member.should respond_to(:group)
    end

    it "should have the right group" do
      @member.group.should == @group
    end

 end
  
  describe "validations" do

    it "should require a group_id" do
      @member.group_id = nil
      @member.should_not be_valid
    end

    it "should require a user_id" do
      @member.user_id = nil
      @member.should_not be_valid
    end
  end
end
