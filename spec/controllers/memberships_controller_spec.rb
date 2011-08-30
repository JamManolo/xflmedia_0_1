require 'spec_helper'

describe MembershipsController do

  describe "access control" do
  
    it "should require signin for create" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should require signin for destroy" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
      @group = @user.groups.create!(:name => "MYFL",
                                    :league_type => "redraft",
                                    :size => 12,
                                    :comp_type => "combo",
                                    :divcount => 3,
                                    :sched_format => "14:3")
                                    
      @member = Factory(:user, :email => Factory.next(:email))
    end

    it "should create a membership" do
      lambda do
        post :create, :membership => { :member_id => @member, :league_id => @group }
        response.should be_redirect
      end.should change(Membership, :count).by(1)
    end
    
    it "should create a membership using Ajax" do
      lambda do
        xhr :post, :create, :membership => { :member_id => @member, :league_id => @group }
        response.should be_success
      end.should change(Membership, :count).by(1)
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
      @member = Factory(:user, :email => Factory.next(:email))
      @group = Factory(:group)
      @group.add_member!(@member)
      @membership = @group.memberships.find_by_member_id(@member)
    end

    it "should destroy a membership" do
      lambda do
        delete :destroy, :id => @membership
        response.should be_redirect
      end.should change(Membership, :count).by(-1)
    end
    
    it "should destroy a membership using Ajax" do
      lambda do
        xhr :delete, :destroy, :id => @membership
        response.should be_success
      end.should change(Membership, :count).by(-1)
    end
  end
end

