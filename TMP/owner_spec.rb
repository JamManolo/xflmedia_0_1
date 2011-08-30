require 'spec_helper'

describe Owner do
  before(:each) do
    @user  = Factory(:user)
    @roster = Factory(:roster)
    @owner = @user.owners.build(:roster_id => @roster.id)
  end
  
  it "should create a new instance given valid attributes" do
    @owner.save!
  end
end
