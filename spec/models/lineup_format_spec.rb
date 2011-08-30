require 'spec_helper'

describe LineupFormat do

  before(:each) do
    @attr = { :name => "ten",
      :qb => 1, :rb => 2, :wr => 2, :te => 1, :k => 1,
      :dst => 1, :idp => 1, :flex => 1, :ir => 2, :bench => 4 
    }
   
    @test_lineup = { :name => @attr[:name], :lineup_size => 0, 
                     :roster_size => 0, :roster_format => "" } 
    
    @attr.each do |pos, count|
      next if pos == :name
      @test_lineup[:roster_format] += count.to_s
      next if pos == :ir
      @test_lineup[:roster_size] += count
      next if pos == :bench
      @test_lineup[:lineup_size] += count 
    end
    
  end
  
  it "should create a new instance given valid attributes" do
    LineupFormat.create!(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      @lineup_format = LineupFormat.create(@attr)
    end
    
    it "should have a lineup_size method" do
      @lineup_format.should respond_to(:lineup_size)
    end
    
    it "should have the right size" do
      @lineup_format.roster_size.should == @test_lineup[:roster_size]
    end
    
    it "should have a roster_format method" do
      @lineup_format.should respond_to(:roster_format)
    end
    
    it "should have the right format" do
      @lineup_format.roster_format.should == @test_lineup[:roster_format]
    end

    it "should have a name attribute" do
      @lineup_format.should respond_to(:name)
    end

    it "should have the right name" do
      @lineup_format.name.should == @test_lineup[:name]
    end

    it "should have a qb attribute" do
      @lineup_format.should respond_to(:qb)
    end

  end
  
  describe "group associations" do

    before(:each) do
      @lineup_format = LineupFormat.create(@attr)
    end
    
    it "should have a group method" do
      @lineup_format.should respond_to(:group)
    end
    
  end
  
  describe "validations" do
  
    it "should require a qb" do
      LineupFormat.new(:rb => 2, :wr => 2, :te => 1,
                       :k => 1, :dst => 1, :idp => 1, :flex => 1 ).should_not be_valid
    end
    
    it "should reject invalid value for qb" do
      LineupFormat.new(:qb => 2, :rb => 2, :wr => 2, :te => 1,
                       :k => 1, :dst => 1, :idp => 1, :flex => 0 ).should_not be_valid
    end
    
    it "should reject invalid value for flex" do
      LineupFormat.new(:qb =>1, :rb => 2, :wr => 2, :te => 1,
                       :k => 1, :dst => 1, :idp => 1, :flex => 2 ).should_not be_valid
    end
  end
end
