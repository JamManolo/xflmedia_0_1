require 'spec_helper'

describe RostersController do
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
      @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => "" }
        @group = Factory(:group)
        test_set_current_group(@group)
      end

      it "should not create a roster" do
        lambda do
          post :create, :roster => @attr
        end.should_not change(Roster, :count)
      end

      it "should render the new page" do
        post :create, :roster => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @group = Factory(:group)
        @attr = { :name => "My Team", :group_id => @group.id }
      end

      it "should create a roster" do
        lambda do
          post :create, :roster => @attr
        end.should change(Roster, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :roster => @attr
        response.should redirect_to(roster_path(assigns(:roster)))
      end

      it "should have a flash message" do
        post :create, :roster => @attr
        flash[:success].should =~ /roster created/i
      end
    end
  end

  describe "GET 'new'" do
  
    describe "failure" do
      it "should be signed in" do
        get 'new', :group => @group.id
        response.should render_template('new')
      end
    end
    
    before(:each) do
      @user = Factory(:user, :email => Factory.next(:email))
      test_sign_in(@user)
      @group = Factory(:group)
      # test_set_current_group(@group)
    end
    
    it "should be successful" do
      get 'new', :group => @group.id
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new', :group => @group.id
      response.should have_selector("title",
                                    :content => "Set up your team in league " + @group.name)
    end

    it "should have a name field" do
      get :new, :group => @group.id
      response.should have_selector("input[name='roster[name]'][type='text']")
    end
    
 end
 
  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @roster = @user.rosters.create!(:name => "PUFL", :group_id => 1  )
      end

      it "should deny access" do
        delete :destroy, :id => @roster
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @roster = @user.rosters.create!(:name => "PUFL", :group_id => 1 )
      end

      it "should destroy the roster" do
        lambda do 
          delete :destroy, :id => @roster
        end.should change(Roster, :count).by(-1)
      end
    end
  end
end

