require 'spec_helper'

describe DetailsController do

  describe "GET 'league_type'" do
    it "should be successful" do
      get 'league_type'
      response.should be_success
    end
  end

  describe "GET 'comp_type'" do
    it "should be successful" do
      get 'comp_type'
      response.should be_success
    end
  end

  describe "GET 'divisions'" do
    it "should be successful" do
      get 'divisions'
      response.should be_success
    end
  end

end
