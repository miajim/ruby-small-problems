# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 10 : Nobility
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin

Now that we have a Walkable module, we are given a new challenge. Apparently
some of our users are nobility, and the regular way of walking simply isn't
good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

We must have access to both name and title because they are needed for other
purposes that we aren't showing here.

byron.name
=> "Byron"
byron.title
=> "Lord"

Further Exploration
This exercise can be solved in a similar manner by using inheritance; a Noble
is a Person, and a Cheetah is a Cat, and both Persons and Cats are Animals.
What changes would you need to make to this program to establish these
relationships and eliminate the two duplicated #to_s methods?

Is to_s the best way to provide the name and title functionality we needed for
this exercise? Might it be better to create either a different name method (or
say a new full_name method) that automatically accesses @title and @name? There
are tradeoffs with each choice -- they are worth considering.

=end
# CODE

# module Walkable
#   def walk
#     "#{name} #{gait} forward"
#   end
# end

# class Person
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end


# class Noble
#   include Walkable
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def walk
#     "#{title} #{super}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# p byron.walk
# # => "Lord Byron struts forward"

# byron.name
# # => "Byron"
# byron.title
# # => "Lord"

# Further Exploration


module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Animal
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  def gait
    @@gait
  end

  # private
  # could turn the gait into a class variable, since it is class-dependent
  # not instance-dependent, though class variables are probably not accessed
  # via instance methods in practice
  @@gait = "saunters"
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def name
    "#{title} #{super}"
    # alternatively
    # "#{@title} #{@name}"
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk

mike = Person.new("Mike")
puts mike.walk

kitty = Cat.new("Kitty")
puts kitty.walk

flash = Cheetah.new("Flash")
puts flash.walk