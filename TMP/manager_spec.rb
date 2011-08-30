require 'spec_helper'

describe Manager do

  before(:each) do
    @user = Factory(:user)
    @group = Factory(:group)
    
    @manager = @user.managers.build(:group_id => @group.id)
  end
  
  it "should create a new instance given valid attributes" do
    @manager.save!
  end
end
