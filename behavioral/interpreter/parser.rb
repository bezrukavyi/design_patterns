class Parser
  attr_accessor :token

  OPERATIONS = %w(plus equal).freeze

  def initialize(text)
    @text = text
    @tokens = text.scan(/\(|\)|[\w\.\*]+/)
  end

  def next_token
    token = ParseSymbol.new(@tokens.shift).execute
    parsed_tokens << token
    token
  end

  def last_token
    token = parsed_tokens[-2]
    token == ')' ? results.last : token
  end

  def parsed_tokens
    @parsed_tokens ||= []
  end

  def results
    @results ||= []
  end

  def expression
    @token = next_token
    if @token.nil?
      results.last
    elsif @token == '('
      results << expression
      expression
    elsif @token == ')'
      last_token
    else
      OPERATIONS.include?(token) ? operation_execute(@token) : expression
    end
  end

  private

  def operation_execute(class_name)
    Object.const_get(class_name.capitalize).new(last_token, expression).execute
  end
end
