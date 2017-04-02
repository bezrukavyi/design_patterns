class Parent
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class Child < Parent
end

class Family
  def initialize(last_name)
    @last_name = last_name
    @children = []
  end

  def add_father(first_name)
    @father = Parent.new first_name, @last_name
  end

  def add_mother(first_name)
    @mother = Parent.new first_name, @last_name
  end

  def add_child(first_name)
    @children << Child.new(first_name, @last_name)
  end

  def each_member
    [@father, @mother, @children].flatten.each do |member|
      yield member
    end
  end
end

# Usage
family = Family.new 'Skyoker'
family.add_father('Anakin')
family.add_mother('Padma')
family.add_child('Luke')
family.add_child('Lea')
family.each_member { |member| puts "#{member.first_name} #{member.last_name}" }
# Anakin Skyoker
# Padma Skyoker
# Luke Skyoker
# Lea Skyoker
