require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
     @base_title = "XFL Media Zero Point One"
     
     @attr = { :name => "JJFL", :affiliation => "nfl",
               :league_type => "redraft", :size => 12,
               :comp_type => "combo", :divcount => 3,
               :sched_format => "14:3",
               :lineup_format_name => "cbs",
     }
     
     Factory(:lineup_format, :name => "cbs")
  end

  describe "GET 'home'" do
  
    describe "when not signed in" do
    
      before(:each) do
        get :home
      end
    
      it "should be successful" do
        response.should be_success
     end
    
      it "should have the right title" do
        response.should have_selector("title",
                                      :content => @base_title + " | Home")
      end
    end
    
    describe "when signed in" do
    
      before(:each) do
        @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
        
        @group = other_user.groups.create!(@attr)
        @member = @group.add_member!(@user)
      end
      
      it "should have the right follower/following counts" do
        get :home
        response.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
      
      it "should have the right league count" do
        @user.toggle!(:admin)
        get :home
        response.should have_selector("a", :href => leagues_user_path(@user),
                                           :content => "1 league membership")
      end
    end
    
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content => @base_title + " | Contact")
    end
    
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content => @base_title + " | About")
    end

  end
  
  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                        :content => @base_title + " | Help")
    end
    
  end
  
end
