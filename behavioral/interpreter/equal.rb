class Equal
  attr_reader :first, :second

  def initialize(first, second)
    @first = first
    @second = second
  end

  def execute
    first == second
  end
end
