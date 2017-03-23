class Person
  attr_accessor :first_name, :last_name

  def self.create(*attrs)
    new(*attrs)
  end

  def initialize(options)
    @first_name = options[:first_name]
    @last_name = options[:last_name]
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end

class Servant < Person
end

class King < Person
  def full_name
    super.prepend('King ')
  end
end

class KingdomFactory
  def initialize
    @populatios = [
      King.create(first_name: 'Ludvig', last_name: 'von Bayern'),
      Servant.create(first_name: 'Mike', last_name: 'Vazovsky'),
      Servant.create(first_name: 'Bob', last_name: 'Dylan')
    ]
  end

  def show
    @populatios.each { |person| puts person.full_name }
  end
end


KingdomFactory.new.show
# King Ludvig von Bayern
# Mike Vazovsky
# Bob Dylan
