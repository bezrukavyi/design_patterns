require 'pry'
require_relative 'command'
require_relative 'save_order_command'
require_relative 'failed_command'
require_relative 'composite_command'
require_relative 'order'

order = Order.new(id: rand(10_000), state: :delivered, total_cost: 100)
total_command = CompositeCommand.new
total_command.add_command(SaveOrderCommand.new(order))
failed_command = FailedCommand.new

total_command.add_command(failed_command)
total_command.execute
puts 'After failed execute'
puts Order.current_orders
total_command.remove_command(failed_command)
total_command.execute
puts 'After success execute'
puts Order.current_orders
