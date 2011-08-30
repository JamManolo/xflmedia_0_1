class DetailsController < ApplicationController

  def template
    @title = "Details template"
  end
  
  def league_type
    @title = "League type"
  end

  def comp_type
    @title = "Competition style"
  end

  def divisions
    @title = "Division"
  end
  
  def yardage
    @title = "Yardage points" 
  end
  
  def yardage_bonus
    @title = "Yardage bonus points"
  end
  
  def playoffs
    @title = "Playoffs"
  end
  
  def pts_allowed
    @title = "Points allowed bonus / penalty"
  end

  def yds_allowed
    @title = "Yards allowed bonus / penalty"
  end

end
