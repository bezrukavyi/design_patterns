class Order
  attr_reader :id, :state, :total_cost

  def self.current_orders
    path = File.join(File.dirname(__FILE__), 'data/orders.yml')
    YAML.load_file(path) if File.exist?(path)
  end

  def initialize(options)
    @id = options[:id]
    @state = options[:state]
    @total_cost = options[:total_cost]
  end

  def form
    instance_variables.map do |param|
      param = param[1..-1]
      [param.to_sym, send(param)]
    end.to_h
  end
end
