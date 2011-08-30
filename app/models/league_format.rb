class LeagueFormat < ActiveRecord::Base
  attr_accessible :league_type, :team_count, :comp_type, :divisions, :sched_format
  
  belongs_to :group

  validates :league_type, :presence  => true,
                          :inclusion => { :in => [ "redraft", "keeper",
                                                   "dynasty", "salary cap" ] }

  validates :team_count, :presence  => true,
                   :inclusion => { :in => [0,8,10,12,14,16] }

  validates :comp_type, :presence  => true,
                        :inclusion => { :in => [ "head-to-head", "points", "combo" ] }

  validates :divisions, :presence  => true,
                       :inclusion => { :in => (1..4) }

  validates :sched_format, :presence  => true,
                           :inclusion => { :in => [ "13:3", "14:2", "14:3",
                                                    "15:2", "16:0", "17:0" ] }

  before_save :handle_schedule_data
  
  private
  
    def handle_schedule_data
      reg = self.sched_format.split(':').first.to_i
      regular_season = Range.new(1,reg)
      unless (post_season = self.sched_format.split(':').last.to_i) == 0
        post_season = Range.new(reg+1,(reg+post_season))
      end
    end

end
