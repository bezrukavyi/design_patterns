class ParseSymbol
  def initialize(value)
    @value = value
  end

  def execute
    number = @value.to_i
    return number if number > 0 || @value == '0'
    @value
  end
end
