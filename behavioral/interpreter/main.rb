require 'pry'
require_relative 'plus'
require_relative 'equal'
require_relative 'parse_symbol'
require_relative 'parser'

text = '( (10 plus (5 plus 10)) equal (10 plus 15) )'
parser = Parser.new(text)
puts parser.expression
