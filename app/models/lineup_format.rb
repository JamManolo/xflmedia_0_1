class LineupFormat < ActiveRecord::Base
  attr_accessible :name, :qb, :rb, :wr, :te, :k, :dst, :idp, :flex, :ir, :bench
  
  belongs_to :group
 
  validates :name,  :length => { :maximum => 20 }
  validates :qb,    :presence => true, :inclusion => { :in => (0..2) }
  validates :rb,    :presence => true, :inclusion => { :in => (0..4) }
  validates :wr,    :presence => true, :inclusion => { :in => (0..4) }
  validates :te,    :presence => true, :inclusion => { :in => (0..2) }
  validates :k,     :presence => true, :inclusion => { :in => (0..1) }
  validates :dst,   :presence => true, :inclusion => { :in => (0..1) }
  validates :idp,   :presence => true, :inclusion => { :in => (0..1) }
  validates :flex,  :presence => true, :inclusion => { :in => (0..1) }
  validates :ir,    :presence => true, :inclusion => { :in => (0..3) }
  validates :bench, :presence => true, :inclusion => { :in => (0..9) }
  
  def lineup_size
    qb + rb + wr + te + k + dst + idp + flex
  end
  
  def roster_size
    lineup_size + bench
  end
  
  def roster_format
    qb.to_s + rb.to_s + wr.to_s + te.to_s + k.to_s + dst.to_s + 
    idp.to_s + flex.to_s + ir.to_s + bench.to_s
  end

end
