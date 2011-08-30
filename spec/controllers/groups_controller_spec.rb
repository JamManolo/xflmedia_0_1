require 'spec_helper'

describe GroupsController do
  render_views
  
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do

    before(:each) do
      @user = Factory(:user, :email => Factory.next(:email))
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => "" }
      end

      it "should not create a group" do
        lambda do
          post :create, :group => @attr
        end.should_not change(Group, :count)
      end

      it "should render the new page" do
        post :create, :group => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = {:name => "UFL"}
        # This next line causes a problem - possibly due to a conflict between the
        # factories for league and scoring formats, with both having :group associations
        #@league_format  = Factory(:league_format)
        @league_format_attr = {:league_type => "redraft", :team_count => 12,
                               :comp_type => "combo", :divisions => 3,
                               :sched_format => "14:3"}
        @scoring_format = Factory(:scoring_format)
        @lineup_format_attr = { :qb => 1, :rb => 2, :wr => 2, :te => 1, :k => 1,
                                :dst => 1, :idp => 1, :flex => 0, :ir => 2, :bench => 8 }
      end

      it "should create a group" do
        lambda do
          post :create, :group => @attr, :league_format => @league_format_attr,
                                         :lineup_format => @lineup_format_attr,
                                         :scoring_format => @scoring_format.attributes
        end.should change(Group, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :group => @attr, :league_format => @league_format_attr,
                                       :lineup_format => @lineup_format_attr,
                                       :scoring_format => @scoring_format.attributes
        response.should redirect_to(group_path(assigns(:group)))
      end

      it "should have a flash message" do
        post :create, :group => @attr, :league_format => @league_format_attr,
                                       :lineup_format => @lineup_format_attr,
                                       :scoring_format => @scoring_format.attributes
        flash[:success].should =~ /group created/i
      end
    end
  end

  describe "GET 'new'" do
  
    describe "failure" do
      it "should be signed in" do
        get 'new'
        response.should render_template('new')
      end
    end
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Create a group")
    end

    it "should have a name field" do
      get :new
      response.should have_selector("input[name='group[name]'][type='text']")
    end
    
 end
 
  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user, :email => Factory.next(:email))
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        
        Factory(:lineup_format, :name => "cbs")                             
           
        @group = @user.groups.create!(:name => "UFL")
#                                      :league_type => "redraft", :size => 12,
#                                      :comp_type => "combo", :divcount => 3,
#                                      :sched_format => "14:3")
      end

      it "should deny access" do
        delete :destroy, :id => @group
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
         
        Factory(:lineup_format, :name => "espn")                             

        @group = @user.groups.create!(:name => "PUFL",
                                      :league_type => "redraft", :size => 12,
                                      :comp_type => "combo", :divcount => 3,
                                      :sched_format => "14:3",
                                      :lineup_format_name => "espn")
      end

      it "should destroy the group" do
        lambda do 
          delete :destroy, :id => @group
        end.should change(Group, :count).by(-1)
      end
    end
  end
end

