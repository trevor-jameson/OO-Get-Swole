
class Lifter

  attr_accessor :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name, @lift_total = name, lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    Membership.all.collect do |membership|
      if membership.lifter == self
        membership.gym
      else
        nil
      end
    end.compact
  end

  def self.average_lift
    sum = 0
    all_lift_totals = @@all.collect {|lifter| lifter.lift_total}
    all_lift_totals.inject(:+) / @@all.size
  end

  def sign_up(cost=0, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    self.memberships.collect {|membership| membership.membership_cost}.inject(:+)
  end

end
