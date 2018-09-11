class Membership

  attr_accessor :lifter, :gym, :membership_cost

  @@all = []

  def initialize(lifter, gym, membership_cost)
    @lifter, @gym, @membership_cost = lifter, gym, membership_cost
    @@all << self
  end

  def self.all
    @@all
  end

end
