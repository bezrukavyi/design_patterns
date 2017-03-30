require 'yaml'

class SaveOrderCommand < Command
  attr_reader :path, :order
  attr_accessor :orders

  def initialize(order)
    @order = order
    @path = File.join(File.dirname(__FILE__), 'data/orders.yml')
    @orders = load || []
  end

  def execute
    orders << order.form
    write_orders
  end

  def unexecute
    orders.delete(order.form)
    write_orders
  end

  private

  def write_orders
    File.open(path, 'w+') { |file| file.write(orders.to_yaml) }
  end

  def load
    YAML.load_file(path) if File.exist?(path)
  end
end
