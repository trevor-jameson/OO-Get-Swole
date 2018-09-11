require 'pry'

class Gym

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

# .collect is used here instead of .select because it needs to return the lifter associated
# to the membership instead of the membership itself
  def lifters
    self.memberships.collect {|membership| membership.lifter}
  end

  def lifter_names
    self.lifters.collect do |lifter|
      lifter.name
    end
  end

  def lift_total_for_gym
    self.lifters.collect {|lifter| lifter.lift_total}.inject(:+)
  end


end
