require 'pry'
require_relative 'plus'
require_relative 'equal'
require_relative 'parse_symbol'
require_relative 'parser'

first_part = '( 30 plus (5 plus 10) )'
second_part = '(10 plus 35)'
text = "( #{first_part} equal #{second_part} )"
parser = Parser.new(text)
puts parser.expression
