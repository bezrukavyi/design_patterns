class Parser
  attr_accessor :token

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
      result = expression
      results << result
      expression
    elsif @token == ')'
      last_token
    elsif @token == 'plus'
      Plus.new(last_token, expression).execute
    elsif @token == 'equal'
      Equal.new(last_token, expression).execute
    else
      expression
    end
  end
end
